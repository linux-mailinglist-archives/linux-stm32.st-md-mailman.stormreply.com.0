Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AB4BFDCCB
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Oct 2025 20:20:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0099C5E2D7;
	Wed, 22 Oct 2025 18:20:50 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 217EAC5E2D4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 18:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2eg5VCKhxpUu6/CBY1uNQQlvIa7Z/RikQOCRPOIN5rs=; b=eYqIBWwzr42NbDZUgJACt+frDZ
 i7ljnO/w9b5sT4KjlaNpTFUbK5JNnvqHzCflRrJZYUk5yHDXajRMQfblY8A3PDMu2g7jrLcnFZaFv
 hwZp/RHAkQaM7d9Jk3pU8g6t4hCJNeSnx817L7Vipz3TsRTTbt8IDMA1EpWZv/coVNrsMet0TjGI9
 cMWI7Nzb11DBcFfC9oiB5aGvK4DKqX6/GaWmWkXTTIU+eJFWGUmtqbd1CKse7sCk3GIPiEfUIzEza
 SwKecesTrtcNMIYnPeI7rd3RitMEk/VCq++jvTiZCOQxcG7B3yeVFk+ScGQKPVS7Zh85hQc3G2Vz0
 uFUxJIaQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38592)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vBdS0-000000005IZ-1ACS;
 Wed, 22 Oct 2025 19:20:44 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vBdRy-000000000v1-1be2; Wed, 22 Oct 2025 19:20:42 +0100
Date: Wed, 22 Oct 2025 19:20:42 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <aPkgeuOAX98aT-T7@shell.armlinux.org.uk>
References: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
 <E1v9jCO-0000000B2O4-1L3V@rmk-PC.armlinux.org.uk>
 <ad16837d-6a30-4b3d-ab9a-99e31523867f@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ad16837d-6a30-4b3d-ab9a-99e31523867f@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 2/6] net: phy: add
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

On Wed, Oct 22, 2025 at 03:43:20PM +0200, Maxime Chevallier wrote:
> Hi Russell,
> 
> That's not exactly what's happening, this suggest this is merely a
> wrapper around device_may_wakeup().
> 
> I don't think it's worth blocking the series though, but if you need to
> respin maybe this could be reworded.
> 
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

I've updated the description as I think patch 4 needs a repost:

+/**
+ * phy_may_wakeup() - indicate whether PHY has wakeup enabled
+ * @phydev: The phy_device struct
+ *
+ * Returns: true/false depending on the PHY driver's device_set_wakeup_enabled()
+ * setting if using the driver model, otherwise the legacy determination.
+ */
+bool phy_may_wakeup(struct phy_device *phydev);
+

Do you want me to still add your r-b?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
