Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04017902435
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2024 16:40:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADC87C6C838;
	Mon, 10 Jun 2024 14:40:40 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBACEC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2024 14:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CAzlZ/VNndl4AKegQFi0JffzH+O3JQElVuoC5uZz9qc=; b=U6GF4YgN3Vi6k0LXMKBgQ2XAfR
 20erK5ZVMUuBt9yBkPFzPKw1Sw82O5TxYQE2i15OZDIKrsLDBiw5/WAKehddfV/PhIIFpjn254xtN
 ShpD12vsLP0yH9lx1xWgOdaK50M8k4APqbvxnyiDIbRh1L3lMbUIhzy0HzT1JdE01cnVdFZ/XT61u
 69kttqT/fAWqj9YKWHSV6OzzJCl5h1N401eVE4ki0ENPquT6Mj57WmzeQbYegzqt0XHDju8fCAUmz
 ectnd1NRBwT00YCqq2J1U3Rb/EFmcqwv7dmYgrsMQZrsnxp2qP5hV+UJg3PExC+LRqBm+7ralTQh4
 IjCW/hRA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39964)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1sGgC0-0001eS-1p;
 Mon, 10 Jun 2024 15:40:16 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1sGgBy-0006xF-Fk; Mon, 10 Jun 2024 15:40:14 +0100
Date: Mon, 10 Jun 2024 15:40:14 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <ZmcQTuR5IKRp0pgy@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next 0/5] net: stmmac: provide platform
	select_pcs method
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

This series adds a select_pcs() method to the stmmac platform data to
allow platforms that need to provide their own PCSes to do so, moving
the decision making into platform code.

This avoids questions such as "what should the priority of XPCS vs
some other platform PCS be?" and when we provide a PCS for the
internal PCS, how that interacts with both the XPCS and platform
provided PCS.

Note that if a platform implements the select_pcs() method, then the
return values are:
- a phylink_pcs pointer - the PCS to be used.
- NULL - no phylink_pcs to be used.
Otherwise (if not implemented or returns an error-pointer), then
allow the the stmmac internal PCS to be used if appropriate (once
that patch set is merged.)

Patch 1 introduces the new method.
Patch 2 converts Intel mGBE to use this to provide the XPCS and
 removes the XPCS decision making from core code.
Patch 3 provides an implementation for rzn1 to return its PCS.
Patch 4 does the same for socfpga.
Patch 5 removes the core code returning priv->hw->phylink_pcs.

No functional change is anticipated. Once this has been merged, it
will be expected that platforms should populate all three PCS
methods or none of the PCS methods.

 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c   | 11 +++++++++++
 drivers/net/ethernet/stmicro/stmmac/dwmac-rzn1.c    |  7 +++++++
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c |  7 +++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c   | 10 +++++++---
 include/linux/stmmac.h                              |  4 +++-
 5 files changed, 35 insertions(+), 4 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
