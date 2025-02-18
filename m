Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B66CA39A31
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2025 12:15:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F7ECC78F87;
	Tue, 18 Feb 2025 11:15:03 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DE34C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2025 11:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=goozUNnJLLkrSorBmN4CSjqgYHxzSyfaXsVrvCrQJa4=; b=VBnSLYdEwASJZI+Z1Kv8WaqVUj
 Gu1Tah9MVvryFRKBG2JxPljesgrEr0NiylzHcyGbSkupA97NOevzP68oL884NugEsBs15/E/eSgar
 pNC/xNuhPK3r9JnPzndMZ9oTPjU+4Hn/cv283WqtPJLFn3soXzRVappfV0arMsxtWs+BfkrRpKYni
 tt3eskO9YIk5T8Ikk5aU6pVa7+uzAV9Kzer3jQcSpbdTpHpugb17KVJR/gfw4lZOpqwTqRxOe1Wru
 YMPm06bYKyELzNlxSc9sb84+KaYUvqjmTW+g29Ce/s7mWn1KzQkuW0Mt/V76Qqt9PjRgw7tlBvmZ+
 b0GG4ECg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58960)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tkLYp-0001hN-3B;
 Tue, 18 Feb 2025 11:14:44 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tkLYl-0007Da-2g;
 Tue, 18 Feb 2025 11:14:39 +0000
Date: Tue, 18 Feb 2025 11:14:39 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jon Hunter <jonathanh@nvidia.com>, Jakub Kicinski <kuba@kernel.org>,
 Thierry Reding <treding@nvidia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Minda Chen <minda.chen@starfivetech.com>, linux-arm-kernel@lists.infradead.org,
 Paolo Abeni <pabeni@redhat.com>, Inochi Amaoto <inochiama@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH RFC net-next 0/7] net: stmmac: cleanup
	transmit clock setting
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
Patches 3 through 7 convert the easy-to-convert platforms to use this
new infrastructure.

 .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    | 10 +----
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c    |  5 ++-
 .../net/ethernet/stmicro/stmmac/dwmac-intel-plat.c | 24 ++----------
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c    | 22 ++---------
 .../net/ethernet/stmicro/stmmac/dwmac-starfive.c   | 26 ++-----------
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  2 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 43 ++++++++++++++++++++++
 include/linux/stmmac.h                             |  4 ++
 8 files changed, 65 insertions(+), 71 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
