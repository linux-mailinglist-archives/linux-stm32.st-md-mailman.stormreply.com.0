Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB27BA5E4AC
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Mar 2025 20:43:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72E9BC78011;
	Wed, 12 Mar 2025 19:43:38 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 472CEC7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Mar 2025 19:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hNZU7Eufd1JegykKvVAxyzlCRzhTF9+s3bvb0sxIJX0=; b=0vw3r5MrcHlD21PyA7dl1mK4Kg
 ufSmqwKJDBV7slfX+xao+ZepvMw1mX1QA4f88351Me+OPN4sePXP4CmjSE6b6psd60uCnu/kTLe1Y
 xNgFMCUgcHk8oLevRFWtxMTLDJkg18Nq3oOOk/QefBWwuDV46iJCBWgFDuHy+u1Q7KiOEWNogwLfY
 j4dXk8xqzHPdYnVOhTryc6CmsIN+atWh/8TykZ3g+kA3bakaWXEGdsW6VrXO8+o6ZgtMVmRdePNvA
 tBdCG1wWJv/T0o7DOFJz0BruOt/VpMNJzRGGunRBw5f6oxthrbCSOPULsXrILs0iqxa0Y3v+lRjsg
 2aGRjHVw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42086 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tsRzG-000647-0E;
 Wed, 12 Mar 2025 19:43:30 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tsRyv-0064nU-O9; Wed, 12 Mar 2025 19:43:09 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tsRyv-0064nU-O9@rmk-PC.armlinux.org.uk>
Date: Wed, 12 Mar 2025 19:43:09 +0000
Cc: Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lars Persson <larper@axis.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net] net: stmmac: dwc-qos-eth: use
	devm_kzalloc() for AXI data
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

Everywhere else in the driver uses devm_kzalloc() when allocating the
AXI data, so there is no kfree() of this structure. However,
dwc-qos-eth uses kzalloc(), which leads to this memory being leaked.
Switch to use devm_kzalloc().

Fixes: d8256121a91a ("stmmac: adding new glue driver dwmac-dwc-qos-eth")
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index bd4eb187f8c6..b5a7e05ab7a7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -46,7 +46,9 @@ static int dwc_eth_dwmac_config_dt(struct platform_device *pdev,
 	u32 a_index = 0;
 
 	if (!plat_dat->axi) {
-		plat_dat->axi = kzalloc(sizeof(struct stmmac_axi), GFP_KERNEL);
+		plat_dat->axi = devm_kzalloc(&pdev->dev,
+					     sizeof(struct stmmac_axi),
+					     GFP_KERNEL);
 
 		if (!plat_dat->axi)
 			return -ENOMEM;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
