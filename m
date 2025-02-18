Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8642EA39B2B
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2025 12:41:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3868BC78F87;
	Tue, 18 Feb 2025 11:41:45 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90F7CC7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2025 11:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6ujQvCQNZoKNKilbwyxTloll25o1U/0BsukcebFRRwI=; b=wvk9irEdCnJm5zqVAKZmmW2efu
 pI4Sn8Kbz4KTGPa1eHSg2k5UZfEz62IQGZSIyYYo1mem2aq7wWLfY6EFrp75rZ4xuMpY2GFYzB/Od
 BWh3C0W+iFSexNDkGJPGWaWh97Xv+3T3Z6n69D9uQmN7hXK29Yq0bj3C00NplKf0UjojfsdUCSOnp
 57Y3w0Okgb+/W15fnImNuNOWDIWbs5H6eCcdVshxfR5oqvNJfjqC0hBZrB5Auorvbvdn/OCO836sn
 smKbwMrklIhGU8Wbccc8O6zxWbMM3E+mjigJJ483hexREyl/dKN/+hFx9Gkj4CxEsft4DTuwYsYDD
 UqYyJUNw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54998)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tkLyf-0001qH-25;
 Tue, 18 Feb 2025 11:41:25 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tkLyZ-0007Ek-2X;
 Tue, 18 Feb 2025 11:41:19 +0000
Date: Tue, 18 Feb 2025 11:41:19 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <Z7Rx36FDAJk_yMQl@shell.armlinux.org.uk>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
 <E1tkLZG-004RZb-8Y@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1tkLZG-004RZb-8Y@rmk-PC.armlinux.org.uk>
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jon Hunter <jonathanh@nvidia.com>, Jakub Kicinski <kuba@kernel.org>,
 Thierry Reding <treding@nvidia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Minda Chen <minda.chen@starfivetech.com>, linux-arm-kernel@lists.infradead.org,
 Paolo Abeni <pabeni@redhat.com>, Inochi Amaoto <inochiama@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 7/7] net: stmmac: imx: use
 generic stmmac_set_clk_tx_rate()
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

On Tue, Feb 18, 2025 at 11:15:10AM +0000, Russell King (Oracle) wrote:
> Convert non-i.MX93 users to use the generic stmmac_set_clk_tx_rate() to
> configure the MAC transmit clock rate.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Looking at this again, this patch is not correct - imx does a few
checks before changing the "tx" clock.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
