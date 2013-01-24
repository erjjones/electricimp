function getDateTime(){
    local d = date();
    local datestring = format("%04d-%02d-%02dT%02d:%02d:%02d", d.year, d.month+1, d.day, d.hour, d.min, d.sec); //ISO 8601
    return datestring;
}

function handler()
{
    local signal = format("%d", imp.rssi()) //dBm
    local voltage = hardware.voltage()    
    
    server.show("voltage: " + voltage + ", signal: " + signal + ", time: " + getDateTime());    
    imp.wakeup(imp.configparams.period, handler);
}

imp.configure("System Ping", [], [], {period = 2});
imp.wakeup(imp.configparams.period, handler);