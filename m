Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1828790243B
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2024 16:40:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3C3EC6C83C;
	Mon, 10 Jun 2024 14:40:53 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82736C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2024 14:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SNwgbigX1ci9uok9QpNvOvvdhi7uYTHIbZL8XLOiAs0=; b=bySBVZ1WVTUaoTnpKTwXy1Z7E7
 DQGEvSoqKScAb2H2fddu2Qy7vV9RGb7kWfcnFiTSQbGmGJTARrhoVJNhxfLW+t/FZs42Kf+UGi7fG
 RwlDENxPiankwnNmb5k3OORLHwWTgYA2+/iWPwVESd0JuByfLe5QYQLvvLYwJTE/f1Z8P06jAWuNr
 SUELNmBj+qZwDP3ezMXQ77NKluM5KghinbGqMkrunCyVF6R6puCuPzXFW8iNk4tI1V4IrF8tfLbFA
 D72ePVbov/VWWFERK9cCH47wSkQNL42/pnAlkq3TNvc4lD4FLedDTAowgEpFn8EWp0q3KdYbifhab
 RSO2GzBQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:55864 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1sGgCP-0001fH-0F;
 Mon, 10 Jun 2024 15:40:41 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1sGgCS-00Facz-4s; Mon, 10 Jun 2024 15:40:44 +0100
In-Reply-To: <ZmcQTuR5IKRp0pgy@shell.armlinux.org.uk>
References: <ZmcQTuR5IKRp0pgy@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1sGgCS-00Facz-4s@rmk-PC.armlinux.org.uk>
Date: Mon, 10 Jun 2024 15:40:44 +0100
Cc: Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next 3/5] net: stmmac: dwmac-rzn1: provide
 select_pcs() implementation
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

Provide a .select_pcs() implementation which returns the phylink PCS
that was created in the .pcs_init() method.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rzn1.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rzn1.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rzn1.c
index 848cf3c01f4a..59a7bd560f96 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rzn1.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rzn1.c
@@ -39,6 +39,12 @@ static void rzn1_dwmac_pcs_exit(struct stmmac_priv *priv)
 		miic_destroy(priv->hw->phylink_pcs);
 }
 
+static struct phylink_pcs *rzn1_dwmac_select_pcs(struct stmmac_priv *priv,
+						 phy_interface_t interface)
+{
+	return priv->hw->phylink_pcs;
+}
+
 static int rzn1_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -57,6 +63,7 @@ static int rzn1_dwmac_probe(struct platform_device *pdev)
 	plat_dat->bsp_priv = plat_dat;
 	plat_dat->pcs_init = rzn1_dwmac_pcs_init;
 	plat_dat->pcs_exit = rzn1_dwmac_pcs_exit;
+	plat_dat->select_pcs = rzn1_dwmac_select_pcs;
 
 	ret = stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
 	if (ret)
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
