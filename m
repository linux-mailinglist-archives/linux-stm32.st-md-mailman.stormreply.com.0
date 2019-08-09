Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5BA882A2
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Aug 2019 20:36:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91332C35E01;
	Fri,  9 Aug 2019 18:36:34 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (unknown [198.182.61.142])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2AD4C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Aug 2019 18:36:33 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9CBA0C0B9F;
 Fri,  9 Aug 2019 18:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1565375791; bh=nCNzho8v5alI/6i+1aHygJFRglDtTEl398Nq+I6/yIg=;
 h=From:To:Cc:Subject:Date:From;
 b=RN61SRAeyCRovJOdAw3w51pIzr4qX27Evn2Gxk1CVaM57hiZFcd9XGZUG/vwmBudU
 EC7v0tXdh6Y3nAn826Tmywch55W4daNIOp7Is1PWy9ANjOhLxHBfxLxAle+HWj8FAM
 BvucbXYt9OA4DKv/jvd9Qfc5lXmAdhNADV84ow6C0i1yaZP+Qw3ZreOSqLswCX42sS
 5tOwiEt7847Q+lkFRf+Kq0whtADYQ4VqBAAqncXm8CfQtUazD38g6WyqnCqlOByswC
 qwmdu4MAxM594bAQXHiuTb3dcSH2J61qbwq4h8bJxa4Q/qiKyhdBIAyXyf/36/MqcX
 b/DVojavfeMHg==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 4E0CAA0057;
 Fri,  9 Aug 2019 18:36:27 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Fri,  9 Aug 2019 20:36:08 +0200
Message-Id: <cover.1565375521.git.joabreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 00/12] net: stmmac: Improvements for
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

Couple of improvements for -next tree. More info in commit logs.

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

Jose Abreu (12):
  net: stmmac: Get correct timestamp values from XGMAC
  net: stmmac: Prepare to add Split Header support
  net: stmmac: xgmac: Correctly return that RX descriptor is not last
    one
  net: stmmac: Add Split Header support and enable it in XGMAC cores
  net: stmmac: Add a counter for Split Header packets
  net: stmmac: dwxgmac: Add Flexible PPS support
  net: stmmac: Add ethtool register dump for XGMAC cores
  net: stmmac: Add support for SA Insertion/Replacement in XGMAC cores
  net: stmmac: selftests: Add tests for SA Insertion/Replacement
  net: stmmac: xgmac: Add EEE support
  net: stmmac: Add support for VLAN Insertion Offload
  net: stmmac: selftests: Add selftest for VLAN TX Offload

 drivers/net/ethernet/stmicro/stmmac/common.h       |  10 +
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |  56 ++++
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    | 189 +++++++++++++-
 .../net/ethernet/stmicro/stmmac/dwxgmac2_descs.c   |  88 ++++++-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c |  31 ++-
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |  30 +++
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  10 +
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   |  25 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 282 ++++++++++++++++-----
 .../net/ethernet/stmicro/stmmac/stmmac_selftests.c | 194 +++++++++++++-
 10 files changed, 824 insertions(+), 91 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
