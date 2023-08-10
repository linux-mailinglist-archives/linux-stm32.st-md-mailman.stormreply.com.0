Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E649B78472F
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:25:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9EC5C6C84D;
	Tue, 22 Aug 2023 16:25:20 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBF51C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 19:29:50 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37AJTXEl014293;
 Thu, 10 Aug 2023 14:29:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1691695773;
 bh=lGqX1kNuw/bIIn91AVvS6yetet/Ki0uuXEkiyMlh1QQ=;
 h=From:Date:Subject:References:In-Reply-To:To:CC;
 b=kSFKPKLp3FORdxg/QQuG2GWduJQOmll0is5Q11L652oWoNzjk9tDjQR+y3yLUI1xj
 NMoCGoKBXNH1bkS4va0q96hDhk8cniFO2FRsXDOEPJAWOZ+e8JDeifJPuinkyjvBrM
 m0eg9aErIQ4+/ZMrSpi4NEs4nO4cbPGFklk8UXnI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37AJTXX2008397
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Aug 2023 14:29:33 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 10
 Aug 2023 14:29:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 10 Aug 2023 14:29:33 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37AJTWZ0021412;
 Thu, 10 Aug 2023 14:29:33 -0500
From: Kamlesh Gurudasani <kamlesh@ti.com>
Date: Fri, 11 Aug 2023 00:58:50 +0530
MIME-Version: 1.0
Message-ID: <20230719-mcrc-upstream-v2-3-4152b987e4c2@ti.com>
References: <20230719-mcrc-upstream-v2-0-4152b987e4c2@ti.com>
In-Reply-To: <20230719-mcrc-upstream-v2-0-4152b987e4c2@ti.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller"
 <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691695767; l=2556;
 i=kamlesh@ti.com; s=20230614; h=from:subject:message-id;
 bh=/LLW6Kt8hKHcCDBDMh4ZLatVHlvY99JTcrS11iXF92Q=;
 b=QAiGHrrUXCFcvkOJiB1SjSy/6++4XYHeiT8zb0bOyW48+JCWXp80jbX3m93QwhnqWPI9h7hI7
 IXdAfwnI9YdBIHWUapCYudmteTuxXBb8HzKSCJxrdlKb8rTf3TjB1Aq
X-Developer-Key: i=kamlesh@ti.com; a=ed25519;
 pk=db9XKPVWDGJVqj2jDqgnPQd6uQf3GZ3oaQa4bq1odGo=
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Tue, 22 Aug 2023 16:24:59 +0000
Cc: devicetree@vger.kernel.org, Kamlesh Gurudasani <kamlesh@ti.com>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/6] dt-bindings: crypto: Add Texas
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
 Documentation/devicetree/bindings/crypto/ti,mcrc64.yaml | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                                             |  5 +++++
 2 files changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/ti,mcrc64.yaml b/Documentation/devicetree/bindings/crypto/ti,mcrc64.yaml
new file mode 100644
index 000000000000..38bc7efebd68
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/ti,mcrc64.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/ti,mcrc64.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments MCRC64
+
+description: The MCRC64 engine calculates 64-bit cyclic redundancy checks
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
index 02a3192195af..66b51f43d196 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21481,6 +21481,11 @@ S:	Maintained
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
