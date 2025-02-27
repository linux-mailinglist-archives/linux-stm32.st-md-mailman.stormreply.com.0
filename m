Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3142A48225
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 15:56:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C850C7A849;
	Thu, 27 Feb 2025 14:56:24 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CE0BC01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 14:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JZ0rC//sE06hPYVngKetF+Xs1DKrHPyHj2XylN4/E1I=; b=ZH5nw2HmODeAQoGF5DwatfyRge
 +AUj4ZofsP5hrrQshUdx0NTfcOTcd0tqxPCrtp8XyTAidSTzSozayjo2LiC0BN9fB8BWk8CY8ZHKs
 11tHep8i8RET06cu+C1Bi7sMZ4F9/O2toXvO+0tdoGMg8QPJYBQOe1FYgQW3zvab1IPI363kK57TP
 kPC3nL/5VU1GGO8Ur+zAH0nT0pp3kB16gwYYMR2YEUHWeZalIO3BovKycBe+bkMg3XKVwynxoSw1v
 E+IAuGrytIT/0lY/KRfWfujqysevSnma6znK3JlmuO0u3z0kPf/CWLKPTpBHhN6DWuHYCmnEWKPJJ
 J6IIAaYQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57152)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tnfJ8-0007Un-1W;
 Thu, 27 Feb 2025 14:56:14 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tnfJ5-0008Dz-0M;
 Thu, 27 Feb 2025 14:56:11 +0000
Date: Thu, 27 Feb 2025 14:56:10 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Neil Armstrong <neil.armstrong@linaro.org>
Message-ID: <Z8B9Cie3nFVY7mMS@shell.armlinux.org.uk>
References: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
 <E1tna0z-0052tN-O1@rmk-PC.armlinux.org.uk>
 <2198e689-ed38-4842-9964-dca42468088a@linaro.org>
 <Z8B4OSbY954Zy37S@shell.armlinux.org.uk>
 <f21edb2c-e49d-4448-a25d-fb75f44c902a@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f21edb2c-e49d-4448-a25d-fb75f44c902a@linaro.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-amlogic@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 10/11] net: stmmac: meson: switch
 to use set_clk_tx_rate() hook
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

On Thu, Feb 27, 2025 at 03:38:53PM +0100, Neil Armstrong wrote:
> On 27/02/2025 15:35, Russell King (Oracle) wrote:
> > On Thu, Feb 27, 2025 at 03:18:22PM +0100, Neil Armstrong wrote:
> > > Hi,
> > > 
> > > On 27/02/2025 10:17, Russell King (Oracle) wrote:
> > > > Switch from using the fix_mac_speed() hook to set_clk_tx_rate() to
> > > > manage the transmit clock.
> > > > 
> > > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > > ---
> > > >    drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c | 9 ++++++---
> > > >    1 file changed, 6 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
> > > > index b115b7873cef..07c504d07604 100644
> > > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
> > > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
> > > > @@ -22,9 +22,10 @@ struct meson_dwmac {
> > > >    	void __iomem	*reg;
> > > >    };
> > > > -static void meson6_dwmac_fix_mac_speed(void *priv, int speed, unsigned int mode)
> > > > +static int meson6_dwmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
> > > > +					phy_interface_t interface, int speed)
> > > 
> > > You can keep priv as first argument name and remove the next changes
> > 
> > I *can* but I don't want to. Inside the bulk of the stmmac driver,
> > "priv" is used with struct stmmac_priv. "plat_dat" is used with
> > struct plat_stmmacenet_data.
> 
> Right, it's still an unrelated change in this case.

This is a new method, even though it happens to have mostly the same
body. All instances of this new method use "bsp_priv" for this argument,
therefore it is consistent.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
