Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6A3828273
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jan 2024 09:52:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E41C6C6B476;
	Tue,  9 Jan 2024 08:52:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 709DAC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jan 2024 08:52:30 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4091jq4w024217; Tue, 9 Jan 2024 09:52:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=5Oo8wwDF2ot9543kBHex9kqdtoI0Sa/P3KlWaqM2WfM=; b=Ez
 GvmRZ2U6sXI42Rh25eXsB00p7BAqhlq4RllDTlNQG5zeviNIXU5rYGqqQzp5Ev19
 f2lKWDzziB2yVfrLfc3bO4glDPWcqbblGJI78e3C/d+v5dlARr3//qWO7b3bzUU2
 lEH0MJAD6/KF0f/IAid9+us8+cjfSHLHIxXaaWrFJwMYbalBN1fa9aQ8EsfuRP9/
 /Npd2N9VP4kfz01YR9HVBE7UupJ8FjjOU5znofphGWWMEwT1VIH+AFpBterrGhDO
 KDrsU92pjJG4G8PVNsmm/d4nWZ00wpwm99mHftWZIbw6AptdeSAeR5Uu79af8AbQ
 c70AyS/f9bcT/LjJ3MVw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vfha4ghaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jan 2024 09:52:03 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B3DFC100049;
 Tue,  9 Jan 2024 09:52:00 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A875722FA49;
 Tue,  9 Jan 2024 09:52:00 +0100 (CET)
Received: from localhost (10.201.20.120) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 9 Jan
 2024 09:52:00 +0100
From: Hugues Fruchet <hugues.fruchet@foss.st.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Benjamin Mugnier
 <benjamin.mugnier@foss.st.com>, Heiko Stuebner <heiko@sntech.de>, Mauro
 Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>
Date: Tue, 9 Jan 2024 09:51:51 +0100
Message-ID: <20240109085155.252358-2-hugues.fruchet@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240109085155.252358-1-hugues.fruchet@foss.st.com>
References: <20240109085155.252358-1-hugues.fruchet@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>, Adam Ford <aford173@gmail.com>,
 Marco Felsch <m.felsch@pengutronix.de>
Subject: [Linux-stm32] [PATCH v6 1/5] dt-bindings: media: Document STM32MP25
	VDEC & VENC video codecs
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

Add STM32MP25 VDEC video decoder & VENC video encoder bindings.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
---
 .../media/st,stm32mp25-video-codec.yaml       | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/st,stm32mp25-video-codec.yaml

diff --git a/Documentation/devicetree/bindings/media/st,stm32mp25-video-codec.yaml b/Documentation/devicetree/bindings/media/st,stm32mp25-video-codec.yaml
new file mode 100644
index 000000000000..e167e3b1bec3
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/st,stm32mp25-video-codec.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/st,stm32mp25-video-codec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32MP25 VDEC video decoder & VENC video encoder
+
+maintainers:
+  - Hugues Fruchet <hugues.fruchet@foss.st.com>
+
+description:
+  The STMicroelectronics STM32MP25 SOCs embeds a VDEC video hardware
+  decoder peripheral based on Verisilicon VC8000NanoD IP (former Hantro G1)
+  and a VENC video hardware encoder peripheral based on Verisilicon
+  VC8000NanoE IP (former Hantro H1).
+
+properties:
+  compatible:
+    enum:
+      - st,stm32mp25-vdec
+      - st,stm32mp25-venc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    video-codec@580d0000 {
+        compatible = "st,stm32mp25-vdec";
+        reg = <0x580d0000 0x3c8>;
+        interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&ck_icn_p_vdec>;
+    };
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
