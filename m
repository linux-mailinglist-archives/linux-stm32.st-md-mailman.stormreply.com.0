Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 262B5F76AD
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Nov 2019 15:43:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5319C36B11;
	Mon, 11 Nov 2019 14:43:04 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CAE62C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2019 14:43:00 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6123CC08B7;
 Mon, 11 Nov 2019 14:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1573483379; bh=xvb79Aahx3jHaPdlZ0qpbSpWPSpjW4NAZIBnGit7MJA=;
 h=From:To:Cc:Subject:Date:From;
 b=mG7s8u/tskFiKSC2onN0QpZIETTM+suYlB3kuRs5z62CfC+EBLVrJpy691KgkU4ZH
 dqPNNGQLN06Jtvax8ZZPn9GeYsGEO17CuntaAdQmN7uBDg3iWILoptfhAh9kr8JL8S
 ekJ680+kU+Jf1MV26oK/somYcDE/MhNlDvJd+18PwN2cGxv3tYhsXt4FdoTokH9PCo
 pyJd6pNm3tbGqGk2OcMH1A5h5j6bcM/uzXfO01MHB8rZl1HEG2j82BwuPZIPlrtAtU
 8QmjqhnS8crQKjDWYT39sUXXwMwqPqrRgC1ACP+mXEGQLmSwM7ModWHwaZiidNeEbH
 qYpcXxe6rxqRA==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id C4B41A01EF;
 Mon, 11 Nov 2019 14:42:50 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Mon, 11 Nov 2019 15:42:33 +0100
Message-Id: <cover.1573482991.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/6] net: stmmac: Improvements for
	-next
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Misc improvements for stmmac.

Patch 1/6, fixes a sparse warning that was introduced in recent commit in
-next.

Patch 2/6, adds the Split Header support which is also available in XGMAC
cores and now in GMAC4+ with this patch.

Patch 3/6, adds the C45 support for MDIO transactions when using XGMAC cores.

Patch 4/6, removes the speed dependency on CBS callbacks so that it can be used
in XGMAC cores.

Patch 5/6, reworks the over-engineered stmmac_rx() function so that its easier
to read.

Patch 6/6, implements the UDP Segmentation Offload feature in GMAC4+ cores.

---
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---

Jose Abreu (6):
  net: stmmac: Fix sparse warning
  net: stmmac: gmac4+: Add Split Header support
  net: stmmac: xgmac: Add C45 PHY support in the MDIO callbacks
  net: stmmac: tc: Remove the speed dependency
  net: stmmac: Rework stmmac_rx()
  net: stmmac: Implement UDP Segmentation Offload

 drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |   7 +
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |   2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c |  21 ++-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h |   1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c   |  19 +++
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h   |   1 +
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |   2 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 183 ++++++++++++++-------
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c  |  58 +++++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c    |   2 -
 11 files changed, 217 insertions(+), 81 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
