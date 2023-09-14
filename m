Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 934DE7A0930
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Sep 2023 17:27:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F47BC6A5EF;
	Thu, 14 Sep 2023 15:27:37 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8BC0C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 15:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jgO0TPjzDMW3uGSemtPUC52aZ0oc1pKGl6v400Y/eSU=; b=y7/3F1nrPEbpVb4EBm2YZ0JbJM
 r8HoMpjBHSbhYHIBI1qKimpRPZPgdkksmPPND6UY2sQVyXf0EiTWQ6i4g1RLLMq8b2NRcdpIbUkI1
 tyFz2eKW43Q9d0WDlhUWL5cDc5FZ+V1QIHIyzk5SXWPxogvqVMtDwcNH+QPg6FdPI5Nkehn1nNDsG
 Jm2P1tj7HpKovJ7HSD0i04CYBw2OIyQT95TQ6Zo9zFpGPBJjhgEzjrhG+vLC/Npqfc1D54hqdYT79
 brVw0SpsGaW7kpKp2Mewz9YFER/FidPd4GbBttZhvsdWALwyVOXPqIRy42lQuAfn2NqKKax8otJkP
 KjQtWypw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56988)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qgoFV-0004U6-09;
 Thu, 14 Sep 2023 16:27:21 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qgoFT-0004sQ-80; Thu, 14 Sep 2023 16:27:19 +0100
Date: Thu, 14 Sep 2023 16:27:19 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <ZQMmV2pSCAX8AJzz@shell.armlinux.org.uk>
References: <ZQMPnyutz6T23E8T@shell.armlinux.org.uk>
 <E1qgmkp-007Z4s-GL@rmk-PC.armlinux.org.uk>
 <7vhtvd25qswsju34lgqi4em5v3utsxlvi3lltyt5yqqecddpyh@c5yvk7t5k5zz>
 <ZQMgtXSTsNoZohnx@shell.armlinux.org.uk>
 <rene2x562lqsknmwpaxpu337mhl4bgynct6vcyryebvem2umso@2pjocnxluxgg>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <rene2x562lqsknmwpaxpu337mhl4bgynct6vcyryebvem2umso@2pjocnxluxgg>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 Samin Guo <samin.guo@starfivetech.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Alexei Starovoitov <ast@kernel.org>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, bpf@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 4/6] net: stmmac: rk: use
 stmmac_set_tx_clk_gmii()
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

On Thu, Sep 14, 2023 at 06:22:33PM +0300, Serge Semin wrote:
> On Thu, Sep 14, 2023 at 04:03:17PM +0100, Russell King (Oracle) wrote:
> > On Thu, Sep 14, 2023 at 05:37:13PM +0300, Serge Semin wrote:
> > > On Thu, Sep 14, 2023 at 02:51:35PM +0100, Russell King (Oracle) wrote:
> > > > Use stmmac_set_tx_clk_gmii().
> > > > 
> > > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > > ---
> > > >  .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 60 +++++--------------
> > > >  1 file changed, 16 insertions(+), 44 deletions(-)
> > > > 
> > > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > > > index d920a50dd16c..5731a73466eb 100644
> > > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > > > @@ -1081,28 +1081,14 @@ static void rk3568_set_gmac_speed(struct rk_priv_data *bsp_priv, int speed)
> > > >  {
> > > >  	struct clk *clk_mac_speed = bsp_priv->clks[RK_CLK_MAC_SPEED].clk;
> > > >  	struct device *dev = &bsp_priv->pdev->dev;
> > > > -	unsigned long rate;
> > > > -	int ret;
> > > > -
> > > > -	switch (speed) {
> > > > -	case 10:
> > > > -		rate = 2500000;
> > > > -		break;
> > > > -	case 100:
> > > > -		rate = 25000000;
> > > > -		break;
> > > > -	case 1000:
> > > > -		rate = 125000000;
> > > > -		break;
> > > > -	default:
> > > > -		dev_err(dev, "unknown speed value for GMAC speed=%d", speed);
> > > > -		return;
> > > > -	}
> > > > -
> > > > -	ret = clk_set_rate(clk_mac_speed, rate);
> > > > -	if (ret)
> > > > -		dev_err(dev, "%s: set clk_mac_speed rate %ld failed %d\n",
> > > > -			__func__, rate, ret);
> > > > +	int err;
> > > > +
> > > > +	err = stmmac_set_tx_clk_gmii(clk_mac_speed, speed);
> > > > +	if (err == -ENOTSUPP)
> > > 
> > > > +		dev_err(dev, "invalid speed %uMbps\n", speed);
> > > > +	else if (err)
> > > > +		dev_err(dev, "failed to set tx rate for speed %uMbps: %pe\n",
> > > 
> > > These type specifiers should have been '%d' since the speed variable
> > > is of the signed integer type here.
> > 
> 
> > Okay, having re-reviewed the changes, I'm changing them _all_ back to
> > be %d, because that is the _right_ thing. It is *not* unsigned, even
> > if fix_mac_speed() thinks that it is. It isn't. It's signed, and it's
> > stmmac bollocks implicitly casting it to unsigned - and that is
> > _wrong_.
> 
> Yes, stmmac is wrong in casting it to the unsigned type, but even
> seeing the original type is intended to be signed doesn't mean the
> qualifier should be fixed separately from the variables type and
> function prototypes. It will cause even more confusion. IMO the best
> way would be to fix the plat_stmmacenet_data->fix_mac_speed()
> prototype and the respective methods in the glue drivers. But it would
> be too bulky and most likely out of your interest to be done. So I
> would still have the variables type and the format qualifier type
> matching here and in the rest of the drivers especially seeing the
> original code in the imx, starfive, rk, QoS Eth LLDDs sticks to the
> convention described by me.

I won't be doing that, sorry. If that's not acceptable, then I'm
junking this series.

What I will be doing is getting rid of as many users of fix_mac_speed()
as possible, but that's for a future patch series.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
