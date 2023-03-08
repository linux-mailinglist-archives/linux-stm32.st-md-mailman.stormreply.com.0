Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 007346B1119
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Mar 2023 19:34:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B76F2C6A5EB;
	Wed,  8 Mar 2023 18:34:44 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB9CAC6907D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Mar 2023 18:34:42 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id k10so45591366edk.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Mar 2023 10:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678300482;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=VtUE/7DBohqNr7IJ3h/RgLd1gCpyEJMqeBsb1dHhiiw=;
 b=fHmNlpoMEszeE15zSWXKhmvAq0EDBulLvVk7HYWuPhBWDAN3TUjmkcrisqicYJ3bW/
 20+ijoy3Y/FQhe5M69QbmFhsZihZK7M8h3X6+HDqYB3hqjql8woeHenCG4MUgzzC8A3g
 ejqZNbW1gsV1Gfwit4wm46QaHrrj9hda+JuGS9nqE2CDZIMy6mO5ocOA00kalBh3HmTI
 oLceEemLvRTcQXfAbwysUE0hFZ+sJcvXGxLNk1KkV3kQjTmky04YODCLVdAZiZUGM84K
 kxxvEnQHVsNLf79Po4HmwGO3h5IjsYrZf3L2tNMVKHJ68/DMP2MRkmOny8WjTZ/N8W8H
 Ub9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678300482;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VtUE/7DBohqNr7IJ3h/RgLd1gCpyEJMqeBsb1dHhiiw=;
 b=jkUCmRK67Qj2B2al5i7UV1Dj8PoK8ibXvbDB4BhD9m6Ung69FyY3QJ3+fNNRqNonrd
 P5wAnip4dh9a4xSWT/EdZrwjip/Q+0hltLLdz+b4G3480IYqKrxa5iuFRk2oKwJnufmz
 8IoKroJRashUtXLjSEO/KkyDbqUhjuj9hL9JKVictQak2MwziZ6qAQrGhNS0RSQ9AMHX
 4+IuYGGm40O3GzRQtrC1dzgm2WT3Y4gqV8tHrzqquR3iaFe8+6p82bjTD2c/gkZRk865
 4dKG22O3QXojy1+6cPpmjU0QRGAhN1HUQDf/pIbZesqMcEe0rn49jilTJ/+LKLPbi8Ep
 B3sg==
X-Gm-Message-State: AO0yUKW+QeBwrxNlYjvoGkaYrsp1EV5g8PaEbrZqhIrZbbylrinar24j
 24vWLVQo7VWiQH+IoSXBjoM=
X-Google-Smtp-Source: AK7set+NcA0sgdg4llwz3yGkNz7kStT6sPz/Ru82tgxk1Zl88I1GbZ2ntBhg9IwWQghzRUFE1LELOQ==
X-Received: by 2002:a05:6402:5154:b0:4bd:6b93:1289 with SMTP id
 n20-20020a056402515400b004bd6b931289mr17146099edd.15.1678300482112; 
 Wed, 08 Mar 2023 10:34:42 -0800 (PST)
Received: from ?IPv6:2a02:168:6806:0:3ab6:1404:fd5c:80ff?
 ([2a02:168:6806:0:3ab6:1404:fd5c:80ff])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a170906771200b008cc920469b5sm7922081ejm.18.2023.03.08.10.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 10:34:41 -0800 (PST)
Message-ID: <09d65e1ee0679e1e74b4f3a5a4c55bd48332f043.camel@gmail.com>
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Date: Wed, 08 Mar 2023 19:34:40 +0100
In-Reply-To: <72530e86-9ba9-4a01-9cd2-68835ecae7a0@lunn.ch>
References: <20230116-net-next-remove-probe-capabilities-v2-0-15513b05e1f4@walle.cc>
 <20230116-net-next-remove-probe-capabilities-v2-4-15513b05e1f4@walle.cc>
 <449bde236c08d5ab5e54abd73b645d8b29955894.camel@gmail.com>
 <100c439a-2a4d-4cb2-96f2-5bf273e2121a@lunn.ch>
 <712bc92ca6d576f33f63f1e9c2edf0030b10d3ae.camel@gmail.com>
 <db6b8a09-b680-4baa-8963-d355ad29eb09@lunn.ch>
 <0e10aa8492eadb587949d8744b56fccaabbd183b.camel@gmail.com>
 <72530e86-9ba9-4a01-9cd2-68835ecae7a0@lunn.ch>
User-Agent: Evolution 3.46.4-1 
MIME-Version: 1.0
Cc: linux-aspeed@lists.ozlabs.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>,
 Joel Stanley <joel@jms.id.au>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Andrew Jeffery <andrew@aj.id.au>,
 Bryan Whitehead <bryan.whitehead@microchip.com>, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, Michael Walle <michael@walle.cc>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Heiner Kallweit <hkallweit1@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [Linux-stm32] [PATCH net-next v2 4/6] net: mdio: scan bus based
 on bus capabilities for C22 and C45
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Tue, 2023-03-07 at 21:35 +0100, Andrew Lunn wrote:
> > Summary: Still 4 calls to mdio_bus_scan_c22, but also *2* calls to mdio_bus_scan_c45, approx. 190*100 reads by the switch driver
> 
> Those calls to mdio_bus_scan_c45 are caused by 743a19e38d02 net: dsa:
> mv88e6xxx: Separate C22 and C45 transactions.

Well, yes and no. I understand orion mdio is MDIOBUS_NO_CAP
and therefore the c45 scan is *not* called until 1a136ca2e0
net: mdio: scan bus based on bus capabilities for C22 and C45.
Which is the behaviour I see.
(I needed a close look at the conditions in the if statements
that were removed then)


