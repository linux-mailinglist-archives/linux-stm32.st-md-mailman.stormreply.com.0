Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B3AA219EB
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jan 2025 10:34:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2617BC78026;
	Wed, 29 Jan 2025 09:34:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA2C1C7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2025 12:12:49 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S9U0m5025055;
 Tue, 28 Jan 2025 13:12:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 pWl1eEN1iUk9ieX08HFfz+2vM8A6BpuZsHouPY02aXE=; b=mlU/4WKCQL6qIvej
 QuMrAiTViBG7wQ0V4qSgelm+pO/bAF9fhRId5E1S+S/H9+XAwZUx0KFeVoNnS4ym
 wH47fvW8q13O4JNKzI459UbTiIkuXvRhKpkbzYjILeexF+n7RBuAXAnts/3p6L7R
 LI5c975SGlknRpC1eHTM9y/Rjhz6LmSvBNgFkn+QsHR8nfcOBNRs61d6X5NbT7iH
 A4GFM+/pN3ddtmHFeiWoPkvIt01wUcynxtCPioMJzJ1OuXuDJo3kaGOpOBojyGHJ
 nKtkxSVeHUbwRRIx8Kdk5jQsYbI1F5Q1hE0zjwX6/tYhHxhQ6Unwxs99lC997ioT
 FOLmAA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44ebcbktnx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jan 2025 13:12:27 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 23C884004B;
 Tue, 28 Jan 2025 13:11:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F24B82CE641;
 Tue, 28 Jan 2025 13:08:11 +0100 (CET)
Received: from localhost (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 28 Jan
 2025 13:08:11 +0100
From: Christian Bruel <christian.bruel@foss.st.com>
To: <christian.bruel@foss.st.com>, <bhelgaas@google.com>,
 <lpieralisi@kernel.org>, <kw@linux.com>,
 <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
 <jingoohan1@gmail.com>, <p.zabel@pengutronix.de>,
 <johan+linaro@kernel.org>, <quic_schintav@quicinc.com>, <cassel@kernel.org>
Date: Tue, 28 Jan 2025 13:07:37 +0100
Message-ID: <20250128120745.334377-3-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128120745.334377-1-christian.bruel@foss.st.com>
References: <20250128120745.334377-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Mailman-Approved-At: Wed, 29 Jan 2025 09:34:43 +0000
Cc: devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 02/10] PCI: dwc: Add
	dw_pcie_wake_irq_handler helper
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

Introduce dw_pcie_wake_irq_handler function to support host wakeup from
the WAKE# irq.

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 15 +++++++++++++++
 drivers/pci/controller/dwc/pcie-designware.h      |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index ef4799effa03..5a67bee5bf3c 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -16,6 +16,7 @@
 #include <linux/of_pci.h>
 #include <linux/pci_regs.h>
 #include <linux/platform_device.h>
+#include <linux/suspend.h>
 
 #include "../../pci.h"
 #include "pcie-designware.h"
@@ -1054,3 +1055,17 @@ int dw_pcie_resume_noirq(struct dw_pcie *pci)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dw_pcie_resume_noirq);
+
+irqreturn_t dw_pcie_wake_irq_handler(int irq, void *arg)
+{
+	struct device *dev = arg;
+
+	dev_dbg(dev, "host wakeup by EP");
+
+	/* Notify PM core we are wakeup source */
+	pm_wakeup_event(dev, 0);
+	pm_system_wakeup();
+
+	return IRQ_HANDLED;
+}
+EXPORT_SYMBOL_GPL(dw_pcie_wake_irq_handler);
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index f8bf9c89a152..f54cf7b01cbd 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -511,6 +511,8 @@ void dw_pcie_edma_remove(struct dw_pcie *pci);
 int dw_pcie_suspend_noirq(struct dw_pcie *pci);
 int dw_pcie_resume_noirq(struct dw_pcie *pci);
 
+irqreturn_t dw_pcie_wake_irq_handler(int irq, void *arg);
+
 static inline void dw_pcie_writel_dbi(struct dw_pcie *pci, u32 reg, u32 val)
 {
 	dw_pcie_write_dbi(pci, reg, 0x4, val);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
