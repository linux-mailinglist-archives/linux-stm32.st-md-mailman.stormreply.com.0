Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4219EB41F3D
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 14:39:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0B48C3FAC8;
	Wed,  3 Sep 2025 12:39:13 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABE2DC3FAC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 12:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W+sciWiR28uADtG6s3fwkiLGHUUGtxaudPakgT3DJGo=; b=Zl1bFRhOamEGMrHA+bo7k+o762
 0u/R00gR0xWdO2HeF9tBwY9CBh2rUhRn1qbituq9p0/4JGY+2vkr4OHoPm55QTBob/kpA02m+8wZD
 tqIFGTKqtslw8jaOTQq1NJubBgSPR/nffsMBZKd6NNLqUs/Ury8OLbpd0F55u41+LmvzES6OJvmHC
 iy6U2Bh1h6ehxykRGaeVWS/L68HzW1UdhKpiZDYIfLUgRf8f6effcLsmA9nTS/qajznPlYv/7R/u+
 fmVfOF1pY2jX7ITIypQo+SDg0NT834XM7XP8n76KM5JgH08P2YcQ68SvLwNLUCswp9DmZXDqvQjl9
 YYDNuLoA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50700)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1utmlR-000000000Ud-0vu5;
 Wed, 03 Sep 2025 13:39:01 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1utmlN-000000000XG-1Ry3; Wed, 03 Sep 2025 13:38:57 +0100
Date: Wed, 3 Sep 2025 13:38:57 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <aLg24RZ6hodr711j@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 00/11] net: stmmac: mdio cleanups
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

Clean up the stmmac MDIO code:
- provide an address register formatter to avoid repeated code
- provide a common function to wait for the busy bit to clear
- pre-compute the CR field (mdio clock divider)
- move address formatter into read/write functions
- combine the read/write functions into a common accessor function
- move runtime PM handling into common accessor function
- rename register constants to better reflect manufacturer names
- move stmmac_clk_csr_set() into stmmac_mdio
- make stmmac_clk_csr_set() return the CR field value and remove
  priv->clk_csr
- clean up if() range tests in stmmac_clk_csr_set()
- use STMMAC_CSR_xxx definitions in initialisers

 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c  |   5 +-
 .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   |   3 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  82 -----
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c  | 342 ++++++++++++---------
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c   |   5 +-
 6 files changed, 204 insertions(+), 235 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
