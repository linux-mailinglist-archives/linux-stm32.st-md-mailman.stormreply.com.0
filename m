Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C713B4007E
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Sep 2025 14:28:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 046E2C3FACC;
	Tue,  2 Sep 2025 12:28:49 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87437C3FACB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Sep 2025 12:28:47 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5829o0Vr014977;
 Tue, 2 Sep 2025 14:28:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=rc26TBA8kHE73g2W9MG6AU
 932qr0T6b9mLZVD7CCCYk=; b=A0YfiPSKYFpUj/5k9h9nBv802d874hQs16bM6s
 ppPFAwDNKj8Etul0xG3jGEhlD+3oR1m9EFSCi/RpwGossBrz3AcXgb9ffD6B8cL2
 ebvrA4UlRrDwuPY695rA0N9clKvqNkUQ4dOTGQU8FNbDgLOmLw/WCgvICfwpaXbU
 upZHQoaW7FhHxYWrlEKuyGHMMmOrc/ivsX2HywsxzNtsSiTRb0ABWbX8vabHSK5o
 yr6AoKBBwXeXXw5JFFCTvVU5l6ZGSS65PZvr7qvWCsYMOXWNopq4SQQG9Qv48B7J
 SfmjFuyPPpXR8WpkVwLl4rvWhCdTe3AwohinkJ7XYYPRywwA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48vc8m1e20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Sep 2025 14:28:29 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B8DC840047;
 Tue,  2 Sep 2025 14:27:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1B1BC39EDB5;
 Tue,  2 Sep 2025 14:26:46 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 2 Sep
 2025 14:26:45 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <christian.bruel@foss.st.com>, <lpieralisi@kernel.org>,
 <kwilczynski@kernel.org>, <mani@kernel.org>, <robh@kernel.org>,
 <bhelgaas@google.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>
Date: Tue, 2 Sep 2025 14:26:41 +0200
Message-ID: <20250902122641.269725-1-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
Cc: linux-pci@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] PCI: stm32: Remove link_status in PCIe EP.
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

Guarding enable_irq/disable_irq against successive link start
link does not seem necessary, since it is not possible to start
the link twice. Similarly for stop.

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <20250828192054.GA957771@bhelgaas>
---
 drivers/pci/controller/dwc/pcie-stm32-ep.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
index 1f46bcf0c79f..a00edb6067f1 100644
--- a/drivers/pci/controller/dwc/pcie-stm32-ep.c
+++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
@@ -18,11 +18,6 @@
 #include "pcie-designware.h"
 #include "pcie-stm32.h"
 
-enum stm32_pcie_ep_link_status {
-	STM32_PCIE_EP_LINK_DISABLED,
-	STM32_PCIE_EP_LINK_ENABLED,
-};
-
 struct stm32_pcie {
 	struct dw_pcie pci;
 	struct regmap *regmap;
@@ -30,7 +25,6 @@ struct stm32_pcie {
 	struct phy *phy;
 	struct clk *clk;
 	struct gpio_desc *perst_gpio;
-	enum stm32_pcie_ep_link_status link_status;
 	unsigned int perst_irq;
 };
 
@@ -66,11 +60,6 @@ static int stm32_pcie_start_link(struct dw_pcie *pci)
 	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
 	int ret;
 
-	if (stm32_pcie->link_status == STM32_PCIE_EP_LINK_ENABLED) {
-		dev_dbg(pci->dev, "Link is already enabled\n");
-		return 0;
-	}
-
 	dev_dbg(pci->dev, "Enable link\n");
 
 	ret = stm32_pcie_enable_link(pci);
@@ -81,8 +70,6 @@ static int stm32_pcie_start_link(struct dw_pcie *pci)
 
 	enable_irq(stm32_pcie->perst_irq);
 
-	stm32_pcie->link_status = STM32_PCIE_EP_LINK_ENABLED;
-
 	return 0;
 }
 
@@ -90,18 +77,11 @@ static void stm32_pcie_stop_link(struct dw_pcie *pci)
 {
 	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
 
-	if (stm32_pcie->link_status == STM32_PCIE_EP_LINK_DISABLED) {
-		dev_dbg(pci->dev, "Link is already disabled\n");
-		return;
-	}
-
 	dev_dbg(pci->dev, "Disable link\n");
 
 	disable_irq(stm32_pcie->perst_irq);
 
 	stm32_pcie_disable_link(pci);
-
-	stm32_pcie->link_status = STM32_PCIE_EP_LINK_DISABLED;
 }
 
 static int stm32_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
