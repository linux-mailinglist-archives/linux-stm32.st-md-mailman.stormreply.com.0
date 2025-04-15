Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3426AA8A426
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Apr 2025 18:30:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFB4AC78023;
	Tue, 15 Apr 2025 16:30:05 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67C62CFAC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 16:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jdg65xfoNMLU/+2u8rET385fzNYh4G19EMmnW4YLQWI=; b=j6ZKx2VUeHyUGjPZC6NE17Gbq6
 frgYfZ3ZiEA3N2JRdRRHz7AgVNFur6HVVz0TpAbRw7nwXUHq5AKvIMWigGYs/1G9MObxPHrKeO3Lf
 RCULYHULslQfBsp3lZht2eDcivF9lLIdWtVOROFXD9kJLpqYBLgv3tXSNCHnLer445esAFVVZ9BV0
 wDBKod+/8oXsNje0ulIpS7+AVuPdiI8eczDV2+S9izdK/Ygp75d5432FcDma12UaCQ9gIe6ATR6u8
 gB039qQFE7309dQxYAgy3loM5sEtWDkh33+a72geL7moeefMc4kXlGgat0nIWXZh5ffcf3UVlSb1Z
 JzKZPHtg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54228 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1u4jAd-0008U4-1U;
 Tue, 15 Apr 2025 17:29:59 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1u4jA2-000r1b-1w; Tue, 15 Apr 2025 17:29:22 +0100
In-Reply-To: <Z_6JaPBiGu_RB4xN@shell.armlinux.org.uk>
References: <Z_6JaPBiGu_RB4xN@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1u4jA2-000r1b-1w@rmk-PC.armlinux.org.uk>
Date: Tue, 15 Apr 2025 17:29:22 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 4/5] net: stmmac: socfpga: call
 set_phy_mode() before registration
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

Initialisation/setup after registration is a bug. This is the second
of two patches fixing this in socfpga.

The set_phy_mode() does various hardware setup that would interfere
with a netdev that has been published, and thus available to be opened
by the kernel/userspace.

Move the call to set_phy_mode() before calling stmmac_dvr_probe().
This also simplifies the probe function as there is no need to
unregister the netdev if set_phy_mode() fails.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 69ffc52c0275..251d8b72bed5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -501,20 +501,11 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 
 	plat_dat->riwt_off = 1;
 
-	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
-	if (ret)
-		return ret;
-
 	ret = socfpga_dwmac_init(pdev, dwmac);
 	if (ret)
-		goto err_dvr_remove;
-
-	return 0;
-
-err_dvr_remove:
-	stmmac_dvr_remove(&pdev->dev);
+		return ret;
 
-	return ret;
+	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 }
 
 static const struct socfpga_dwmac_ops socfpga_gen5_ops = {
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
