Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4DDA398B3
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2025 11:25:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E83A5C78F87;
	Tue, 18 Feb 2025 10:25:09 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A095C7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2025 10:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iCGlt1XjQ6QDZy/H4sRD//zFdvPIbzwJDuXqfDTZWiE=; b=HDZagU0Or4bBEC1KIYcsqJYh/t
 12u8YWrIKHC1A5oUovdwvFi/FDdvMnDe/THtbf4y8XcD/uhvsgSmx07Z5awaA/yoe9v1go+Ipe+IT
 nibmkv8+HhR7rAOoPdjYZLPjl2NKEbaWZNYQLZOqhHuBhthsa1TLSeepcdEV25+msAg1JArMcjnFm
 m4nQ0ZJPpH6E9ebcVHtzpwQsuTk0Ovrq1v7AadIt/WJOeskVT5ktiRN36HRfCg8AZkWl+HXd0wEud
 4SSqtUx3Y5WuUskBrOmfMBdGmCRPDLe+JAb7QZcY0WOUCNRSaqxgkhyIkSY3hZ40tn5pHvizppt9B
 +/cSlsLg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35042)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tkKmJ-0001Uw-0C;
 Tue, 18 Feb 2025 10:24:35 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tkKm9-0007B7-2G;
 Tue, 18 Feb 2025 10:24:25 +0000
Date: Tue, 18 Feb 2025 10:24:25 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: netdev@vger.kernel.org
Message-ID: <Z7Rf2daOaf778TOg@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Drew Fustini <drew@pdp7.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Jan Petrous <jan.petrous@oss.nxp.com>,
 Minda Chen <minda.chen@starfivetech.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: [Linux-stm32] [PATCH net-next 0/3] net: stmmac: further cleanups
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

This small series does further cleanups to the stmmac driver:

1. Name priv->pause to indicate that it's a timeout and clarify the
units of the "pause" module parameter
2. Remove useless priv->flow_ctrl member and deprecate the useless
"flow_ctrl" module parameter
3. Fix long-standing signed-ness issue with "speed" passed around the
driver from the mac_link_up method.

 .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    |  4 +--
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c    |  8 ++---
 .../net/ethernet/stmicro/stmmac/dwmac-intel-plat.c |  4 +--
 .../net/ethernet/stmicro/stmmac/dwmac-ipq806x.c    |  8 ++---
 .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   |  3 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c  |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    |  6 ++--
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c     |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c    |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-starfive.c   |  4 +--
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c    |  8 ++---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c  |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c  |  4 +--
 .../net/ethernet/stmicro/stmmac/dwmac-visconti.c   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  3 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 37 +++++++++++-----------
 include/linux/stmmac.h                             |  2 +-
 18 files changed, 50 insertions(+), 53 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