> The only part of a c45 scan which is not linear is
> mv88e6xxx_g2_smi_phy_wait() which is implemented by
> mv88e6xxx_wait_mask(). That loops reading a register waiting for a bit
> to change. Maybe print out the value of i, and see if it is looping
> more times for C45 than C22?

Here the debug code

diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/chip.c
index 0a5d6c7bb1..23816cad41 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -90,6 +90,7 @@ int mv88e6xxx_wait_mask(struct mv88e6xxx_chip *chip, int addr, int reg,
 	u16 data;
 	int err;
 	int i;
+	static unsigned wait_count = 0, loop_count = 0;
 
 	/* There's no bus specific operation to wait for a mask. Even
 	 * if the initial poll takes longer than 50ms, always do at
@@ -100,8 +101,13 @@ int mv88e6xxx_wait_mask(struct mv88e6xxx_chip *chip, int addr, int reg,
 		if (err)
 			return err;
 
-		if ((data & mask) == val)
+		if ((data & mask) == val) {
+			wait_count++;
+			loop_count += i;
+			if (wait_count % 10 == 0)
+				dev_warn(chip->dev, "wait_count %u, loop_count %u\n", wait_count, loop_count);
 			return 0;
+		}
 
 		if (i < 2)
 			cpu_relax();
diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
index 5b2f48c09a..19fde21cae 100644
--- a/drivers/net/phy/mdio_bus.c
+++ b/drivers/net/phy/mdio_bus.c
@@ -569,6 +569,7 @@ static int mdiobus_scan_bus_c22(struct mii_bus *bus)
 {
 	int i;
 
+	dev_warn(&bus->dev, "*** mdiobus_scan_bus_c22 call ***\n");
 	for (i = 0; i < PHY_MAX_ADDR; i++) {
 		if ((bus->phy_mask & BIT(i)) == 0) {
 			struct phy_device *phydev;
@@ -578,6 +579,7 @@ static int mdiobus_scan_bus_c22(struct mii_bus *bus)
 				return PTR_ERR(phydev);
 		}
 	}
+	dev_warn(&bus->dev, "*** mdiobus_scan_bus_c22 return ***\n");
 	return 0;
 }
 
@@ -585,6 +587,7 @@ static int mdiobus_scan_bus_c45(struct mii_bus *bus)
 {
 	int i;
 
+	dev_warn(&bus->dev, "*** mdiobus_scan_bus_c45 call ***\n");
 	for (i = 0; i < PHY_MAX_ADDR; i++) {
 		if ((bus->phy_mask & BIT(i)) == 0) {
 			struct phy_device *phydev;
@@ -598,6 +601,7 @@ static int mdiobus_scan_bus_c45(struct mii_bus *bus)
 				return PTR_ERR(phydev);
 		}
 	}
+	dev_warn(&bus->dev, "*** mdiobus_scan_bus_c45 return ***\n");
 	return 0;
 }
 


And here the trimmed results from boot @ 1a136ca2e0, plus debug code.

It's not only the looping during the mv88e6xxx_wait_mask calls, but
also the sheer amount of mv88e6xxx_wait_mask calls during the c45 scans.
(c22: ~0.1 sec & ~150 calls, c45: 2.3-2.5 sec & ~4800 calls)


[    0.195215] mdio_bus fixed-0: *** mdiobus_scan_bus_c22 call ***
[    0.195221] mdio_bus fixed-0: *** mdiobus_scan_bus_c22 return ***
[    0.195617] mdio_bus f1072004.mdio-mii: *** mdiobus_scan_bus_c22 call ***
[    0.195623] mdio_bus f1072004.mdio-mii: *** mdiobus_scan_bus_c22 return ***
[    0.202583] mv88e6085 f1072004.mdio-mii:10: switch 0x1760 detected: Marvell 88E6176, revision 1
[    0.212708] mdio_bus mv88e6xxx-0: *** mdiobus_scan_bus_c22 call ***
[    0.222200] mv88e6085 f1072004.mdio-mii:10: wait_count 10, loop_count 3
........
[    0.315724] mv88e6085 f1072004.mdio-mii:10: wait_count 150, loop_count 76
[    0.315908] mdio_bus mv88e6xxx-0: *** mdiobus_scan_bus_c22 return ***
[    0.315913] mdio_bus mv88e6xxx-0: *** mdiobus_scan_bus_c45 call ***
[    0.321095] mv88e6085 f1072004.mdio-mii:10: wait_count 160, loop_count 83
........
[    2.610380] mv88e6085 f1072004.mdio-mii:10: wait_count 4980, loop_count 1571
[    2.613258] mdio_bus mv88e6xxx-0: *** mdiobus_scan_bus_c45 return ***
[    2.755785] mv88e6085 f1072004.mdio-mii:10: switch 0x1760 detected: Marvell 88E6176, revision 1
[    2.766047] mdio_bus mv88e6xxx-1: *** mdiobus_scan_bus_c22 call ***
[    2.766960] mv88e6085 f1072004.mdio-mii:10: wait_count 4990, loop_count 1574
........
[    2.867107] mv88e6085 f1072004.mdio-mii:10: wait_count 5130, loop_count 1645
[    2.869938] mdio_bus mv88e6xxx-1: *** mdiobus_scan_bus_c22 return ***
[    2.869943] mdio_bus mv88e6xxx-1: *** mdiobus_scan_bus_c45 call ***
[    2.871556] mv88e6085 f1072004.mdio-mii:10: wait_count 5140, loop_count 1649
........
[    5.371710] mv88e6085 f1072004.mdio-mii:10: wait_count 9970, loop_count 4282
[    5.373332] mdio_bus mv88e6xxx-1: *** mdiobus_scan_bus_c45 return ***




Best regards, Klaus
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
