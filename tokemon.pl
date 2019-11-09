/* Tipe Tokemon */
    % type(fire).
    % type(leaves).
    % type(water).
    % type(dragon).
    % type(normal).
    % type(electric).
/* Nama Tokemon */
    /* type: fire */
        tokemon(charmanbro).
        type(fire, charmanbro).
        tokemon(magger).
        type(fire, magger).
        tokemon(moltron).
        type(fire, moltron).
    /* type: leaves */
        tokemon(execute).
        type(leaves, execute).
        tokemon(lotek).
        type(leaves, lotek).
        tokemon(nutleaf).
        type(leaves, nutleaf).
    /* type: water */
        tokemon(psyluck).
        type(water, psyluck).
        tokemon(magicard).
        type(water, magicard).
        tokemon(fastpoke).
        type(water, fastpoke).
    /* type: dragon */
        tokemon(martini).
        type(dragon, martini).
        tokemon(latian).
        type(dragon, latian).
        tokemon(educa).
        type(dragon, educa).
        tokemon(ruanguru).
        type(dragon, ruanguru).
    /* type: normal */
        tokemon(dosatu).
        type(normal, dosatu).
        tokemon(pidgay).
        type(normal, pidgay).
        tokemon(setarbuck).
        type(normal, setarbuck).
    /* type: electric */    
        tokemon(tikachu).
        type(electric, tikachu).
        tokemon(elekterus).
        type(electric, elekterus).
        tokemon(helicopter).
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