Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F02D313B43
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Feb 2021 18:44:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AA3DC57189;
	Mon,  8 Feb 2021 17:44:45 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47F65C3FADB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 17:44:43 +0000 (UTC)
Date: Mon, 8 Feb 2021 20:44:41 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20210208174441.z4nnugkaadhmgnum@mobilestation>
References: <20210208140341.9271-1-Sergey.Semin@baikalelectronics.ru>
 <20210208140341.9271-2-Sergey.Semin@baikalelectronics.ru>
 <YCFYaFYgFikj/Gqz@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCFYaFYgFikj/Gqz@lunn.ch>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
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

On Mon, Feb 08, 2021 at 04:27:36PM +0100, Andrew Lunn wrote:
> On Mon, Feb 08, 2021 at 05:03:22PM +0300, Serge Semin wrote:
> > It has been noticed that RTL8211E PHY stops detecting and reporting events
> > when EEE is successfully advertised and RXC stopping in LPI is enabled.
> > The freeze happens right after 3.0.10 bit (PC1R "Clock Stop Enable"
> > register) is set. At the same time LED2 stops blinking as if EEE mode has
> > been disabled. Notably the network traffic still flows through the PHY
> > with no obvious problem. Anyway if any MDIO read procedure is performed
> > after the "RXC stop in LPI" mode is enabled PHY gets to be unfrozen, LED2
> > starts blinking and PHY interrupts happens again. The problem has been
> > noticed on RTL8211E PHY working together with DW GMAC 3.73a MAC and
> > reporting its event via a dedicated IRQ signal. (Obviously the problem has
> > been unnoticed in the polling mode, since it gets naturally fixed by the
> > periodic MDIO read procedure from the PHY status register - BMSR.)
> > 
> > In order to fix that problem we suggest to locally re-implement the MMD
> > write method for RTL8211E PHY and perform a dummy read right after the
> > PC1R register is accessed to enable the RXC stopping in LPI mode.
> 
> Hi Serge
> 
> Is this listed in an Errata from Realtek?

Hi Andrew,

I honestly tried to find any doc with a glimpse of errata for RTL8211E
PHY, but with no luck. Official datasheet didn't have any info regarding
possible hw bugs too. Thus I had no choice but to find a fix of the
problem myself.

It took me some time to figure out why the events weren't reported after
the very first link setup (turned out only a full HW reset clears the
PC1R.10 bit state). I thought it could have been connected with some
sleep/idle/power-safe mode. So I disabled the EEE initialization in the
STMMAC driver. It worked. Then I left the EEE mode enabled, but called the
phy_init_eee(phy, 0) method with "clk_stop_enable==0", so PHY wouldn't
stop RXC in LPI mode. And it wonderfully worked. Then I started to dig in
from another side. I left "RXC disable in LPI" mode enabled and tried to
figure out what was going on with the PHY when it stopped reporting events
just by reading from its CSR using phytool utility. It was curious to
discover that any attempt to read from any PHY register caused the problem
disappearance (LED2 started blinking, events got to be reported). Since I
did nothing but a mere reading from a random even EEE-unrelated register I
inferred that the problem must be in some HW/PHY bug. That's how I've got
to the patch introduced here. If you have any better idea what could be a
reason of that weird behavior I'd be glad to test it out on my device.

-Sergey

> 
>    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
