Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB56577395B
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Aug 2023 11:32:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B648C6B469;
	Tue,  8 Aug 2023 09:32:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CB4BC6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Aug 2023 09:32:04 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3788jJI3008038; Tue, 8 Aug 2023 11:31:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=M+IuYoEUiyN+G/GS5dPfHhgm4XbDSRY/d6hoesq7He4=; b=GF
 gdqTeegucgb8ERKFBUsDKK87BQ/6zrK/DlxOS00ecMz71JY8vlWha2ZrLV1CNUu7
 gn6e3Od8a+/Q1DSoCm0PAxvT98C9HmpguMJ3BrJeu1BaetHOE6RDLjF3SUXcjyia
 CKzKRyUGRYrcOZOGhxh4G2f7YCvwswU0WwS0o4I6h85Qlwo0dS6eXt80uTPzPUM9
 nZ6bblRnyjiuNKjeM88ebg09GWO0mNAAhDPzwnO3e25j4kO7/GzswCWb6feAh63B
 5i9Z3Vvm7eP1kO/I/el6Hkm88kLr/bwxpw5XBJ5++DZ9yRB47ALqLir+foM+7O0d
 a/sHjUaHKEF5+oUpnlAg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sbjfn09nr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Aug 2023 11:31:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 90EAA100063;
 Tue,  8 Aug 2023 11:31:40 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 86EE0216850;
 Tue,  8 Aug 2023 11:31:40 +0200 (CEST)
Received: from localhost (10.201.20.38) by EQNDAG1NODE4.st.com (10.75.129.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 8 Aug
 2023 11:31:40 +0200
From: <patrice.chotard@foss.st.com>
To: <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, <alexandre.torgue@foss.st.com>
Date: Tue, 8 Aug 2023 11:31:19 +0200
Message-ID: <20230808093119.714224-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230808093119.714224-1-patrice.chotard@foss.st.com>
References: <20230808093119.714224-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-08_08,2023-08-03_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2/2] ARM: dts: stm32: Add gpio-ranges for
	stm32f769-pinctrl
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

Since commit 913a956c4363 ("pinctrl: stm32: use dynamic allocation
of GPIO base"), it's impossible to retrieve gpios from phandle,
for example, mmc driver can't retrieve cd-gpios.
Add missing gpio-ranges properties to fix it.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32f769-pinctrl.dtsi | 44 +++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32f769-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32f769-pinctrl.dtsi
index c26abc04e2ce..02c2a8b08468 100644
--- a/arch/arm/boot/dts/st/stm32f769-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32f769-pinctrl.dtsi
@@ -8,4 +8,48 @@
 
 &pinctrl {
 	compatible = "st,stm32f769-pinctrl";
+
+	gpioa: gpio@40020000 {
+		gpio-ranges = <&pinctrl 0 0 16>;
+	};
+
+	gpiob: gpio@40020400 {
+		gpio-ranges = <&pinctrl 0 16 16>;
+	};
+
+	gpioc: gpio@40020800 {
+		gpio-ranges = <&pinctrl 0 32 16>;
+	};
+
+	gpiod: gpio@40020c00 {
+		gpio-ranges = <&pinctrl 0 48 16>;
+	};
+
+	gpioe: gpio@40021000 {
+		gpio-ranges = <&pinctrl 0 64 16>;
+	};
+
+	gpiof: gpio@40021400 {
+		gpio-ranges = <&pinctrl 0 80 16>;
+	};
+
+	gpiog: gpio@40021800 {
+		gpio-ranges = <&pinctrl 0 96 16>;
+	};
+
+	gpioh: gpio@40021c00 {
+		gpio-ranges = <&pinctrl 0 112 16>;
+	};
+
+	gpioi: gpio@40022000 {
+		gpio-ranges = <&pinctrl 0 128 16>;
+	};
+
+	gpioj: gpio@40022400 {
+		gpio-ranges = <&pinctrl 0 144 16>;
+	};
+
+	gpiok: gpio@40022800 {
+		gpio-ranges = <&pinctrl 0 160 8>;
+	};
 };
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
