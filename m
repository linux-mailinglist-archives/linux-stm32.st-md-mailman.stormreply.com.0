Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC80A7EAB1
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Apr 2025 20:39:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89B36C7128A;
	Mon,  7 Apr 2025 18:39:15 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03C9FC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Apr 2025 18:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vgmARS6iCi48GW/CgYcjmbFCRe8AS0AVo3at8RS+ydA=; b=CRVTW/L3XtBMiF8Z11Y9L+CIR6
 R1XFP5YVqcC3nQEgKZltrDV13hDyZQGSCRFh2Gf+AmwoQhRKDw7qwle1EmrzJ0eBMtaoUUVQZGp06
 GefWRU6uKmxH+hzPLypFvZsvuKc9wyy8QpFJPHek1Cc0fNFmc2jOLT8UMkvWaFpeqyzMennAav137
 KdqlJgNtBXAqGuWiS8wHQgIQy2SZnFc2nIlG/DphOOqFdY1NVI/stOXXHhiKR4pZ0ZX9MHRL0lZNT
 9AQP51iQHm19NNIJxeL2d5eZrXXWkiFqyupZgmjLc1hRp8CSDUXBb7Cm2dTUhvgG2qv93qiqXEqyF
 F29JhbTQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58606)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1u1rN9-0005rO-1A;
 Mon, 07 Apr 2025 19:39:03 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1u1rN5-0000cC-1Y;
 Mon, 07 Apr 2025 19:38:59 +0100
Date: Mon, 7 Apr 2025 19:38:59 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <Z_Qbw0tZ2ktgBf7c@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Thierry Reding <treding@nvidia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jon Hunter <jonathanh@nvidia.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Prabhakar <prabhakar.csengg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/2] net: stmmac:
	stmmac_pltfr_find_clk()
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

The GBETH glue driver that is being proposed duplicates the clock
finding from the bulk clock data in the stmmac platform data structure.
iLet's provide a generic implementation that glue drivers can use, and
convert dwc-qos-eth to use it.

 drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c | 14 ++------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c   | 11 +++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h   |  3 +++
 3 files changed, 16 insertions(+), 12 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
