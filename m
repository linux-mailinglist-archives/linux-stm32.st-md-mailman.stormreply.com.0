Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3191A53B467
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Jun 2022 09:35:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3852C03FE0;
	Thu,  2 Jun 2022 07:35:46 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 823DBC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jun 2022 07:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654155344; x=1685691344;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=guW2S9dJLzjEzn/tbSdMDgpb8Z56ie57XqS2+J+2Pe0=;
 b=c6bG4aBNqOpv17/JjRk2ViLb+zuSQqhWVNYeE+T8ND4OWXjsiSaBtdYT
 ZrkCaE/hTrGmwXVoiGn/MH9lelH7aMp1T5E8ct5LNXB1BoC3iz6REC4/6
 YRpSMe+atKkosjKkUJef5Gj2f+jVekQw6zaCzs7BglfCi8cqcV+MpLOPV
 AK109PJRTVM5JbyemUWFLbe3z7jA+rIWtKp6tpAkR79v/KgF+wp69FVUz
 hA7z0e8VeTHrvM0mpBnILW1oCB1pStVzuFYZ+CpwY2DfwsSsbPdLzCjPz
 Lb5AbktuT8gtu7MMdH7chqwJT77kivXA0Jn9wjRmWpcR1+t8lwtWiHX8a w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="275935054"
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; d="scan'208";a="275935054"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 00:35:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; d="scan'208";a="606706523"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by orsmga008.jf.intel.com with ESMTP; 02 Jun 2022 00:35:21 -0700
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Thu,  2 Jun 2022 15:35:07 +0800
Message-Id: <20220602073507.3955721-1-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Wong Vee Khee <vee.khee.wong@linux.intel.com>,
 Voon Weifeng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Tan Tee Min <tee.min.tan@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [net-next 1/1] stmmac: intel: Add RPL-P PCI ID
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

Add PCI ID for Ethernet TSN Controller on RPL-P.

Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 0b0be0898ac5..f9f80933e0c9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -1161,6 +1161,7 @@ static SIMPLE_DEV_PM_OPS(intel_eth_pm_ops, intel_eth_pci_suspend,
 #define PCI_DEVICE_ID_INTEL_ADLS_SGMII1G_0	0x7aac
 #define PCI_DEVICE_ID_INTEL_ADLS_SGMII1G_1	0x7aad
 #define PCI_DEVICE_ID_INTEL_ADLN_SGMII1G	0x54ac
+#define PCI_DEVICE_ID_INTEL_RPLP_SGMII1G	0x51ac
 
 static const struct pci_device_id intel_eth_pci_id_table[] = {
 	{ PCI_DEVICE_DATA(INTEL, QUARK, &quark_info) },
@@ -1179,6 +1180,7 @@ static const struct pci_device_id intel_eth_pci_id_table[] = {
 	{ PCI_DEVICE_DATA(INTEL, ADLS_SGMII1G_0, &adls_sgmii1g_phy0_info) },
 	{ PCI_DEVICE_DATA(INTEL, ADLS_SGMII1G_1, &adls_sgmii1g_phy1_info) },
 	{ PCI_DEVICE_DATA(INTEL, ADLN_SGMII1G, &tgl_sgmii1g_phy0_info) },
+	{ PCI_DEVICE_DATA(INTEL, RPLP_SGMII1G, &tgl_sgmii1g_phy0_info) },
 	{}
 };
 MODULE_DEVICE_TABLE(pci, intel_eth_pci_id_table);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
