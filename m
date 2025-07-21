Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D99B0C2E6
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Jul 2025 13:28:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5841C32E92;
	Mon, 21 Jul 2025 11:28:46 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46998C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 11:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0ZUgBqx92qBG7YxcgchOSk9zrFJ4dI1nB3VhodBS568=; b=0Dw7LcU4IbmDlG8F3HK/dH3mNC
 kmeTh2bcWVTzXjyJVMqXg3wQ76dFrx/HO3L7pLaA2sJKblmKg0f4P7Bxnp3HSv3Usb8hLtY4eXo9R
 04yA3YHQoqwdYfT4R8gseeR8PYNpoGtiRwDVB0fo5QDED4IGKQz6lgqGAdrzVTGq7VWBgP2hFrvK+
 3leX5BI1MRCdfce+CLH6smel8QBOLGKhFRa9Vz2800x6OP7S0lGSN0qDyRptpSi+v22YP2dO2w3ga
 uix/Z+iEhNHoA7BzmNAiRbuLDeUrmWV7Po1TtNtdNqMAFOjsEJg8Hu5TD6892xi9HOn2CTtaNqBeQ
 c6L+ElgA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51126)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1udoh1-0006cW-0F;
 Mon, 21 Jul 2025 12:28:27 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1udogu-00067a-2M;
 Mon, 21 Jul 2025 12:28:20 +0100
Date: Mon, 21 Jul 2025 12:28:20 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <aH4kVBTxd4zRYv2l@shell.armlinux.org.uk>
References: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
 <20250721-wol-smsc-phy-v1-3-89d262812dba@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250721-wol-smsc-phy-v1-3-89d262812dba@foss.st.com>
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
Subject: Re: [Linux-stm32] [PATCH net-next 3/4] net: phy: smsc: fix and
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

On Mon, Jul 21, 2025 at 01:14:45PM +0200, Gatien Chevallier wrote:
> +static int smsc_phy_suspend(struct phy_device *phydev)
> +{
> +	if (!phydev->wol_enabled)
> +		return genphy_suspend(phydev);

This should not be necessary. Take a look at phy_suspend(). Notice:

        phydev->wol_enabled = phy_drv_wol_enabled(phydev) ||
                              (netdev && netdev->ethtool->wol_enabled);
        /* If the device has WOL enabled, we cannot suspend the PHY */
        if (phydev->wol_enabled && !(phydrv->flags & PHY_ALWAYS_CALL_SUSPEND))
                return -EBUSY;

PHY_ALWAYS_CALL_SUSPEND is not set for this PHY, therefore if
phydev->wol_enabled is set by the above code, phydrv->suspend will
not be called.

> +
> +	return 0;
> +}
> +
> +static int smsc_phy_resume(struct phy_device *phydev)
> +{
> +	int rc;
> +
> +	if (!phydev->wol_enabled)
> +		return genphy_resume(phydev);
> +
> +	rc = phy_read_mmd(phydev, MDIO_MMD_PCS, MII_LAN874X_PHY_MMD_WOL_WUCSR);
> +	if (rc < 0)
> +		return rc;
> +
> +	if (!(rc & MII_LAN874X_PHY_WOL_STATUS_MASK))
> +		return 0;
> +
> +	dev_info(&phydev->mdio.dev, "Woke up from LAN event.\n");
> +	rc = phy_write_mmd(phydev, MDIO_MMD_PCS, MII_LAN874X_PHY_MMD_WOL_WUCSR,
> +			   rc | MII_LAN874X_PHY_WOL_STATUS_MASK);
> +
> +	return rc;

Note that this will be called multiple times, e.g. during attachment of
the PHY to the network device, when the device is opened, etc even
without ->suspend having been called, and before ->wol_enabled has
been set. Make sure your code is safe for this.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
