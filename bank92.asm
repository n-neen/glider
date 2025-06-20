lorom

org $928000


;===========================================================================================
;===================================  P A L E T T E S  =====================================
;===========================================================================================


    testpalette:
        dw $5B9C, $2A16, $42D6, $57ff, $1084, $0150, $0008, $2108,
           $0420, $08a0, $439C, $0216, $2A10, $0000, $0000, $0000

    
        ;incbin "./data/palettes/palette0.bin"
        ;incbin "./data/palettes/palette1.bin"
        
        ;dw $2940, $0000, $6739, $7ec7, $2108, $5ef7, $39ac, $24a4,
        ;   $2529, $39ce, $4e73, $44c4, $7fff, $5294, $3c3c, $643c
        ;   
        ;dw $2940, $0000, $6739, $7ec7, $2108, $5ef7, $39ac, $24a4,
        ;   $2529, $39ce, $4e73, $44c4, $7fff, $5294, $3c3c, $643c
        
    splashpalette:
        incbin "./data/palettes/splash.pal"
        
    bg2palette:
        incbin "./data/palettes/bg2.pal"


;===========================================================================================
;===============================   S P R I T E   D A T A   =================================
;===========================================================================================


gliderdata:
    .header:
        dw #.graphics, #.palette, #.hitbox
        
    .hitbox:                ;radii
        db $0a, $05         ;x, y
        
    .graphics:
        incbin "./data/sprites/glider.gfx"
    
    .palette:
        ;incbin "./data/sprites/glider.pal"
        dw $2940, $0000, $6739, $7ec7, $2108, $5ef7, $39ac, $24a4,
           $2529, $39ce, $4e73, $44c4, $7fff, $5294, $3c3c, $643c

;===========================================================================================
;===============================    B A C K G R O U N D    =================================
;===============================      T I L E M A P S      =================================
;===========================================================================================


bg1tilemap:
    incbin "./data/tilemaps/bg1tilemap.bin"
    
splashtilemap:
    incbin "./data/tilemaps/splash.bin"
        
bg2tilemap:
    incbin "./data/tilemaps/bg2tilemap.bin"
    
objtilemap:
    incbin "./data/tilemaps/obj_initial_tilemap.bin"
    
;warn pc