Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8C6B214DC
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Aug 2025 20:51:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66534C32E92;
	Mon, 11 Aug 2025 18:51:15 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00712C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 18:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a/zRgNd+k/l8rezaEo/b4GJ3tZC8LPU16UMqdrMXbbY=; b=CqEi4Bfg8Ylv8LU/VebBnS+0Wq
 El4pVziTBNoVZ1PqTcs/LEXfvkzNNgUkKCDV6RziIpI2Ma3xYjHntpIPBaVFyZACRtsGzqZ8pB82r
 rXYijs014y9SxWbK2h0QkcLy4noAdMxpphjXTTmtS/zBUoLkRL9p6BVPtXoDQ5/wnS/HrddCyFpY1
 AKi4qJZNWrNCd1c+v73WfHtC4wb2BPzJvJAyk9Z+gsYZI0/uEcMxMVuou+KGbnPFfpP1fctqfoiZ7
 d/EktjuSq8wT4c9C1sxd7NGaZl+lbJ6MjhooUrXkc1TgQAl5A28F48xVkOmgO/hN6AbuB6iDsscXs
 HZcqrkEQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47900)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1ulXbs-0003aE-1L;
 Mon, 11 Aug 2025 19:51:04 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1ulXbn-0003vT-0R;
 Mon, 11 Aug 2025 19:50:59 +0100
Date: Mon, 11 Aug 2025 19:50:58 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <aJo7kvoub5voHOUQ@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [Linux-stm32] [PATCH net-next 0/9] net: stmmac: improbe
	suspend/resume architecture
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

This series improves the stmmac suspend/resume architecture by
providing a couple of method hooks in struct plat_stmmacenet_data which
are called by core code, and thus are available for any of the
platform glue drivers, whether using a platform or PCI device.

As these methods are called by core code, we can also provide a simple
PM ops structure also in the core code for converted glue drivers to
use.

The remainder of the patches convert the various drivers.

 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c  | 74 ++++++++++------------
 .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   | 73 ++++++++++-----------
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   | 10 +--
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c     | 58 ++++++++---------
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c  | 68 +++++++-------------
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  2 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 12 ++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c   | 73 ++++++++++-----------
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 64 +++++++------------
 include/linux/stmmac.h                             |  2 +
 10 files changed, 195 insertions(+), 241 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
