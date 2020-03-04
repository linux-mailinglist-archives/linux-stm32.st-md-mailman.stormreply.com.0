Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB8B178C48
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Mar 2020 09:10:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B407EC36B0B;
	Wed,  4 Mar 2020 08:10:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F0F8C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Mar 2020 08:10:25 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02487rck032634; Wed, 4 Mar 2020 09:10:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=9+Gur4liQxZrb9Zq6YHMLRkrSMJr+7zsVz7UDw2bPG8=;
 b=q9IMOaqvtnNPcV8kSycSRkPVCm0vA3gqtvkWM5uqnE7hGaAj2Q5xtiYVNnE6HnnwUt8o
 jZqcvPcYTNl+nwB/iIXnkBeIOqPu7mLU1D5AFYcnpCC0iaGOyxX5xmEe17i39uaPuUxi
 oNkTOeN9FXi33XdUMoyA6zWY079DKnsLTWuwf/V2/MOaj/+EunG1G/g88EQNdnaLRsdp
 B1Yfkw6q6w7atnZWZzPiGZw2qbhYK0SMvrgmZIlBOGTlD87fO7BCj0QSiWxB1ppb+roY
 kBJusWnBpZNyjXraXxf7YTUa3Eqa0xMIPyjPhQdrYson5R5jWnYPjjcrC/o9Xnk/ZM0H 5Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yfem0ybx6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Mar 2020 09:10:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 70A1110003E;
 Wed,  4 Mar 2020 09:10:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6361821FE85;
 Wed,  4 Mar 2020 09:10:07 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 4 Mar 2020 09:10:06 +0100
From: Yann Gautier <yann.gautier@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Wed, 4 Mar 2020 09:09:55 +0100
Message-ID: <20200304080956.7699-3-yann.gautier@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200304080956.7699-1-yann.gautier@st.com>
References: <20200304080956.7699-1-yann.gautier@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-04_01:2020-03-03,
 2020-03-04 signatures=0
Subject: [Linux-stm32] [PATCH 2/3] ARM: dts: stm32: add disable-wp property
	for SD-card on STM32MP1 boards
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

On STM32MP1 DK1, DK2, ED1 and EV1 boards, there is only a micro SD socket.
This is also the case on Avenger board.
They don't support the Write Protect pin.
The disable-wp is then added in the SD-cards sdmmc1 nodes.
This avoids executing some code and a warning during driver probe.

Signed-off-by: Yann Gautier <yann.gautier@st.com>
---
 arch/arm/boot/dts/stm32mp157a-avenger96.dts | 1 +
 arch/arm/boot/dts/stm32mp157c-ed1.dts       | 1 +
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi      | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
index 2bdfab192a39..8e060219751b 100644
--- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
+++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
@@ -301,6 +301,7 @@
 	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
 	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
 	cd-gpios = <&gpioi 8 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+	disable-wp;
 	st,sig-dir;
 	st,neg-edge;
 	st,use-ckin;
diff --git a/arch/arm/boot/dts/stm32mp157c-ed1.dts b/arch/arm/boot/dts/stm32mp157c-ed1.dts
index 5daaec3aec9b..6f8d23a7d4a6 100644
--- a/arch/arm/boot/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ed1.dts
@@ -314,6 +314,7 @@
 	pinctrl-1 = <&sdmmc1_b4_od_pins_a &sdmmc1_dir_pins_a>;
 	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a &sdmmc1_dir_sleep_pins_a>;
 	cd-gpios = <&gpiog 1 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+	disable-wp;
 	st,sig-dir;
 	st,neg-edge;
 	st,use-ckin;
diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
index 02d52eb3c34f..6897119cadc9 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
@@ -480,6 +480,7 @@
 	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
 	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
 	cd-gpios = <&gpiob 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+	disable-wp;
 	st,neg-edge;
 	bus-width = <4>;
 	vmmc-supply = <&v3v3>;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
