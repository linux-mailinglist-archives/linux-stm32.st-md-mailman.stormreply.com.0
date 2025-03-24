Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C076A6D444
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Mar 2025 07:28:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFC31C78F64;
	Mon, 24 Mar 2025 06:27:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8390CC78037
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 06:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742797679; x=1774333679;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eITHe9O29qurQr+w4lnf9ce6r8QgdKu3VSz+sAB0QJc=;
 b=d9MBV2dy8KxY5d38CeHeevGjYjvx8ZJmvYe3vpogOkLVT2KkP4Q0M5bK
 ITpLgI4oKFdNnmJnBGR0OTLzww2moW6zvkcMXj2BEuVdIUv3SZHFuErUA
 UWUD832iizE8QK61UkNoT9nrznDSy05DaOnWOchPeWSL1uMlGnDVyL65L
 qYbdXDHhVkxQQAlyOGJcSnsS3n0XAnf7RKOA+xvdYMudmafHIa64CaXK9
 +0YqL4yEiY8bzI+D3IfzrtgFwfVEthVUVOa4IV7MZtgMXtQKMuZRjYuQD
 e75sR/gehIKiNgnz4OT5Eef2TkrHLeabNEcfKVYI+lFSV//P2klDzLFIT g==;
X-CSE-ConnectionGUID: tzDCR7qfQIGl9e3oRGZITw==
X-CSE-MsgGUID: lYLoS8btSlyUfDbvmr34EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="47638758"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="47638758"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2025 23:27:56 -0700
X-CSE-ConnectionGUID: B48+T+GRQwqiLpAT4hNPdA==
X-CSE-MsgGUID: BDisJXbXTsSeVaZTCIRHpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="124901989"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.227.39])
 by orviesa008.jf.intel.com with ESMTP; 23 Mar 2025 23:27:54 -0700
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 24 Mar 2025 14:27:42 +0800
Message-Id: <20250324062742.462771-1-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v1 1/1] stmmac: intel: interface
	switching support for RPL-P platform
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

Based on the patch series [1], the enablement of interface switching for
RPL-P will use the same handling as ADL-N.

Link: https://patchwork.kernel.org/project/netdevbpf/cover/20250227121522.1802832-1-yong.liang.choong@linux.intel.com/ [1]

Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 5910571a954f..c8bb9265bbb4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -1437,7 +1437,7 @@ static const struct pci_device_id intel_eth_pci_id_table[] = {
 	{ PCI_DEVICE_DATA(INTEL, ADLS_SGMII1G_0, &adls_sgmii1g_phy0_info) },
 	{ PCI_DEVICE_DATA(INTEL, ADLS_SGMII1G_1, &adls_sgmii1g_phy1_info) },
 	{ PCI_DEVICE_DATA(INTEL, ADLN_SGMII1G, &adln_sgmii1g_phy0_info) },
-	{ PCI_DEVICE_DATA(INTEL, RPLP_SGMII1G, &tgl_sgmii1g_phy0_info) },
+	{ PCI_DEVICE_DATA(INTEL, RPLP_SGMII1G, &adln_sgmii1g_phy0_info) },
 	{}
 };
 MODULE_DEVICE_TABLE(pci, intel_eth_pci_id_table);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
