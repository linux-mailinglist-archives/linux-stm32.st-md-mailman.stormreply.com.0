Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF88BC73462
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Nov 2025 10:46:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC813C597BF;
	Thu, 20 Nov 2025 09:46:30 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFB09C55590
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Nov 2025 09:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7sswFl5l2p4ZT3evZ9i3gc9xarSldWVyH7umhKc38wc=; b=Lz0IPuPfFUD4WovXjBHEyMPMOQ
 xm6rjezioffBkDb++RJz8WeiwEl4r86o7ZJDjO0RsJDeFRVkrXzri7xJ9lKkUCdpglWTCx85P7TfU
 Q2zDgXQGw2xx0FkGNUJgViUOODSqxJfjnD0KkTrhmy8USf5IpRQrdFNlNSicvLZdTbymvxUL7ixrK
 Hr447VPZFNiuvO0kNJDe/tE2t0DhwpM9UQBzugIkItt6e+n54Q77ADyiTrTMBKHMNL2q3KPQcWcCh
 rZvn1HKkP4b+aHw0kiIsDOeaKskXW5zd1d3ETJ9GGWXyXnSy6wPuvwldhpJ+N3XDXxBb0bvQ2hnCg
 HxyCh/Hw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50818)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vM1F5-0000000062y-2Z0H;
 Thu, 20 Nov 2025 09:46:19 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vM1F1-000000004Hk-3fFC; Thu, 20 Nov 2025 09:46:15 +0000
Date: Thu, 20 Nov 2025 09:46:15 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Message-ID: <aR7jZ4KkKE9nTsMh@shell.armlinux.org.uk>
References: <aR2rOKopeiNvOO-P@shell.armlinux.org.uk>
 <E1vLgSU-0000000FMrL-0EZT@rmk-PC.armlinux.org.uk>
 <b720570b-6576-41d7-a803-3d5524b685e4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b720570b-6576-41d7-a803-3d5524b685e4@oss.qualcomm.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 2/3] net: stmmac: qcom-ethqos:
 add rgmii set/clear functions
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

On Thu, Nov 20, 2025 at 10:42:04AM +0100, Konrad Dybcio wrote:
> On 11/19/25 12:34 PM, Russell King (Oracle) wrote:
> > The driver has a lot of bit manipulation of the RGMII registers. Add
> > a pair of helpers to set bits and clear bits, converting the various
> > calls to rgmii_updatel() as appropriate.
> > 
> > Most of the change was done via this sed script:
> > 
> > /rgmii_updatel/ {
> > 	N
> > 	/,$/N
> > 	/mask, / ! {
> > 		s|rgmii_updatel\(([^,]*,\s+([^,]*),\s+)\2,\s+|rgmii_setmask(\1|
> > 		s|rgmii_updatel\(([^,]*,\s+([^,]*),\s+)0,\s+|rgmii_clrmask(\1|
> > 		s|^\s+$||
> > 	}
> > }
> > 
> > and then formatting tweaked where necessary.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 187 +++++++++---------
> >  1 file changed, 89 insertions(+), 98 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > index ae3cf163005b..cdaf02471d3a 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > @@ -137,6 +137,18 @@ static void rgmii_updatel(struct qcom_ethqos *ethqos, u32 mask, u32 val,
> >  	rgmii_writel(ethqos, temp, offset);
> >  }
> >  
> > +static void rgmii_setmask(struct qcom_ethqos *ethqos, u32 mask,
> > +			  unsigned int offset)
> > +{
> > +	rgmii_updatel(ethqos, mask, mask, offset);
> > +}
> 
> It's almost unbelieveable there's no set/clr/rmw generics for
> readl and friends

Consider what that would mean - such operations can not be atomic, but
users would likely not realise, which means we get a load of new
potential bugs. Not having these means that driver authors get to
code this up, and because they realise they have to do separate read
and write operations, it's more obvious that there may be races.

The phy_* accessors are different - these take the bus lock while they
operate, and thus are atomic.

> 
> [...]
> >  	/* Set DLL_EN */
> > -	rgmii_updatel(ethqos, SDCC_DLL_CONFIG_DLL_EN,
> > -		      SDCC_DLL_CONFIG_DLL_EN, SDCC_HC_REG_DLL_CONFIG);
> > +	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_DLL_EN,  SDCC_HC_REG_DLL_CONFIG);
> 
> double space
> 
> [...]
> 
> >  	/* Select RGMII, write 0 to interface select */
> > -	rgmii_updatel(ethqos, RGMII_CONFIG_INTF_SEL,
> > -		      0, RGMII_IO_MACRO_CONFIG);
> > +	rgmii_clrmask(ethqos, RGMII_CONFIG_INTF_SEL,  RGMII_IO_MACRO_CONFIG);
> 
> and here
> 
> Everything else looks in tact

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
