Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0B6822BE
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Aug 2019 18:45:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63056C10CA9;
	Mon,  5 Aug 2019 16:45:36 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (dc8-smtprelay2.synopsys.com
 [198.182.47.102])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BAC6C32EA2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Aug 2019 16:45:33 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 67A76C015B;
 Mon,  5 Aug 2019 16:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1565023530; bh=0LbPrLAJZPL+E0+EEkTDfdECwXLyTc0PWcn5jnubUI8=;
 h=From:To:Cc:Subject:Date:From;
 b=fwhulZuLa3ryglwiiwLjF4/2ithvclLv+FstYbrMDuZUUzbasLHK6bKffdBkzXJbw
 Bze7ohv14AR+/LgKzBrDhlrZ922jio5ql9f+PUa5FEcwYYyeAXs+QkqwOQr3/UQUBb
 hywH00ci3zmVycCrIu0L1pOeotaSjKBgV9l864aNVk2LgVEOzpRcrwGKi1EhLmzoUP
 qure26YhNg7npw16CSBy72d8V4vyNnmbY9G/beRv3rnFEipdd05UGN+VH2rafPGzT+
 WT9LOXYfKY/xU+TzcfDjPLJmNSAVOu/7dGib4K7dwl+sJoZTIaBIj94VkSxpryQzzU
 TG0wIbOb+vBpA==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id CD08FA005D;
 Mon,  5 Aug 2019 16:45:25 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Mon,  5 Aug 2019 18:44:27 +0200
Message-Id: <cover.1565022597.git.joabreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 00/26] net: stmmac: Misc improvements
	for XGMAC
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

[ This series depend on 3caa61c20875 ("net: stmmac: Sync RX Buffer upon allocation")
which is already in -net but not -next ]

Misc improvements for -next which adds new features in XGMAC cores.

More info in commit logs.

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

Jose Abreu (26):
  net: stmmac: xgmac: Fix XGMAC selftests
  net: stmmac: xgmac: Implement MMC counters
  net: stmmac: Fix issues when number of Queues >= 4
  net: stmmac: xgmac: Implement set_mtl_tx_queue_weight()
  net: stmmac: xgmac: Implement tx_queue_prio()
  net: stmmac: Implement RSS and enable it in XGMAC core
  net: stmmac: selftests: Add RSS test
  net: stmmac: Implement VLAN Hash Filtering in XGMAC
  net: stmmac: selftests: Add test for VLAN and Double VLAN Filtering
  net: stmmac: Implement Safety Features in XGMAC core
  net: stmmac: Add Flexible RX Parser support in XGMAC
  net: stmmac: tc: Do not return a fragment entry
  net: stmmac: selftests: Add a selftest for Flexible RX Parser
  net: stmmac: Get correct timestamp values from XGMAC
  net: stmmac: Prepare to add Split Header support
  net: stmmac: xgmac: Correctly return that RX descriptor is not last
    one
  net: stmmac: Add Split Header support and enable it in XGMAC cores
  net: stmmac: dwxgmac: Add Flexible PPS support
  net: stmmac: Add ethtool register dump for XGMAC cores
  net: stmmac: Add a counter for Split Header packets
  net: stmmac: Add support for SA Insertion/Replacement in XGMAC cores
  net: stmmac: selftests: Add tests for SA Insertion/Replacement
  net: stmmac: xgmac: Add EEE support
  net: stmmac: Add support for VLAN Insertion Offload
  net: stmmac: selftests: Add selftest for VLAN TX Offload
  net: stmmac: selftests: Return proper error code to userspace

 drivers/net/ethernet/stmicro/stmmac/common.h       |  16 +
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |   4 +
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     | 135 +++-
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    | 880 ++++++++++++++++++++-
 .../net/ethernet/stmicro/stmmac/dwxgmac2_descs.c   | 118 ++-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c |  41 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.c         |   4 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |  47 ++
 drivers/net/ethernet/stmicro/stmmac/mmc.h          |   9 +
 drivers/net/ethernet/stmicro/stmmac/mmc_core.c     | 192 +++++
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  21 +
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   | 106 ++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 380 +++++++--
 .../net/ethernet/stmicro/stmmac/stmmac_selftests.c | 513 +++++++++++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c    |   2 +-
 include/linux/stmmac.h                             |   1 +
 16 files changed, 2361 insertions(+), 108 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
