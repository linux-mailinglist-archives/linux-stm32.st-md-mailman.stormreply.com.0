Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D369D313E60
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Feb 2021 20:03:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F623C57189;
	Mon,  8 Feb 2021 19:03:51 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A789FC5717D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 19:03:50 +0000 (UTC)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1l9Bou-004vFh-KW; Mon, 08 Feb 2021 20:03:36 +0100
Date: Mon, 8 Feb 2021 20:03:36 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Message-ID: <YCGLCK+1RB7pzytU@lunn.ch>
References: <20210208140341.9271-1-Sergey.Semin@baikalelectronics.ru>
 <20210208140341.9271-2-Sergey.Semin@baikalelectronics.ru>
 <YCFYaFYgFikj/Gqz@lunn.ch>
 <20210208174441.z4nnugkaadhmgnum@mobilestation>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210208174441.z4nnugkaadhmgnum@mobilestation>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Jose Abreu <joabreu@synopsys.com>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 01/20] net: phy: realtek: Fix events
 detection failure in LPI mode
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

> Hi Andrew,
> 
> I honestly tried to find any doc with a glimpse of errata for RTL8211E
> PHY, but with no luck. Official datasheet didn't have any info regarding
> possible hw bugs too. Thus I had no choice but to find a fix of the
> problem myself.
> 
> It took me some time to figure out why the events weren't reported after
> the very first link setup (turned out only a full HW reset clears the
> PC1R.10 bit state). I thought it could have been connected with some
> sleep/idle/power-safe mode. So I disabled the EEE initialization in the
> STMMAC driver. It worked. Then I left the EEE mode enabled, but called the
> phy_init_eee(phy, 0) method with "clk_stop_enable==0", so PHY wouldn't
> stop RXC in LPI mode. And it wonderfully worked. Then I started to dig in
> from another side. I left "RXC disable in LPI" mode enabled and tried to
> figure out what was going on with the PHY when it stopped reporting events
> just by reading from its CSR using phytool utility. It was curious to
> discover that any attempt to read from any PHY register caused the problem
> disappearance (LED2 started blinking, events got to be reported). Since I
> did nothing but a mere reading from a random even EEE-unrelated register I
> inferred that the problem must be in some HW/PHY bug. That's how I've got
> to the patch introduced here. If you have any better idea what could be a
> reason of that weird behavior I'd be glad to test it out on my device.

It is a reasonable explanation, and a read should not do any harm.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
   
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
