Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CADAD3CDE
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Jun 2025 17:24:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2816BC3F949;
	Tue, 10 Jun 2025 15:24:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81083C3F93D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jun 2025 15:24:55 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLFJT028167;
 Tue, 10 Jun 2025 17:24:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 zgHCfxHCSrQZLBdhcD+8YVibXqq6yEAZb7msrNjGwik=; b=gbFNVWnDU5B4VYPw
 JLXZoZjW3QzBbTMtKQGrMLN+zbOs3B6+9b0IDIO19iZTL1e2CxTbdN/2zdpPxZEi
 HI9bKSS/7sm/Ne0h6uxWzB4t85pLsNtIM8phH2b+i3tix+fF1OFA8lSE3pZ3LM5w
 5TwSqLVCMxxyc8f0zyLHeM+EbqZ1E1+MDmgY2YFSu2tygqt/LE/kFVPQSiSgP0eY
 /0Q7kQGxQcx7H75ZQghOm95AmCAbfBJkqa/hdEhkjW8n7RYRSxHjHWxBIJjatmUX
 JCjrR4sggFJZdm5lyi7p2Yc7ZSZ/+TINYtgM+tQ2tOttYDoynbmBqToisXisUOLG
 ChaC7A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs2nueh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jun 2025 17:24:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 443BF40052;
 Tue, 10 Jun 2025 17:23:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8B5BEB79BA8;
 Tue, 10 Jun 2025 17:23:14 +0200 (CEST)
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
Date: Tue, 10 Jun 2025 17:23:07 +0200
Message-ID: <20250610152309.299438-4-antonio.borneo@foss.st.com>
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
Subject: [Linux-stm32] [RESEND PATCH v2 3/5] ARM: dts: stm32: Add pinmux for
	CM4 leds pins
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

The GPIO H7 on boards stm32mp15xx-dkx and the GPIO D8 on boards
stm32mp15xx-ed1 are used by the coprocessor Cortex-M4.
Linux running on Cortex-A should not use the GPIO and should left
it available for the coprocessor.

Add two pinmux groups, one for each families of boards, setting
the GPIO function as Reserved (RSVD).

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
index 40605ea85ee1d..835b034d0aa7e 100644
--- a/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
@@ -1304,6 +1304,20 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	m4_leds_orange_pins_a: m4-leds-orange-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 7, RSVD)>;
+		};
+	};
+
+	/omit-if-no-ref/
+	m4_leds_orange_pins_b: m4-leds-orange-1 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 8, RSVD)>;
+		};
+	};
+
 	/omit-if-no-ref/
 	mco1_pins_a: mco1-0 {
 		pins {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
