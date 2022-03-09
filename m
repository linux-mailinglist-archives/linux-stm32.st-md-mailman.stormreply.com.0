Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 015CA4D263B
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Mar 2022 04:39:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2AEFC60497;
	Wed,  9 Mar 2022 03:39:04 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6552C5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Mar 2022 03:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646797142; x=1678333142;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MllVgczf0c1TNdA75U5Rm2oYU7fpnZ5DVIRsDr6nA24=;
 b=DRzH6fEYFf8j8cvEaHuqfaNJr8A0eehHMZBATFfaqAOmUl5z6Sc5+f6L
 jfry/+8omWNigoLVuhRZ47odw/aKRUxgiBOsBGG88klNqEYHQDwZDXEcD
 hvaGzBUrhEkU7YV7uSW7QqODeZbIYbdYOvROvcLhpgm5DTJyu6wGHL802
 0GfJCJLZ9oxRt4dDh0nG+Dh1uaftXh0UmMtoFCigMFiQDWUtXzgi0ND6B
 f2F7zcjN3huQ8i0HWwOG2BQUIFUPPo18SA9DOKow93qBITHGUq30PIE5F
 ip0uugMLg3fxkXSCDmJFOJRwmknjDKOb458zQzSgVLNCr3TczbEWumxrg Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="242320602"
X-IronPort-AV: E=Sophos;i="5.90,166,1643702400"; d="scan'208";a="242320602"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 19:39:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,166,1643702400"; d="scan'208";a="510345506"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by orsmga002.jf.intel.com with ESMTP; 08 Mar 2022 19:38:57 -0800
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Wed,  9 Mar 2022 11:34:15 +0800
Message-Id: <20220309033415.3370250-1-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Wong Vee Khee <vee.khee.wong@linux.intel.com>,
 Voon Weifeng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/1] stmmac: intel: Add ADL-N PCI ID
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

Add PCI ID for Ethernet TSN Controller on ADL-N.

Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 32ef3df4e266..63754a9c4ba7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -1159,6 +1159,7 @@ static SIMPLE_DEV_PM_OPS(intel_eth_pm_ops, intel_eth_pci_suspend,
 #define PCI_DEVICE_ID_INTEL_TGL_SGMII1G		0xa0ac
 #define PCI_DEVICE_ID_INTEL_ADLS_SGMII1G_0	0x7aac
 #define PCI_DEVICE_ID_INTEL_ADLS_SGMII1G_1	0x7aad
+#define PCI_DEVICE_ID_INTEL_ADLN_SGMII1G	0x54ac
 
 static const struct pci_device_id intel_eth_pci_id_table[] = {
 	{ PCI_DEVICE_DATA(INTEL, QUARK, &quark_info) },
@@ -1176,6 +1177,7 @@ static const struct pci_device_id intel_eth_pci_id_table[] = {
 	{ PCI_DEVICE_DATA(INTEL, TGLH_SGMII1G_1, &tgl_sgmii1g_phy1_info) },
 	{ PCI_DEVICE_DATA(INTEL, ADLS_SGMII1G_0, &adls_sgmii1g_phy0_info) },
 	{ PCI_DEVICE_DATA(INTEL, ADLS_SGMII1G_1, &adls_sgmii1g_phy1_info) },
+	{ PCI_DEVICE_DATA(INTEL, ADLN_SGMII1G, &tgl_sgmii1g_phy0_info) },
 	{}
 };
 MODULE_DEVICE_TABLE(pci, intel_eth_pci_id_table);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
