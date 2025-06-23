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
    device/sony/extras/lib/yodo/audio

# Local Path
LOCAL_AUDIO := device/sony/extras/lib/yodo/audio

# SEPolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(LOCAL_AUDIO)/sepolicy/vendor

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(LOCAL_AUDIO)/proprietary/vendor/etc/vintf/dms/dolby_framework_matrix.xml \
    $(LOCAL_AUDIO)/proprietary/vendor/etc/vintf/threesixty/threesixty_framework_matrix.xml

DEVICE_MANIFEST_FILE += \
    $(LOCAL_AUDIO)/proprietary/vendor/etc/vintf/dms/vendor.dolby.media.c2.xml \
    $(LOCAL_AUDIO)/proprietary/vendor/etc/vintf/dms/vendor.dolby.hardware.dms.xml \
    $(LOCAL_AUDIO)/proprietary/vendor/etc/vintf/threesixty/vendor.threesixty_ra.codec2.xml

# Dolby DAP
AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := true

# Copy Sound Enhancement Config(s)
PRODUCT_COPY_FILES += \
    $(LOCAL_AUDIO)/proprietary/vendor/etc/alc.speaker.bin:$(TARGET_COPY_OUT_VENDOR)/etc/alc.speaker.bin \
    $(LOCAL_AUDIO)/proprietary/vendor/etc/dsx_param_file.bin:$(TARGET_COPY_OUT_VENDOR)/etc/dsx_param_file.bin \
    $(LOCAL_AUDIO)/proprietary/vendor/etc/windnoise_reduction.data:$(TARGET_COPY_OUT_VENDOR)/etc/windnoise_reduction.data \
    $(LOCAL_AUDIO)/proprietary/vendor/etc/windnoise_reduction_stat.data:$(TARGET_COPY_OUT_VENDOR)/etc/windnoise_reduction_stat.data \
    $(LOCAL_AUDIO)/proprietary/vendor/etc/windnoise_reduction_stat_back.data:$(TARGET_COPY_OUT_VENDOR)/etc/windnoise_reduction_stat_back.data \
    $(LOCAL_AUDIO)/proprietary/vendor/etc/windnoise_reduction_back.data:$(TARGET_COPY_OUT_VENDOR)/etc/windnoise_reduction_back.data \
    $(LOCAL_AUDIO)/proprietary/vendor/etc/XTC_speaker_coef.hki:$(TARGET_COPY_OUT_VENDOR)/etc/XTC_speaker_coef.hki \
    $(LOCAL_AUDIO)/proprietary/vendor/etc/dolby/dax-default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/dolby/dax-default.xml

# Blobs
PRODUCT_COPY_FILES += \
    $(LOCAL_AUDIO)/proprietary/system_ext/etc/permissions/com.sonyericsson.soundenhancement.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.sonyericsson.soundenhancement.xml \
    $(LOCAL_AUDIO)/proprietary/system_ext/etc/permissions/com.dolby.daxservice.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.dolby.daxservice.xml \
    $(LOCAL_AUDIO)/proprietary/system_ext/etc/permissions/com.sony.threesixtyra.audiofx.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.sony.threesixtyra.audiofx.xml \
    $(LOCAL_AUDIO)/proprietary/system_ext/etc/permissions/jp.co.sony.threesixtyra.system.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/jp.co.sony.threesixtyra.system.xml \
    $(LOCAL_AUDIO)/proprietary/system_ext/etc/permissions/com.sony.360ra.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.sony.360ra.xml \
    $(LOCAL_AUDIO)/proprietary/system_ext/etc/default-permissions/default-permissions-360ra.apps.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/default-permissions/default-permissions-360ra.apps.xml \
    $(LOCAL_AUDIO)/proprietary/vendor/etc/media_codecs_sony_c2_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_sony_c2_audio.xml \
    $(LOCAL_AUDIO)/proprietary/vendor/etc/seccomp_policy/android.hardware.media.c2@1.2-default-seccomp_policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/android.hardware.media.c2@1.2-default-seccomp_policy \

# Codec2 Props
PRODUCT_VENDOR_PROPERTIES += \
    vendor.audio.c2.preferred=true \
    debug.c2.use_dmabufheaps=1 \
    vendor.qc2audio.suspend.enabled=true \
    vendor.qc2audio.per_frame.flac.dec.enabled=true \
    debug.stagefright.c2inputsurface=-1

# Dolby Props
PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.dolby.dax.version=DAX3_3.7.0.8_r1 \
    vendor.audio.dolby.ds2.hardbypass=false \
    vendor.audio.dolby.ds2.enabled=false

# 360 Reality Audio Props
PRODUCT_VENDOR_PROPERTIES += \
    vendor.360ra.effect=1 \
    ro.audio.spatializer_enabled=true

PRODUCT_ODM_PROPERTIES += \
    vendor.sony_spatializer.suppress.dolby=true

# Packages
PRODUCT_PACKAGES += \
    daxService \
    DolbySound \
    ThreeSixtyRASettings \
    ThreeSixtyRASystem \
    ThreeSixtyRASystem-Overlay \
    com.sony.threesixtyra.audiofx