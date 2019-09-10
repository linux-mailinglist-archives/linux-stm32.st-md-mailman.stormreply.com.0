Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E06AED4F
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Sep 2019 16:41:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6634AC35E07;
	Tue, 10 Sep 2019 14:41:36 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (unknown [198.182.61.142])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7E92C35E05
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2019 14:41:33 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4F355C2B07;
 Tue, 10 Sep 2019 14:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1568126491; bh=Tub4nxbeU4nreRv8Psll6baSDgasdHP9Jdi2H3FUuM0=;
 h=From:To:Cc:Subject:Date:From;
 b=C2o6PJo4/Gf/7lp2JOLM+WEG1MfCOq73flr31Z7C9+k5tPz3ahpk3X+Jdiw3i1fn9
 imLq+yTn/PJJlWrTdXHoTa/8aus7nXy5gjO+RrI80mGiwkgCCXASzT7qN2WCdjCmue
 OfxO8I9cv2dqEbJBlSWxOiLrHu6RW1A/4GkyB+sQraKB0raSVjXXKSPSvCrFaIga4B
 y9BuCLwa04cyaUqPgnY6ADYrMAWgEQzFctN1M50DadnTDXTeUkweuOTpiwzxUdd5pr
 rfMt62re75WqJhRakCtdR1TKDAOFu4McgBvPV74oFBSIxBzoQgSa7LdCuXxvsneLn/
 kptY6jHGqPW/g==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id B7508A0057;
 Tue, 10 Sep 2019 14:41:28 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Tue, 10 Sep 2019 16:41:21 +0200
Message-Id: <cover.1568126224.git.joabreu@synopsys.com>
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

Misc patches for -next. It includes:
 - Two fixes for features in -next only
 - New features support for GMAC cores (which includes GMAC4 and GMAC5)

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
  net: stmmac: Prevent divide-by-zero
  net: stmmac: Add VLAN HASH filtering support in GMAC4+
  net: stmmac: xgmac: Reinitialize correctly a variable
  net: stmmac: Add support for SA Insertion/Replacement in GMAC4+
  net: stmmac: Add support for VLAN Insertion Offload in GMAC4+
  net: stmmac: ARP Offload for GMAC4+ Cores

 drivers/net/ethernet/stmicro/stmmac/dwmac4.h       | 23 +++++++
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  | 79 ++++++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c | 43 ++++++++++++
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h |  9 +++
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c   |  5 +-
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  4 +-
 7 files changed, 162 insertions(+), 3 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
