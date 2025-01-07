Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4685EA03E50
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2025 12:57:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9745C78022;
	Tue,  7 Jan 2025 11:57:36 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 722C0C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2025 11:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rt0/m2Ur3xOciFGnYgCU4bKBYglBzbBymgd9Uo9+dy8=; b=KqBecdSB8IPGU3TLqYufcE250X
 L8FjFnrCvCmlwFzsHJsSPeLZnFEyAjY/CqcY/tdqZcI5BDjHtx0Sfcqd8rRNpx++b6wLAeYLCobcz
 ga/vcKx/Td9Tk2Wz6kFF4+X7NOXMmhXtxdDVX7yHEC4QAXgIOry3SWOXLskF8m+47nQBiR8GNfetZ
 b/+3k5DjNDNdfV+iX/C80SZEa8OLqnwTE9QHUKGebd1RFADCNBKxv+7GSKNRWiDM08F3aj1IPvA/8
 RkAQ53VOxwGg14bEjWtHv0T0cVe9fR6RyUmOBZLoFJObCvivZ+VCeFojq9z4rRPnehF7qjiORvNDC
 7dsLtgew==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33040)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tV8Cy-0007Li-2x;
 Tue, 07 Jan 2025 11:57:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tV8Cu-0005G3-0o;
 Tue, 07 Jan 2025 11:57:12 +0000
Date: Tue, 7 Jan 2025 11:57:12 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Simon Horman <horms@kernel.org>
Message-ID: <Z30WmPpMp_BRgrOI@shell.armlinux.org.uk>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
 <E1tUmAE-007VWv-UW@rmk-PC.armlinux.org.uk>
 <20250107112851.GE33144@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250107112851.GE33144@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 03/17] net: stmmac: use
 correct type for tx_lpi_timer
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

On Tue, Jan 07, 2025 at 11:28:51AM +0000, Simon Horman wrote:
> On Mon, Jan 06, 2025 at 12:24:58PM +0000, Russell King (Oracle) wrote:
> > The ethtool interface uses u32 for tx_lpi_timer, and so does phylib.
> > Use u32 to store this internally within stmmac rather than "int"
> > which could misinterpret large values.
> > 
> > Since eee_timer is used to initialise priv->tx_lpi_timer, this also
> > should be unsigned to avoid a negative number being interpreted as a
> > very large positive number.
> > 
> > Also correct "value" in dwmac4_set_eee_lpi_entry_timer() to use u32
> > rather than int, which is derived from tx_lpi_timer, even though
> > masking with STMMAC_ET_MAX will truncate the sign bits. u32 is the
> > value argument type for writel().
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> ...
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 9a9169ca7cd2..b0ef439b715b 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -111,8 +111,8 @@ static const u32 default_msg_level = (NETIF_MSG_DRV | NETIF_MSG_PROBE |
> >  				      NETIF_MSG_IFDOWN | NETIF_MSG_TIMER);
> >  
> >  #define STMMAC_DEFAULT_LPI_TIMER	1000
> > -static int eee_timer = STMMAC_DEFAULT_LPI_TIMER;
> > -module_param(eee_timer, int, 0644);
> > +static unsigned int eee_timer = STMMAC_DEFAULT_LPI_TIMER;
> > +module_param(eee_timer, uint, 0644);
> >  MODULE_PARM_DESC(eee_timer, "LPI tx expiration time in msec");
> >  #define STMMAC_LPI_T(x) (jiffies + usecs_to_jiffies(x))
> >  
> 
> Hi Russell,
> 
> now that eee_timer is unsigned the following check in stmmac_verify_args()
> can never be true. I guess it should be removed.
> 
>         if (eee_timer < 0)
>                 eee_timer = STMMAC_DEFAULT_LPI_TIMER;
> 

Thanks for finding that. The parameter description doesn't seem to
detail whether this is intentional behaviour or not, or whether it is
"because someone used int and we shouldn't have negative values here".

I can't see why someone would pass a negative number for eee_timer
given that it already defaults to STMMAC_DEFAULT_LPI_TIMER.

So, I'm tempted to remove this.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
