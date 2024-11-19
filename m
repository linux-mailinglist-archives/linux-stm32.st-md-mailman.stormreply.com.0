Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 250259D4197
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 18:49:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EA87C7BF72;
	Wed, 20 Nov 2024 17:49:46 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1066C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 16:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=820A+uqPjk3jrH0mLxNnwDGBvwyz/yvubtHzlTrrbZw=; b=aaZC67T0sa+lZ43UDQKQKt69/z
 8VkYUpereUrC5gOPyh0zBSP9ETlYVP+htDja+DcuPS4RT7gA1EJSnBJhizZcl/1aLQmI/LGRbCxOQ
 vhZae9c3UWVvdIbCoFfEZ9JJLdb4QzDaK+ytPFLqhzJepmYuPcaZ0lEuet60q91Nuf9qHuTKTdVvN
 IdqJWQQF9UHu0xMyiOqifaWCvNe+SRGGPAIRirK6ysKtsGUKuKTZizNicVvQKkmMnC6z5RAcYFGJ1
 ZShLf5w3Ie95GCUvWiZC3TO62GUXwgXhj3znzaQqJqpLqXAkP8cGa50N7aJv9GIOs1DuvdzMvr6Yw
 gSsmJ+rQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50346)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tDRHw-0003wv-31;
 Tue, 19 Nov 2024 16:41:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tDRHv-0006Cs-07;
 Tue, 19 Nov 2024 16:41:15 +0000
Date: Tue, 19 Nov 2024 16:41:14 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: jan.petrous@oss.nxp.com
Message-ID: <Zzy_qh13euS1aTYr@shell.armlinux.org.uk>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
 <20241119-upstream_s32cc_gmac-v5-4-7dcc90fcffef@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241119-upstream_s32cc_gmac-v5-4-7dcc90fcffef@oss.nxp.com>
X-Mailman-Approved-At: Wed, 20 Nov 2024 17:49:43 +0000
Cc: Andrew Lunn <andrew@lunn.ch>, NXP S32 Linux Team <s32@nxp.com>,
 Emil Renner Berthing <kernel@esmil.dk>, imx@lists.linux.dev,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v5 04/16] net: phy: Add helper for mapping
 RGMII link speed to clock rate
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

On Tue, Nov 19, 2024 at 04:00:10PM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> The RGMII interface supports three data rates: 10/100 Mbps
> and 1 Gbps. These speeds correspond to clock frequencies
> of 2.5/25 MHz and 125 MHz, respectively.
> 
> Many Ethernet drivers, including glues in stmmac, follow
> a similar pattern of converting RGMII speed to clock frequency.
> 
> To simplify code, define the helper rgmii_clock(speed)
> to convert connection speed to clock frequency.
> 
> Suggested-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
