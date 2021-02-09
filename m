Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 946D5314D8C
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Feb 2021 11:55:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C19FC57B55;
	Tue,  9 Feb 2021 10:55:13 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 149E9C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 10:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3/TUpESOFMiIecNRcH48chaK6zVBZGJlr46X+upUebA=; b=ORIeczxG6jbTmSEAuNEG1JdrR
 xGoiTu7oGesBibfvig3oGF/eDxko88zQN52GBNVNFyzH/LgbCNH5qlaS69+llTaJD2rTIwzASf9US
 UK3zl9y5TBYF31nbpMxSomHFgmJazlF02ICFaFTamhXN4wI4bRmdnbcgibxXm3TqLyywpDdkjRyY9
 bkGCE3zuY3Zar5eR9uiiCPSMzZjwhT+mgRfrKTwFbH0qVG0ck78s/YSEJfHmYzApX7zxBpNmdZEtI
 jFRsdcjUxCqyn8ebdImG5vBccCYanY0+lbY97AH218dHtdUtqDYX2PtCqJH3tJXPa1h1LtixSgNt2
 IkiPojVMA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41152)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1l9Qfb-0003J3-5t; Tue, 09 Feb 2021 10:55:00 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1l9QfX-0003zQ-Vc; Tue, 09 Feb 2021 10:54:55 +0000
Date: Tue, 9 Feb 2021 10:54:55 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Message-ID: <20210209105455.GO1463@shell.armlinux.org.uk>
References: <20210208140341.9271-1-Sergey.Semin@baikalelectronics.ru>
 <20210208140341.9271-2-Sergey.Semin@baikalelectronics.ru>
 <8300d9ca-b877-860f-a975-731d6d3a93a5@gmail.com>
 <20210209101528.3lf47ouaedfgq74n@mobilestation>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210209101528.3lf47ouaedfgq74n@mobilestation>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Joao Pinto <Joao.Pinto@synopsys.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Jose Abreu <joabreu@synopsys.com>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
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

On Tue, Feb 09, 2021 at 01:15:28PM +0300, Serge Semin wrote:
> On Mon, Feb 08, 2021 at 09:14:02PM +0100, Heiner Kallweit wrote:
> > Nice analysis. Alternatively to duplicating this code piece we could
> > export mmd_phy_indirect(). But up to you.
> 
> I also considered creating a generic method to access the MMD
> registers of a generic PHY, something like phy_read()/phy_write(), but
> for MMD (alas just exporting mmd_phy_indirect() would not be enough).
> But as I see it such methods need to be created only after we get to
> have at least several places with duplicating direct MMD-read/write
> patterns. Doing that just for a single place seems redundant. Anyway it's
> up to maintainers to decide whether they want to see a generic part
> of the phy_read_mmd()/phy_write_mmd() methods being detached and
> exported as something like genphy_{read,write}_mmd() methods. I can do
> that in v2 if you ask me to.

Please not genphy_* - that namespace is used for up-to-1G PHYs.

I thought about suggesting what you are proposing, but the problem is
this is just making things less and less efficient. Every time we
break a function up and export it, we increase the execution overhead
of the code. That said, the PHY accesses are relatively slow.

My opinion is that as this is just a single location at the moment,
it is not worth the effort - but if we get more of examples of this,
then it makes sense to provide the common accessor.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
