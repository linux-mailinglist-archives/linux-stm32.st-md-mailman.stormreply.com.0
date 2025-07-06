Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78686AFA44B
	for <lists+linux-stm32@lfdr.de>; Sun,  6 Jul 2025 12:06:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BB3DC3087B;
	Sun,  6 Jul 2025 10:06:43 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7F1AC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Jul 2025 10:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IWfeIfuL/kwNF8nAD5QuTvp840QjR9/bbiTVVW0dfhk=; b=iU5ZzXcNVcNXf4OCCNIVweOmSz
 hiHERGwNfjqeYzsY1DNxe+aGznYucGnwzjIDO1pnnaDrV70QF49/IGm+Qf9gzrCSwsrC5QxyIkSK9
 WIAezClT4H61s8UjuL9hOpXEUu4TfEWLY3PyQWm+GqneNTlpm/QrkD+3DfYDouJA5Wi1nahWcvgMD
 uLNwbwyT98O/RlkjerGR5DK6Jw9YY3FunMqfpKvzRIajDfqE75N2a7q0LmOq9Aahft7hZjzl2Pxd5
 0wNWmFmQvEZS9C1+pFFsDYWouTGOaIOu3p9EmrJg2TxGb4GMs8WxCfSJ8SAZXKJW7TPBTHBDc9hp2
 hupzmhwg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47384)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1uYMGR-0003xa-2A;
 Sun, 06 Jul 2025 11:06:27 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1uYMGL-0007ya-32;
 Sun, 06 Jul 2025 11:06:21 +0100
Date: Sun, 6 Jul 2025 11:06:21 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Biju Das <biju.das.jz@bp.renesas.com>
Message-ID: <aGpKncEeZTifSlA2@shell.armlinux.org.uk>
References: <20250705170326.106073-1-biju.das.jz@bp.renesas.com>
 <aGl9e9Exvq1fVI0s@shell.armlinux.org.uk>
 <TYCPR01MB11332BCE03B3533784711A5BF864DA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <TY3PR01MB113460004F6A57B3AAD77E86E864CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <TY3PR01MB113460004F6A57B3AAD77E86E864CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac:
 dwmac-renesas-gbeth: Add PM suspend/resume callbacks
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

On Sun, Jul 06, 2025 at 08:45:14AM +0000, Biju Das wrote:
> Hi Russell King,
> 
> FYI, The above testing is done with rootFS mounted on SD card.
> 
> But when I mount rootFS on NFS, after wakeup, I am not able to contact the NFS server.
> 
> The below patch makes it to work[1].
> Not sure, why the original code is failing if the rootFS is mounted on NFS?

It would be good to understand exactly what is going on there.

As stmmac sets mac_managed_pm to true, which is propagated to phylib,
this means the mdiobus suspend/resume will be no-ops, as the MAC driver
needs to do everything necessar to resume the PHY.

Is your PHY losing power over suspend/resume?

Maybe phylink_prepare_resume() needs to call phy_init_hw() as well,
like mdio_bus_phy_resume() does?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
