Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E24F63289
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jul 2019 10:03:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C394C79A9C
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jul 2019 08:03:19 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (dc2-smtprelay2.synopsys.com
 [198.182.61.142])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7913C7AB2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jul 2019 08:03:17 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B4D2CC0269;
 Tue,  9 Jul 2019 08:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1562659396; bh=pjjR0DynETAtrfqRsKnG9IivsK2E0/99XZIXZKRRtnw=;
 h=From:To:Cc:Subject:Date:From;
 b=NXVFLcn8kjhVQ9hRwltqlZFa9UBoqh/qcY4xoijWRlNLzztXPdYooTWGAy/jKx5Nh
 iNW85V96gv5v/3rQmLv/lXQTyUxo8aVUo5BhZcUy+BFmKIISvo8mwgi0fYG2m3W4Bx
 7G9B7awEnPxiiQ5jdnXH7n9nHyKFq3xelUxHpxiK63CmBep9jsJJg0R84vYIzFqb9m
 gbGtKK3IUSE3U3o/yXDUonxhwdIK7oLLtdgnPG0Xbcvmrc8J1p6gT4NBbn+Tg9XvHU
 fcZK7T/tSz+Axk/tG2k4xQA1S+8Wqoto+8wi1ebEtyu6T1AAJ98gIZ09t+Ut0y8Wib
 TSNtn2ZWaaadg==
Received: from de02.synopsys.com (de02.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 80E12A005D;
 Tue,  9 Jul 2019 08:03:13 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id 4256C3F82C;
 Tue,  9 Jul 2019 10:03:13 +0200 (CEST)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Tue,  9 Jul 2019 10:02:57 +0200
Message-Id: <cover.1562659012.git.joabreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v4 0/3] net: stmmac: Some
	improvements and a fix
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

Some performace improvements (01/03 and 03/03) and a fix (02/03), all for -next.

---
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---

Jose Abreu (3):
  net: stmmac: Implement RX Coalesce Frames setting
  net: stmmac: Fix descriptors address being in > 32 bits address space
  net: stmmac: Introducing support for Page Pool

 drivers/net/ethernet/stmicro/stmmac/Kconfig        |   1 +
 drivers/net/ethernet/stmicro/stmmac/common.h       |   1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  |   8 +-
 .../net/ethernet/stmicro/stmmac/dwmac1000_dma.c    |   8 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac100_dma.c |   8 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c   |   8 +-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |   2 +
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c |  10 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |   4 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  12 +-
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   |   7 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 217 +++++++--------------
 12 files changed, 114 insertions(+), 172 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
