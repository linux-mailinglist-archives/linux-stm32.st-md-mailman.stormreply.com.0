Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F4AD0EF4D
	for <lists+linux-stm32@lfdr.de>; Sun, 11 Jan 2026 14:14:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 433B5C349C4;
	Sun, 11 Jan 2026 13:14:49 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7672CC36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jan 2026 13:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WwF1Gcz9iHiKKMLX60wVzRv0f2xUV+Pl1/UTVZ/rgK4=; b=zhbJvdFJG1xbOIX9EZGXofp/aF
 rxWWssHcKknP9f3JHVPxEbALA4S0VYbFmYEtV+ejzqo/eM67zYwcatMqzJq08FShind19kUKH7Etj
 z+3hQuL8knERabhXbKFS8HAkxa3DPC4fcIqXOQx7knNWXM3r9Ypuy/ufnio4KI2g2rjoR/EfJF5FK
 VKF1e0KaYlTMMhcudwvxKG95jMXiqLP8rD9it/vT1DJBfMXH1Nlnf5xE+eWCOKI8V4cBUoQJLS3LV
 ZNh3lAS2p0dSe1PJK7d7fj4wzuYUkZNsihJc5weoKfYeFg7mZqGO1misD/07jOy/23iPkfQKh80UG
 iI0/bZbg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33506)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vevHC-000000005Te-33S8;
 Sun, 11 Jan 2026 13:14:38 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vevH7-0000000078S-2Be3; Sun, 11 Jan 2026 13:14:33 +0000
Date: Sun, 11 Jan 2026 13:14:33 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <aWOiOfDQkMXDwtPp@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/5] net: stmmac: pcs: clean up pcs
 interrupt handling
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

Clean up the stmmac PCS interrupt handling:

- Avoid promotion to unsigned long from unsigned int by defining PCS
  register bits/fields using u32 macros.
- Pass struct stmmac_priv into the host_irq_status MAC core method.
- Move the existing PCS interrupt handler (dwmac_pcs_isr) into
  stmmac_pcs.c, change it's arguments, use dev_info() rather than
  pr_info()
- arrange to call phylink_pcs_change() on link state changes.

 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   |  7 +--
 .../net/ethernet/stmicro/stmmac/dwmac100_core.c    |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |  7 +--
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  4 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |  4 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c   | 22 ++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h   | 62 ++++++----------------
 8 files changed, 53 insertions(+), 57 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
