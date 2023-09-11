Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D0E79A7D1
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Sep 2023 14:04:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0BD2C6B472;
	Mon, 11 Sep 2023 12:04:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFFF7C6B46F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Sep 2023 12:04:47 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38B9Sv7f023324; Mon, 11 Sep 2023 14:04:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=QNEkYKRW+zpzx0P74SNWmpxXLHw8AgBvEDWW0I7ar5k=; b=tc
 XlTbGRh77bplTRCiH7tozCkD58C5zQggHRoPi7zhQ+f6NzjMX7/UizdwzHXLiswZ
 Nb+wl7R5LWKo10c5xnsG0j7ezKnIkGR0QWbqRkxUB8RPyoERXMmUeCHTEQgdN5yu
 a/bNkg0VJgHF8xhZfja8UG/jbPAJHrx60vczMCbiZMNljlKwQveZHeL9OaB/SiCs
 KBYd/I/nZa0gAWz0Q58BsRM+XAFTo8ckqjpELBLQ0S2NcTHVCiKfVBIR3vBLuu9l
 Ny0oGZEK0z8/KexsatHY/jufQ2grovpJSjiNH3JCQF4W8H+v2gAn/i0bpbOlwqKM
 4+ah6DXUyVu+cXr1DYYg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t0g21ywgc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Sep 2023 14:04:36 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 239ED10005A;
 Mon, 11 Sep 2023 14:04:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 18F51252259;
 Mon, 11 Sep 2023 14:04:36 +0200 (CEST)
Received: from localhost (10.201.20.32) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 14:04:35 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
To: Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 11 Sep 2023 14:02:03 +0200
Message-ID: <20230911120203.774632-11-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230911120203.774632-1-gatien.chevallier@foss.st.com>
References: <20230911120203.774632-1-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.32]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_06,2023-09-05_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 10/10] ARM: dts: stm32: add RNG node for
	STM32MP13x platforms
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

The RNG on STM32MP13 offers upgrades like customization of its
configuration and the conditional reset.

The hardware RNG should be managed in the secure world for but it
is supported on Linux. Therefore, is it not default enabled.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index ac90fcbf0c09..39db82b782eb 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -1220,6 +1220,14 @@ mdma: dma-controller@58000000 {
 			dma-requests = <48>;
 		};
 
+		rng: rng@54004000 {
+			compatible = "st,stm32mp13-rng";
+			reg = <0x54004000 0x400>;
+			clocks = <&rcc RNG1_K>;
+			resets = <&rcc RNG1_R>;
+			status = "disabled";
+		};
+
 		fmc: memory-controller@58002000 {
 			compatible = "st,stm32mp1-fmc2-ebi";
 			reg = <0x58002000 0x1000>;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
