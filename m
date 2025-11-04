Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C55C2FB83
	for <lists+linux-stm32@lfdr.de>; Tue, 04 Nov 2025 08:50:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3B6EC62ECF;
	Tue,  4 Nov 2025 07:50:43 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95E7FC030AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 07:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zFX01VJY+mONJhtkTUSxkKaT0H5G139ZB0xMXIf93pU=; b=wIlEtaBuc6pk0JydqUtkiAPcMk
 HwzT8yrzhnGYhaJ77ceqr0R1uX6nmiTza8Ew6/zLqvmB9oGEK/a5xbrMUJZ6+g8Ie6ZhiPnWChxJT
 3Ay5bztyapqiwUL8TY2VBasG5z9rfn0o++CpnI9WgkcrAm9BOB5UsaULfBdapeSSuL4/5zUZ4NYRT
 Z8c/7ki/T4w/hXf598eUAbvxyE0Xg2pQmiYfUy1MfRANUr7nnvQlGrGYT5/GoX6OPzP3KrU5ORlwz
 HN8tuTD9OVq2t830RD2CIAPUHoUzcw05FHEToxxkO6gvSUAS4sYKRNgGt+aQBDVaF/DOk12yX3xcD
 kaqsOJ9A==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40358)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vGBoE-000000001p2-3uhA;
 Tue, 04 Nov 2025 07:50:31 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vGBoB-000000004b2-0Cf4; Tue, 04 Nov 2025 07:50:27 +0000
Date: Tue, 4 Nov 2025 07:50:26 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Message-ID: <aQmwQoxn5CwS9988@shell.armlinux.org.uk>
References: <E1vEn1W-0000000CHoi-2koP@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vEn1W-0000000CHoi-2koP@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev,
 netdev@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Fabio Estevam <festevam@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: imx: use phylink's
 interface mode for set_clk_tx_rate()
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

On Fri, Oct 31, 2025 at 11:10:26AM +0000, Russell King (Oracle) wrote:
> imx_dwmac_set_clk_tx_rate() is passed the interface mode from phylink
> which will be the same as plat_dat->phy_interface. Use the passed-in
> interface mode rather than plat_dat->phy_interface.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

While checking patchwork this morning, this patch was unexpectedly
marked as superseded. It appears I accidentally posted it as part of
the multi-interface stmmac series. This should not have happened.
Please apply _this_ patch as it has Maxime's attributations on,
whereas the mistakenly reposted patch does not.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
