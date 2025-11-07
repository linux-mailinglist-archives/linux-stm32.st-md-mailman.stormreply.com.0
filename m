Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE27FC3EF60
	for <lists+linux-stm32@lfdr.de>; Fri, 07 Nov 2025 09:29:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BC58C60466;
	Fri,  7 Nov 2025 08:29:36 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65D4AC60465
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Nov 2025 08:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6b2Jeag/15waNFP16mPLz7zFFYTMVqMxpfra85ewdwk=; b=N2EDNrYyhg0H3Yv2T5jPC1mMNh
 YAIeb+w4j06Kb0t1XN+W6BPwAc6NdgLITQjPiTDxj9rhKSs5u9BQWbAvcW+2E+ShCTkCTaZXoJyce
 ZYC8Jz+FEw2wqav8zHC4pjsPuosP7hVYvylRF4rMBBQfdwdJA2gvKIsoAykqkL2nFB8R7HRgUyqQC
 w40SPqg9HXXtCTFuApRdvcB1QKe5MIl6jqLRFmDMPJwP8DqqbnzkaSYYMpMSppTJ1ut+03ZLfG4Yn
 nSBm8mW+flfvZV7hAntpanIqYVAYmuBR1W5B/shu2sYO/Dqwol7z5aRCLoQFL3dz6PNrxqS7VeLZL
 JSUxWELg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33948 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vHHqa-000000006Bi-0VZP;
 Fri, 07 Nov 2025 08:29:28 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vHHqY-0000000Djrn-1D6H; Fri, 07 Nov 2025 08:29:26 +0000
In-Reply-To: <aQ2tgEu-dudzlZlg@shell.armlinux.org.uk>
References: <aQ2tgEu-dudzlZlg@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vHHqY-0000000Djrn-1D6H@rmk-PC.armlinux.org.uk>
Date: Fri, 07 Nov 2025 08:29:26 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 11/11] net: stmmac: ingenic: use
 ->set_phy_intf_sel()
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

Rather than placing the phy_intf_sel() setup in the ->init() method,
move it to the new ->set_phy_intf_sel() method.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
v3: fix Smatch warning: phy_intf_sel is unsigned and thus cannot be
    negative
---
 .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 33 +++++++------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
index 41a2071262bc..8e4a30c11db0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
@@ -134,32 +134,21 @@ static int x2000_mac_set_mode(struct ingenic_mac *mac, u8 phy_intf_sel)
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
 }
 
-static int ingenic_mac_init(struct platform_device *pdev, void *bsp_priv)
+static int ingenic_set_phy_intf_sel(void *bsp_priv, u8 phy_intf_sel)
 {
 	struct ingenic_mac *mac = bsp_priv;
-	phy_interface_t interface;
-	int phy_intf_sel, ret;
-
-	if (mac->soc_info->set_mode) {
-		interface = mac->plat_dat->phy_interface;
-
-		phy_intf_sel = stmmac_get_phy_intf_sel(interface);
-		if (phy_intf_sel < 0 || phy_intf_sel >= BITS_PER_BYTE ||
-		    ~mac->soc_info->valid_phy_intf_sel & BIT(phy_intf_sel)) {
-			dev_err(mac->dev, "unsupported interface %s\n",
-				phy_modes(interface));
-			return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;
-		}
 
-		dev_dbg(mac->dev, "MAC PHY control register: interface %s\n",
-			phy_modes(interface));
+	if (!mac->soc_info->set_mode)
+		return 0;
 
-		ret = mac->soc_info->set_mode(mac, phy_intf_sel);
-		if (ret)
-			return ret;
-	}
+	if (phy_intf_sel >= BITS_PER_BYTE ||
+	    ~mac->soc_info->valid_phy_intf_sel & BIT(phy_intf_sel))
+		return -EINVAL;
+
+	dev_dbg(mac->dev, "MAC PHY control register: interface %s\n",
+		phy_modes(mac->plat_dat->phy_interface));
 
-	return 0;
+	return mac->soc_info->set_mode(mac, phy_intf_sel);
 }
 
 static int ingenic_mac_probe(struct platform_device *pdev)
@@ -221,7 +210,7 @@ static int ingenic_mac_probe(struct platform_device *pdev)
 	mac->plat_dat = plat_dat;
 
 	plat_dat->bsp_priv = mac;
-	plat_dat->init = ingenic_mac_init;
+	plat_dat->set_phy_intf_sel = ingenic_set_phy_intf_sel;
 
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
