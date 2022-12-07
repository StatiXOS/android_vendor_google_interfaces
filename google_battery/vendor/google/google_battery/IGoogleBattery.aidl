package vendor.google.google_battery;

import vendor.google.google_battery.ChargingStage;

@VintfStability
interface IGoogleBattery {

    oneway void clearBatteryDefender();
    ChargingStage getChargingStageAndDeadline();
    int getDockDefendStatus();
    int getHealthCapacityIndex();
    int getHealthImpedanceIndex();
    int getHealthIndex();
    oneway void setChargingDeadline(in int seconds);
    oneway void setEnable(in int feature, in boolean enabled);

}
