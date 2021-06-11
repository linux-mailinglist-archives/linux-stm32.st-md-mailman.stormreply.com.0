Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA393A3E69
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jun 2021 10:58:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EE32C58D5B;
	Fri, 11 Jun 2021 08:58:03 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23EF0C57B75
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jun 2021 08:57:59 +0000 (UTC)
IronPort-SDR: mB3A2TBdOMFKcmsWH2Tt9oBRVUEQcHf1PHZGv3Nh1KWxWhhBMsGAKYIwqyYMVZFbIXEl6nB6S4
 TI2Jzv1wAAww==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="192802162"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="192802162"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 01:57:56 -0700
IronPort-SDR: npVUMD7Ug39OKV8mQBP2p8S6y05DhCrJgUGROtC6C9qLuGKTFN6wPgCeFaoHpm+9HeH+9XzICC
 TkH6Yq+ddVOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="620329231"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga005.jf.intel.com with ESMTP; 11 Jun 2021 01:57:56 -0700
Received: from glass.png.intel.com (glass.png.intel.com [10.158.65.69])
 by linux.intel.com (Postfix) with ESMTP id E705B5807AA;
 Fri, 11 Jun 2021 01:57:53 -0700 (PDT)
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Fri, 11 Jun 2021 17:02:38 +0800
Message-Id: <20210611090238.1157557-1-vee.khee.wong@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v1 1/1] net: stmmac: Fix potential
	integer overflow
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

The commit d96febedfde2 ("net: stmmac: arrange Tx tail pointer update
to stmmac_flush_tx_descriptors") introduced the following coverity
warning:-

  1. Unintentional integer overflow (OVERFLOW_BEFORE_WIDEN)
     overflow_before_widen: Potentially overflowing expression
     'tx_q->cur_tx * desc_size' with type 'unsigned int' (32 bits,
     unsigned) is evaluated using 32-bit arithmetic, and then used in a
     context that expects an expression of type dma_addr_t (64 bits,
     unsigned).

Fixed this by assigning tx_tail_addr to dma_addr_t type, as dma_addr_t
datatype is decided by CONFIG_ARCH_DMA_ADDR_T_64_BIT.

Fixes: d96febedfde2 ("net: stmmac: arrange Tx tail pointer update to stmmac_flush_tx_descriptors")
Signed-off-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index fd7212afc543..6655cb8e24cf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -75,7 +75,7 @@ struct stmmac_tx_queue {
 	unsigned int cur_tx;
 	unsigned int dirty_tx;
 	dma_addr_t dma_tx_phy;
-	u32 tx_tail_addr;
+	dma_addr_t tx_tail_addr;
 	u32 mss;
 };
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
