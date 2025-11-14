Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CF2C5DD84
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Nov 2025 16:27:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C27AC628DA;
	Fri, 14 Nov 2025 15:27:31 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39B8AC06935
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 15:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x8I9KPnocTwYvke4KmXVCDz7cZG6pMchNENixp9PaBs=; b=Zn9Awb85lPONKsoStmaW7puSJd
 sWvTakfmHty+CMm9yYGn2u9kg/IUnrIviU8J6r5+kbjT2c+0wtalE3+CQn/03msl6F6/VZrPMbHGN
 SIUgk6n5hY7iVXH8HC565xoQMEjiJg6gFliLTIarrIhlSYHmFiGQ0rUDvcG+D9jhTV/iuCzoMyxLg
 26hEe04rdRWNm3bEIBDiqg1tYbPZAsQo3Y9Tamx1CNrxYEHaKhKoVwZgm9ogMPW3psyb12bFKmQd8
 rmH+Xyh4lmrtsZACjXvvFBQRK4WyREdITOuOn74qX++CZCzNG5vHB5w1eAVUvsJMW3pl2a4KDOZUd
 HTD62yYg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35954)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vJvho-0000000075e-1H7F;
 Fri, 14 Nov 2025 15:27:20 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vJvhk-000000005wa-1i8p; Fri, 14 Nov 2025 15:27:16 +0000
Date: Fri, 14 Nov 2025 15:27:16 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <aRdKVMPHXlIn457m@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: sophgo@lists.linux.dev, Inochi Amaoto <inochiama@gmail.com>,
 Chen Wang <unicorn_wang@outlook.com>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 00/11] net: stmmac: clean up plat_dat
 allocation/initialisation
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

This series cleans up the plat_dat allocation and initialisation,
moving common themes into the allocator.

This results in a nice saving:

 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c  | 43 +---------------
 .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   | 22 +-------
 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c |  1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  2 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 34 ++++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c   | 39 +-------------
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 60 ++++------------------
 7 files changed, 53 insertions(+), 148 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
