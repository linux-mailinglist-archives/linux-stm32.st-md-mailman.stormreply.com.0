Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A9A12449E
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2019 11:33:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E1B8C36B18;
	Wed, 18 Dec 2019 10:33:24 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (sv2-smtprelay2.synopsys.com
 [149.117.73.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16B1CC36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2019 10:33:23 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BF0BA40346;
 Wed, 18 Dec 2019 10:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1576665201; bh=0M9mYY6dp+dohtIQdCtyeu3ar+st+lmwIwwIyzmrtEs=;
 h=From:To:Cc:Subject:Date:From;
 b=Oqr9YdTMq7rKi76ubUYqeeAZPBqhy9xYt+pcgaPQCjCillvkAX8cd7xDoBVbKNIiA
 wZXIGHoXGM0um9oi7FSdwc2DzhHbNbNlGI2fWta06r9fospEE/vrMjUPZ01GFGKNiC
 DLSN3H7FvMmlySIuSFqXTw539a/5mjdzzCrENMCE3FHojVZYb33YR0CvKOTlSc52Y6
 62EsFBN7cxGhI36BwclRX2ZoYWlB1z7NkQHG3olyty1PttwTygNL7jBca2JWY9xKc0
 z7TriHFtjmqZDNiWMJLUICYE73uXk1SWxqJqmHDnmMXghTp+TvsgdbGN0wBpqGSHNx
 LGxrRd7SU0pCQ==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 68555A0066;
 Wed, 18 Dec 2019 10:33:18 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Wed, 18 Dec 2019 11:33:04 +0100
Message-Id: <cover.1576664870.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 Richard.Ong@synopsys.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Andre Guedes <andre.guedes@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/7] net: stmmac: TSN support using
	TAPRIO API
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

This series adds TSN support (EST and Frame Preemption) for stmmac driver.

1) Adds the HW specific support for EST in GMAC5+ cores.

2) Adds the HW specific support for EST in XGMAC3+ cores.

3) Integrates EST HW specific support with TAPRIO scheduler API.

4) Adds the Frame Preemption suppor on stmmac TAPRIO implementation.

5) Adds the HW specific support for Frame Preemption in GMAC5+ cores.

6) Adds the HW specific support for Frame Preemption in XGMAC3+ cores.

7) Adds support for HW debug counters for Frame Preemption available in
GMAC5+ cores.

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

Jose Abreu (7):
  net: stmmac: Add basic EST support for GMAC5+
  net: stmmac: Add basic EST support for XGMAC
  net: stmmac: Integrate EST with TAPRIO scheduler API
  net: stmmac: Add Frame Preemption support using TAPRIO API
  net: stmmac: gmac5+: Add support for Frame Preemption
  net: stmmac: xgmac3+: Add support for Frame Preemption
  net: stmmac: mmc: Add Frame Preemption counters on GMAC5+ cores

 drivers/net/ethernet/stmicro/stmmac/common.h       |   5 +
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |  12 ++
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |   4 +
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c   |   4 +
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c       | 118 ++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h       |  24 ++++
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |  25 ++++
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  76 ++++++++++++
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c |   4 +
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |  14 +++
 drivers/net/ethernet/stmicro/stmmac/mmc_core.c     |  16 +++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |   2 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c    | 135 +++++++++++++++++++++
 include/linux/stmmac.h                             |  13 ++
 14 files changed, 452 insertions(+)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
