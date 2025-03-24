Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9237A6D7BC
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Mar 2025 10:43:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81969C7802F;
	Mon, 24 Mar 2025 09:43:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CFD0C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 09:43:21 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O9bkhv012912;
 Mon, 24 Mar 2025 10:42:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 NzLmfHxTjgjzxH2MLhlvyo1SC7eJ5Hj+e6zOGJcJg9E=; b=RjZcSVc6/aR2sEEY
 p3+BtYB+Ow7xIIr5Zlmif8LHp0BXyL7U/CXvQCDlo3ElPwrs6FqMnlWzmcXm1DPK
 rH0kQ3KIL+8NjPBh+buHONUDAD1JKonPfsTnn2Xv+RlWegZzs4TGw4zdWTOJ1qe8
 t2VkWPdFcgkBHkI+9s41y6qim0O39+VTOlbLMZ6U7Kxcp+Zyn5EToWLu6Hoo7cHj
 Mkipvnv1f4yVJUmwaGp9h0OVk+pTJqI7d8fpXiJM1zkejYnwv8yBcfgqd4qLy0uT
 MjO2zzu1L/5TGYKx3FnEDJAcfUG2pfccNb82WW8acU/FxPA7qGYGGDT6x51S+tHl
 VwAJMw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45hne56t0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Mar 2025 10:42:59 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E3C6C400DB;
 Mon, 24 Mar 2025 10:41:40 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CA1817DCB33;
 Mon, 24 Mar 2025 10:40:16 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Mar
 2025 10:40:16 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Mon, 24 Mar 2025 10:40:13 +0100
MIME-Version: 1.0
Message-ID: <20250324-upstream_ospi_required_resets-v2-1-85a48afcedec@foss.st.com>
References: <20250324-upstream_ospi_required_resets-v2-0-85a48afcedec@foss.st.com>
In-Reply-To: <20250324-upstream_ospi_required_resets-v2-0-85a48afcedec@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/2] spi: dt-bindings: st,
 stm32mp25-ospi: Make "resets" a required property
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

On STM32MP2x SoC's family, OSPI is child of Octo Memory Manager which
must have asccess to OSPI's reset to ensure its initialization.
Make "resets" a required property.

Fixes: bed97e35786a ("dt-bindings: spi: Add STM32 OSPI controller")
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml b/Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml
index 5f276f27dc4c1fd2056f129cafc1005eaee8008f..272bc308726b2dfdf3ec80740d70e0fd1bfc4fea 100644
--- a/Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml
+++ b/Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml
@@ -68,6 +68,7 @@ required:
   - compatible
   - reg
   - clocks
+  - resets
   - interrupts
   - st,syscfg-dlyb
 

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
