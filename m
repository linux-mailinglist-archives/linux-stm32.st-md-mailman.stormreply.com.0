Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A01E0AB6E60
	for <lists+linux-stm32@lfdr.de>; Wed, 14 May 2025 16:48:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68FDEC7A844;
	Wed, 14 May 2025 14:48:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4D4BC7A848
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 May 2025 14:48:29 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAvNob027618;
 Wed, 14 May 2025 16:48:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 lYgmq8Feu1A709M6Lp0Ahv3YnYb8aDShkbJc7diMvRs=; b=gDdt3mbVwWWkPnAn
 lpuB2We54+ZCkWvuDilN0qpzkcOB/jbQ1YW9hGsBsZvO9yleJ3A00c7fqr1rVr5S
 lHSV1kTXCqHGQCsqsksEEp0cciHl/b6sbpnemwFldgN1OBPS9EpmPySd+pAC3Tii
 H4jhQuDc32iHSEGC2VfEcgqrZbStjBNPBB9rLq/9F3VGNKQHpStrB0oHqEHAubtn
 BM8nSa2zjSwKteSxYrq5tmjaqvWApOu+qzICh8sVOMUr29lvicUMMF1Uo9maYTyI
 PcGgIP4nJ6YmklYstmu8BXKVff8UNuotmYBc5mw2sAXu5fEzMv/q8f37cSnbYlU3
 me74OQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46mbds4b58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 May 2025 16:48:04 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BE13D40058;
 Wed, 14 May 2025 16:46:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 606DDAF0552;
 Wed, 14 May 2025 16:44:34 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 May
 2025 16:44:34 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <christian.bruel@foss.st.com>, <lpieralisi@kernel.org>, <kw@linux.com>,
 <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
 <bhelgaas@google.com>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
 <p.zabel@pengutronix.de>, <thippeswamy.havalige@amd.com>,
 <shradha.t@samsung.com>, <quic_schintav@quicinc.com>,
 <cassel@kernel.org>, <johan+linaro@kernel.org>
Date: Wed, 14 May 2025 16:44:22 +0200
Message-ID: <20250514144428.3340709-4-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514144428.3340709-1-christian.bruel@foss.st.com>
References: <20250514144428.3340709-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH v10 3/9] dt-bindings: PCI: Add STM32MP25 PCIe
	Endpoint bindings
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

STM32MP25 PCIe Controller is based on the DesignWare core configured as
end point mode from the SYSCFG register.

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 .../bindings/pci/st,stm32-pcie-ep.yaml        | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-ep.yaml

diff --git a/Documentation/devicetree/bindings/pci/st,stm32-pcie-ep.yaml b/Documentation/devicetree/bindings/pci/st,stm32-pcie-ep.yaml
new file mode 100644
index 000000000000..6edccaa73034
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/st,stm32-pcie-ep.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/st,stm32-pcie-ep.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32MP25 PCIe Endpoint
+
+maintainers:
+  - Christian Bruel <christian.bruel@foss.st.com>
+
+description:
+  PCIe endpoint controller based on the Synopsys DesignWare PCIe core.
+
+allOf:
+  - $ref: /schemas/pci/snps,dw-pcie-ep.yaml#
+  - $ref: /schemas/pci/st,stm32-pcie-common.yaml#
+
+properties:
+  compatible:
+    const: st,stm32mp25-pcie-ep
+
+  reg:
+    items:
+      - description: Data Bus Interface (DBI) registers.
+      - description: Data Bus Interface (DBI) shadow registers.
+      - description: Internal Address Translation Unit (iATU) registers.
+      - description: PCIe configuration registers.
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: dbi2
+      - const: atu
+      - const: addr_space
+
+  reset-gpios:
+    description: GPIO controlled connection to PERST# signal
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+required:
+  - phys
+  - reset-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/phy/phy.h>
+    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
+
+    pcie-ep@48400000 {
+        compatible = "st,stm32mp25-pcie-ep";
+        reg = <0x48400000 0x400000>,
+              <0x48500000 0x100000>,
+              <0x48700000 0x80000>,
+              <0x10000000 0x8000000>;
+        reg-names = "dbi", "dbi2", "atu", "addr_space";
+        clocks = <&rcc CK_BUS_PCIE>;
+        phys = <&combophy PHY_TYPE_PCIE>;
+        resets = <&rcc PCIE_R>;
+        pinctrl-names = "default", "init";
+        pinctrl-0 = <&pcie_pins_a>;
+        pinctrl-1 = <&pcie_init_pins_a>;
+        reset-gpios = <&gpioj 8 GPIO_ACTIVE_LOW>;
+        access-controllers = <&rifsc 68>;
+        power-domains = <&CLUSTER_PD>;
+    };
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
