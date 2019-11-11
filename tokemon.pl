/* Nama Tokemon */
        tokemon(charmanbro).
        tokemon(magger).
        tokemon(moltron).
        tokemon(execute).
        tokemon(lotek).
        tokemon(nutleaf).
        tokemon(psyluck).
        tokemon(magicard).
        tokemon(fastpoke).
        tokemon(martini).
        tokemon(latian).
        tokemon(educa).
        tokemon(ruanguru).
        tokemon(dosatu).
        tokemon(pidgay).
        tokemon(setarbuck).
        tokemon(tikachu).
        tokemon(elekterus).
        tokemon(helicopter).
        tokemon(moltron).
        tokemon(latian).
        tokemon(educa).
        tokemon(ruanguru).

    /* type: fire */
        type(fire, magger).
        type(fire, charmanbro).
        type(fire, moltron).
    /* type: leaves */
        type(leaves, execute).    
        type(leaves, lotek).     
        type(leaves, nutleaf).
    /* type: water */    
        type(water, psyluck).
        type(water, magicard).
        type(water, fastpoke).
    /* type: dragon */
        type(dragon, martini).
        type(dragon, latian).
        type(dragon, educa).
        type(dragon, ruanguru).
    /* type: normal */
        type(normal, dosatu).
        type(normal, pidgay).
        type(normal, setarbuck).
    /* type: electric */ 
        type(electric, tikachu). 
        type(electric, elekterus).
        type(electric, helicopter).
    
/* Legendary Tokemon */
        legendary(moltron).
        legendary(latian).
        legendary(ruanguru).
        legendary(educa).

/* Relasi Tipe Tokemon */
    /* Super Effective */
    /* Serangan tokemon fire efektif terhadap leaves */
    seffective(fire, leaves).
    /* Serangan tokemon leaves efektif terhadap water */
    seffective(leaves, water).
    /* Serangan tokemon water efektif terhadap fire */
    seffective(water, fire).
    /* Serangan tokemon electric efektif terhadap water */
    seffective(electric, water).
    /* Serangan tokemon dragon efektif terhadap dragon */
    seffective(dragon, dragon).
    /* Not Effective */
    /* Serangan tokemon leaves tidak efektif terhadap fire */
    neffective(leaves, fire).
    /* Serangan tokemon water tidak efektif terhadap leaves */
    neffective(water, leaves).
    /* Serangan tokemon fire tidak efektif terhadap water */
    neffective(fire, water).
    /* Serangan tokemon dragon tidak efektif terhadap fire */
    neffective(dragon, fire).
    /* Serangan tokemon dragon tidak efektif terhadap water, leaves, dan electric */
    neffective(dragon, water).
    neffective(dragon, leaves).
    neffective(dragon, electric).
    /* Serangan tokemon electric tidak efektif terhadap leaves */
    neffective(electric, leaves).