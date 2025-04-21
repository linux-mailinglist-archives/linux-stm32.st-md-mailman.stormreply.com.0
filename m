Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 324E9A95663
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Apr 2025 21:00:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC379C7802E;
	Mon, 21 Apr 2025 19:00:29 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5487CFAC45
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Apr 2025 19:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IEN033baaB4ogGADBJMQL9poprZr/OOuFaTb+kBE3qw=; b=zfsFMbWg6CK6J4o+6YCkUph4VD
 G8rRxLGFNmj1yc8SuXsCdmeBXLFsKmo+pQU/YmDEj6XuVLWOZBctb/wT3kZhd9jkwHP7nDLX7j/5S
 cBWBX9FWMs4jPDwKAQR/ZY0NkKDBxSI7VpltWeIOoCafynDuzUQ8BsVTGMHO4nxq3AQZ990XL7OmZ
 KI9dlW7Oa7niv5zhxM7BpQnNsx2RyizT3XdHdAfas9Qpz6L+UBfQCAeBZGXVzxjTDZ6QBCLv03l7G
 wG2uSezrrzpzhsb+ULzwEsAOe1f5hzufGywh/IeMMcpc4kNcbIXvQheVPTZOzqV+xQomlb7Sx8I/j
 DAhQts3A==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59916)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1u6wNB-0003FY-0i;
 Mon, 21 Apr 2025 20:00:05 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1u6wN3-0006g3-2g;
 Mon, 21 Apr 2025 19:59:57 +0100
Date: Mon, 21 Apr 2025 19:59:57 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Biju Das <biju.das.jz@bp.renesas.com>
Message-ID: <aAaVrVFql3vSktrT@shell.armlinux.org.uk>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z_0-iH91A4Sexlzj@shell.armlinux.org.uk>
 <CA+V-a8sS0TtS-TEdkQ8MB5F4JtzV9358Y9fmKe5MggGU+wP=4Q@mail.gmail.com>
 <CA+V-a8tbW2Zs6op20yRTcihSm1bcMC2dYnRXVCKRf=q4fymZyg@mail.gmail.com>
 <TY3PR01MB1134633A8CB82788BB98C6E6286B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <TY3PR01MB1134633A8CB82788BB98C6E6286B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Eric Dumazet <edumazet@google.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Rob Herring <robh@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Lad,
 Prabhakar" <prabhakar.csengg@gmail.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v5 3/3] net: stmmac: Add DWMAC
 glue layer for Renesas GBETH
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

On Mon, Apr 21, 2025 at 01:45:50PM +0000, Biju Das wrote:
> Hi All,
> FYI, On RZ/G3E, for STR to work with mainline, we need to reinitialize the PHY.

Which "mainline" are you using?

Reading your emails, I suspect v6.14 rather than something post-dating
v6.15-rc1, since your latest email suggests that the PHY driver's
->resume method is not being called early in stmmac's resume. However,
commits 367f1854d442 and ef43e5132895 made this happen, which were
merged during the merge window, and are thus in v6.15-rc1.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
