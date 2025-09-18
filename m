Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E82AEB85AB9
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Sep 2025 17:37:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9EDDC3F940;
	Thu, 18 Sep 2025 15:37:03 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69524C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Sep 2025 15:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aM9defDUbxftG1qhQP/TtclfqCxbcheJJLtqcFMRzU4=; b=F7JJb73THAOqRK1K8GFdiT/8Ej
 gj9W1dfgE4nWfaTkdI63AdaKD9zzZMlzAxOzu/aVmbYNPPczfMsbitvrzmw7CZnzqz/C9q3imUOni
 DrjmmEfLd4yPeTmSp8UTMZiFZhZVOCF/DbW5nbpr95AdhrtzhSqzme+mDJkXUlfUxPsOgtLSizXEI
 aKmM1UInF0ZFJyDXT4Q/TiHrZbxO+8cSKNzxhzXu4mZcNN4QEbc2pAfsUEqW1Dfh8v32Pv/wPfA9I
 6e+qoV4lDUliCYjwrwt3A8JGGBM4o8WYYgFiQYMG0kH0PY/hQ7LWOjWw3XYtpBs06bmGxtzkqmwLx
 q1UygtCQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43486)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1uzGgg-000000001BG-1j6Y;
 Thu, 18 Sep 2025 16:36:46 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1uzGgc-000000001Hk-0d9w; Thu, 18 Sep 2025 16:36:42 +0100
Date: Thu, 18 Sep 2025 16:36:41 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Message-ID: <aMwnCWT5JFY4jstm@shell.armlinux.org.uk>
References: <20250917-wol-smsc-phy-v2-0-105f5eb89b7f@foss.st.com>
 <20250917-wol-smsc-phy-v2-2-105f5eb89b7f@foss.st.com>
 <aMriVDAgZkL8DAdH@shell.armlinux.org.uk>
 <72ad4e2d-42fa-41c2-960d-c0e7ea80c6ff@foss.st.com>
 <aMwQKERA1p29BeKF@shell.armlinux.org.uk>
 <64b32996-9862-4716-8d14-16c80c4a2b10@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <64b32996-9862-4716-8d14-16c80c4a2b10@foss.st.com>
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
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/4] net: stmmac: stm32: add
 WoL from PHY support
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

On Thu, Sep 18, 2025 at 05:07:00PM +0200, Gatien CHEVALLIER wrote:
> On 9/18/25 15:59, Russell King (Oracle) wrote:
> >  > So no. In a situation like this, either we want to be in interrupt
> > mode (in which case we have an interrupt), or the pin is wired to
> > a power management controller and needs to be in PME mode, or it isn't
> > wired.
> > 
> 
> If you are in interrupt mode, plugging a cable would trigger a
> system wakeup in low-power mode if the INTB/PMEB line is wired to a
> power management controller and the WoL is enabled because we're no
> longer in polling mode, wouldn't it?

What Andrew suggested, which is what I implemented for Realtek, other
interrupts get disabled when we enter suspend:

static int rtl8211f_suspend(struct phy_device *phydev)
{
...
        /* If a PME event is enabled, then configure the interrupt for
         * PME events only, disabling link interrupt. We avoid switching
         * to PMEB mode as we don't have a status bit for that.
         */
        if (device_may_wakeup(&phydev->mdio.dev)) {
                ret = phy_write_paged(phydev, 0xa42, RTL821x_INER,
                                      RTL8211F_INER_PME);

This disables all other interrupts when entering suspend _if_ WoL
is enabled and only if WoL is enabled.

If you're getting woken up when you unplug/replug the ethernet cable
when WoL is disabled, that suggests you have something wrong in your
interrupt controller - the wake-up state of the interrupt is managed
by core driver-model code. I tested this on nVidia Jetson Xavier NX
and if WoL wasn't enabled at the PHY, no wakeup occurred.

> You can argue that as per the Realtek 8211F datasheet:
> "The interrupts can be individually enabled or disabled by setting or
> clearing bits in the interrupt enable register INER". That requires
> PHY registers handling when going to low-power mode.

... which is what my patch does.

> There are PHYs like the LAN8742 on which 3 pins can be configured
> as nINT(equivalent to INTB), and 2 as nPME(equivalent to PMEB). The
> smsc driver, as is, contains hardcoded nPME mode on the
> LED2/nINT/nPME/nINTSEL pin. What if a manufacturer wired the power
> management controller to the LED1/nINT/nPME/nINTSEL?
> This is where the pinctrl would help even if I do agree it might be a
> bit tedious at first. The pinctrl would be optional though.

I'm not opposing the idea of pinctrl on PHYs. I'm opposing the idea
of tying it into the WoL code in a way that makes it mandatory.
Of course, if it makes sense for a PHY driver to do pinctrl stuff
then go ahead - and if from that, the driver can work out that
the PHY is wake-up capable, even better.

What I was trying to say is that in such a case as the Realtek
driver, I don't want to see pinctrl forced upon it unless there is
a real reason and benefit, especially when there are simpler ways
to do this.

I also think that it would be helpful to add the wakeup-source
property where PHYs are so capable even if the PHY driver doesn't
need it for two reasons. 1. OS independence. 2. it's useful docs.
3. just because our driver as it stands at whatever moment in time
doesn't make use of it doesn't mean that will always be the case.
(e.g., we may want to have e.g. phylib looking at that property.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
