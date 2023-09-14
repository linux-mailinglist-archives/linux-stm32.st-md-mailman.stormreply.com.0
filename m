Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B597A08BC
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Sep 2023 17:12:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5484BC6B462;
	Thu, 14 Sep 2023 15:12:30 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F521C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 15:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JCzR9bnKdQWaES21IE+SF94nKQUXujpbyIjqGFP/0Oc=; b=DocVKf/DEW9GRSxUzKW453infY
 3tYI+lAYsKsAnPVa7L81GtPxGu/JHmN0CUL5NnFS5ySgtVc0fm7xGOTr/TlNJz+qFOaxnb2S9YCLa
 xM/M+3/QGiaZJ3iIWQNW2T09x4tADGJD/aDNbarS7hf46Gy9NH411PTGoI6Zl+XttLd8Yi/6cexjh
 KAkiikxKjDnuZxrk3vLO2r/ak/Oz8I2NbDpgRuopWXji7UCf9N2hl2dLZYhiIsiQHw0hv+cl8URyC
 bh4xBVakhyntjhPPVqeBZvQ8ckzeO2McAI6zEDpVO6AkjJTIArjD2rcGxa7mmop04lraEZo5pU1fb
 Ioank7rA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40360)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qgo0u-0004Sf-1Y;
 Thu, 14 Sep 2023 16:12:16 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qgo0r-0004s6-VM; Thu, 14 Sep 2023 16:12:13 +0100
Date: Thu, 14 Sep 2023 16:12:13 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <ZQMizWbkAEyTh4M7@shell.armlinux.org.uk>
References: <ZQMPnyutz6T23E8T@shell.armlinux.org.uk>
 <E1qgmka-007Z4Z-1E@rmk-PC.armlinux.org.uk>
 <j64xmkplk2kkb4esteaic3hsofex3eishxxr3z6hppnm6heoz5@5fyj4x5qouc3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <j64xmkplk2kkb4esteaic3hsofex3eishxxr3z6hppnm6heoz5@5fyj4x5qouc3>
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
Subject: Re: [Linux-stm32] [PATCH net-next 1/6] net: stmmac: add
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

On Thu, Sep 14, 2023 at 05:54:09PM +0300, Serge Semin wrote:
> On Thu, Sep 14, 2023 at 02:51:20PM +0100, Russell King (Oracle) wrote:
> > Add a helper function for setting the transmit clock for GMII
> > interfaces. This handles 1G, 100M and 10M using the standard clock
> > rates of 125MHz, 25MHz and 2.5MHz.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  .../ethernet/stmicro/stmmac/stmmac_platform.c | 25 +++++++++++++++++++
> >  .../ethernet/stmicro/stmmac/stmmac_platform.h |  1 +
> >  2 files changed, 26 insertions(+)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > index 0f28795e581c..f7635ed2b255 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > @@ -700,6 +700,31 @@ EXPORT_SYMBOL_GPL(stmmac_probe_config_dt);
> >  EXPORT_SYMBOL_GPL(devm_stmmac_probe_config_dt);
> >  EXPORT_SYMBOL_GPL(stmmac_remove_config_dt);
> >  
> 
> > +int stmmac_set_tx_clk_gmii(struct clk *tx_clk, unsigned int speed)
> > +{
> > +	unsigned long rate;
> > +
> > +	switch (speed) {
> > +	case SPEED_1000:
> > +		rate = 125000000;
> > +		break;
> > +
> > +	case SPEED_100:
> > +		rate = 25000000;
> > +		break;
> > +
> > +	case SPEED_10:
> > +		rate = 2500000;
> > +		break;
> > +
> > +	default:
> > +		return -ENOTSUPP;
> > +	}
> > +
> > +	return clk_set_rate(tx_clk, rate);
> > +}
> > +EXPORT_SYMBOL_GPL(stmmac_set_tx_clk_gmii);
> 
> As I already noted in v1 normally the switch-case operations are
> defined with no additional line separating the cases. I would have
> dropped them here too especially seeing the stmmac core driver mainly
> follow that implicit convention.

It's rather haphazard whether there are blank lines or not between
case statements.

> Additionally I suggest to move the method to being defined at the head
> of the file. Thus a more natural order normally utilized in the kernel
> drivers would be preserved: all functional implementations go first,
> the platform-specific things are placed below like probe()/remove()
> and their sub-functions, suspend()/resume() and PM descriptors,
> (device IDs table, driver descriptor, etc). stmmac_set_tx_clk_gmii()
> looks as a functional helper which is normally utilized on the network
> device open() stage in the framework of the fix_mac_speed() callback.
> Moreover my suggestion gets to be even more justified seeing you
> placed the method prototype at the head of the prototypes list in the
> stmmac_platform.h file.

How is one supposed to know about this? I did my best trying to work
out where they should've gone...

If it's that important, maybe add some /* Comments */ to state that
there are separate sections to the file?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
