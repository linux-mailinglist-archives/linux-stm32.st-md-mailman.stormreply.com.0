Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED24AB95ABA
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Sep 2025 13:31:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17140C3089D;
	Tue, 23 Sep 2025 11:31:33 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A5C3C36B20
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Sep 2025 11:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FqqitcQCkxhV32rTsJ+uCNxHvhC6YeG2qjPkLgt2EmY=; b=V2Xf7M/44Zue2oMyR0jrB+6qMg
 7ZAh961BrfLS0ajhseeoLhfyHCGNfHPNryrtiAnligon5imjUELBnAYYeYvGEq8HyMCjvXGG18NeR
 xX45bLWzxrnwcB0j2Yuoglb08+J7TKgm0LM9hQOtYHtqGNt/4LLi/I5MvXUR0NQgnNiUhEG5hUbCb
 JDYoTT3RoUIm3MA855yGNesZCF5JUQgQT8BS9MXHIxnoViLqZaISaVBU/hb0hizZXSiz2+qH5qEXO
 pgg/MesL/bYJCJJnAnbqqg0IgZRGp7D8trqHGNCTboXfcIhzp4fb1h7R3YigLmTnbHn8DxIhHllQS
 q3C2v+Fg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54658)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1v11F2-000000007BP-0BY1;
 Tue, 23 Sep 2025 12:31:28 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1v11Ez-0000000066T-3bkC; Tue, 23 Sep 2025 12:31:25 +0100
Date: Tue, 23 Sep 2025 12:31:25 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <aNKFDW_aaSZl2NFE@shell.armlinux.org.uk>
References: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/6] net: stmmac: yet more
	cleanups
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

On Tue, Sep 23, 2025 at 12:25:30PM +0100, Russell King (Oracle) wrote:
> Building on the previous cleanup series, this cleans up yet more stmmac
> code.
> 
> - Move stmmac_bus_clks_config() into stmmac_platform() which is where
>   its onlny user is.
> 
> - Move the xpcs Clause 73 test into stmmac_init_phy(), resulting in
>   simpler code in __stmmac_open().
> 
> - Move "can't attach PHY" error message into stmmac_init_phy().
> 
> We then start moving stuff out of __stmac_open() into stmmac_open()
> (and correspondingly __stmmac_release() into stmmac_release()) which
> is not necessary when re-initialising the interface on e.g. MTU change.
> 
> - Move initialisation of tx_lpi_timer
> - Move PHY attachment/detachment
> - Move PHY error message into stmmac_init_phy()
> 
> Finally, simplfy the paths in stmmac_init_phy().
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h       |   1 -
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 111 ++++++++-------------
>  .../net/ethernet/stmicro/stmmac/stmmac_platform.c  |  32 ++++++
>  3 files changed, 73 insertions(+), 71 deletions(-)

Should've added: tested on nVidia Jetson Xavier NX.

However, observed a failure changing the MTU with the link down - our
old friend, failure to complete the DMA reset.

Once that's been triggered, taking the interface down or changing the
MTU again results in more problems, with the thread spinning in
napi_disable_locked() with RTNL held (as we effectively end up calling
napi_disable() twice on the same napi struct.)

This basically makes the platforms networking unusable - and needs to
be hard-reset.

These issues pre-exist all my cleanups.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
