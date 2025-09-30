Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD5CBAC90D
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Sep 2025 12:54:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDB55C424C3;
	Tue, 30 Sep 2025 10:54:20 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC572C3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Sep 2025 10:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wEl8Vu88HbCShDFSr5D6DQceYwmi4hJ5JAfySeh3vM0=; b=nT2/PjyaS3+5akC+nlaDg1dnl2
 qySlS/urecJfiMgtpqDdIAeNmqXaaJ7jgItB6dkul7Pu0XCdCkJvY7quTX7Nx/HVJErSznFhOVMW3
 l2IF65Ho7x7uhudSAuT9mGvMQHXP/AYmgKipOCZfuga9k8wR2Q9GY2rAnJCVe1WXspiKk9gmRg6Zu
 EIBzDlzP6HMuvyOc2agL26rCwn0RYze2vwHeEKs/X1iK3hbAEDO9dEvGREHG7jrABtAGlWHXiboom
 iIVV5KEackWguKVh2fCjZUfXrfDOrN1c4okkChlg9xbaUCqnriRndVGocSFImsJErd6bvo9A19r0p
 ROXO0TIA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36802)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1v3Xzh-000000007iL-0Awj;
 Tue, 30 Sep 2025 11:54:05 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1v3Xzc-000000004Rc-0Mbn; Tue, 30 Sep 2025 11:54:00 +0100
Date: Tue, 30 Sep 2025 11:53:59 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Message-ID: <aNu2xxrOuFuFc7wE@shell.armlinux.org.uk>
References: <aNj4HY_mk4JDsD_D@shell.armlinux.org.uk>
 <E1v2nFD-00000007jXP-0fX2@rmk-PC.armlinux.org.uk>
 <2e23535f-f0a2-4111-ae64-6f496a72f27d@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2e23535f-f0a2-4111-ae64-6f496a72f27d@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tristram Ha <Tristram.Ha@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 2/6] net: phy: add
	phy_may_wakeup()
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

On Tue, Sep 30, 2025 at 11:04:28AM +0200, Gatien CHEVALLIER wrote:
> Hi Russell,
> 
> First of all, thank you for taking the time to propose something.
> 
> IIUC, using ethtool to enable WoL with, e.g: "ethtool -s end0 wol g"
> even if the WoL isn't really supported will prevent the phy suspend.

This is correct - whenever a PHY has WoL enabled, it won't be suspended
as it has to listen for the configured wake-up packet(s).

> Therefore, PHY drivers should be adapted to implement something like:
> 
> 	if (!device_can_wakeup(&dev->mdio.dev))
> 		return -EOPNOTSUPP;
> 
> in their set_wol() ops to fully adapt to what you propose, right?

That's not sufficient. Yes, it's one of the things they need to do.

1. get_wol() should set ->supported to 0 (or at least not add anything
   to it) if wake-up is not possible.

2. set_wol() should not enable WoL modes or return -EOPNOTSUPP as you
   have above if wake-up is not possible. It should also call
   device_set_wakeup_enable() to indicate whether wake-up has been
   enabled for this device or not.

3. the PHY driver's probe function needs to be modified to call 
   device_set_wakeup_capable() to configure whether this device _really_
   can wake-up the system. See realtek_main.c::rtl8211f_probe() and
   broadcom.c as examples.

4. if using interrupt-based wake-up, use devm_pm_set_wake_irq() so
   the driver core can manage the irq-wake configuration.

See realtek_main.c - that's the driver I recently fixed (it had many
issues).

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
