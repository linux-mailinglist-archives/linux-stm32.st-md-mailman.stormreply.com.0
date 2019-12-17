Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3C0122C22
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2019 13:46:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63181C36B18;
	Tue, 17 Dec 2019 12:46:24 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD599C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2019 12:46:21 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5AF8BC00AE;
 Tue, 17 Dec 2019 12:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1576586780; bh=JfzLeaD7F4WW4TsqwGILNTOHGkhNnPEwK2ItB4zHXlk=;
 h=From:To:Cc:Subject:Date:From;
 b=dKVErmsvICyvIYUNQzYHD0yQcMGdDCyqaa/xKB06F2qxDLCwqvCO2hff1lxqcDlBk
 5UOH+nu0exSiCkL5g6ChAtZZrjI29qjtL7QEcppuF2R5XsFfkNw5eS4QJOa011/rVY
 SKYDfGOq6PD27OIzPt+mt6ojSDsBtqUQosPL4/iZYqieX7LrMbwLHr1bCSvREV3jAW
 bPoI6CberKXSmELcrXhmoiVLltos0AxZlqZmtBu+tPhJa7+uLxCz0jjm8XUq/uCW4i
 5HH+VhCtSkjIK6c59p5S3hsfuC57GNcS7WRH5v1vyHsdkUbeOKgC3+eoFif0u8bCbo
 SUqXaKGGfTB/Q==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 6D72FA0075;
 Tue, 17 Dec 2019 12:46:16 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Tue, 17 Dec 2019 13:46:04 +0100
Message-Id: <cover.1576586602.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 Jakub Kicinski <jakub.kicinski@netronome.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 0/7] net: stmmac: Improvements for
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

Improvements for stmmac.

1) Adds more information regarding HW Caps in the DebugFS file.

2) Prevents incostant bandwidth because of missed interrupts.

3) Allows interrupts to be independently enabled or disabled so that we don't
have to schedule both TX and RX NAPIs.

4) Stops using a magic number in coalesce timer re-arm.

5) and 6) Implements the EST feature for GMAC5+ and XGMAC3+ cores which leads
to 7) that integrates EST feature with TAPRIO API.

---
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-kernel@vger.kernel.org
---

Jose Abreu (7):
  net: stmmac: Print more information in DebugFS DMA Capabilities file
  net: stmmac: Always arm TX Timer at end of transmission start
  net: stmmac: Let TX and RX interrupts be independently
    enabled/disabled
  net: stmmac: Always use TX coalesce timer value when rescheduling
  net: stmmac: Add basic EST support for GMAC5+
  net: stmmac: Add basic EST support for XGMAC
  net: stmmac: Integrate EST with TAPRIO scheduler API

 drivers/net/ethernet/stmicro/stmmac/common.h       |   4 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  |  24 ++++-
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |   9 ++
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |   2 +
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c   |   3 +
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h   |  11 ++-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c   |  47 +++++++--
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c       |  95 ++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h       |  19 ++++
 drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h    |   6 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c    |  22 ++++-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |  21 ++++
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  52 ++++++++++
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c |  27 +++++-
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |  16 ++-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |   1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  96 ++++++++++++------
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c    | 108 +++++++++++++++++++++
 include/linux/stmmac.h                             |  11 +++
 19 files changed, 519 insertions(+), 55 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
