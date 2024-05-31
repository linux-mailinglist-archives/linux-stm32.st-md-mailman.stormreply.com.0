Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 805A78D60AC
	for <lists+linux-stm32@lfdr.de>; Fri, 31 May 2024 13:27:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B80DC7128F;
	Fri, 31 May 2024 11:27:04 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DCCCC71288
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 May 2024 11:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yz4eTBWoxbuuF2Ohye0DezdsGM6F55QSQ6ouR9V4Ptc=; b=EXs2dttXM8ndBMt8IApzgkEDHA
 ga7xrkejCRdN7lqD2UVBjsJpQEWWoXRv7yLAF9K/jZ3CNcb3JxHjUWL0h61Hv7j2DpFRoeJ1wOm5y
 Gi2JpJxYxsu+6jJ4TcWLQDQTcDtM3zZLVr+yuqdYKngWiBAtbIzfYiVGLrcIStLSSfc4IRmCmah3C
 orNEaZCslTVJvctl6/IqeJMdbHoQLHZ0eQ2jRInDO8ULH2zkpKuGhhIZ1ZsCk1y2EsIMXPpwS+8qx
 NCqDByD6TAo4cdI5fI8e3rhQ8BoQnOTY90lDk/lBFuy0Zx1URcpNxfTKcZl/4iZP+Tg79oH2SOzQN
 iy5nyZKw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:32886 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1sD0PJ-0008TA-1W;
 Fri, 31 May 2024 12:26:49 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1sD0PL-00EzCP-1u; Fri, 31 May 2024 12:26:51 +0100
In-Reply-To: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
From: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1sD0PL-00EzCP-1u@rmk-PC.armlinux.org.uk>
Date: Fri, 31 May 2024 12:26:51 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH RFC net-next v2 8/8] net: stmmac: Activate
 Inband/PCS flag based on the selected iface
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

From: Serge Semin <fancer.lancer@gmail.com>

The HWFEATURE.PCSSEL flag is set if the PCS block has been synthesized
into the DW GMAC controller. It's always done if the controller supports
at least one of the SGMII, TBI, RTBI PHY interfaces. If none of these
interfaces support was activated during the IP-core synthesize the PCS
block won't be activated either and the HWFEATURE.PCSSEL flag won't be
set. Based on that the RGMII in-band status detection procedure
implemented in the driver hasn't been working for the devices with the
RGMII interface support and with none of the SGMII, TBI, RTBI PHY
interfaces available in the device.

Fix that just by dropping the dma_cap.pcs flag check from the conditional
statement responsible for the In-band/PCS functionality activation. If the
RGMII interface is supported by the device then the in-band link status
detection will be also supported automatically (it's always embedded into
the RGMII RTL code). If the SGMII interface is supported by the device
then the PCS block will be supported too (it's unconditionally synthesized
into the controller). The later is also correct for the TBI/RTBI PHY
interfaces.

Note while at it drop the netdev_dbg() calls since at the moment of the
stmmac_check_pcs_mode() invocation the network device isn't registered. So
the debug prints will be for the unknown/NULL device.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
[rmk: fix build errors, only use PCS for SGMII if priv->dma_cap.pcs is set]
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c    | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ad19ba42c412..4384d61a3bcd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1132,18 +1132,10 @@ static void stmmac_check_pcs_mode(struct stmmac_priv *priv)
 {
 	int interface = priv->plat->mac_interface;
 
-	if (priv->dma_cap.pcs) {
-		if ((interface == PHY_INTERFACE_MODE_RGMII) ||
-		    (interface == PHY_INTERFACE_MODE_RGMII_ID) ||
-		    (interface == PHY_INTERFACE_MODE_RGMII_RXID) ||
-		    (interface == PHY_INTERFACE_MODE_RGMII_TXID)) {
-			netdev_dbg(priv->dev, "PCS RGMII support enabled\n");
-			priv->hw->pcs = STMMAC_PCS_RGMII;
-		} else if (interface == PHY_INTERFACE_MODE_SGMII) {
-			netdev_dbg(priv->dev, "PCS SGMII support enabled\n");
-			priv->hw->pcs = STMMAC_PCS_SGMII;
-		}
-	}
+	if (phy_interface_mode_is_rgmii(interface))
+		priv->hw->pcs = STMMAC_PCS_RGMII;
+	else if (priv->dma_cap.pcs && interface == PHY_INTERFACE_MODE_SGMII)
+		priv->hw->pcs = STMMAC_PCS_SGMII;
 }
 
 /**
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
