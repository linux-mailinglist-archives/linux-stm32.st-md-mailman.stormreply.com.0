Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 319EE3AE827
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Jun 2021 13:27:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCF47C597B5;
	Mon, 21 Jun 2021 11:27:15 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0D54C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jun 2021 09:46:16 +0000 (UTC)
IronPort-SDR: I7KCRKygzI28G6hjRkvBsgM/m9sb+9iNlxVTl4P8dnNMUAbnFRIm7qeUc+y+ZhI2R5WPJIA17x
 a3YBF0lQgnGw==
X-IronPort-AV: E=McAfee;i="6200,9189,10021"; a="292441071"
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="292441071"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 02:46:15 -0700
IronPort-SDR: neKELTmt31WoAvjNQcXp+1P6WpL/4Do+v28x74Uedwxd8vt3xG6AIgcdfznSP26mRdEAIRLioM
 CD6Zrh0XniJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="638720326"
Received: from peileeli.png.intel.com ([172.30.240.12])
 by fmsmga006.fm.intel.com with ESMTP; 21 Jun 2021 02:46:10 -0700
From: Ling Pei Lee <pei.lee.ling@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Voon Weifeng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@linux.intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>,
 Tan Tee Min <tee.min.tan@intel.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 21 Jun 2021 17:45:36 +0800
Message-Id: <20210621094536.387442-5-pei.lee.ling@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621094536.387442-1-pei.lee.ling@intel.com>
References: <20210621094536.387442-1-pei.lee.ling@intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 21 Jun 2021 11:27:13 +0000
Cc: pei.lee.ling@intel.com
Subject: [Linux-stm32] [PATCH net-next V1 4/4] stmmac: intel: set PCI_D3hot
	in suspend
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

From: Voon Weifeng <weifeng.voon@intel.com>

During suspend, set the Intel mgbe to D3hot state
to save power consumption.

Signed-off-by: Voon Weifeng <weifeng.voon@intel.com>
Signed-off-by: Ling Pei Lee <pei.lee.ling@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 73be34a10a4c..69a725b661c2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -1088,6 +1088,7 @@ static int __maybe_unused intel_eth_pci_suspend(struct device *dev)
 		return ret;
 
 	pci_wake_from_d3(pdev, true);
+	pci_set_power_state(pdev, PCI_D3hot);
 	return 0;
 }
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
