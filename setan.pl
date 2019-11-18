:- dynamic(hp/2). /* hp(X, Y) */
:- dynamic(fullhp/2).
:- dynamic(level/2).
:- dynamic(experience/2).

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
        setan(hantu_wibu).
        setan(nurikabe).
        setan(samurai).
        setan(grimreaper).
        setan(cerberus).
        setan(twilight_Dragon).

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
        type(gluttony, grimreaper).
    /* type: greed */
        type(greed, mbah_jenggot).
        type(greed, hantu_kaki).
        type(greed, slenderman).
        type(greed, mammon).
    /* type: pride */
        type(pride, hantu_IP_4).
        type(pride, jin_tomang).
        type(pride, jelangkung).
        type(pride, lucifer).
        type(pride, samurai).
    /* type: sloth */
        type(sloth, jenglot).
        type(sloth, wewe_gombel).
        type(sloth, jeruk_purut).
        type(sloth, nurikabe).
        type(sloth, belphegor).
    /* type: lust */
        type(lust, noni_belanda).
        type(lust, tukang_baso_PAU).
        type(lust, hantu_wibu).
        type(lust, asmodeus).
    /*  type: wrath */
        type(wrath, pennywise).
        type(wrath, valak).
        type(wrath, danlap_1920).
        type(wrath, satan).
        type(wrath, cerberus).
    /* type: void */
        type(void, twilight_Dragon).

/* Legendary setan */
        legendary(lucifer).
        legendary(mammon).
        legendary(asmodeus).
        legendary(belphegor).
        legendary(beelzebub).
        legendary(leviathan).
        legendary(satan).

/* stats */
        starthp(pocong, 7500).
        starthp(kuntilanak, 5000).
        starthp(tuyul, 4000).
        starthp(banaspati, 5000).
        starthp(genderuwo, 4250).
        starthp(kuyang, 4100).
        starthp(mbah_jenggot, 4400).
        starthp(hantu_kaki, 5250).
        starthp(slenderman, 6500).
        starthp(jin_tomang, 7250).
        starthp(jelangkung, 6500).
        starthp(hantu_IP_4, 9000).
        starthp(tukang_baso_PAU, 5000).
        starthp(noni_belanda, 7600).
        starthp(jenglot, 6340).
        starthp(wewe_gombel, 6460).
        starthp(jeruk_purut, 6600).
        starthp(valak, 6470).
        starthp(pennywise, 6750).
        starthp(danlap_1920,8150).
        starthp(hantu_wibu,6235).
        starthp(nurikabe, 10500).
        starthp(samurai, 8700).
        starthp(grimreaper, 9750).
        starthp(cerberus, 9750).
        starthp(lucifer, 9000).
        starthp(mammon, 8500).
        starthp(asmodeus, 8500).
        starthp(belphegor, 9500).
        starthp(beelzebub, 10000).
        starthp(leviathan, 9000).
        starthp(satan, 12000).
        starthp(twilight_Dragon, 18000).

        nattack(pocong, 750).
        nattack(kuntilanak, 475).
        nattack(tuyul, 425).
        nattack(banaspati, 525).
        nattack(genderuwo, 575).
        nattack(kuyang, 675).
        nattack(mbah_jenggot, 525).
        nattack(hantu_kaki, 600).
        nattack(slenderman, 650).
        nattack(jin_tomang, 625).
        nattack(jelangkung, 550).
        nattack(hantu_IP_4, 500).
        nattack(tukang_baso_PAU, 550).
        nattack(noni_belanda, 525).
        nattack(jenglot, 475).
        nattack(wewe_gombel, 500).
        nattack(jeruk_purut, 600).
        nattack(valak, 600).
        nattack(pennywise, 625).
        nattack(danlap_1920,700).
        nattack(hantu_wibu,550).
        nattack(nurikabe, 400).
        nattack(samurai, 800).
        nattack(grimreaper, 900).
        nattack(cerberus, 650).
        nattack(lucifer, 550).
        nattack(mammon, 500).
        nattack(asmodeus, 460).
        nattack(belphegor, 460).
        nattack(beelzebub, 510).
        nattack(leviathan, 510).
        nattack(satan, 810).
        nattack(twilight_Dragon, 1300).

        spattack(pocong, 1000, 'Rocket Knuckle').
        spattack(kuntilanak, 950, 'Screaming Howl').
        spattack(tuyul, 1275, 'Dual Burst').
        spattack(banaspati, 1475,'Rising Flame').
        spattack(genderuwo, 1775,'Black Void').
        spattack(kuyang, 1675,'Surging Aurora').
        spattack(mbah_jenggot, 1525,'Beard Slap').
        spattack(hantu_kaki, 1550,'Rampaging Kick').
        spattack(slenderman, 1700,'Faceless Rage').
        spattack(jin_tomang, 1800,'Cyclone Fury').
        spattack(jelangkung, 1250,'Vegetable Nightmare').
        spattack(hantu_IP_4, 1650,'Soulstroke of Education').
        spattack(tukang_baso_PAU, 1550,'Happy Discount Fiesta').
        spattack(noni_belanda, 1550,'Assasinate').
        spattack(jenglot, 1850,'Moonlight Fury').
        spattack(wewe_gombel, 1775,'Spicy BOMB!!!').
        spattack(jeruk_purut, 1800,'Exploded Fruit Farm').
        spattack(valak, 3000,'Indignation').
        spattack(pennywise, 1575,'Lucky!!!').
        spattack(danlap_1920, 1800,'Homing Interruption Fury').
        spattack(hantu_wibu, 2000,'Comiket Open!!!').
        spattack(nurikabe, 2500,'Earthquake').
        spattack(samurai, 2100,'Godspeed Slash').
        spattack(grimreaper, 2200,'Twilight Fury').
        spattack(cerberus, 3000,'Tri-Burst Elemental Ray').
        spattack(lucifer, 2500,'Terminus Pride').
        spattack(mammon, 2250,'Astral Impact').
        spattack(asmodeus, 2400,'Symphony of Hell').
        spattack(belphegor, 2750,'Chaotic Fury').
        spattack(beelzebub, 2800,'Demonic Blast').
        spattack(leviathan, 2600,'Hell Punishing Wave').
        spattack(satan, 8000,'Big Bang!').
        spattack(twilight_Dragon, 6500,'Twilight ').

