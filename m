Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8914EC97E7A
	for <lists+linux-stm32@lfdr.de>; Mon, 01 Dec 2025 15:50:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D91BC35E3C;
	Mon,  1 Dec 2025 14:50:13 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC2CDC35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Dec 2025 14:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eU9psOUffFFLH8iXGGNckKFSi0N1lnrRVekGn56l2Oo=; b=eJa7casIJQrMJzBa++zmER07wC
 E2rt0q800czairfx7haxMsd4cNy3BmusqoGQGNs/B5xhYVipNpJvAM+c/FyGH2TMmd6O93JSb+n0C
 VqTmHZoMboC5yxCti8kfhAmm7+Pah6vqDwTvD0zxb+WgBpZHU7su1aOYSmjmbYw+IT+gEDCMAGYWB
 qc3wGqo2wNKSQYMT4mFqsYDTEfmMLOtPeyC7BVx0zmgefyyuzSTSWu9c139/ngksUpnrfwsaJM2NA
 718tAVPDRrh9rNP5/sHAhW/UvK5SEKE+GK9sTmCqwoEyXELA1ceGyPga/roDkXku/hssrxgA5j22T
 ExlEcVZQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59362)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vQ5E1-000000000ei-0iY7;
 Mon, 01 Dec 2025 14:50:01 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vQ5Dw-000000006Y9-3GUO; Mon, 01 Dec 2025 14:49:56 +0000
Date: Mon, 1 Dec 2025 14:49:56 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <aS2rFBlz1jdwXaS8@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 00/15] net: stmmac: rk: cleanups
	galore
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

This is work in progress, cleaning up the excessively large Rockchip
glue driver somewhat. This series as it currently stands removes
approximately 200 lines from this file, while adding slightly to its
flexibility.

A brief overview of the changes:

- similar to previous commits, it seems the RGMII clock field follows
  a common pattern irrespective of the SoC.
- update rk3328 to use the ->id mechanism rather than guessing from
  the PHY interface mode and whether the PHY is integrated.
- switch to wm16 based masking, providing the lower-16 bits of the
  mask to indicate appropriate fields, and use this to construct the
  values to write to the registers.
- convert px30 to these methods.
- since many set_to_rmii() methods are now empty, add flags to indicate
  whether RMII / RGMII are supported.
- clear RGMII where the specific SoC's GMAC instance doesn't support
  this.

I've spent quite a while mulling over how to deal with these "wm16"
registers, none of the kernel bitfield macros (not even the
hw_bitfield.h macros) allow for what I present here, because the
masks are not constant.

One of the interesting things is that this appears to deal with RGMII
delays at the MAC end of the link, but there's no way to tell phylib
that's the case. I've not looked deeply into what is going on there,
but it is surprising that the driver insists that the delays (in
register values?) are provided, but then ignores them depending on the
exact RGMII mode selected.

One outstanding issue with these patches: RK3528_GMAC0_CLK_RMII_DIV2
remains, although I deleted its definition, so there's build errors
in this series. Before I do anything about that, I would like to hear
from the Rockchip guys whether it is necessary for rk3528_set_to_rmii()
to set the clock rate, given that rk_set_clk_tx_rate() will do this
when the link comes up. Does it matter whether it was set to 2.5MHz
(/ 20) or 25MHz (/ 2) when we switch to RMII mode?

 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 968 ++++++++++---------------
 1 file changed, 382 insertions(+), 586 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
