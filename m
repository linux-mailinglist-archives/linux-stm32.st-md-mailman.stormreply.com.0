Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 052E6C407B5
	for <lists+linux-stm32@lfdr.de>; Fri, 07 Nov 2025 15:59:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C30E9C6046A;
	Fri,  7 Nov 2025 14:59:05 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FCA7C60469
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Nov 2025 14:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6tHEJW/uohGXrC6WjLOnZ8INtuIGiGHzzYLj1JRrzuw=; b=az7B7UIiP4X3flwMTakKGhlyQR
 S3YOu+/7Sj5fS2nd3EP3TLsu3knmkIEazrD9Apt+1bLHhFia8dYdZ2kMm8mJt79xlI+Gf7ooNCwB3
 s+WkhlE6ZVnRnLqFCvhiRZU1y7Lj69MA9131aH/B3UWQcTdk8z++xx6WZ/8/NmLP2g7yPm3gux+cd
 LMEooG7bfQN/fGpVVIDDALVhSMSqZeC3+UvnCDQKnAPA+z1nMglY6wNrPJypKPTJ8qOFF3VzZeYuf
 IvbCtndfbdo7Fx1Rw+0fbE2dU+EPEFvsHdDnAhchhBsT8SRng47dZF2jv9JwejEQIdGdAV5ohiQXU
 8REM/Vbg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58972 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vHNSn-000000006jh-2nV4;
 Fri, 07 Nov 2025 14:29:17 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vHNSl-0000000DkTH-2tGu; Fri, 07 Nov 2025 14:29:15 +0000
In-Reply-To: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vHNSl-0000000DkTH-2tGu@rmk-PC.armlinux.org.uk>
Date: Fri, 07 Nov 2025 14:29:15 +0000
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
Subject: [Linux-stm32] [PATCH net-next 15/16] net: stmmac: visconti: use
 PHY_INTF_SEL_x to select PHY interface
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

Convert dwmac-visconti to use the PHY_INTF_SEL_x definitions. The
original definitions used constant 0, BIT(0) (==1) and BIT(2) (==4)
to define these, but the values of the bits corresponds with the
PHY_INTF_SEL_x values, so it is highly likely that these are not
individual bits, but the PHY_INTF_SEL_x bitfield.

This removes this incorrect use of BIT().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
index bd65d4239054..7b6b048e1be0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
@@ -42,9 +42,9 @@
 
 #define ETHER_CLK_SEL_RX_TX_CLK_EN (ETHER_CLK_SEL_RX_CLK_EN | ETHER_CLK_SEL_TX_CLK_EN)
 
-#define ETHER_CONFIG_INTF_MII 0
-#define ETHER_CONFIG_INTF_RGMII BIT(0)
-#define ETHER_CONFIG_INTF_RMII BIT(2)
+#define ETHER_CONFIG_INTF_MII	PHY_INTF_SEL_GMII_MII
+#define ETHER_CONFIG_INTF_RGMII	PHY_INTF_SEL_RGMII
+#define ETHER_CONFIG_INTF_RMII	PHY_INTF_SEL_RMII
 
 struct visconti_eth {
 	void __iomem *reg;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
