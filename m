Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB91C05A82
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Oct 2025 12:48:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BC56C5F1C5;
	Fri, 24 Oct 2025 10:48:54 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72B7BC36B31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Oct 2025 10:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=St90YPnsStMZ+8WdvRz0HPPenligqgpjDzaMg+CNa44=; b=0RI7a9/r0zJ+F/hwqE74pmKjfc
 HybwQpD3cclhhl9ZA6zhGD/G7u5/Uj29NVHdGAPqYUtoWC9Az8sjpbvM9NK7nROw3vTU7ttqLtXrB
 Lg4Ykv78Mjp81NuN3j9s5itvmdCVFlxsSYgEPSE8StTB/UNHIO+saNGpYwm94Oq7jR52u9sk49y1R
 1EJ1pgip2mnwmtUI9OLG0QS7bnBGAm+tJxIF2Hb/Pw5dynnSt7/gQ73Ikn5jKzEVHWK9qdQIaEwjA
 ErLm79mHxFQWnTsmDl2wQhlqLWReETrFaraFxHxY6gnqIQdhzKAqQenFfc8KiMO0QtQvfYdbvlf7L
 9WBBTNOQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43764)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vCFLd-000000007RV-2TKn;
 Fri, 24 Oct 2025 11:48:41 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vCFLX-000000002dR-44CK; Fri, 24 Oct 2025 11:48:35 +0100
Date: Fri, 24 Oct 2025 11:48:35 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <aPtZg_v3H53hiQXo@shell.armlinux.org.uk>
References: <aPn3MSQvjUWBb92P@shell.armlinux.org.uk>
 <28d91eca-28dd-4e5b-ae60-021e777ee064@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <28d91eca-28dd-4e5b-ae60-021e777ee064@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 0/8] net: stmmac: hwif.c cleanups
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

On Fri, Oct 24, 2025 at 08:44:07AM +0200, Maxime Chevallier wrote:
> Hello Russell,
> 
> On 23/10/2025 11:36, Russell King (Oracle) wrote:
> > Hi,
> > 
> > This series cleans up hwif.c:
> > 
> > - move the reading of the version information out of stmmac_hwif_init()
> >   into its own function, stmmac_get_version(), storing the result in a
> >   new struct.
> > 
> > - simplify stmmac_get_version().
> > 
> > - read the version register once, passing it to stmmac_get_id() and
> >   stmmac_get_dev_id().
> > 
> > - move stmmac_get_id() and stmmac_get_dev_id() into
> >   stmmac_get_version()
> > 
> > - define version register fields and use FIELD_GET() to decode
> > 
> > - start tackling the big loop in stmmac_hwif_init() - provide a
> >   function, stmmac_hwif_find(), which looks up the hwif entry, thus
> >   making a much smaller loop, which improves readability of this code.
> > 
> > - change the use of '^' to '!=' when comparing the dev_id, which is
> >   what is really meant here.
> > 
> > - reorganise the test after calling stmmac_hwif_init() so that we
> >   handle the error case in the indented code, and the success case
> >   with no indent, which is the classical arrangement.
> > 
> >  drivers/net/ethernet/stmicro/stmmac/common.h |   3 +
> >  drivers/net/ethernet/stmicro/stmmac/hwif.c   | 166 +++++++++++++++------------
> >  2 files changed, 98 insertions(+), 71 deletions(-)
> 
> I didn't have the bandwidth to do a full review, however I ran tests
> with this series on dwmac-socfpga and dwmac-stm32, no regressions found.
> 
> For the series,
> 
> Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks, it's good to have someone else testing. I do need to post v2
with some tweaks to patches 2, 3 and 4 due to a typo that gets
eliminated in later patches. "verison*" -> "version*" in one instance.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
