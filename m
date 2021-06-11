Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D713E3A49CE
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jun 2021 22:05:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DAB2C58D79;
	Fri, 11 Jun 2021 20:05:56 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8A97C58D5B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jun 2021 20:05:53 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id h24so6274286ejy.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jun 2021 13:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cCwEJUHeAoTnvtQiOv8/qIkgEHZZI2eLgqihKWStCTA=;
 b=UladNP+iMMAw277jet/G1MBHS6R4dHEwZtSNVjceKmd1O5TDqUgXSiAy8ihf1M5HBk
 0K/QLGV8+B0o3dOaOCs4IRR4ylQVVIY3+Wj2LzfIPLMeHZPpyrcJDiksYXyfGH3hBAI+
 X8rx4haL+lsNOOxYW+kVP73UqWe+CXqFqKuPzPMa4MiyTgMTl1vYTbWVYZ41+RjTW8mc
 8r1MxBJGW3zAxOMu4l48u1NxyjWx0NyQ2uJI2Kx/jy+TtST6UsDh5AqM/PnQh+9JX1hj
 obkOw52ngn57PvHUVmlj2MpVLGDHLukmaBLhL1GC0XSnf09fgrqyvzgABEFUpOcSxEVz
 97iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cCwEJUHeAoTnvtQiOv8/qIkgEHZZI2eLgqihKWStCTA=;
 b=KWY5qKUYB20yzbFXeFS+lPYzP5YLEqRQD9K9WLaNP93/nvT7GLpdE7cKqrxCq8elNl
 rUXO6c90UhKvZtHM4uo3da+iMk0gG18Bv67ya6yqQRkUNG4aV0U17tZY7YQfFNDiZP2h
 NNk/cRpGOd42XcoWhdZHOqNU2/tRzpNJbCfLFg0yA/m6FXHeXmcOe+pQ5JQqR06RXQ/I
 9mE7hvdrALCtapmOg/qgMr841+kGEgDy1j3/hoxwpfqYrNzGRlkU7ht7dhjat098GfPW
 nNbjBVsnxZshUIPPPVkNDt83WCeFmi4YkNJy4iKGW9rbh/Nbpii9Vuacoiy4ULCyhduo
 pgfg==
X-Gm-Message-State: AOAM53026L+QirJgdpU6LJDgcLfRrhS90To9ExCMcMNZOZl7HfzuugOL
 TnSvCJleoQFXfDsylqSS0uk=
X-Google-Smtp-Source: ABdhPJy9gtLuOD1wJaJl7UX1fgXHvNi8IgK7khyGFgXFBf/7UKrvioUjhswjSXXNFZhaWTKS8giy/g==
X-Received: by 2002:a17:906:4c91:: with SMTP id
 q17mr5221433eju.512.1623441953473; 
 Fri, 11 Jun 2021 13:05:53 -0700 (PDT)
Received: from localhost.localdomain ([188.26.52.84])
 by smtp.gmail.com with ESMTPSA id w2sm2392084ejn.118.2021.06.11.13.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 13:05:53 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org
Date: Fri, 11 Jun 2021 23:05:23 +0300
Message-Id: <20210611200531.2384819-6-olteanv@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611200531.2384819-1-olteanv@gmail.com>
References: <20210611200531.2384819-1-olteanv@gmail.com>
MIME-Version: 1.0
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Wong Vee Khee <vee.khee.wong@linux.intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH v3 net-next 05/13] net: pcs: xpcs: add support
	for sgmii with no inband AN
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

From: Vladimir Oltean <vladimir.oltean@nxp.com>

In fixed-link use cases, the XPCS can disable the clause 37 in-band
autoneg process, disable the "Automatic Speed Mode Change after CL37 AN"
setting, and force operation in a speed dictated by management.

Add support for this operating mode.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
v2->v3: none
v1->v2: none

 drivers/net/pcs/pcs-xpcs.c | 41 +++++++++++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 8ca7592b02ec..743b53734eeb 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -690,7 +690,7 @@ int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns, int enable)
 }
 EXPORT_SYMBOL_GPL(xpcs_config_eee);
 
-static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs)
+static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs, unsigned int mode)
 {
 	int ret;
 
@@ -726,7 +726,10 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs)
 	if (ret < 0)
 		return ret;
 
-	ret |= DW_VR_MII_DIG_CTRL1_MAC_AUTO_SW;
+	if (phylink_autoneg_inband(mode))
+		ret |= DW_VR_MII_DIG_CTRL1_MAC_AUTO_SW;
+	else
+		ret &= ~DW_VR_MII_DIG_CTRL1_MAC_AUTO_SW;
 
 	return xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_DIG_CTRL1, ret);
 }
@@ -772,7 +775,7 @@ static int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
 		}
 		break;
 	case DW_AN_C37_SGMII:
-		ret = xpcs_config_aneg_c37_sgmii(xpcs);
+		ret = xpcs_config_aneg_c37_sgmii(xpcs, mode);
 		if (ret)
 			return ret;
 		break;
@@ -905,6 +908,36 @@ static void xpcs_get_state(struct phylink_pcs *pcs,
 	}
 }
 
+static void xpcs_link_up_sgmii(struct dw_xpcs *xpcs, unsigned int mode,
+			       int speed, int duplex)
+{
+	int val, ret;
+
+	if (phylink_autoneg_inband(mode))
+		return;
+
+	switch (speed) {
+	case SPEED_1000:
+		val = BMCR_SPEED1000;
+		break;
+	case SPEED_100:
+		val = BMCR_SPEED100;
+		break;
+	case SPEED_10:
+		val = BMCR_SPEED10;
+		break;
+	default:
+		return;
+	}
+
+	if (duplex == DUPLEX_FULL)
+		val |= BMCR_FULLDPLX;
+
+	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, MDIO_CTRL1, val);
+	if (ret)
+		pr_err("%s: xpcs_write returned %pe\n", __func__, ERR_PTR(ret));
+}
+
 static void xpcs_link_up(struct phylink_pcs *pcs, unsigned int mode,
 			 phy_interface_t interface, int speed, int duplex)
 {
@@ -912,6 +945,8 @@ static void xpcs_link_up(struct phylink_pcs *pcs, unsigned int mode,
 
 	if (interface == PHY_INTERFACE_MODE_USXGMII)
 		return xpcs_config_usxgmii(xpcs, speed);
+	if (interface == PHY_INTERFACE_MODE_SGMII)
+		return xpcs_link_up_sgmii(xpcs, mode, speed, duplex);
 }
 
 static u32 xpcs_get_id(struct dw_xpcs *xpcs)
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
