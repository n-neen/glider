lorom

org $828000



;=================================palettes=================================
    
    testpalette:
        dw $5B9C, $2A16, $42D6, $57ff, $1084, $0150, $0008, $2108,
           $0420, $08a0, $439C, $0216, $2A10, $0000, $0000, $0000

    
        incbin "./data/palettes/palette0.bin"
        incbin "./data/palettes/palette1.bin"
        
        dw $2940, $0000, $6739, $7ec7, $2108, $5ef7, $39ac, $24a4,
           $2529, $39ce, $4e73, $44c4, $7fff, $5294, $3c3c, $643c
           
        dw $2940, $0000, $6739, $7ec7, $2108, $5ef7, $39ac, $24a4,
           $2529, $39ce, $4e73, $44c4, $7fff, $5294, $3c3c, $643c
        
        ;gets thrown at the start of cgram
        
;===============================sprite data===============================

glider:
    .header:
        dw #.graphics, #.spritemap, #.palette, #.hitbox
        
    .hitbox:                ;radii
        db $0a, $05         ;x, y
        
    .graphics:
        incbin "./data/sprites/glider.gfx"
    
    .spritemap:
        incsrc "./data/sprites/glider_spritemap.asm"
    
    .palette:
        incbin "./data/sprites/glider.pal"


;===============================background data===============================

bg1tilemap:
    incbin "./data/tilemaps/bg1tilemap.bin"
    
bg1gfx:
    incbin "./data/tiles/bg1_gfx.gfx"