using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.ActivityMonitor as Act;
using Toybox.Lang;
using Toybox.Time;
using Toybox.Time.Gregorian;

class GOTWatchFace2View extends Ui.WatchFace {

	var monImage = null;
	var bgColor = 0x000000;

    // Load your resources here
    function onLayout(dc) {
    	
        monImage = Ui.loadResource(Rez.Drawables.got); 
    }
    
    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        
        var clockTime = Sys.getClockTime();   
        var hour  = clockTime.hour;
        var min  = clockTime.min;  
        
        // Set Background Color        
        dc.setColor(bgColor, bgColor); 
        dc.clear();
        
        // Set Background image
        dc.drawBitmap(0, 0, monImage);
 
        if(hour>12) {hour = hour - 12; }
                
        dc.setPenWidth(6);        
        dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_TRANSPARENT);        	
    	dc.drawArc(dc.getWidth()/2, dc.getHeight()/2, dc.getWidth()/2 - 1, Gfx.ARC_CLOCKWISE, 90, 90 - (hour*30));
    	
    	dc.setPenWidth(4); 
    	dc.setColor(Gfx.COLOR_YELLOW, Gfx.COLOR_TRANSPARENT);        	
    	dc.drawArc(dc.getWidth()/2, dc.getHeight()/2, dc.getWidth()/2 - 6, Gfx.ARC_CLOCKWISE, 90, 90 - (min*6));
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
   	}

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }
      
}
