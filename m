Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C69B2DAF66
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Dec 2020 15:52:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE628C3FAD4;
	Tue, 15 Dec 2020 14:52:56 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D4B3C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Dec 2020 14:52:55 +0000 (UTC)
Date: Tue, 15 Dec 2020 17:52:53 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20201215145253.sc6cmqetjktxn4xb@mobilestation>
References: <20201214092516.lmbezb6hrbda6hzo@mobilestation>
 <20201214153143.GB2841266@lunn.ch>
 <20201215082527.lqipjzastdlhzkqv@mobilestation>
 <20201215135837.GB2822543@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201215135837.GB2822543@lunn.ch>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Jose Abreu <joabreu@synopsys.com>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC] net: stmmac: Problem with adding the native
	GPIOs support
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

On Tue, Dec 15, 2020 at 02:58:37PM +0100, Andrew Lunn wrote:
> > > > Anyway the hardware setup depicted above doesn't seem
> > > > problematic at the first glance, but in fact it is. See, the DW *MAC driver
> > > > (STMMAC ethernet driver) is doing the MAC reset each time it performs the
> > > > device open or resume by means of the call-chain:
> > > > 
> > > >   stmmac_open()---+
> > > >                   +->stmmac_hw_setup()->stmmac_init_dma_engine()->stmmac_reset().
> > > >   stmmac_resume()-+
> > > > 
> > > > Such reset causes the whole interface reset: MAC, DMA and, what is more
> > > > important, GPIOs as being exposed as part of the MAC registers. That
> > > > in our case automatically causes the external PHY reset, what neither
> > > > the STTMAC driver nor the PHY subsystem expect at all.
> > > 
> > 
> > > Is the reset of the GPIO sub block under software control? When you
> > > have a GPIO controller implemented, you would want to disable this.
> > 
> > Not sure I've fully understood your question. The GPIO sub-block of
> > the MAC is getting reset together with the MAC.
> 

> And my question is, is that under software control, or is the hardware
> synthesised so that the GPIO controller is reset as part of the MAC
> reset?

Alas the SoC has already been synthesized and multiple devices have
already been produced as I described in the initial message. So we can't
change the way the MAC reset works.

> 
> From what you are saying, it sounds like from software you cannot
> independently control the GPIO controller reset?

No. The hardware implements the default MAC reset behavior. So the
GPIO controller gets reset synchronously with the MAC reset and that
can't be changed.

> 
> This is something i would be asking the hardware people. Look at the
> VHDL, etc.

Alas it's too late. I have to fix it in software somehow. As I see it
the only possible ways to bypass the problem are either to re-init the
PHY each time the reset happens or somehow to get rid of the MAC
reset. That's why I have sent this RFC to ask the driver maintainers
whether my suggestions are correct or of a better idea to work around
the problem.

-Sergey

> 
>       Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
