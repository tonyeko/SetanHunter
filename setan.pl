:- dynamic(hp/2). /* hp(X, Y) */

/* Nama setan */
        setan(pocong).
        setan(kuntilanak).
        setan(tuyul).
        setan(banaspati).
        setan(genderuwo).
        setan(kuyang).
        setan(mbah_jenggot).
        setan(hantu_kaki).
        setan(slenderman).
        setan(jin_tomang).
        setan(jelangkung).
        setan(hantu_IP_4).
        setan(tukang_baso_PAU).
        setan(noni_belanda).
        setan(jenglot).
        setan(wewe_gombel).
        setan(jeruk_purut).
        setan(valak).
        setan(pennywise).
        setan(danlap_1920).

    /* type: envy */
        type(envy, pocong).
        type(envy, kuntilanak).
        type(envy, tuyul).
        type(envy, leviathan).
    /* type: gluttony */
        type(gluttony, banaspati).    
        type(gluttony, genderuwo).     
        type(gluttony, kuyang).
        type(gluttony, beelzebub).
    /* type: greed */    
        type(greed, mbah_jenggot).
        type(greed, hantu_kaki).
        type(greed, slenderman).
        type(greed, mammon).
    /* type: pride */
        type(pride, hantu_IP_4).
        type(pride,	jin_tomang).
        type(pride, jelangkung).
        type(pride, lucifer).
    /* type: sloth */
        type(sloth, jenglot).
        type(sloth, wewe_gombel).
        type(sloth, jeruk_purut).
    /* type: lust */ 
        type(lust, noni_belanda). 
        type(lust, tukang_baso_PAU).
        type(lust, hantu_wibu).
        type(lust, asmodeus).
    /*	type: wrath */
    	type(wrath, pennywise).
    	type(wrath, valak).
    	type(wrath, danlap_1920).
    	type(wrath, satan).

/* Legendary setan */
        legendary(lucifer).
        legendary(mammon).
        legendary(asmodeus).
        legendary(belphegor).
        legendary(beelzebub).
        legendary(leviathan).
        legendary(satan).

/* stats */

        starthp(charmanbro, 500).
        starthp(magger, 450).
        starthp(moltron, 1000).
        starthp(execute, 350).
        starthp(lotek, 300).
        starthp(nutleaf, 470).
        starthp(psyluck, 360).
        starthp(magicard, 250).
        starthp(fastpoke, 660).
        starthp(martini, 450).
        starthp(latian, 1500).
        starthp(educa, 2200).
        starthp(ruanguru, 3000).
        starthp(dosatu, 600).
        starthp(pidgay, 340).
        starthp(setarbuck, 460).
        starthp(tikachu, 500).
        starthp(elekterus, 470).
        starthp(helicopter, 750).

        hp(charmanbro, 500).
        hp(magger, 450).
        hp(moltron, 1000).
        hp(execute, 350).
        hp(lotek, 300).
        hp(nutleaf, 470).
        hp(psyluck, 360).
        hp(magicard, 250).
        hp(fastpoke, 660).
        hp(martini, 450).
        hp(latian, 1500).
        hp(educa, 2200).
        hp(ruanguru, 3000).
        hp(dosatu, 600).
        hp(pidgay, 340).
        hp(setarbuck, 460).
        hp(tikachu, 500).
        hp(elekterus, 470).
        hp(helicopter, 750).

        attack(charmanbro, 40).
        attack(magger, 30).
        attack(moltron, 90).
        attack(execute, 25).
        attack(lotek, 25).
        attack(nutleaf, 27).
        attack(psyluck, 23).
        attack(magicard, 15).
        attack(fastpoke, 40).
        attack(martini, 50).
        attack(latian, 95).
        attack(educa, 103).
        attack(ruanguru, 105).
        attack(dosatu, 40).
        attack(pidgay, 34).
        attack(setarbuck, 46).
        attack(tikachu, 40).
        attack(elekterus, 47).
        attack(helicopter, 75).

        spattack(charmanbro, 65).
        spattack(magger, 50).
        spattack(moltron, 120).
        spattack(execute, 50).
        spattack(lotek, 40).
        spattack(nutleaf, 47).
        spattack(psyluck, 43).
        spattack(magicard, 35).
        spattack(fastpoke, 60).
        spattack(martini, 90).
        spattack(latian, 135).
        spattack(educa, 163).
        spattack(ruanguru, 175).
        spattack(dosatu, 60).
        spattack(pidgay, 54).
        spattack(setarbuck, 66).
        spattack(tikachu, 75).
        spattack(elekterus, 77).
        spattack(helicopter, 85).


/* Relasi Tipe setan */
    /* Super Effective */
    /* Serangan setan envy efektif terhadap gluttony */
    seffective(envy, gluttony).
    /* Serangan setan gluttony efektif terhadap greed */
    seffective(gluttony, greed).
    /* Serangan setan greed efektif terhadap envy */
    seffective(greed, envy).
    /* Serangan setan lust efektif terhadap greed */
    seffective(lust, greed).
    /* Serangan setan pride efektif terhadap pride */
    seffective(pride, pride).
    /* Serangan setan wrath efektif terhadap pride */
    seffective(wrath, pride).
    /* Serangan setan wrath efektif terhadap envy */
    seffective(wrath, envy).
    /* Not Effective */
    /* Serangan setan gluttony tidak efektif terhadap envy */
    neffective(gluttony, envy).
    /* Serangan setan greed tidak efektif terhadap gluttony */
    neffective(greed, gluttony).
    /* Serangan setan envy tidak efektif terhadap greed */
    neffective(envy, greed).
    /* Serangan setan pride tidak efektif terhadap envy */
    neffective(pride, envy).
    /* Serangan setan pride tidak efektif terhadap greed, gluttony, dan lust */
    neffective(pride, greed).
    neffective(pride, gluttony).
    neffective(pride, lust).
    /* Serangan setan lust tidak efektif terhadap gluttony */
    neffective(lust, gluttony).