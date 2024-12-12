Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EA09EE93E
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Dec 2024 15:46:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42DB7C7129D;
	Thu, 12 Dec 2024 14:46:29 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBE93C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2024 14:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZkrXX153lKu3k/l3jT/iu1cloY9TaUjnBUlB62dxb9w=; b=ZQWhfJRJtI5LqxCpw7MJ14SgcT
 vXk32dFCdmOPf+ZiAv1JAf0ZBJbhLG6BodeEN6UHNB5uBqDSjcZQdel0JS0QwAVCE1FaNIMEd8qvb
 KfpwjB7bwyrnKOm+DEY2f8xhcCaf2Qa4aEbj8MGY0WPYf7nqf3KwQ4cQqBIMXin0sAquDVB4tWmRD
 YBIO4h3SjY3LA5ft1qPdX9UqnlltVOZ73wqQIYg6UfdqzKVdQn/fXgHafIYqwk5J2hPgfJ+Y0BGQ8
 fSWJhhBWO4WqjnfWArVzmwB04MtzVvs25hjlIYAxHGlmKNq75f8w0FoVDmz0hPNl1q8l8PEeHZj7a
 tYIfrYsg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44810)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tLkSD-0005KA-0D;
 Thu, 12 Dec 2024 14:46:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tLkS9-0005PQ-1i;
 Thu, 12 Dec 2024 14:46:09 +0000
Date: Thu, 12 Dec 2024 14:46:09 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <Z1r3MWZOt36SgGxf@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/7] net: stmmac: clean up and fix
	EEE implementation
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

This is a rework of stmmac's EEE support in light of the addition of EEE
management to phylib.

Patch 1 adds configuration of the receive clock phy_eee_rx_clock_stop()
(which was part of another series.)

Patch 2 moves the tracking of tx_lpi_timer to phylib.

Patch 3 makes stmmac EEE state depend on phylib's enable_tx_lpi flag.

Patch 4 removes redundant code from the ethtool EEE operations.

Patch 5 removes the driver private tx_lpi_enabled, which will now be
managed by phylib.

Patch 6 removes the dependence of EEE error statistics on the EEE
enable state, instead depending on whether EEE is supported by the
hardware.

Patch 7 removes phy_init_eee(), instead using phy_eee_rx_clock_stop()
to configure whether the PHY may stop the receive clock.

 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  1 -
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   | 25 ++------------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 26 +++++++++++++--------
 drivers/net/phy/phy.c                              | 27 ++++++++++++++++++----
 include/linux/phy.h                                |  1 +
 5 files changed, 42 insertions(+), 38 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
