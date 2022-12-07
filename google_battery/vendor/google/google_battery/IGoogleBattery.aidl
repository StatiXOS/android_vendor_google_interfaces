/*
 * Copyright (C) 2022 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package vendor.google.google_battery;

import vendor.google.google_battery.BatteryHealthStatus;
import vendor.google.google_battery.ChargingStage;
import vendor.google.google_battery.ChargingStatus;
import vendor.google.google_battery.ChargingType;
import vendor.google.google_battery.DockDefendStatus;
import vendor.google.google_battery.Feature;

@VintfStability
interface IGoogleBattery {
    const int RESULT_IO_ERROR = 1; // Reported via Status::fromServiceSpecificError

    /**
     * Enables or disables an internally supported feature. If unsupported, the
     * service will report EX_ILLEGAL_ARGUMENT.
     */
    void setEnable(in Feature feature, in boolean enabled);

    /**
     * Sets the charging target deadline.
     *
     * @param seconds charging deadline in the number of seconds from now;
     *        zero to clear.
     */
    void setChargingDeadline(in int seconds);

    /**
     * Get the charging stage and deadline.
     *
     * @param out charging stage and number of seconds until charging deadline
     * @return the current ChargingStage status
     */
    ChargingStage getChargingStageAndDeadline();

    /**
     * Sets battery health charging always-on at a given SOC. You must set this at boot
     * if this feature is enabled in settings.
     *
     */
    void setHealthAlwaysOn(in int soc);

    /**
     * Gets the battery feature property. The feature, property and values
     * are internally defined.
     *
     * @param feature identifies the battery feature
     * @param property identifies the battery feature property
     *
     * @return out the value identified by the feature and property
     */
    int getProperty(in Feature feature, in int property);

    /**
     * Sets a battery feature property. If this is not set,
     * the property is not overridden from the system's default.
     *
     * @param feature identifies the battery feature
     * @param property identifies the battery feature property
     * @param value is the property to be set
     */
    void setProperty(in Feature feature, in int property, in int value);

    /**
     * Clears all battery defenders if triggered. This will send a clear command
     * to all battery defender algorithms.
     */
    void clearBatteryDefender();

    /**
     * Retrieves an adapter ID integer. This is determined from different sources, but
     * may not be available. This may only be available on first party adapters.
     *
     * @return a value representing the adapter ID. <TBD> This will be defined at implementation.
     */
    int getAdapterId();

    /**
     * Retrieves an adapter type integer. This is determined from different sources.
     *
     * For example, for USB, this may derived from PID/VID. Uniqueness is not guaranteed,
     * but different integers will provide a rough estimate of different adapters.
     *
     * @return a value representing the adapter type. <TBD> This will be defined at implementation.
     */
    int getAdapterType();

    /**
     * The ratio between battery actual average current and battery actual current demand.
     *
     * @return the values, having a range [0, 100], or negative for errors.
     */
    int getChargingSpeed();

    /**
     * Returns the current charging status.
     *
     * @return charging status enum
     */
    ChargingStatus getChargingStatus();

    /**
     * Returns the current charging type.
     *
     * @return charging type enum
     */
    ChargingType getChargingType();

    /**
     * A value in the range [0, 100] representing the capacity index of the battery,
     * where 100 is the highest capacity of the battery and 0 is the lowest.
     *
     * @return the value in range [0, 100], and may be negative for errors.
     */
    int getHealthCapacityIndex();

    /**
     * A value in the range [0, 100] representing the impedance of the battery,
     * where 100 is the lowest impedance and 0 is the highest impedance.
     *
     * @return the value in range [0, 100], and may be negative for errors.
     */
    int getHealthImpedanceIndex();

    /**
     * A value in the range [0, 100] representing the health of the battery,
     * where 100 is a perfectly health battery, and 0 is a unhealthy battery.
     *
     * @return the value in range [0, 100], and may be negative for errors.
     */
    int getHealthIndex();

    /**
     * Returns the current battery health status.
     *
     * @return the battery health status enum
     */
    BatteryHealthStatus getHealthStatus();

    /**
     * Returns the current dock defend status.
     *
     * @return the dock defend status enum
     */
    DockDefendStatus getDockDefendStatus();
}
