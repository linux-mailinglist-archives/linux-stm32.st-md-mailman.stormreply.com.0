Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4D3706C98
	for <lists+linux-stm32@lfdr.de>; Wed, 17 May 2023 17:25:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 222ABC6B442;
	Wed, 17 May 2023 15:25:34 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32CDAC6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 May 2023 15:25:32 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 27740861BF;
 Wed, 17 May 2023 17:25:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1684337131;
 bh=+xQn6x8oUFrIA0o4ijehWZbii0Ux1WX6Npl6s6lpi9U=;
 h=From:To:Cc:Subject:Date:From;
 b=l6urBZ4SMcI4BejngZtJ0G5pO94CGdyveBtNnnl4HC63RkueHQNCEawW3NrNDhcot
 tsJ/CKu6XzAPPjSrjdYwtva6GGFsCyB6ZPCwD/slA6AfPI7MdG5WPx7LnO15shB0QL
 vspqKgXLqALxk+oulHbvhHXsw20eJ2Lr25oW30sEExqMSeKANzKsrpgkfu5NDUCtKD
 NS8K6P6nftde6z+uAwJ7anvpkJW/dj5x98lAjJYe7v3TY0DpJMFAMB5Ho7U7KgDWoI
 JUV5fo6/23NeR3P9/Go1WaLqfO8N11d77aqiMTtvkG4jM5HlzMYMD9FJ8ziT/IJJrq
 cSQp4oP8aXsaQ==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Wed, 17 May 2023 17:25:11 +0200
Message-Id: <20230517152513.27922-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com
Subject: [Linux-stm32] [PATCH v2 1/3] dt-bindings: nvmem: syscon: Add syscon
	backed nvmem bindings
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

Add trivial bindings for driver which permits exposing syscon backed
register to userspace. This is useful e.g. to expose U-Boot boot
counter on various platforms where the boot counter is stored in
random volatile register, like STM32MP15xx TAMP_BKPxR register.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Marek Vasut <marex@denx.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
V2: Use generic syscon supernode
---
 .../bindings/nvmem/nvmem-syscon.yaml          | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/nvmem-syscon.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/nvmem-syscon.yaml b/Documentation/devicetree/bindings/nvmem/nvmem-syscon.yaml
new file mode 100644
index 0000000000000..7c1173a1a6218
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/nvmem-syscon.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/nvmem-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic syscon backed nvmem
+
+maintainers:
+  - Marek Vasut <marex@denx.de>
+
+allOf:
+  - $ref: "nvmem.yaml#"
+
+properties:
+  compatible:
+    enum:
+      - nvmem-syscon
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        syscon@14c {
+            compatible = "nvmem-syscon";
+            reg = <0x14c 0x4>;
+        };
+    };
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