/* Relasi Tipe setan */
    /* Super Effective */
    /* Envy -> Gluttony && Envy -> Pride */
    seffective(envy, gluttony).
    seffective(envy, pride).
    /* Gluttony -> Greed && Gluttony -> Sloth */
    seffective(gluttony, greed).
    seffective(gluttony, sloth).
    /* Greed -> Pride && Greed -> Lust */
    seffective(greed, pride).
    seffective(greed, lust).
    /* Pride -> Sloth && Pride -> Wrath */
    seffective(pride, sloth).
    seffective(pride, wrath).
    /* Sloth -> Lust && Sloth -> Wrath */
    seffective(sloth, lust).
    seffective(sloth, wrath).
    /* Lust -> Envy && Lust -> Wrath */
    seffective(lust, envy).
    seffective(lust, wrath).
    /* Wrath -> Envy && Wrath -> Gluttony && Wrath -> Greed */
    seffective(wrath, envy).
    seffective(wrath, gluttony).
    seffective(wrath, greed).
    /* Void -> Pride && Void -> Sloth && Void -> Lust && Void -> Wrath */
    seffective(void, pride).
    seffective(void, sloth).
    seffective(void, lust).
    seffective(void, wrath).
    
    /* Not Effective */
    /* Envy -> Lust && Envy -> Wrath */
    neffective(envy, lust).
    neffective(envy, wrath).
    /* Gluttony -> Envy && Gluttony -> Wrath */
    neffective(gluttony, envy).
    neffective(gluttony, wrath).
    /* Greed -> Gluttony && Greed -> Wrath */
    neffective(greed, gluttony).
    neffective(greed, wrath).
    /* Pride -> Envy && Pride -> Greed */
    neffective(pride, envy).
    neffective(pride, greed).
    /* Sloth -> Pride && Sloth -> Gluttony */
    neffective(sloth, pride).
    neffective(sloth, gluttony).
    /* Lust -> Greed && Lust -> Sloth */
    neffective(lust, greed).
    neffective(lust, sloth).
    /* Wrath -> Pride && Wrath -> Sloth && Wrath -> Lust */
    neffective(wrath, pride).
    neffective(wrath, sloth).
    neffective(wrath, lust).
    /* Void -> Envy && Void -> Gluttony && Void -> Greed */
    neffective(void, envy).
    neffective(void, gluttony).
    neffective(void, greed).
