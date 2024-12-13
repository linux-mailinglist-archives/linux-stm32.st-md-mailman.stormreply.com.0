Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE889F0A45
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Dec 2024 12:00:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9D9CC78006;
	Fri, 13 Dec 2024 11:00:13 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24916C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2024 11:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tW1kqG7AA7VKuaZuIchhnJLzAYeE13kvfdYICGMAvpA=; b=BAynvb7wzY0Qw60t6wnpt78/qq
 vFB1MVGBVwIRglh/GEFtMTFb03eloxHgljpyzzDUs2omP3GUblZGcLOIc9evLq0qrEPJfPUQuJgOn
 xDolDmF8a0Ag+MXGKmMfJEkKjpYABzH/x581Dt1BabS44Sbofprj51HoI5P5a622ScSqBlCT1O6yg
 MGUhQmh8uBOBzQbcKrjCJbz9aL22I/+UpbWSzVQ/3GKAjjijlwErDxyH2XgnqjPmz5V0kWQ1Tp/wO
 DpmJnZpgleUDOqghGcZs3+mDQeWuxuzTDS+83fti+X9buWRsGee9bvqHZL5FN3bQGLhto+z1CoCBv
 Kt9Qx8PQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48066)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tM3On-0006ar-0n;
 Fri, 13 Dec 2024 10:59:58 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tM3Ok-0006Fr-0f;
 Fri, 13 Dec 2024 10:59:54 +0000
Date: Fri, 13 Dec 2024 10:59:54 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <Z1wTqh-BnvPYLqU8@shell.armlinux.org.uk>
References: <Z1r3MWZOt36SgGxf@shell.armlinux.org.uk>
 <E1tLkSX-006qfS-Rx@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1tLkSX-006qfS-Rx@rmk-PC.armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/7] net: stmmac: move
 tx_lpi_timer tracking to phylib
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

On Thu, Dec 12, 2024 at 02:46:33PM +0000, Russell King (Oracle) wrote:
> @@ -1092,6 +1092,7 @@ static void stmmac_mac_link_up(struct phylink_config *config,
>  			phy_init_eee(phy, !(priv->plat->flags &
>  				STMMAC_FLAG_RX_CLK_RUNS_IN_LPI)) >= 0;
>  		priv->eee_enabled = stmmac_eee_init(priv);
> +		priv->tx_lpi_timer = phy->eee_cfg.tx_lpi_timer;
>  		priv->tx_lpi_enabled = priv->eee_enabled;
>  		stmmac_set_eee_pls(priv, priv->hw, true);
>  	}

While looking deeper at stmmac, there's a bug in the above hunk -
stmmac_eee_init() makes use of priv->tx_lpi_timer, so this member
needs to be set before calling this function. I'll post a v2 shortly.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
