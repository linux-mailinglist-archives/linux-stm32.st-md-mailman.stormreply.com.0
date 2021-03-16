Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C72533D3A1
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Mar 2021 13:18:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E07CFC57B5A;
	Tue, 16 Mar 2021 12:18:33 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21AB2C56632
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 12:18:29 +0000 (UTC)
IronPort-SDR: IGWEpoe+j8zOeFvVsdgsA+2PHBxLD8q2Ro8Ln2nMAFYMWOwsXyMM/jNEw/uYQxleZY3CDZhnlL
 dC9QgH8BuOpg==
X-IronPort-AV: E=McAfee;i="6000,8403,9924"; a="209181300"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="209181300"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2021 05:18:27 -0700
IronPort-SDR: hfN8W7PNV5itwFmITqi3spDA4QeDpgxF6ahDdPoZxhENQvr4KdyCNAe8h7yOBykFXS/d3E11ib
 lFLKrnLPnnmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="449703375"
Received: from climb.png.intel.com ([10.221.118.165])
 by orsmga001.jf.intel.com with ESMTP; 16 Mar 2021 05:18:24 -0700
From: Voon Weifeng <weifeng.voon@intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Tue, 16 Mar 2021 20:18:18 +0800
Message-Id: <20210316121823.18659-1-weifeng.voon@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue <alexandre.torgue@st.com>,
 Voon Weifeng <weifeng.voon@intel.com>, Wong Vee Khee <vee.khee.wong@intel.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RESEND v1 net-next 0/5] net: stmmac: enable
	multi-vector MSI
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

This patchset adds support for multi MSI interrupts in addition to
current single common interrupt implementation. Each MSI interrupt is tied
to a newly introduce interrupt service routine(ISR). Hence, each interrupt
will only go through the corresponding ISR.

In order to increase the efficiency, enabling multi MSI interrupt will
automatically select the interrupt mode configuration INTM=1. When INTM=1,
the TX/RX transfer complete signal will only asserted on corresponding
sbd_perch_tx_intr_o[] or sbd_perch_rx_intr_o[] without asserting signal
on the common sbd_intr_o. Hence, for each TX/RX interrupts, only the
corresponding ISR will be triggered.

Every vendor might have different MSI vector assignment. So, this patchset
only includes multi-vector MSI assignment for Intel platform.

Ong Boon Leong (4):
  net: stmmac: introduce DMA interrupt status masking per traffic
    direction
  net: stmmac: make stmmac_interrupt() function more friendly to MSI
  net: stmmac: introduce MSI Interrupt routines for mac, safety, RX & TX
  stmmac: intel: add support for multi-vector msi and msi-x

Wong, Vee Khee (1):
  net: stmmac: use interrupt mode INTM=1 for multi-MSI

 drivers/net/ethernet/stmicro/stmmac/common.h  |  21 +
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 112 +++-
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  24 +-
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  |   8 +
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.h  |  24 +-
 .../net/ethernet/stmicro/stmmac/dwmac4_lib.c  |  30 +-
 .../net/ethernet/stmicro/stmmac/dwmac_dma.h   |  22 +-
 .../net/ethernet/stmicro/stmmac/dwmac_lib.c   |   8 +-
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |   6 +
 .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |   8 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  16 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 482 +++++++++++++++---
 include/linux/stmmac.h                        |   9 +
 14 files changed, 676 insertions(+), 96 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
