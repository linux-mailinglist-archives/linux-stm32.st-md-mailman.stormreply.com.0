Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA77F36671E
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Apr 2021 10:41:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89E3DC5719E;
	Wed, 21 Apr 2021 08:41:45 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14811C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Apr 2021 08:41:42 +0000 (UTC)
IronPort-SDR: QTbnwi1LbWdoafns63fiRwolsJYunEcf4pV+ERgUAfVOXqcVkwmUr21j/oqUnNExjrn/wky2nc
 2r/KAmasYAxQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="175770572"
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; d="scan'208";a="175770572"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 01:41:41 -0700
IronPort-SDR: /fwMw7Aaz+8j1L6wYxFmScfEReB1nmgpeJCTWfKvGnnbkI3h1qiIYaZADDhsfvqJp/tpUFEtIi
 rdWm/MvFW9ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; d="scan'208";a="455249802"
Received: from glass.png.intel.com ([10.158.65.59])
 by fmsmga002.fm.intel.com with ESMTP; 21 Apr 2021 01:41:38 -0700
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 21 Apr 2021 16:46:06 +0800
Message-Id: <20210421084606.20851-1-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/1] stmmac: intel: set TSO/TBS TX
	Queues default settings
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

TSO and TBS cannot coexist, for now we set Intel mGbE controller to use
below TX Queue mapping: TxQ0 uses TSO and the rest of TXQs supports TBS.

Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index ec140fc4a0f5..844332a2c2e0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -446,6 +446,9 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 
 		/* Disable Priority config by default */
 		plat->tx_queues_cfg[i].use_prio = false;
+		/* Default TX Q0 to use TSO and rest TXQ for TBS */
+		if (i > 0)
+			plat->tx_queues_cfg[i].tbs_en = 1;
 	}
 
 	/* FIFO size is 4096 bytes for 1 tx/rx queue */
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
