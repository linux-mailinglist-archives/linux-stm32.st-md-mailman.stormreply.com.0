Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6BB31884F
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Feb 2021 11:39:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DDB2C57B56;
	Thu, 11 Feb 2021 10:39:57 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48297C57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Feb 2021 10:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KqKL6U54aCC0e44bsyZEz0rjpqJM8TsWEFnpO14j4I0=; b=V/XKeJOwhiGwwPrOF/Ejk+2gU
 RUlWQlS7edN8olo8oHfkWd7OfyKxmdav9/717Ou8/3rJweQCj8FWraj7NC3ofElWgR/b4oP6+WMMr
 9a6hKi+G955sI6tWlouZKrxpPC8XUR76WOdOJ7GzpQMLIZYAq9QhR4Gft4GC+SCGyDO92arJJlhSf
 SYq2lujQBwQBLKiUqZjSmC/AE+yGH2LlB7IswQNlqGwT0933GByZGtJxQcwhaQzqPW/Zf7zRfBtxv
 Q+LGWnwyD68v1Wb0WX2gCJT+wrc9HRham/g+Z5QSbb4v99b9BTVrItcQ+y1GLxpsijl5mnPkx+Ci8
 gF9YWi+SQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41972)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1lA9Nz-0005vP-Cw; Thu, 11 Feb 2021 10:39:47 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1lA9Nt-00060X-RR; Thu, 11 Feb 2021 10:39:41 +0000
Date: Thu, 11 Feb 2021 10:39:41 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Message-ID: <20210211103941.GW1463@shell.armlinux.org.uk>
References: <20210208140341.9271-1-Sergey.Semin@baikalelectronics.ru>
 <20210208140341.9271-2-Sergey.Semin@baikalelectronics.ru>
 <8300d9ca-b877-860f-a975-731d6d3a93a5@gmail.com>
 <20210209101528.3lf47ouaedfgq74n@mobilestation>
 <a652c69b-94d3-9dc6-c529-1ebc0ed407ac@gmail.com>
 <20210209105646.GP1463@shell.armlinux.org.uk>
 <20210210164720.migzigazyqsuxwc6@mobilestation>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210210164720.migzigazyqsuxwc6@mobilestation>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Joao Pinto <Joao.Pinto@synopsys.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Jose Abreu <joabreu@synopsys.com>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
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

On Wed, Feb 10, 2021 at 07:47:20PM +0300, Serge Semin wrote:
> On Tue, Feb 09, 2021 at 10:56:46AM +0000, Russell King - ARM Linux admin wrote:
> > On Tue, Feb 09, 2021 at 11:37:29AM +0100, Heiner Kallweit wrote:
> > > Right, adding something like a genphy_{read,write}_mmd() doesn't make
> > > too much sense for now. What I meant is just exporting mmd_phy_indirect().
> > > Then you don't have to open-code the first three steps of a mmd read/write.
> > > And it requires no additional code in phylib.
> > 
> > ... but at the cost that the compiler can no longer inline that code,
> > as I mentioned in my previous reply. (However, the cost of the accesses
> > will be higher.) On the plus side, less I-cache footprint, and smaller
> > kernel code.
> 
> Just to note mmd_phy_indirect() isn't defined with inline specifier,
> but just as static and it's used twice in the
> drivers/net/phy/phy-core.c unit. So most likely the compiler won't
> inline the function code in there.

You can't always tell whether the compiler will inline a static function
or not.

> Anyway it's up to the PHY
> library maintainers to decide. Please settle the issue with Heiner and
> Andrew then. I am ok with both solutions and will do as you decide.

FYI, *I* am one of the phylib maintainers.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
