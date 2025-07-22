Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA03AB0E5FF
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jul 2025 00:00:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8948C36B0C;
	Tue, 22 Jul 2025 22:00:53 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A48EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 22:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XSSmyEAVCfx6UoBN6/vyS4ypSsBayt+epb+whGNpxlc=; b=efkh5OYuxMntLpQJfhREDs00bT
 e31RvBopK3XWSjzCJceqzHhiBJnPqtcwtbFK2oBy1s+de/r7ALJUKHqz9WXbLx63YkB6KsGHefWJm
 bVpZBLUWfqTjXLGYD+9/yA6JkLuiDEHB3SC1+2EKu+hGz0nnQxP1d51EvqA0oztSftHu8f8AOUXY6
 Uh/2FYBf5MV7yTGyrYO4gHZrkZeLx8Ol7t4D5hCvcROVO2KkTqzCgOZJcAGkyqZoeh6yqbhEV3BMY
 oRfBIsyD+K7rDqe/zylRjiXU91hxTdGab+qPmrM/htdnJM+aafdw8LQLtBZ3+B02TzBlV0zgqVBdg
 xuuzHWUQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56144)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1ueL2L-0000hK-0z;
 Tue, 22 Jul 2025 23:00:37 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1ueL2I-0007UG-0n;
 Tue, 22 Jul 2025 23:00:34 +0100
Date: Tue, 22 Jul 2025 23:00:34 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <aIAKAlkdB5S8UiYx@shell.armlinux.org.uk>
References: <faea23d5-9d5d-4fbb-9c6a-a7bc38c04866@kernel.org>
 <f5c4bb6d-4ff1-4dc1-9d27-3bb1e26437e3@foss.st.com>
 <e3c99bdb-649a-4652-9f34-19b902ba34c1@lunn.ch>
 <38278e2a-5a1b-4908-907e-7d45a08ea3b7@foss.st.com>
 <5b8608cb-1369-4638-9cda-1cf90412fc0f@lunn.ch>
 <383299bb-883c-43bf-a52a-64d7fda71064@foss.st.com>
 <2563a389-4e7c-4536-b956-476f98e24b37@lunn.ch>
 <aH_yiKJURZ80gFEv@shell.armlinux.org.uk>
 <ae31d10f-45cf-47c8-a717-bb27ba9b7fbe@lunn.ch>
 <aIAFKcJApcl5r7tL@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aIAFKcJApcl5r7tL@shell.armlinux.org.uk>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Simon Horman <horms@kernel.org>, Tristram Ha <Tristram.Ha@microchip.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/4] dt-bindings: net: document
 st, phy-wol property
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

On Tue, Jul 22, 2025 at 10:39:53PM +0100, Russell King (Oracle) wrote:
> rtl8211f_get_wol() does not take account of whether the PMEB pin is
> wired or not. Thus, stmmac can't just forward the get_wol() and
> set_wol() ops to the PHY driver and let it decide, as suggested
> earlier. As stmmac gets used with multiple PHYs, (and hey, we can't
> tell what they are, because DT doesn't list what the PHY actually is!)
> we can't know how many other PHY drivers also have this problem.

I've just read a bit more of the RTL8211F datasheet, and looked at the
code, and I'm now wondering whether WoL has even been tested with
RTL8211F. What I'm about to state doesn't negate anything I've said
in my previous reply.


So, the RTL8211F doesn't have a separate PMEB pin. It has a pin that
is shared between "interrupt" and "PMEB".

Register 22, page 0xd40, bit 5 determines whether this pin is used for
PMEB (in which case it is pulsed on wake-up) or whether it is used as
an interrupt. It's one or the other function, but can't be both.

rtl8211f_set_wol() manipulates this bit depending on whether
WAKE_MAGIC is enabled or not.

The effect of this is...

If we're using PHY interrupts from the RTL8211F, and then userspace
configures magic packet WoL on the PHY, then we reconfigure the
interrupt pin to become a wakeup pin, disabling the interrupt
function - we no longer receive interrupts from the RTL8211F !!!!!!!

Yes, the driver does support interrupts for this device!

This is surely wrong because it will break phylib's ability to track
the link state as there will be no further interrupts _and_ phylib
won't be expecting to poll the PHY.

The really funny thing is that the PHY does have the ability to
raise an interrupt if a wakeup occurs through the interrupt pin
(when configured as such) via register 18, page 0xa42, bit 7...
but the driver doesn't touch that.


Jetson Xavier NX uses interrupts from this PHY. Forwarding an
ethtool .set_wol() op to the PHY driver which enables magic packet
will, as things stand, switch the interrupt pin to wake-up only
mode, preventing delivery of further link state change events to
phylib, breaking phylib.

Maybe there's a need for this behaviour with which-ever network
driver first used RTL8211F in the kernel. Maybe the set of network
drivers that use interrupts from the RTL8211F don't use WoL and
vice versa. If there's any network drivers that do forward WoL
calls to the RTL8211F driver _and_ use interrupts from the PHY...
that's just going to break if magic packet WoL is ever enabled at
the PHY.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
