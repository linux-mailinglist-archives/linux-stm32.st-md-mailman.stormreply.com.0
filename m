Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 859FDBDF06B
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Oct 2025 16:29:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E56CC56636;
	Wed, 15 Oct 2025 14:29:00 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7333C56634
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 14:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aaUd4tWFZNUKcPxnE7KNdvYW06fqH0+s6HREJdLSzmQ=; b=VXEYYjC9FYzhm8DfEcHVVCdcvC
 DTBEQrBNMkmHoLbTuNdF9ytUM83G0bfKuyXJctRaxJHhY9xjuEJ3YcgaqZubRsJXZTqewOtyC3pBO
 xVDhK8u0El36GrgatZLs9b7JLcc69MYjCZONELmE+J45cInBU8RPzmYJDcrfU2/0QTCAbzGv6bx64
 ZOt0Aw6cwwSDwwU07u9pMhVK1hAdqqjVa+Vw6DwIF7ZjB8M9epfY06LKI2lUuYeI8+a7n9TtafOll
 YUeXivdsF2WoG1qBuDVhCYhQPaLiGS05R0Wm0n0U3c8ZgAnvbZx5DhqOnCjN4YOnLEnlCH5GD6y5Q
 2SejqPkA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46036 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1v92N7-000000004gb-2Of4;
 Wed, 15 Oct 2025 15:20:58 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1v92Mt-0000000AmHF-3AQR; Wed, 15 Oct 2025 15:20:43 +0100
In-Reply-To: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1v92Mt-0000000AmHF-3AQR@rmk-PC.armlinux.org.uk>
Date: Wed, 15 Oct 2025 15:20:43 +0100
Cc: Song Yoong Siang <yoong.siang.song@intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Kees Cook <kees@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
 Swathi K S <swathi.ks@samsung.com>, Eric Dumazet <edumazet@google.com>,
 Jisheng Zhang <jszhang@kernel.org>, Simon Horman <horms@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Furong Xu <0x1207@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Shenwei Wang <shenwei.wang@nxp.com>,
 Abhishek Chauhan <quic_abchauha@quicinc.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Daniel Machon <daniel.machon@microchip.com>,
 Ley Foon Tan <leyfoon.tan@starfivetech.com>, linux-arm-msm@vger.kernel.org,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Alexis Lothore <alexis.lothore@bootlin.com>,
 Drew Fustini <dfustini@tenstorrent.com>, linux-arm-kernel@lists.infradead.org,
 Rohan G Thomas <rohan.g.thomas@altera.com>,
 Vladimir Oltean <olteanv@gmail.com>, Inochi Amaoto <inochiama@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [Linux-stm32] [PATCH net-next 09/14] net: stmmac: simplify
	stmmac_check_pcs_mode()
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

Now that we only support one mode, simplify stmmac_check_pcs_mode().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c   | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 013a2f3684c7..611197cfa34f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1086,22 +1086,23 @@ static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
 static void stmmac_check_pcs_mode(struct stmmac_priv *priv)
 {
 	int interface = priv->plat->phy_interface;
+	int speed = priv->plat->mac_port_sel_speed;
 
 	if (priv->dma_cap.pcs && interface == PHY_INTERFACE_MODE_SGMII) {
 		netdev_dbg(priv->dev, "PCS SGMII support enabled\n");
 		priv->hw->pcs = STMMAC_PCS_SGMII;
-	}
-
-	/* PS and related bits will be programmed according to the speed */
-	if (priv->hw->pcs) {
-		int speed = priv->plat->mac_port_sel_speed;
 
-		if ((speed == SPEED_10) || (speed == SPEED_100) ||
-		    (speed == SPEED_1000)) {
+		switch (speed) {
+		case SPEED_10:
+		case SPEED_100:
+		case SPEED_1000:
 			priv->hw->ps = speed;
-		} else {
+			break;
+
+		default:
 			dev_warn(priv->device, "invalid port speed\n");
 			priv->hw->ps = 0;
+			break;
 		}
 	}
 }
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
