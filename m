Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD94A50A4
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Sep 2019 10:02:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B465C24023;
	Mon,  2 Sep 2019 08:02:24 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [198.182.61.142])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29CFDC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Sep 2019 08:02:23 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6F353C0419;
 Mon,  2 Sep 2019 08:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1567411341; bh=4COHdtFTDR5TsR1zywo8dHE+8UKYJjqPIwYaAeI8pyg=;
 h=From:To:Cc:Subject:Date:From;
 b=DdkuJriaM4/aER3fqZqTEzsnXsx/AYp8+0gwL4/R1QSKZdpQ4VDvIQoDtXxnajxWY
 QWqH/Jd2Cm7MCiYHVvHZHpE7x1W98KFZXd/Mmvc9X0v8L7IZUnT/YSyaNlzH6bs0zm
 DMAZGAj5S9eBhlGmaT8koMqisB5MUhMRJCvOhVAfggtgCSd9fKppePInaeA1w8JJT8
 aiauR+ka1H54huxYDQCzigw+LIF5cJxH/sFaCr8xGdmuRDhFguE8PHBPG2yP6MQLn3
 tu1BtfSdmSNXaR3Pm9VBnF6c+5HgGIskIU1Wwsap85x6ylRG6Upej8jydAL8hwgG03
 CzXInQL34H5lg==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 4F684A0063;
 Mon,  2 Sep 2019 08:02:14 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Mon,  2 Sep 2019 10:01:42 +0200
Message-Id: <cover.1567410970.git.joabreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 00/13] net: stmmac: Improvements for
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

Couple of improvements for -next tree. More info in commit logs. Some of them
includes fixes for features that are only in -next tree.

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

Jose Abreu (13):
  net: stmmac: selftests: Return proper error code to userspace
  net: stmmac: xgmac: Add RBU handling in DMA interrupt
  net: stmmac: Do not return error code in TC Initialization
  net: stmmac: Implement L3/L4 Filters using TC Flower
  net: stmmac: selftests: Add selftest for L3/L4 Filters
  net: stmmac: xgmac: Implement ARP Offload
  net: stmmac: selftests: Implement the ARP Offload test
  net: stmmac: Only consider RX error when HW Timestamping is not
    enabled
  net: stmmac: ethtool: Let user configure TX coalesce without RIWT
  net: stmmac: xgmac: Correct RAVSEL field interpretation
  net: stmmac: Correctly assing MAX MTU in XGMAC cores case
  net: stmmac: xgmac: Enable RX Jumbo frame support
  net: stmmac: selftests: Add Jumbo Frame tests

 drivers/net/ethernet/stmicro/stmmac/common.h       |   2 +
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |  33 +-
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    | 205 +++++++++-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c |   8 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |  19 +
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  12 +
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   |  21 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  18 +-
 .../net/ethernet/stmicro/stmmac/stmmac_selftests.c | 451 ++++++++++++++++++++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c    | 247 ++++++++++-
 10 files changed, 969 insertions(+), 47 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
