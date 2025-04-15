Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CF0A89ED2
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Apr 2025 14:58:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF47CC78F81;
	Tue, 15 Apr 2025 12:58:54 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7375C78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 12:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OqLXDGv3Fls4ysUHHIvC7QJrCvpDtEPwNQhSDZ3sDJ4=; b=ViuqtjcQbaHZXdfHO3285BRbUz
 AbwRA36/hCCqufNfw6WB3lJKwWDm2445K9WaduGMmu0GVCiB8Z0PtmgVY0l4iXUYsfaEVvRu0dWK+
 PWvKM/i6KX1WNJg0dhc+NhStQ1R0FNKb8Zkhx3m8o8R0rLwoSrDSOXvyrROnJSueQNDU6YYc5lNfI
 aUGnXjCjQQ33mYVtWF99qr7lgVQrIXssuLzBOlqgAMASApczkFyQGRJE560LoyCipkI6IgX8unPY1
 t/L8hbaEMHMs9Fm9Zm3cuY4AvKjx7yHuPu2B/n66Hauj11C4ZPRmCtQ/N2l65UPqQ+CDFnagVfIDg
 L7SgmtpA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:55888 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1u4fsG-0008CS-0W;
 Tue, 15 Apr 2025 13:58:48 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1u4fre-000nMr-FT; Tue, 15 Apr 2025 13:58:10 +0100
In-Reply-To: <Z_5WT_jOBgubjWQg@shell.armlinux.org.uk>
References: <Z_5WT_jOBgubjWQg@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1u4fre-000nMr-FT@rmk-PC.armlinux.org.uk>
Date: Tue, 15 Apr 2025 13:58:10 +0100
Cc: Eric Dumazet <edumazet@google.com>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: sunxi: use
 devm_stmmac_pltfr_probe()
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

Using devm_stmmac_pltfr_probe() simplifies the probe function. This
will not only call plat_dat->init (sun7i_dwmac_init), but also
plat_dat->exit (sun7i_dwmac_exit) appropriately if stmmac_dvr_probe()
fails. This results in an overall simplification of the glue driver.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
index 665eab1d3409..1eadcf5d1ad6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
@@ -144,7 +144,7 @@ static int sun7i_gmac_probe(struct platform_device *pdev)
 	plat_dat->tx_fifo_size = 4096;
 	plat_dat->rx_fifo_size = 16384;
 
-	return stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
+	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
 static const struct of_device_id sun7i_dwmac_match[] = {
@@ -155,7 +155,6 @@ MODULE_DEVICE_TABLE(of, sun7i_dwmac_match);
 
 static struct platform_driver sun7i_dwmac_driver = {
 	.probe  = sun7i_gmac_probe,
-	.remove = stmmac_pltfr_remove,
 	.driver = {
 		.name           = "sun7i-dwmac",
 		.pm		= &stmmac_pltfr_pm_ops,
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
