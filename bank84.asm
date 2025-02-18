lorom

org $848000
    
;===========================================================================================
;===================================  D E F I N E S  =======================================
;===========================================================================================

;24 words, 24 objects = 24 words, 48 bytes per array ($30)
!objectarraystart       =       $1000
!objectarraysize        =       $0030
!objID                  =       !objectarraystart
!objsizex               =       !objID+!objectarraysize
!objsizey               =       !objsizex+!objectarraysize
!objtilemapointer       =       !objsizey+!objectarraysize
!objxcoord              =       !objtilemapointer+!objectarraysize
!objycoord              =       !objxcoord+!objectarraysize
;arrays' ends                   +!objectarraysize


!objtilemaps            =       $7f6000



;===========================================================================================
;=========================    R O O M   O B J E C T S   ====================================
;===========================================================================================
    
;object header:
    ;pointer to tilemap in $84
    ;length of each row [x size]
    ;number of rows     [y size]
    
;object instance additionally has:
        ;origin coords in room (where to start writing tilemap update)
    
obj: {
    
    .init: {
        ;creates instance of an object
        ;takes argument:
        ;a = object header pointer
        
        
        ;does not fetch x, y coords, room populator will do that
        ;via the obj_place routine below
        
        phx
        phy
        phb
        
        phk                         ;db = $84
        plb
        
        pha
        ..findslot: {
            ldx #!objectarraysize+2     ;currently $0030
        -
            dex : dex                   ;we want the zero flag from lda
            lda !objID,x                ;so the loop starts at ammount+2 (dex would affect zero flag)
            bne -
            ;after we exit this loop, x will be the first available slot
        }
        pla
        
        sta !objID,x                ;store object ID
        tay
        
        lda $0000,y
        sta !objtilemapointer,x     ;store tilemap pointer
        
        lda $0002,y
        sta !objsizey,x             ;store object x
        
        lda $0004,y
        sta !objsizex,x             ;store object y
        
        ply
        plb
        plx
        rtl
    }
    
    
    .clear: {
        ;deals with an instance of an object. clears all array slots
        ;argument: x = obj id to clear
        
        stz !objID,x
        stz !objsizex,x
        stz !objsizey,x
        stz !objtilemapointer,x
        stz !objxcoord,x
        stz !objycoord,x
        
        rtl
    }
    
    
    .place: {
        ;deals with an instance of an object, called after it is init
        ;get position in room from room object list
        rtl
    }
    
    .writetilemap: {
        ;deals with an instance of an object
        ;get object ID, get x and y post, get tilemap pointer, draw
        rtl
    }
    
    
    .headers: {
        ;object types
        ..vent: {     ;tilemap pointer, xsize, ysize
            dw #obj_tilemaps_floorvent, $0002, $0008
        }
        
        ..candle: {
            dw #obj_tilemaps_candle,    $0002, $0003
        }
        
        ..fanR: {
            dw #obj_tilemaps_fanR,      $0000, $0000
        }
    }
    
    .tilemaps: {
        ..floorvent: {
            ;incbin "./data/tilemaps/obj/floorvent.bin"
        }
        
        ..candle: {
            ;incbin "./data/tilemaps/obj/candle.bin"
        }
        
        ..fanR: {
            ;incbin "./data/tilemaps/obj/fanR.bin"
        }
        
    }
}
