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
enum ChargingStatus {
    UNKNOWN = -1,
    HEALTH_COLD = 10, // Battery temperature too cold
    HEALTH_HOT = 11, // Battery temperature too hot
    SYSTEM_THERMAL = 20, // Thermal engine
    SYSTEM_LOAD = 21, // Load might eventually become thermals
    ADAPTER_AUTH = 30, // During authentication (if supported) or failed authentication
    ADAPTER_POWER = 31,  // Low power adapter
    ADAPTER_QUALITY = 32, // Adapter or cable (low voltage)
    DEFENDER_TEMP = 40,
    DEFENDER_DWELL = 41,
    DEFENDER_TRICKLE = 42,
    DEFENDER_DOCK = 43,
    NOT_CHARGING = 100, // plugged, not charging
    CHARGING = 200,  // All good
}
