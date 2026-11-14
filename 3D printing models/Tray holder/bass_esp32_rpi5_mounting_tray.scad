// BASS Project - ESP32 housing + CanaKit Raspberry Pi 5 cage mounting tray
// Units: millimeters
// part = 0: tray
// part = 1: visual assembly preview

part = 0;

// Current ESP32 housing footprint, including the external mounting tabs.
esp_x = 152;
esp_y = 55.8;

// CanaKit / official Raspberry Pi 5 case approximate footprint.
pi_x = 98.5;
pi_y = 70.3;

device_clearance = 3;
tray_x = 172;
tray_y = 165;
base_t = 3;
rim_h = 6;
rim_t = 4;
guide_h = 2.5;
guide_t = 2.5;

// Placement zones. The devices sit side-by-side along the tray's Y direction.
esp_pos = [10,10];
pi_pos = [10,84];

module rounded_box(size, r=4) {
    x=size[0]; y=size[1]; z=size[2];
    hull() {
        for (xx=[r,x-r], yy=[r,y-r])
            translate([xx,yy,0]) cylinder(r=r,h=z,$fn=32);
    }
}

module rectangular_guide(pos, size) {
    x=pos[0]; y=pos[1]; w=size[0]; d=size[1];
    // Four low guide rails. They leave the center flat for Velcro or glue.
    translate([x-guide_t,y-guide_t,base_t]) cube([w+2*guide_t,guide_t,guide_h]);
    translate([x-guide_t,y+d,base_t]) cube([w+2*guide_t,guide_t,guide_h]);
    translate([x-guide_t,y,base_t]) cube([guide_t,d,guide_h]);
    translate([x+w,y,base_t]) cube([guide_t,d,guide_h]);
}

module outer_rim() {
    difference() {
        rounded_box([tray_x,tray_y,rim_h],6);
        translate([rim_t,rim_t,-0.1])
            cube([tray_x-2*rim_t,tray_y-2*rim_t,rim_h+0.2]);
    }
}

module tray() {
    difference() {
        union() {
            rounded_box([tray_x,tray_y,base_t],6);
            outer_rim();

            // Low placement guides for the ESP32 enclosure and Pi cage.
            rectangular_guide([esp_pos[0]-device_clearance,esp_pos[1]-device_clearance],
                              [esp_x+2*device_clearance,esp_y+2*device_clearance]);
            rectangular_guide([pi_pos[0]-device_clearance,pi_pos[1]-device_clearance],
                              [pi_x+2*device_clearance,pi_y+2*device_clearance]);

            // Divider between the two mounting zones.
            translate([rim_t,76,base_t])
                cube([tray_x-2*rim_t,3,guide_h]);
        }

        // Optional M4 tray mounting holes at the four corners.
        for (x=[10,tray_x-10])
            for (y=[10,tray_y-10])
                translate([x,y,-0.1]) cylinder(d=4.2,h=base_t+0.2,$fn=32);
    }
}

if (part==0) tray();

if (part==1) {
    tray();
    // Approximate footprints only for visual placement checking.
    color([0.05,0.20,0.55,0.85])
        translate([esp_pos[0],esp_pos[1],base_t+guide_h])
            cube([esp_x,esp_y,55]);
    color([0.15,0.15,0.15,0.85])
        translate([pi_pos[0],pi_pos[1],base_t+guide_h])
            cube([pi_x,pi_y,33]);
}
