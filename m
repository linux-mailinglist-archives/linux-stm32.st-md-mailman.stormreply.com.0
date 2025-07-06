Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC645AFA45C
	for <lists+linux-stm32@lfdr.de>; Sun,  6 Jul 2025 12:11:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C85CC3087B;
	Sun,  6 Jul 2025 10:11:00 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2EF0CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Jul 2025 10:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9haV9aTUDDiNQXjFQryFZWilFLS3MvagruKpPoAm5Gw=; b=ObeV/uaUNE0I4Y3/DRfwn8vH4Q
 ZO2Mv2+qO2bL4rWOb4ULI26+iN3zooJHkM6XchfBUBpBImRBZWEpcATvceTleEhvd0XWaxxmki6T1
 IZZe02lU3N2iK0PNw0UMdU8jj2Jun/gVHJhsTwttl2TwFuV1PMZaWUwozONCDhl6jcLLXW+b1JFLN
 iS8z3gVRvgSIY+FYvn4EEIKTKezufe3N75/FdjWdU6+XnWngTm4kBOSf/DtaFNis4JIUUABlgLrlX
 DBta5ZrVCu1D5499RmxhYyQZzESUgzOspnQRhVQbBb/n/wqQxP7vDnSX0ypT69mI0F4OhLVYtUUrm
 niNYX5IQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52150)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1uYMKd-0003yH-1A;
 Sun, 06 Jul 2025 11:10:48 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1uYMKa-0007zX-1h;
 Sun, 06 Jul 2025 11:10:44 +0100
Date: Sun, 6 Jul 2025 11:10:44 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Biju Das <biju.das.jz@bp.renesas.com>
Message-ID: <aGpLpLDPdcPByC7j@shell.armlinux.org.uk>
References: <20250705170326.106073-1-biju.das.jz@bp.renesas.com>
 <aGl9e9Exvq1fVI0s@shell.armlinux.org.uk>
 <TYCPR01MB11332BCE03B3533784711A5BF864DA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <TY3PR01MB113460004F6A57B3AAD77E86E864CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB113467D8E13143E412B119270864CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <TY3PR01MB113467D8E13143E412B119270864CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
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

On Sun, Jul 06, 2025 at 09:55:28AM +0000, Biju Das wrote:
> Just adding some logs:
> Currently PHY resume is called twice
> [   35.754933]  kszphy_resume+0x3c/0xf0
> [   35.754940]  phy_resume+0x3c/0x74
> [   35.754949]  phylink_prepare_resume+0x58/0xa0
> [   35.754957]  stmmac_resume+0x90/0x2a0
> [   35.771296]  stmmac_pltfr_resume+0x3c/0x4c
> 
> and
> 
> [   35.771258]  kszphy_resume+0x3c/0xf0
> [   35.771263]  __phy_resume+0x28/0x54
> [   35.771270]  phy_start+0x7c/0xb4
> [   35.771275]  phylink_start+0xb8/0x210
> [   35.771282]  phylink_resume+0x7c/0xc4
> [   35.771288]  stmmac_resume+0x1ec/0x2a0
> [   35.771296]  stmmac_pltfr_resume+0x3c/0x4c

This shouldn't be a problem. Phylib will do this, and PHY drivers are
expected to cope.

For example, on non-MAC managed PM PHYs, mdio_bus_phy_resume() will
call phy_init_hw() followed by phy_resume(). If a MAC subsequently is
brought up, phy_start() will be called, which will also call
__phy_resume().

If this is upsetting the KSZ PHY, then the KSZ PHY driver needs fixing.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
