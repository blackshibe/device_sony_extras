#
# Copyright (C) 2024 XperiaLabs Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Soong Namespace
PRODUCT_SOONG_NAMESPACES += \
    vendor/sony/extras

# Flags
TARGET_SHIPS_SOUND_ENHANCEMENT ?= false
TARGET_SUPPORTS_GAME_CONTROLLERS ?= false
TARGET_SUPPORTS_XPERIA_STREAM ?= false
TARGET_SHIPS_XPERIA_LWP ?= false
TARGET_SHIPS_XPERIA_LWP_NEWEST ?= false
TARGET_SHIPS_SONY_CAMERA ?= false
TARGET_SHIPS_SONY_FRAMEWORK ?= false

# LineageOS overrides
TARGET_EXCLUDES_AUDIOFX := true

# Sony Framework
ifeq ($(TARGET_SHIPS_SONY_FRAMEWORK),true)
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/sony/extras/lib/common/framework/system/,$(TARGET_COPY_OUT_SYSTEM)/) \
    $(call find-copy-subdir-files,*,device/sony/extras/lib/common/framework/system_ext/,$(TARGET_COPY_OUT_SYSTEM_EXT)/) \
    $(call find-copy-subdir-files,*,device/sony/extras/lib/common/framework/product/,$(TARGET_COPY_OUT_PRODUCT)/)
endif

# Sony Camera
ifeq ($(TARGET_SHIPS_SONY_CAMERA),true)
    $(call inherit-product, device/sony/extras/lib/yodo/camera/camera.mk)
endif

# Sound Enhancements
ifeq ($(TARGET_SHIPS_SOUND_ENHANCEMENT),true)
    $(call inherit-product, device/sony/extras/lib/yodo/audio/audio.mk)
endif

# Game Controllers
ifeq ($(TARGET_SUPPORTS_GAME_CONTROLLERS),true)
    $(call inherit-product, device/sony/extras/lib/common/controllers/gc.mk)
endif

# Xperia Stream
ifeq ($(TARGET_SUPPORTS_XPERIA_STREAM),true)
    $(call inherit-product, device/sony/extras/lib/common/stream/stream.mk)
endif

# Xperia LWPs
ifeq ($(TARGET_SHIPS_XPERIA_LWP),true)
    $(call inherit-product, device/sony/extras/lib/common/lwp/lwp.mk)
endif

# Xperia LWPs | Newest
ifeq ($(TARGET_SHIPS_XPERIA_LWP_NEWEST),true)
    $(call inherit-product, device/sony/extras/lib/common/lwp/lwp-newest.mk)
endif

# Vendor files
$(call inherit-product, vendor/sony/extras/extras-vendor.mk)
