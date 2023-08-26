Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EAA789790
	for <lists+linux-stm32@lfdr.de>; Sat, 26 Aug 2023 16:54:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4E12C6B44F;
	Sat, 26 Aug 2023 14:54:01 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A0C3C6B44E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Aug 2023 14:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XvrmkOBIBL2yzNCs3oBH8eiEWLRpItGIKPxS8cClzPI=; b=Hi6eaxOMUvV63VLOFfxaiqREGf
 msmZdihLKwkrGyV4RClmbtvOyw3bM0RublCdxCaSME79MIEDc3SJahWzDxBG6Fef4zzjnq8vTHJKu
 z++P4nVjINb0nWM76nnwTKzHpmdG7YevzWkXTKpsSULAXMl3G6EE1cn1/NYEV4kqqat1S/ewJZJnZ
 DY/aueqAJjCUk2IdvFnncr1UjdqYs9c0GvvXN20e0QinPsL3FvbM2HYsCGu/ZsLMHYdCdrIfhhyTD
 UynclqsQAqK8tgK74vbVU2ChVo/OJA3hRzV+ttkilEwdvq+YIjJT4AMj3hnSmTsVahhAxIoysm/qg
 FQXH0Qnw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47450)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qZufg-0006I1-0w;
 Sat, 26 Aug 2023 15:53:52 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qZuff-0001Zw-En; Sat, 26 Aug 2023 15:53:51 +0100
Date: Sat, 26 Aug 2023 15:53:51 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <ZOoR/3mssyKV+7Ef@shell.armlinux.org.uk>
References: <ZOddFH22PWmOmbT5@shell.armlinux.org.uk>
 <E1qZAXd-005pUP-JL@rmk-PC.armlinux.org.uk>
 <m6wo7hsk2wy2sgwjxlj37u5zg3iba7ecgjrvmhvkw7kdm7o6j7@ggcag6ziyk4c>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <m6wo7hsk2wy2sgwjxlj37u5zg3iba7ecgjrvmhvkw7kdm7o6j7@ggcag6ziyk4c>
Cc: Andrew Lunn <andrew@lunn.ch>, Feiyang Chen <chenfeiyang@loongson.cn>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 08/10] net: stmmac: move xgmac
 specific phylink caps to dwxgmac2 core
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

On Sat, Aug 26, 2023 at 04:36:46PM +0300, Serge Semin wrote:
> On Thu, Aug 24, 2023 at 02:38:29PM +0100, Russell King (Oracle) wrote:
> > Move the xgmac specific phylink capabilities to the dwxgmac2 support
> > core.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 10 ++++++++++
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c   | 10 ----------
> >  2 files changed, 10 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > index 34e1b0c3f346..f352be269deb 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > @@ -47,6 +47,14 @@ static void dwxgmac2_core_init(struct mac_device_info *hw,
> >  	writel(XGMAC_INT_DEFAULT_EN, ioaddr + XGMAC_INT_EN);
> >  }
> >  
> 
> > +static void xgmac_phylink_get_caps(struct stmmac_priv *priv)
> 
> Also after splitting this method up into DW XGMAC v2.x and DW XLGMAC
> v2.x specific functions please preserve the local naming convention:
> use dwxgmac2_ and dwxlgmac2_ prefixes.

The only possibility I have would be to implement two functions with
different names but are functionally identical, since I have no further
information. The new code is functionally identical to the code it
replaces - as explained in my previous response.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
