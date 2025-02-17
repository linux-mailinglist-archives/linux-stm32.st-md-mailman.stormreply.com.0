Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDD1A38F91
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2025 00:22:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38B15C78F69;
	Mon, 17 Feb 2025 23:22:15 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1154CC78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2025 23:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z4zZA+SHhnpmJYDOp0NswBWcZOVtoN7RDeuxjfGWwYM=; b=NESdsBBLeV/I0kXm45xJYp1bTL
 oWkZIdEUuBRoCa45X0wQa6fuOpZrM5lGjcanXPnllxXNH6pTn1/m/7yaJSbv+O7Ymg8dAVt6f6Wfy
 bTaDLLNYsjGRf6lT0m/MGUsLjIfJH8mjAgK522uHle1UDz8LcWyCv9GGcplS0nfP5EJExAltRINzo
 559KURpSKhEvCcEG6EkJCXOKVEhh1HF/8QUJ+jAMhz8We6zWJ8UKFVmvqyELxtyrh+n7v4aMZoSpb
 zbBToIGKwNOQVgqeJzR0WJabFApK02ghl42zyjJ6ciFTq1R2nXF2o6jG0J5tRuff5bcvWFqPSewg1
 TGBaTskA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58678)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tkAQk-0008Gn-2z;
 Mon, 17 Feb 2025 23:21:39 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tkAQb-0006c4-02;
 Mon, 17 Feb 2025 23:21:29 +0000
Date: Mon, 17 Feb 2025 23:21:28 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Inochi Amaoto <inochiama@gmail.com>
Message-ID: <Z7PEeGmNvlYD33rZ@shell.armlinux.org.uk>
References: <20250216123953.1252523-1-inochiama@gmail.com>
 <20250216123953.1252523-4-inochiama@gmail.com>
 <Z7IIht2Q-iXEFw7x@shell.armlinux.org.uk>
 <5e481b95-3cf8-4f71-a76b-939d96e1c4f3@lunn.ch>
 <js3z3ra7fyg4qwxbly24xqpnvsv76jyikbhk7aturqigewllbx@gvus6ub46vow>
 <24eecc48-9061-4575-9e3b-6ef35226407a@lunn.ch>
 <Z7NDakd7zpQ_345D@shell.armlinux.org.uk>
 <rsysy3p5ium5umzz34rtinppcu2b36klgjdtq5j4lm3mylbqbz@z44yeje5wgat>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <rsysy3p5ium5umzz34rtinppcu2b36klgjdtq5j4lm3mylbqbz@z44yeje5wgat>
Cc: Andrew Lunn <andrew@lunn.ch>, Longbin Li <looong.bin@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jisheng Zhang <jszhang@kernel.org>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Chen Wang <unicorn_wang@outlook.com>, Furong Xu <0x1207@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, Lothar Rubusch <l.rubusch@gmail.com>,
 sophgo@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Drew Fustini <dfustini@tenstorrent.com>, linux-arm-kernel@lists.infradead.org,
 Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Hariprasad Kelam <hkelam@marvell.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v5 3/3] net: stmmac: Add glue
 layer for Sophgo SG2044 SoC
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

On Tue, Feb 18, 2025 at 06:50:24AM +0800, Inochi Amaoto wrote:
> On Mon, Feb 17, 2025 at 02:10:50PM +0000, Russell King (Oracle) wrote:
> > On Mon, Feb 17, 2025 at 02:25:33PM +0100, Andrew Lunn wrote:
> > > > I am not sure all whether devices has this clock, but it appears in
> > > > the databook. So I think it is possible to move this in the core so
> > > > any platform with these clock can reuse it.
> > > 
> > > Great
> > > 
> > > The next problem will be, has everybody called it the same thing in
> > > DT. Since there has been a lot of cut/paste, maybe they have, by
> > > accident.
> > 
> > Tegra186: "tx"
> > imx: "tx"
> > intel: "tx_clk"
> > rk: "clk_mac_speed"
> > s32: "tx"
> > starfive: "tx"
> > sti: "sti-ethclk"
> > 
> 
> The dwc-qos-eth also use clock name "tx", but set the clock with
> extra calibration logic.

Yep, that's what I meant by "Tegra186" above.

> > so 50% have settled on "tx" and the rest are doing their own thing, and
> > that horse has already bolted.
> > 
> 
> The "rx" clock in s32 also uses the same logic. I think the core also
> needs to take it, as this rx clock is also mentioned in the databook.

The "rx" clock on s32 seems to only be set to 125MHz, and the driver
seems to be limited to RGMII.

This seems weird as the receive clock is supposed to be supplied by the
PHY, and is recovered from the media (and thus will be 2.5, 25 or
125MHz as determined by the PHY.) So, I'm not sure that the s32 "rx"
clock is really the clk_rx_i clock supplied to the DWMAC core.

Certainly on stm32mp151, it states that ETH_RX_CLK in RGMII mode will
be 2.5, 25 or 125MHz provided by the PHY, and the clock tree indicates
that ETH_RX_CLK in RGMII mode will be routed directly to the clk_rx_i
input on the DWMAC(4) core.

> > I have some ideas on sorting this out, and I'm working on some patches
> > today.
> 
> Great, Could you cc me when you submit them? So I can take it and
> change my series.

Will do - I'm almost at that point, I have three other cleanup patches
I will be sending before hand, so I'll send those out and then this
series as RFC.

The only platform drivers I've left with a call to rgmii_clock() are
sti, imx (for imx93 only as that does extra fiddling after setting the
clock and I'm not sure if there's an ordering dependency there) and
the rk platforms.

Five platforms converted, three not, and hopefully your platform can
also use the helper as well!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
