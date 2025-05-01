Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F77AA5DEA
	for <lists+linux-stm32@lfdr.de>; Thu,  1 May 2025 13:45:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 491D6C78F87;
	Thu,  1 May 2025 11:45:35 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C168C78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 May 2025 11:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jk5Z4QPc9J8CRieYaOp+Msl4krhLC3Zgsoyy7SV1l8k=; b=hK1Y1QeCPApCKnF+ianQWZIXEC
 IHN3gx2RJrK2jKbMQ+4C+nZBiIoR/TszssSm6C0daW1H/8pZjRYR+/4n46MDB3CpWtkr02lXmEJe+
 C80HUytlH6LHmdjrMhtqNsNSAOWARB0rjVygCjLDJPcXxtcyP9TzMN/HkK7jHGp6AclCHlbgv8xHv
 kfR7bIskJRsM1sVLxGc52m1FnpHT3yvVmc5E4ii314vcbHWbP08ogWVJHEGA+6oVUWTBs0Z+23jfk
 OWnvEBtJMMKIajNtFCqtZU/l0ojlUPX1FWHsM2mW+wO69MrCLXhcHl/dswyqlxJLbTnqYukZZjcmr
 l3Fb5Tug==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58470)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1uASM1-0008WA-25;
 Thu, 01 May 2025 12:45:25 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1uASLx-000865-3B;
 Thu, 01 May 2025 12:45:22 +0100
Date: Thu, 1 May 2025 12:45:21 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <aBNe0Vt81vmqVCma@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/6] net: stmmac: replace
	speed_mode_2500() method
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

Hi,

This series replaces the speed_mode_2500() method with a new method
that is more flexible, allowing the platform glue driver to populate
phylink's supported_interfaces and set the PHY-side interface mode.

The only user of this method is currently dwmac-intel, which we
update to use this new method.

 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 33 +++++++------
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.h |  1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 56 +++++++++++++----------
 include/linux/stmmac.h                            |  3 +-
 4 files changed, 49 insertions(+), 44 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
