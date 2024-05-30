Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B99398D4B81
	for <lists+linux-stm32@lfdr.de>; Thu, 30 May 2024 14:25:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 823E7C6DD66;
	Thu, 30 May 2024 12:25:11 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A27D6C030CA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 May 2024 12:25:09 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44UCOmxk097829;
 Thu, 30 May 2024 07:24:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1717071888;
 bh=hbJYOsyxMhIpnLlrkY0sqXD5JsFeWhlLGbK42ukDK7w=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=fLTh9hK2+lFl+bpNVeZcvNIf9tDlXxiSYQPsRx/XsyMySm+w7vWcYg6RMAnzesmOr
 mzsFWazkQPUW+EJtX7sS/olpZesqHLgbaNqo2suHrSlehfaIMo3g9qUKS6SHUBu8dM
 eRdfemwaOOYYpRLU1yp0XzdoJoF2Tsp4qYKbH6B4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44UCOmJb094891
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 30 May 2024 07:24:48 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 30
 May 2024 07:24:48 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 30 May 2024 07:24:48 -0500
Received: from localhost (kamlesh.dhcp.ti.com [172.24.227.123])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44UCOlHl070599;
 Thu, 30 May 2024 07:24:48 -0500
From: <kamlesh@ti.com>
To: <herbert@gondor.apana.org.au>, <kristo@kernel.org>, <will@kernel.org>
Date: Thu, 30 May 2024 17:54:25 +0530
Message-ID: <20240524-mcrc64-upstream-v3-3-24b94d8e8578@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524-mcrc64-upstream-v3-0-24b94d8e8578@ti.com>
References: <20240524-mcrc64-upstream-v3-0-24b94d8e8578@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: robh@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, catalin.marinas@arm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Kamlesh Gurudasani <kamlesh@ti.com>, akpm@linux-foundation.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org, vigneshr@ti.com
Subject: [Linux-stm32] [PATCH v3 3/6] dt-bindings: crypto: Add Texas
	Instruments MCRC64
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

From: Kamlesh Gurudasani <kamlesh@ti.com>

Add binding for Texas Instruments MCRC64

MCRC64 engine calculates 64-bit cyclic redundancy checks (CRC)
according to the ISO 3309 standard.

The ISO 3309 64-bit CRC model parameters are as follows:
    Generator Polynomial: x^64 + x^4 + x^3 + x + 1
    Polynomial Value: 0x000000000000001B
    Initial value: 0x0000000000000000
    Reflected Input: False
    Reflected Output: False
    Xor Final: 0x0000000000000000

Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
---
 Documentation/devicetree/bindings/crypto/ti,mcrc64.yaml | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                                             |  5 +++++
 2 files changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/ti,mcrc64.yaml b/Documentation/devicetree/bindings/crypto/ti,mcrc64.yaml
new file mode 100644
index 000000000000..52505cc40a57
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/ti,mcrc64.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/ti,mcrc64.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments MCRC64
+
+description:
+  The MCRC64 engine calculates 64-bit cyclic redundancy checks
+  (CRC) according to the ISO 3309 standard.
+
+maintainers:
+  - Kamlesh Gurudasani <kamlesh@ti.com>
+
+properties:
+  compatible:
+    const: ti,am62-mcrc64
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/ti,sci_pm_domain.h>
+
+    crc@30300000 {
+      compatible = "ti,am62-mcrc64";
+      reg = <0x30300000 0x1000>;
+      clocks = <&k3_clks 116 0>;
+      power-domains = <&k3_pds 116 TI_SCI_PD_EXCLUSIVE>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 613604d2e999..0c6bd9c22b91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22191,6 +22191,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/adc/ti,lmp92064.yaml
 F:	drivers/iio/adc/ti-lmp92064.c
 
+TI MEMORY CYCLIC REDUNDANCY CHECK (MCRC64) DRIVER
+M:	Kamlesh Gurudasani <kamlesh@ti.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/crypto/ti,mcrc64.yaml
+
 TI PCM3060 ASoC CODEC DRIVER
 M:	Kirill Marinushkin <kmarinushkin@birdec.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)

-- 
2.34.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
