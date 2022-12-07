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

@VintfStability
@Backing(type="int")
enum Feature {
    ADAPTIVE_CHARGING = 0,
    TEMP_DEFEND = 1,
    TRICKLE_DEFEND = 2,
    DWELL_DEFEND = 3,
    DREAM_DEFEND = 4,
    DC_CHARGING = 5,
    AGE_ADJUSTED_CHARGE_RATE = 6,
    DOCK_DEFEND = 7,
    BATTERY_HEALTH_INDEX = 8,
    CHARGING_SPEED_INDICATOR = 9,
    FEATURE_MAX,
}
