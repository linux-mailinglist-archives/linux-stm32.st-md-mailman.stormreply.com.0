Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 616A1C4059F
	for <lists+linux-stm32@lfdr.de>; Fri, 07 Nov 2025 15:29:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25025C60466;
	Fri,  7 Nov 2025 14:29:00 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 067BCC60465
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Nov 2025 14:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=85Jbq2TMyjp//ir32iMggvHsmI3Fb24s322nxxYV6Nc=; b=endjxMR/0ZEliwKzqbqjEt/zbg
 n1x03XPjy4JiRDb/3oFVXZn7qbqJsjLYAsgtCbOE/Ly+x2lrSsqtdodqtsgfoJvku3A7iInxUwNoF
 y5YqbAy0jyIKL0MRkRKTK8cOhi8iJzrXks3ixAbkyWRWO1gV4WaoZsoWVjdEhEN6s+D3rMSxxeR7K
 k7uPbW8bg5ZIw9zj7uKBjzS7nwB+pn55TTQb8tuRSt88tJLjM8tOgxxcpghSX9I7/ZCPY6XR7bKjx
 bH57FhuEmzlM3th40BKeZMjkTiBPl3jf9wd472H1/L2ewVE1cWN7PCa1bOXS8nElQkBZg3MumyTOq
 66OLnRtA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56072 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vHNSE-000000006hF-3DEv;
 Fri, 07 Nov 2025 14:28:43 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vHNSB-0000000DkSb-3fWL; Fri, 07 Nov 2025 14:28:39 +0000
In-Reply-To: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vHNSB-0000000DkSb-3fWL@rmk-PC.armlinux.org.uk>
Date: Fri, 07 Nov 2025 14:28:39 +0000
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Keguang Zhang <keguang.zhang@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Minda Chen <minda.chen@starfivetech.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 linux-mips@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next 08/16] net: stmmac: meson8b: use
 phy_intf_sel directly
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

Rearrange meson_axg_set_phy_mode() to use phy_intf_sel directly,
converting it to the register field for meson8b_dwmac_mask_bits().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-meson8b.c  | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index f485b9b858bf..865cd6166134 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -26,8 +26,6 @@
 #define PRG_ETH0_RGMII_MODE		BIT(0)
 
 #define PRG_ETH0_EXT_PHY_MODE_MASK	GENMASK(2, 0)
-#define PRG_ETH0_EXT_RGMII_MODE		PHY_INTF_SEL_RGMII
-#define PRG_ETH0_EXT_RMII_MODE		PHY_INTF_SEL_RMII
 
 /* mux to choose between fclk_div2 (bit unset) and mpll2 (bit set) */
 #define PRG_ETH0_CLK_M250_SEL_MASK	GENMASK(4, 4)
@@ -238,21 +236,19 @@ static int meson8b_set_phy_mode(struct meson8b_dwmac *dwmac)
 
 static int meson_axg_set_phy_mode(struct meson8b_dwmac *dwmac)
 {
+	int phy_intf_sel;
+
 	switch (dwmac->phy_mode) {
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 		/* enable RGMII mode */
-		meson8b_dwmac_mask_bits(dwmac, PRG_ETH0,
-					PRG_ETH0_EXT_PHY_MODE_MASK,
-					PRG_ETH0_EXT_RGMII_MODE);
+		phy_intf_sel = PHY_INTF_SEL_RGMII;
 		break;
 	case PHY_INTERFACE_MODE_RMII:
 		/* disable RGMII mode -> enables RMII mode */
-		meson8b_dwmac_mask_bits(dwmac, PRG_ETH0,
-					PRG_ETH0_EXT_PHY_MODE_MASK,
-					PRG_ETH0_EXT_RMII_MODE);
+		phy_intf_sel = PHY_INTF_SEL_RMII;
 		break;
 	default:
 		dev_err(dwmac->dev, "fail to set phy-mode %s\n",
@@ -260,6 +256,10 @@ static int meson_axg_set_phy_mode(struct meson8b_dwmac *dwmac)
 		return -EINVAL;
 	}
 
+	meson8b_dwmac_mask_bits(dwmac, PRG_ETH0, PRG_ETH0_EXT_PHY_MODE_MASK,
+				FIELD_PREP(PRG_ETH0_EXT_PHY_MODE_MASK,
+					   phy_intf_sel));
+
 	return 0;
 }
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
