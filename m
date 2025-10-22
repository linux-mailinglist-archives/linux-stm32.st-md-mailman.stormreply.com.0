Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1885ABFDCD4
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Oct 2025 20:21:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3561C5E2D8;
	Wed, 22 Oct 2025 18:21:46 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4190C5E2D6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 18:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bku8ZfM1vd1cxkJC/JuPNt08MeKU8abxyCWkKmsYXbM=; b=WzZGa/PWzfHHLyzzZox92f11dx
 jfzyLEMXDOhoxlluvfXPRcA3iQ0LQWc22quFb5M9ZwO9ZNQglgdRhMkb/nMPeqzDpKL1na/fPd5bT
 Z2Ur+DfOCNO2NcllHSm7JcoNHtPDQaa/5omjJOUiWV8Te+tNc97UdHHv+nHrPJ9qk2K52/Vz73CQy
 c344P5Tn+IAbIOkGjXrnr8Bycjyz3NQEntfS2ODGglEHKEtvF2bog2NrGzJLAWxL46H8sNf9wiK5E
 stmTVIU6yCX79eMwav6tOmj905wLBoEC/Ix/xyYRsq5CsKxjFHk++iLDPiJdI5j8Urg+bLDWo3lT0
 OpD80XVQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50792)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vBdSv-000000005Iv-0yvw;
 Wed, 22 Oct 2025 19:21:41 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vBdSt-000000000vC-2c8q; Wed, 22 Oct 2025 19:21:39 +0100
Date: Wed, 22 Oct 2025 19:21:39 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <aPkgs44E2ahwsaWx@shell.armlinux.org.uk>
References: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
 <E1v9jCO-0000000B2O4-1L3V@rmk-PC.armlinux.org.uk>
 <432ac9c4-845d-4fe4-84fb-1b2407b88b3f@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <432ac9c4-845d-4fe4-84fb-1b2407b88b3f@gmail.com>
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

On Wed, Oct 22, 2025 at 11:14:08AM -0700, Florian Fainelli wrote:
> On 10/17/25 05:04, Russell King (Oracle) wrote:
> > Add phy_may_wakeup() which uses the driver model's device_may_wakeup()
> > when the PHY driver has marked the device as wakeup capable in the
> > driver model, otherwise use phy_drv_wol_enabled().
> > 
> > Replace the sites that used to call phy_drv_wol_enabled() with this
> > as checking the driver model will be more efficient than checking the
> > WoL state.
> > 
> > Export phy_may_wakeup() so that phylink can use it.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

Note my reply to Maxime, I've changed the description to:

+/**
+ * phy_may_wakeup() - indicate whether PHY has wakeup enabled
+ * @phydev: The phy_device struct
+ *
+ * Returns: true/false depending on the PHY driver's device_set_wakeup_enabled()
+ * setting if using the driver model, otherwise the legacy determination.
+ */
+bool phy_may_wakeup(struct phy_device *phydev);
+

Are you still okay for me to add your r-b?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
