Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E95A478CA
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 10:16:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AE80C7A83E;
	Thu, 27 Feb 2025 09:16:42 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B6E5C7A83B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 09:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mYBSB07Y1Lcf9/eRz7dCZu8qEiXLm/2Bh2FG5QcVSNc=; b=wnuAID+7ZSTSMWHQ59mO8ZAM3B
 CXzkqOUzdgxZnDMtHa4II8PYjkSxTM7m1LNXr33U19kuK1ae5zZKuUp3tg2uL5Ey90GFmzIglLjBO
 CbtRR2ZE3plQksGYIyWZUm/A7QIB63d11CBuuuzUJFuycBdiv8VyUBZY8y8Dh95PoSxSQon3s8Qs0
 p5s2hsxSoqBzXgzpPvt/6HSRLbUB2G5FTWfhZqJava+whQzY3B9gHiYfZXqENo0+aQjBgTReH4g9Q
 XIdkxeCxPK/Fu7I9PJz30wNkp87HakU8lrEPt7BRMQLkZpVegwZigbgwwbf2ZAekiD2uYTXMWYoKD
 XUwNPFjA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55760)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tna0G-0006b7-14;
 Thu, 27 Feb 2025 09:16:24 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tna07-000818-23;
 Thu, 27 Feb 2025 09:16:15 +0000
Date: Thu, 27 Feb 2025 09:16:15 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: imx@lists.linux.dev, Emil Renner Berthing <kernel@esmil.dk>,
 Eric Dumazet <edumazet@google.com>, Guo Ren <guoren@kernel.org>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Drew Fustini <drew@pdp7.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Minda Chen <minda.chen@starfivetech.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: [Linux-stm32] [PATCH net-next 00/11] net: stmmac: cleanup transmit
	clock setting
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

Hi,

A lot of stmmac platform code which sets the transmit clock is very
similar - they decode the speed to the clock rate (125, 25 or 2.5 MHz)
and then set a clock to that rate.

The DWMAC core appears to have a clock input for the transmit section
called clk_tx_i which requires this rate.

This series moves the code which sets this clock into the core stmmac
code.

Patch 1 adds a hook that platforms can use to configure the clock rate.
Patch 2 adds a generic implementation.
The remainder of the patches convert the glue code for various platforms
to use this new infrastructure.

Changes since RFC: fix build errors, add Thierry Reding's r-b. More
platform glue conversions.

 .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    | 10 +----
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c    | 21 ++++++++++-
 .../net/ethernet/stmicro/stmmac/dwmac-intel-plat.c | 24 ++----------
 .../net/ethernet/stmicro/stmmac/dwmac-ipq806x.c    |  9 +++--
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c  |  9 +++--
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c     | 10 +++--
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c    | 22 ++---------
 .../net/ethernet/stmicro/stmmac/dwmac-starfive.c   | 26 ++-----------
 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c  | 18 +++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  2 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 43 ++++++++++++++++++++++
 include/linux/stmmac.h                             |  4 ++
 12 files changed, 108 insertions(+), 90 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
