Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E53177124FB
	for <lists+linux-stm32@lfdr.de>; Fri, 26 May 2023 12:43:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FC05C6A615;
	Fri, 26 May 2023 10:43:02 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACE58C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 May 2023 10:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p6gZGYkzEZra90Ov53s4Zo39rKzj5xOBW7Fj0aYklb4=; b=z2SVF97U2nzlAUNoG+MftZHkYL
 PMhR8msg2OhhdCekSckaC6W7w/6SkvnvTV6f7iJTsmO+AjyOCYQpLqOfT1SqLqZE34AIAOLnttl5d
 ACLXlDb2uXTtDQOmHjcJL4HVKdVoaPUVYaG71gb5XNtP3BG+JsXvce+g3yU+HXqlpefXMZCAX/MMG
 5O/JDZeB3CVN6dFwgFIgbJtb5MD5GomD5byTvFGwRnmGtAjAuSgDb0VqJwv90NnELymwnlU2S1RoS
 2zfVNxzXIQGXBSVt3vHaDKiY71T0YSfVXAmYuDn73enIqJ+w6RkSLg10gZp5GSFfmev5ifto0pnRK
 d+EfC/FQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35688)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1q2UuK-0005Sz-S2; Fri, 26 May 2023 11:42:52 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1q2UuI-0003fU-VC; Fri, 26 May 2023 11:42:50 +0100
Date: Fri, 26 May 2023 11:42:50 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Simon Horman <simon.horman@corigine.com>
Message-ID: <ZHCNKjMFd4bu4Cmz@shell.armlinux.org.uk>
References: <20230526074252.480200-1-maxime.chevallier@bootlin.com>
 <20230526074252.480200-3-maxime.chevallier@bootlin.com>
 <ZHBwLBnKacQCG2/U@corigine.com>
 <ZHB2Tfn9yZPs6l56@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZHB2Tfn9yZPs6l56@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Mark Brown <broonie@kernel.org>, alexis.lothore@bootlin.com,
 thomas.petazzoni@bootlin.com, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/4] net: ethernet:
 altera-tse: Convert to mdio-regmap and use PCS Lynx
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

On Fri, May 26, 2023 at 10:05:17AM +0100, Russell King (Oracle) wrote:
> On Fri, May 26, 2023 at 10:39:08AM +0200, Simon Horman wrote:
> > On Fri, May 26, 2023 at 09:42:50AM +0200, Maxime Chevallier wrote:
> > > The newly introduced regmap-based MDIO driver allows for an easy mapping
> > > of an mdiodevice onto the memory-mapped TSE PCS, which is actually a
> > > Lynx PCS.
> > > 
> > > Convert Altera TSE to use this PCS instead of the pcs-altera-tse, which
> > > is nothing more than a memory-mapped Lynx PCS.
> > > 
> > > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > 
> > Hi Maxime,
> > 
> > I have some concerns about the error paths in this patch.
> 
> We've had similar problems with mdio_device_create() vs the XPCS
> driver.
> 
> I think it's time that we made this easier for users.

Patch series here:
https://lore.kernel.org/all/ZHCGZ8IgAAwr8bla@shell.armlinux.org.uk/

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
