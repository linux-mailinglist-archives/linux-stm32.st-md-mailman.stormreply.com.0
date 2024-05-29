Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0F88D31B2
	for <lists+linux-stm32@lfdr.de>; Wed, 29 May 2024 10:40:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 993A1C6B47E;
	Wed, 29 May 2024 08:40:39 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D61D8C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 May 2024 08:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WBthTXF0tvM8P+3l/Pr3VnSW0fJqfhQ6w5OUBDLvGXo=; b=jdRa0V1sN+VDzhVS8kCjLjkIWd
 T0sYAhjp9LxuBKngzUjWFhqA3LU9ZIiuUg0QdTeiDNDezt9aMbTnKCeFvktKl7cfb0J7v5UxYlS+c
 4g4QPhRjwP8k32yGfi6rIJA+44OdIEmei51tN11Hz08g0eVs9uZX7ERNVfBJdwTfdDjDSbIgZ86jc
 b7vA5X2pHklEAK/oxjCLUpo4M8im+BxohncFfuVFMm/gQC82Vj0UYV6fd5lCEwelzad5mBDlSi3ef
 rlDbGKFh7Hv/uif+lSu7yZVtxShXstk6QETs7lf1IW3QtWzfIkCIvkoSTGfc3QqXy+IhiZxDVOglP
 ExTzue0w==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53862)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1sCEr3-0005lJ-1G;
 Wed, 29 May 2024 09:40:17 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1sCEr2-000458-1F; Wed, 29 May 2024 09:40:16 +0100
Date: Wed, 29 May 2024 09:40:15 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <Zlbp7xdUZAXblOZJ@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Vinod Koul <vkoul@kernel.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next v2 0/6] net: stmmac: cleanups
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

This series removes various redundant items in the stmmac driver:

- the unused TBI and RTBI PCS flags
- the NULL pointer initialisations for PCS methods in dwxgmac2
- the stmmac_pcs_rane() method which is never called, and it's
  associated implementations
- the redundant netif_carrier_off()s

Finally, it replaces asm/io.h with the preferred linux/io.h.

Changes since v1:
 - Fix patch 1 "Drop TBI/RTBI flags" which didn't transfer correctly
   between my internal trees!
 - Update patch 5 to address all the asm/io.h in stmmac
 - Add Andrew Halaney's reviewed-by
 - Add patch 6 cleaning up qcom-ethqos phy speed setting

 drivers/net/ethernet/stmicro/stmmac/common.h       |  2 --
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 24 +++++++-------
 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   |  8 +----
 .../net/ethernet/stmicro/stmmac/dwmac1000_dma.c    |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac100_core.c    |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac100_dma.c |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |  8 -----
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  6 ----
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |  3 --
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 38 +++++-----------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h   | 17 ----------
 12 files changed, 26 insertions(+), 88 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
