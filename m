Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAD7AD3CDB
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Jun 2025 17:24:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB332C3F93D;
	Tue, 10 Jun 2025 15:24:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF75DC3F93D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jun 2025 15:24:54 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLFRk012963;
 Tue, 10 Jun 2025 17:24:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 6jFgEWw4ARwHHobxDSziy501YUd5MUew54ky5yZYuxs=; b=fRIBy1BxcpFxUqXZ
 zFzb+4hJFSEaZOpDRM+1lBrH+cRSNV1X52Jit1DkbvovitiXs6S4q5NAgdcI+nNI
 /dv13hLMhWOkVSUUQxAvyAQtzZ13rbxKZyzudUcD/rJVzbGbVBxAlnsx/2BJtLl0
 kEISu9Ow4LKrqXAS7xN2MBZ01GsDt9iOF+KNhmu8D+WxB/4wiYF1rHpuIpyrRNGA
 AZ29Zl5vVTthSC1xV5sevT4ObOStkC9HQtrI//yzLL4wa4fuvL+bB69YMIVJJj2L
 MMiVA3vT4nSvphcQn84rUh/bSA8r9+Nq4Y7cvnjcf0NDsfg+RLnRwkqbQNqK9a2Y
 DGR3cw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474aume5nh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jun 2025 17:24:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C9E4A40055;
 Tue, 10 Jun 2025 17:23:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1ED6DB79BAB;
 Tue, 10 Jun 2025 17:23:15 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 17:23:14 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Tue, 10 Jun 2025 17:23:08 +0200
Message-ID: <20250610152309.299438-5-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610152309.299438-1-antonio.borneo@foss.st.com>
References: <20250610152309.299438-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.132]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_07,2025-06-10_01,2025-03-28_01
Cc: linux-arm-kernel@lists.infradead.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [Linux-stm32] [RESEND PATCH v2 4/5] ARM: dts: stm32: Add leds for
	CM4 on stm32mp15xx-ed1 and stm32mp15xx-dkx
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

Add to the node m4_rproc the pinctrl property corresponding to the
orange LED.
The GPIO is reserved for the coprocessor Cortex-M4 and will be
ignored by Linux.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts  | 2 ++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
index 9cf5ed111b52e..f6c478dbd0418 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
@@ -328,6 +328,8 @@ &m4_rproc {
 			<&vdev0vring1>, <&vdev0buffer>;
 	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
 	mbox-names = "vq0", "vq1", "shutdown", "detach";
+	pinctrl-names = "default";
+	pinctrl-0 = <&m4_leds_orange_pins_b>;
 	interrupt-parent = <&exti>;
 	interrupts = <68 1>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index a5511b1f0ce30..26f36a232d42d 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -479,6 +479,8 @@ &m4_rproc {
 			<&vdev0vring1>, <&vdev0buffer>;
 	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
 	mbox-names = "vq0", "vq1", "shutdown", "detach";
+	pinctrl-names = "default";
+	pinctrl-0 = <&m4_leds_orange_pins_a>;
 	interrupt-parent = <&exti>;
 	interrupts = <68 1>;
 	status = "okay";
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
