# Sony Xperia Vendor Extras

Sony vendor extras for Xperia 1 V. Includes Dolby and stock camera apps. Android now forces ELF checks and I didn't know how to refactor https://github.com/XperiaLabs/vendor_sony_extra to work with them, hence this is now sm8550 only.

## Usage

To include this repo, use this in your device tree
```
$(call inherit-product, device/sony/extras/extra.mk)
```
## TODO

- Remove unused blobs from the repo
- Remove useless makefile declarations
- Readd build flags(?)
- Fix sony overlay menu toggles