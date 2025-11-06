Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C250C38C02
	for <lists+linux-stm32@lfdr.de>; Thu, 06 Nov 2025 02:55:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E414C62D94;
	Thu,  6 Nov 2025 01:55:43 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80281C5F1E0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Nov 2025 01:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4ITqPQA8fRrbxRLD4xqri1t/q83422DhMqqq3jEbapI=; b=JmIY1pv7Y602Ue9TRGVE3iKkZr
 DKbXWpfFusF2yAM32fugEYoHzHzcxqyC+23jOYx24+5PYnR197hQEHICzt3WQGW7S0WTuctCbXefr
 2RvsZtddE+47OH/HpaMwbQLva9BqWsHiTz4zqgS8sNIQaYN78oNqvhGTp3R88WOSLIufjCtmtTjm6
 ob+etum/3S4QYnsXf3Hx4h8NBTtUpnl6xU3iZd1V9JwHxVyP1SZMbRdUU8dlHz91NFQCxvNvQfV3g
 NTpSwbRgkE4QJVhb5lEYenP0gQzClSIkI3R802GYHb90y8UX/AQomKuxlxi8q8Jj0rxISdK/MYwNc
 efmGaPyw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49948)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vGpDq-000000004A9-1LiQ;
 Thu, 06 Nov 2025 01:55:34 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vGpDn-000000006Ch-1KZs; Thu, 06 Nov 2025 01:55:31 +0000
Date: Thu, 6 Nov 2025 01:55:31 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <aQwAExA7bAgwNkdI@shell.armlinux.org.uk>
References: <aQtQYlEY9crH0IKo@shell.armlinux.org.uk>
 <E1vGdXJ-0000000CloA-3yVc@rmk-PC.armlinux.org.uk>
 <20251105171848.550f625a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251105171848.550f625a@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 09/11] net: stmmac: ingenic:
 simplify x2000 mac_set_mode()
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

On Wed, Nov 05, 2025 at 05:18:48PM -0800, Jakub Kicinski wrote:
> On Wed, 05 Nov 2025 13:26:53 +0000 Russell King (Oracle) wrote:
> > As per the previous commit, we have validated that the phy_intf_sel
> > value is one that is permissible for this SoC, so there is no need to
> > handle invalid PHY interface modes. We can also apply the other
> > configuration based upon the phy_intf_sel value rather than the
> > PHY interface mode.
> 
> clang sayeth:
> 
> drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c:128:13: warning: variable 'val' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
>   128 |         } else if (phy_intf_sel == PHY_INTF_SEL_RGMII) {
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Clang can't know that phy_intf_sel will only ever be one of
PHY_INTF_SEL_RMII or PHY_INTF_SEL_RGMII here (its already been
validated as such by the only caller of this function.)

I guess the way around this warning is to move:

        val |= FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);

up and make it a simple assignment, and make the others |=.

That's the code I originally had before I attempted to minimise the
noise in the patches. :(

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
