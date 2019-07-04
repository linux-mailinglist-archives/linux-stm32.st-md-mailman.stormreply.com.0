Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BAA5FA88
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2019 17:04:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF9F4C20B9E
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2019 15:04:28 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (dc8-smtprelay2.synopsys.com
 [198.182.47.102])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2BF9C20B72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jul 2019 15:04:27 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 12782C263A;
 Thu,  4 Jul 2019 15:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1562252666; bh=PAo9PIfhNcKwwl9Dq4k5dVtLOG+3Xoxeinoz/2G+cRY=;
 h=From:To:Cc:Subject:Date:From;
 b=fjCN0tWGG04dUAErtw3+lTfyoSI1bCYZ1W+tfumt497tAJeXlHTCvXjXWLxORtmi4
 yXfh0hm7HNGGtcQ6o1SUPI+r/oAFWW/WhzoIb7CCcmkrO2Z31MBMLv9QXfr60L0iFL
 V85QfjjBvyr1H7MZ39Yv7It51sh1IWofgDC6HtR2wSZ4m0lV+Ds04F2+hDJI1zZ2g0
 Sh00PHuMlY2A7OU4rDGocObLlvHj90HK+AICMmIRfFasQNWaabU1kRoolcmjRCVt5S
 JbZG9TSrg7HTFzM2F+63jh53vle+CRvMxIBK38p9Pdxjp7eO972wJ1w8HjYwABzYSh
 VmrsJ2wO+zWTA==
Received: from de02.synopsys.com (de02.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 81926A005D;
 Thu,  4 Jul 2019 15:04:23 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id 2984E3FC5D;
 Thu,  4 Jul 2019 17:04:23 +0200 (CEST)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Thu,  4 Jul 2019 17:04:11 +0200
Message-Id: <cover.1562252534.git.joabreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Joao Pinto <Joao.Pinto@synopsys.com>, "David S . Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v2 0/3] net: stmmac: Some
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

Cc: Joao Pinto <jpinto@synopsys.com>
Cc: David S. Miller <davem@davemloft.net>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>

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
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 215 +++++++--------------
 12 files changed, 112 insertions(+), 172 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
