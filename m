Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 424BFAADF5D
	for <lists+linux-stm32@lfdr.de>; Wed,  7 May 2025 14:37:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7339C7A820;
	Wed,  7 May 2025 12:37:43 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4C6FC78F9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 May 2025 12:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=5sPVrzUiQ+hehg1asUBhs/XYvzKveDurKf1FDpj71eU=; b=UxEUkuIlcl7krxdT+42I9uKAVB
 YsgHWsOYxgVRqKwf7S8mlsuYxgynUv7Q9dX/JaEovXdfoebGLpb08RSV3kTRj4omig7NyEb6+V/rw
 UceXPNJzvFZKjLe9487sxOqbkwnHbCPN4zSyyKGVVC3kyRHngUxW7FK4rGWfa2nyHZr4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uCe1T-00BsZW-F1; Wed, 07 May 2025 14:37:15 +0200
Date: Wed, 7 May 2025 14:37:15 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Inochi Amaoto <inochiama@gmail.com>
Message-ID: <b4ce3e35-9255-4fc7-9c8d-4078b24ac3fa@lunn.ch>
References: <20250506093256.1107770-1-inochiama@gmail.com>
 <c7a8185e-07b7-4a62-b39b-7d1e6eec64d6@lunn.ch>
 <fgao5qnim6o3gvixzl7lnftgsish6uajlia5okylxskn3nrexe@gyvgrp72jvj6>
 <ffa044e2-ee9e-4a34-af6a-2e45294144f7@lunn.ch>
 <2tu2mvwsnqdezjei5h43ko24vfave4c3ek2fjoatwsg72p6lpz@3vbtpmm7l73z>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2tu2mvwsnqdezjei5h43ko24vfave4c3ek2fjoatwsg72p6lpz@3vbtpmm7l73z>
Cc: Longbin Li <looong.bin@gmail.com>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Guo Ren <guoren@kernel.org>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Chen Wang <unicorn_wang@outlook.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 sophgo@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Lothar Rubusch <l.rubusch@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 0/4] riscv: sophgo: Add ethernet
 support for SG2042
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

On Wed, May 07, 2025 at 08:01:29PM +0800, Inochi Amaoto wrote:
> On Wed, May 07, 2025 at 02:10:48AM +0200, Andrew Lunn wrote:
> > On Wed, May 07, 2025 at 06:24:29AM +0800, Inochi Amaoto wrote:
> > > On Tue, May 06, 2025 at 02:03:18PM +0200, Andrew Lunn wrote:
> > > > On Tue, May 06, 2025 at 05:32:50PM +0800, Inochi Amaoto wrote:
> > > > > The ethernet controller of SG2042 is Synopsys DesignWare IP with
> > > > > tx clock. Add device id for it.
> > > > > 
> > > > > This patch can only be tested on a SG2042 x4 evb board, as pioneer
> > > > > does not expose this device.
> > > > 
> > > > Do you have a patch for this EVB board? Ideally there should be a user
> > > > added at the same time as support for a device.
> > > > 
> > > > 	Andrew
> > > 
> > > Yes, I have one for this device. And Han Gao told me that he will send
> > > the board patch for the evb board. So I only send the driver.
> > > And the fragment for the evb board is likes below, I think it is kind
> > > of trivial:
> > > 
> > > &gmac0 {
> > > 	phy-handle = <&phy0>;
> > > 	phy-mode = "rgmii-txid";
> > 
> > And this is why i ask, because this is broken. For more information,
> > please see:
> > 
> > https://patchwork.kernel.org/project/netdevbpf/patch/20250430-v6-15-rc3-net-rgmii-delays-v2-1-099ae651d5e5@lunn.ch/
> > 
> > 	Andrew
> 
> You are right, the right phy-mode is "rgmii-id", the delay is not
> added by the PCB. It seems to be better to ask for the vendor about
> the hardware design before copying params for vendor dts. Anyway,
> thanks for reviewing this.

Please do figure this out. Since you are adding a new compatible, you
have a bit more flexibility. If the MAC driver is doing something
wrong, you can change its behaviour based on this new compatible
without breaking other users of the driver using other compatibles.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
