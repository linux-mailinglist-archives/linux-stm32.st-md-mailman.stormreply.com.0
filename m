Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB99EA2EA0E
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Feb 2025 11:53:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C183C78F88;
	Mon, 10 Feb 2025 10:53:12 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BE4AC78F85
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2025 10:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z34HUMIhzyaBlycKqhDV99x6wJM5d6YY7KL/669ZsG8=; b=NN0+SOSYZV+oT+iWN1rq4IgRz5
 fazaCYica3uF+0pW/+dZNAaU2scIF0g4lJlxOKB8vIwH71MOlPDZo7/Y8zJ8qqgfGSvLJxgaxAcBJ
 0p0aGb7qhP8Bdfek/dMbk3NlJOjgE723jH5klp7J+SdPOIVLfZupQNuQ6lwk5MVDxCyL4cKJIN3GP
 FNlsN4Nrpl9Ryr0ti93eJyBkZoERA7kmpG3roqprXUOLY6cmnrt4QkH0NNqz46hAVXyteN+uTFEpA
 LheIa35smPdvZKrTi6w6us5L/dhfYV2NSFRPnW5n9QmiebzcgeInN/E9PQbEDKnfc3j/B2VZZzedT
 O+PmBN6w==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33268)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1thRPP-0006Uy-24;
 Mon, 10 Feb 2025 10:52:59 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1thRPM-0007R3-1h;
 Mon, 10 Feb 2025 10:52:56 +0000
Date: Mon, 10 Feb 2025 10:52:56 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <Z6naiPpxfxGr1Ic6@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/8] net: phylink, xpcs,
 stmmac: support PCS EEE configuration
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

This series adds support for phylink managed EEE at the PCS level,
allowing xpcs_config_eee() to be removed. Sadly, we still end up with
a XPCS specific function to configure the clock multiplier.

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  7 --
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c |  2 +
 drivers/net/pcs/pcs-xpcs.c                        | 89 +++++++++++++++--------
 drivers/net/pcs/pcs-xpcs.h                        |  1 +
 drivers/net/phy/phylink.c                         | 25 ++++++-
 include/linux/pcs/pcs-xpcs.h                      |  3 +-
 include/linux/phylink.h                           | 22 ++++++
 7 files changed, 107 insertions(+), 42 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
