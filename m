Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC48AB80C83
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Sep 2025 17:54:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54BE5C3F954;
	Wed, 17 Sep 2025 15:54:59 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99DA0C3F93C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Sep 2025 15:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AJktQMdqIHogk394FiivhFmOdjrHiCFPa1pHkmNNloE=; b=tA7yjSBfh1hpMlPKDhAteZScZ3
 LWtL4OhwJkoeY112/UKM1Lj8dS10jvM+/d6/xo7uOMTYDiqIm1NQXobdmEP65om9Qn9i5wDxhEPd0
 P+IcrmnIkqG20n8KABAmHw35SvqVVXkkU52TAhEpRjB553kSnPam6Gyb9lSssnWmtArp8+a58ynQ2
 BDtXU4CWBHtd28yI7/zUBK8UQClI5b7KUxLuPnp+KI2wVmuPFgZljQtubiVf3vGnXc158jeQGCHYZ
 QbXZ0eaG7ML9xwJ8sYFm6VONwlxAFv8YKbLmt62yyEzyVX9cwqj2YVfya/NnroZvUcrbbMUwW7293
 2hky0hiA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45608)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1uyuUV-0000000053e-1IFT;
 Wed, 17 Sep 2025 16:54:43 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1uyuUQ-000000000Jt-3aAP; Wed, 17 Sep 2025 16:54:38 +0100
Date: Wed, 17 Sep 2025 16:54:38 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <aMrZvvVBwmWGjr4P@shell.armlinux.org.uk>
References: <20250917-wol-smsc-phy-v2-0-105f5eb89b7f@foss.st.com>
 <20250917-wol-smsc-phy-v2-3-105f5eb89b7f@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250917-wol-smsc-phy-v2-3-105f5eb89b7f@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Andrew Lunn <andrew@lunn.ch>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tristram Ha <Tristram.Ha@microchip.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 3/4] net: phy: smsc: fix and
 improve WoL support
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

On Wed, Sep 17, 2025 at 05:36:38PM +0200, Gatien Chevallier wrote:
> @@ -673,6 +726,9 @@ int smsc_phy_probe(struct phy_device *phydev)
>  
>  	phydev->priv = priv;
>  
> +	if (phydev->drv->set_wol)
> +		device_set_wakeup_capable(&phydev->mdio.dev, true);

This suggests that you know that this device is _always_ capable of
waking the system up, irrespective of the properties of e.g. the
interrupt controller. If this is not the case, please consider the
approach I took in the realtek driver.

In that case, you also need to add checks in the get_wol() and
set_wol() methods to refuse WoL configuration, and to report that
WoL is not supported.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
