Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5344A42681A
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Oct 2021 12:42:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA3A5C5AB9F;
	Fri,  8 Oct 2021 10:42:35 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9A58C597B2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 10:35:09 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPA id 2C3CF240009;
 Fri,  8 Oct 2021 10:35:07 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: 
Date: Fri,  8 Oct 2021 12:34:36 +0200
Message-Id: <20211008103440.3929006-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 08 Oct 2021 10:42:35 +0000
Cc: Jose Abreu <joabreu@synopsys.com>, Herve Codina <herve.codina@bootlin.com>,
 devicetree@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/4] net: stmmac: fix regression on SPEAr3xx
	SOC
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

The ethernet driver used on old SPEAr3xx soc was previously supported on old
kernel. Some regressions were introduced during the different updates leading
to a broken driver for this soc.

This series fixes these regressions and brings back ethernet on SPEAr3xx.
Tested on a SPEAr320 board.

Herve Codina (4):
  net: stmmac: fix get_hw_feature() on old hardware
  dt-bindings: net: snps,dwmac: add dwmac 3.40a IP version
  net: stmmac: add support for dwmac 3.40a
  ARM: dts: spear3xx: Fix gmac node

 .../devicetree/bindings/net/snps,dwmac.yaml         |  2 ++
 arch/arm/boot/dts/spear3xx.dtsi                     |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c |  1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c | 13 +++++++++++--
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c    |  6 ++++--
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c  |  6 ++++--
 drivers/net/ethernet/stmicro/stmmac/hwif.h          |  6 +++---
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c   |  8 ++++++++
 8 files changed, 34 insertions(+), 10 deletions(-)

-- 
2.31.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
