Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 712C1A3994C
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2025 11:41:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12A39C78F87;
	Tue, 18 Feb 2025 10:41:14 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61D99C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2025 10:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z8u1HFNvQFj00JNaA7UaE7kZ0fKIp/C21Or6VG3Kq3c=; b=o6c4u2Hq6aOiw0zopooYt7wvcp
 E3+jJCUM7nHq46JD0aXLOfQ5Jm9ZhiuFSdXnxjiWn9cVMEovMxHN7TD4ujzEjPQEVc6txt7E4gDph
 BHWvbtGL9aaT4ZgG0CHp7d6oKKCXz32SmZ0jB9UccZ/92My6rP3+Y5OrkuvJ8ftIm4VjlE02Pbr4k
 nIrWR3UsptipUVbzuYoaJvi8ShzHrPLpO88aDnZusLz1wytWrp0eazSi9VGFBz9Pa7EZgViJT1rCI
 Ae0dUoitzhjc8huX/pRHtI95OX5/ZxGGj5lqlzmrV1FnqdO7uzbiTcQG61C0pcjWDafsPxQS+tWSX
 ji52VNQQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48852)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tkL1a-0001bu-2a;
 Tue, 18 Feb 2025 10:40:22 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tkL1S-0007CN-2u;
 Tue, 18 Feb 2025 10:40:14 +0000
Date: Tue, 18 Feb 2025 10:40:14 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Inochi Amaoto <inochiama@gmail.com>
Message-ID: <Z7Rjjo5nZ0gnCbzq@shell.armlinux.org.uk>
References: <20250216123953.1252523-1-inochiama@gmail.com>
 <20250216123953.1252523-4-inochiama@gmail.com>
 <Z7IIht2Q-iXEFw7x@shell.armlinux.org.uk>
 <5e481b95-3cf8-4f71-a76b-939d96e1c4f3@lunn.ch>
 <js3z3ra7fyg4qwxbly24xqpnvsv76jyikbhk7aturqigewllbx@gvus6ub46vow>
 <24eecc48-9061-4575-9e3b-6ef35226407a@lunn.ch>
 <Z7NDakd7zpQ_345D@shell.armlinux.org.uk>
 <rsysy3p5ium5umzz34rtinppcu2b36klgjdtq5j4lm3mylbqbz@z44yeje5wgat>
 <Z7PEeGmNvlYD33rZ@shell.armlinux.org.uk>
 <6obom7jyciq2kqw5iuqlugbzbsebgd7ymnq2crlm565ybbz7de@n7o3tcqn5idi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6obom7jyciq2kqw5iuqlugbzbsebgd7ymnq2crlm565ybbz7de@n7o3tcqn5idi>
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

On Tue, Feb 18, 2025 at 09:01:59AM +0800, Inochi Amaoto wrote:
> On Mon, Feb 17, 2025 at 11:21:28PM +0000, Russell King (Oracle) wrote:
> > On Tue, Feb 18, 2025 at 06:50:24AM +0800, Inochi Amaoto wrote:
> > > On Mon, Feb 17, 2025 at 02:10:50PM +0000, Russell King (Oracle) wrote:
> > > > On Mon, Feb 17, 2025 at 02:25:33PM +0100, Andrew Lunn wrote:
> > > > > > I am not sure all whether devices has this clock, but it appears in
> > > > > > the databook. So I think it is possible to move this in the core so
> > > > > > any platform with these clock can reuse it.
> > > > > 
> > > > > Great
> > > > > 
> > > > > The next problem will be, has everybody called it the same thing in
> > > > > DT. Since there has been a lot of cut/paste, maybe they have, by
> > > > > accident.
> > > > 
> > > > Tegra186: "tx"
> > > > imx: "tx"
> > > > intel: "tx_clk"
> > > > rk: "clk_mac_speed"
> > > > s32: "tx"
> > > > starfive: "tx"
> > > > sti: "sti-ethclk"
> > > > 
> > > 
> > > The dwc-qos-eth also use clock name "tx", but set the clock with
> > > extra calibration logic.
> > 
> > Yep, that's what I meant by "Tegra186" above.
> > 
> > > > so 50% have settled on "tx" and the rest are doing their own thing, and
> > > > that horse has already bolted.
> > > > 
> > > 
> > > The "rx" clock in s32 also uses the same logic. I think the core also
> > > needs to take it, as this rx clock is also mentioned in the databook.
> > 
> > The "rx" clock on s32 seems to only be set to 125MHz, and the driver
> > seems to be limited to RGMII.
> > 
> > This seems weird as the receive clock is supposed to be supplied by the
> > PHY, and is recovered from the media (and thus will be 2.5, 25 or
> > 125MHz as determined by the PHY.) So, I'm not sure that the s32 "rx"
> > clock is really the clk_rx_i clock supplied to the DWMAC core.
> > 
> > Certainly on stm32mp151, it states that ETH_RX_CLK in RGMII mode will
> > be 2.5, 25 or 125MHz provided by the PHY, and the clock tree indicates
> > that ETH_RX_CLK in RGMII mode will be routed directly to the clk_rx_i
> > input on the DWMAC(4) core.
> > 
> 
> RGMII is not the problem. The databook says the RGMII clock (rx/tx)
> follows this set rate logic. 

Sorry, I find this ambiguous. "This" doesn't tell me whether you are
referring to either what s32 does (setting the "rx" clock to 125MHz
only) or what RGMII spec says about RX_CLK (which is that it comes from
the PHY and is 2.5/25/125MHz) which stm32mp151 agrees with and feeds
the PHY's RX_CLK to the clk_rx_i inputs on the DWMAC in RGMII, GMII
and MII modes.

clk_rx_i comes through a bunch of muxes on stm32mp151. When the clock
tree is configured for RMII mode, the rate on clk_rx_i depends on the
MAC speed (10/100Mbps).

This suggests as far as the core is concerned, the clock supplied as
clk_rx_i isn't a fixed rate clock but depends on the speed just like
the transmit clock.

> For other things, I agree with you. A fixed "rx" clock does reach the
> limit of what I know. And the databook told nothing about it. As we
> can not determine the rx clock of s32 and it may be set for the phy,
> it will be better to not move it into the core.

I'm intending to leave s32's rx clock alone for this reason as it does
not match what I expect. Maybe on s32 there is a bunch of dividers
which are selected by the mac_speed_o signals from the core to divide
the 125MHz clock down to 25 or 2.5MHz for 100 and 10Mbps respectively.
As I don't know, it's safer that I leave it alone as that means the
"rx" clock used there is not clk_rx_i.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
