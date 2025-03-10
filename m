Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B63B9A593A1
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Mar 2025 13:09:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EFBDC7802E;
	Mon, 10 Mar 2025 12:09:19 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10E03C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 12:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PqVBOCxsxyp7wajKPgMinDlSlaZeZV6g0DWdsy2a0XY=; b=FO2AjppqJGF5ifVgbYsiWDAgyW
 IwfC5BRAdftqY9sbhjmf+MCfwuMrOOWTovki9FgpdbT2bLnlNmiz0LtHC68eHtgmam9Wy+vbVjPrL
 3QfLr390Qbk4K1lziDcNf9StX1h5Uga4B3FfQdbIf8jBoVzjqb+d4/ilQW3EPl4onGnYF04G7CjzP
 0ifaNoJ5/39nZYbt3L9NS3FoUhz20xmYGGZpZclGuYLr2+wlpoE+Uje6uyPNRlytqngG+BcrKsyAR
 CdKvD+S0XX1WcQwOFelY6/QOD0LA8D4USDJSAxn/F1cAqNLnhxVMW2/HWWInM/3sY0vDH9FRPrZ6U
 3VId71fg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48000)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1trbwK-0002XX-2w;
 Mon, 10 Mar 2025 12:09:01 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1trbwE-0002Rn-1T;
 Mon, 10 Mar 2025 12:08:54 +0000
Date: Mon, 10 Mar 2025 12:08:54 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <Z87WVk0NzMUyaxDj@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next 0/9] net: stmmac: remove unnecessary
 of_get_phy_mode() calls
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

This series removes unnecessary of_get_phy_mode() calls from the stmmac
glue drivers. stmmac_probe_config_dt() / devm_stmmac_probe_config_dt()
already gets the interface mode using device_get_phy_mode() and stores
it in plat_dat->phy_interface.

Therefore, glue drivers using of_get_phy_mode() are just duplicating
the work that has already been done.

This series adjusts the glue drivers to remove their usage of
of_get_phy_mode().

 drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c    | 18 ++++++++----------
 drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c    | 12 ++++--------
 drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c   |  8 +-------
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c    |  6 +-----
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    |  4 +---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c         |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c        | 12 ++++--------
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c      |  8 +-------
 drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c      |  6 +-----
 9 files changed, 22 insertions(+), 54 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
