Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC96FC68ACB
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Nov 2025 11:00:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AD6FC628CF;
	Tue, 18 Nov 2025 10:00:20 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 447C9C1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 10:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZHtYuYxvWqbVVfivkjXN2yF2dYFsIpwehTqtsa5taOc=; b=wXCPvy19LVshAa4rOzm6Eu7c1v
 qKbcCfAZparxO4aSBWG29gShzC+P/5T4Q5+lretIYqoY/yxPCvZkOJHEsYSLlK222UF32OuBywoGh
 5Vn7vci+LECxTe2mBJUez4eJCCGeWO2kUQncKX3r5B4af0Nq/PZ6mEuJPZxJv/h1gyJH/dvocVZ2g
 rc6saTB8D36f9EGU6z6pMRXoUd+xDdPoEw7LIleLcq7elOknljK/NanH3DNY8kwLP08jUNq24vbyP
 rL1qTRuY6F5LpDaT50ZqDiXgciGGtVI+HWzx6qrrClJrBLlAl6pMFXbc7miGBgEbClkYAAHlrapjQ
 nQiKBsVQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39436)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vLIVQ-0000000031R-44Py;
 Tue, 18 Nov 2025 10:00:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vLIVN-000000002Mv-0OUs; Tue, 18 Nov 2025 10:00:09 +0000
Date: Tue, 18 Nov 2025 10:00:08 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <aRxDqJSWxOdOaRt4@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: sanitise
	stmmac_is_jumbo_frm()
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

stmmac_is_jumbo_frm() takes skb->len, which is unsigned int, but the
parameter is passed as an "int" and then tested using signed
comparisons. This can cause bugs. Change the parameter to be unsigned.

Also arrange for it to return a bool.

 drivers/net/ethernet/stmicro/stmmac/chain_mode.c  | 9 ++++-----
 drivers/net/ethernet/stmicro/stmmac/hwif.h        | 2 +-
 drivers/net/ethernet/stmicro/stmmac/ring_mode.c   | 9 ++-------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++---
 4 files changed, 10 insertions(+), 16 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
