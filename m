Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EC3B0D322
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jul 2025 09:33:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D97EFC3F93B;
	Tue, 22 Jul 2025 07:33:08 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07F4FC3F93A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 07:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U6YMzP+2dWgWiUnFlZiTb7wmZcswaZFKOx7Tx9ijr9I=; b=qChRxj60ECKPufnRYt+Lj+Pjgw
 4TtJYFrn2SbRTyUb9OZTtSuALjGdYgGwFaZsBPTCeKc1UhF8PGXaNXFgQpMNfJehBOL2TsAL/JghM
 ztZwOoy8KrecDxpV68upEIUo/CEEl2t3T3hj/P9Q6T4EzawJgEcd0UDh8/jZ6Sr0C9lVlg3a4H6Gb
 d9LwXuv/9y/bt/y3NF0gTq7tbVSCwErt4++t9G4cxQcUsiMzltqJu/i3KBZewhechX+QwOdB2XPdk
 drEU2x4ZHNlUpT4+y0OW3BJtZth18KWYGfy35nNbllatWoDjzItAg3AMxi8bq0F1wKCK3SjGRVvm6
 v4O4NA0w==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50216)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1ue7UX-0007zl-2z;
 Tue, 22 Jul 2025 08:32:49 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1ue7UT-0006y6-1K;
 Tue, 22 Jul 2025 08:32:45 +0100
Date: Tue, 22 Jul 2025 08:32:45 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Message-ID: <aH8-nQtNVuewNuwU@shell.armlinux.org.uk>
References: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
 <20250721-wol-smsc-phy-v1-1-89d262812dba@foss.st.com>
 <faea23d5-9d5d-4fbb-9c6a-a7bc38c04866@kernel.org>
 <f5c4bb6d-4ff1-4dc1-9d27-3bb1e26437e3@foss.st.com>
 <e3c99bdb-649a-4652-9f34-19b902ba34c1@lunn.ch>
 <38278e2a-5a1b-4908-907e-7d45a08ea3b7@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <38278e2a-5a1b-4908-907e-7d45a08ea3b7@foss.st.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
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

On Mon, Jul 21, 2025 at 05:56:17PM +0200, Gatien CHEVALLIER wrote:
> Here's an extract from the Microchip datasheet for the LAN8742A PHY:
> 
> "In addition to the main interrupts described in this section, an nPME
> pin is provided exclusively for WoL specific interrupts."

So the pin on the PHY for WoL is called nPME? If this pin isn't wired
to an interrupt controller, then the PHY doesn't support WoL. If it is
wired, then could it be inferred that WoL is supported?

If so, then it seems to me the simple solution here is for the PHY
driver to say "if the nPME pin is connected to an interrupt controller,
then PHY-side WoL is supported, otherwise PHY-side WoL is not
supported".

Then, I wonder if the detection of the WoL capabilities of the PHY
in stmmac_init_phy() could be used to determine whether PHY WoL
should be used or not.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
