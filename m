Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DD22DAE64
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Dec 2020 14:58:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E186C3FAD4;
	Tue, 15 Dec 2020 13:58:54 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCE6AC36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Dec 2020 13:58:52 +0000 (UTC)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1kpAqb-00C52E-Nu; Tue, 15 Dec 2020 14:58:37 +0100
Date: Tue, 15 Dec 2020 14:58:37 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Message-ID: <20201215135837.GB2822543@lunn.ch>
References: <20201214092516.lmbezb6hrbda6hzo@mobilestation>
 <20201214153143.GB2841266@lunn.ch>
 <20201215082527.lqipjzastdlhzkqv@mobilestation>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201215082527.lqipjzastdlhzkqv@mobilestation>
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

> > > Anyway the hardware setup depicted above doesn't seem
> > > problematic at the first glance, but in fact it is. See, the DW *MAC driver
> > > (STMMAC ethernet driver) is doing the MAC reset each time it performs the
> > > device open or resume by means of the call-chain:
> > > 
> > >   stmmac_open()---+
> > >                   +->stmmac_hw_setup()->stmmac_init_dma_engine()->stmmac_reset().
> > >   stmmac_resume()-+
> > > 
> > > Such reset causes the whole interface reset: MAC, DMA and, what is more
> > > important, GPIOs as being exposed as part of the MAC registers. That
> > > in our case automatically causes the external PHY reset, what neither
> > > the STTMAC driver nor the PHY subsystem expect at all.
> > 
> 
> > Is the reset of the GPIO sub block under software control? When you
> > have a GPIO controller implemented, you would want to disable this.
> 
> Not sure I've fully understood your question. The GPIO sub-block of
> the MAC is getting reset together with the MAC.

And my question is, is that under software control, or is the hardware
synthesised so that the GPIO controller is reset as part of the MAC
reset?

From what you are saying, it sounds like from software you cannot
independently control the GPIO controller reset?

This is something i would be asking the hardware people. Look at the
VHDL, etc.

      Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
