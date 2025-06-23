# Sony Xperia Vendor Extras

Sony vendor extras for Xperia 1 V. Includes Dolby and stock camera apps. Tested on Xperia 1 V.


To include this repo, use this in your device tree
```
$(call inherit-product, device/sony/extras/extra.mk)
```

## Why this exists

Android now forces ELF checks and I didn't know how to refactor https://github.com/XperiaLabs/vendor_sony_extra to work with them, hence this is now sm8550 only

## TODO

- Test and remove useless flags
- Remove unused blobs from the repo
- Remove useless makefile declarations

## Flags

|Flag|Description|
|:-:|:-:|
|`TARGET_SHIPS_SONY_FRAMEWORK`|`Ships libraries and permissions, needed for TARGET_SHIPS_SONY_APPS and all other flags/extras to work`|
|`TARGET_SHIPS_SONY_APPS`|`Ships some miscellaneous Sony apps`|
|`TARGET_SHIPS_SOUND_ENHANCEMENT`|`Ships the needed blobs & apps for Audio Settings (Dolby Sound, 360 Reality Audio Upmix) to work`|
|`TARGET_SUPPORTS_GAME_CONTROLLERS`|`Ships Sony's Game controller app and needed layouts for various controllers`|
|`TARGET_SUPPORTS_XPERIA_STREAM`|`Ships Sony's "Xperia Stream" suite for the Xperia Stream gaming accessory which should work on (Xperia 1 III, IV and V)`|
|`TARGET_SHIPS_XPERIA_LWP`|`Ships the Live Wallpaper from the latest Xperia flagship`|
|`TARGET_SHIPS_XPERIA_LWP_NEWEST`|`Ships all Xperia Live Wallpapers`|