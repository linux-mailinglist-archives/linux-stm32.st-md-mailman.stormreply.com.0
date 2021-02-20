Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAEA32048A
	for <lists+linux-stm32@lfdr.de>; Sat, 20 Feb 2021 10:02:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B1FFC57B64;
	Sat, 20 Feb 2021 09:02:55 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DBF51C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Feb 2021 09:02:52 +0000 (UTC)
Date: Sat, 20 Feb 2021 12:02:48 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>, Heiner Kallweit
 <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Message-ID: <20210220090248.oiyonlfucvmgzw6d@mobilestation>
References: <20210208140341.9271-1-Sergey.Semin@baikalelectronics.ru>
 <20210208140341.9271-2-Sergey.Semin@baikalelectronics.ru>
 <8300d9ca-b877-860f-a975-731d6d3a93a5@gmail.com>
 <20210209101528.3lf47ouaedfgq74n@mobilestation>
 <a652c69b-94d3-9dc6-c529-1ebc0ed407ac@gmail.com>
 <20210209105646.GP1463@shell.armlinux.org.uk>
 <20210210164720.migzigazyqsuxwc6@mobilestation>
 <20210211103941.GW1463@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210211103941.GW1463@shell.armlinux.org.uk>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Jose Abreu <joabreu@synopsys.com>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

On Thu, Feb 11, 2021 at 10:39:41AM +0000, Russell King - ARM Linux admin wrote:
> On Wed, Feb 10, 2021 at 07:47:20PM +0300, Serge Semin wrote:
> > On Tue, Feb 09, 2021 at 10:56:46AM +0000, Russell King - ARM Linux admin wrote:
> > > On Tue, Feb 09, 2021 at 11:37:29AM +0100, Heiner Kallweit wrote:
> > > > Right, adding something like a genphy_{read,write}_mmd() doesn't make
> > > > too much sense for now. What I meant is just exporting mmd_phy_indirect().
> > > > Then you don't have to open-code the first three steps of a mmd read/write.
> > > > And it requires no additional code in phylib.
> > > 
> > > ... but at the cost that the compiler can no longer inline that code,
> > > as I mentioned in my previous reply. (However, the cost of the accesses
> > > will be higher.) On the plus side, less I-cache footprint, and smaller
> > > kernel code.
> > 
> > Just to note mmd_phy_indirect() isn't defined with inline specifier,
> > but just as static and it's used twice in the
> > drivers/net/phy/phy-core.c unit. So most likely the compiler won't
> > inline the function code in there.
> 
> You can't always tell whether the compiler will inline a static function
> or not.

Andrew, Heiner, Russell, what is your final decision about this? Shall
we export the mmd_phy_indirect() method, implement new
genphy_{read,write}_mmd() or just leave the patch as is manually
accessing the MMD register in the driver?

-Sergey

> 
> > Anyway it's up to the PHY
> > library maintainers to decide. Please settle the issue with Heiner and
> > Andrew then. I am ok with both solutions and will do as you decide.
> 
> FYI, *I* am one of the phylib maintainers.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
