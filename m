Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 453DB66701E
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jan 2023 11:46:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B4E7C65E55;
	Thu, 12 Jan 2023 10:46:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8DDE9C65E45
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 10:46:31 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30C7gaKt031502; Thu, 12 Jan 2023 11:46:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=knjudRumlSRyotBrdwQs+Czf8QCBps4pPL3XJKzxDtQ=;
 b=c/FSxS7UxvIJ63IRac71CHZW9UNik2UdXRkFYkOjcS68/C3P0gAE/jHVhACbCZ/a8qAs
 yUmdYzF5lk6+w2g1neN4sMuFr8W8hevZ/JVKnRCszsLk23X/45eGEMS/nw4MSXSn1ftu
 KpwGJIWhZWNPH8WikjIRboYHGEX6AArr6cm7joePZ0jIsE6X5TTqz/BKo53N1OXCr6qo
 YKgi6P31XYHtxh3u5sh10ARx78OVBIib5xV9I9b7Memc7Kf3xnMXGXngB/51OSw29IbZ
 LUt8gupSMFm3gBvUnZN+GclIwtUeM0DiiP3reggr8zwG9qEh++yBsy1KbKbCeFyReMMM aQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3n1k43j0bv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 11:46:13 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7F53510002A;
 Thu, 12 Jan 2023 11:46:13 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 782EB214B1C;
 Thu, 12 Jan 2023 11:46:13 +0100 (CET)
Received: from localhost (10.201.20.178) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 12 Jan
 2023 11:46:13 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 12 Jan 2023 11:44:43 +0100
Message-ID: <20230112104446.1140551-9-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230112104446.1140551-1-olivier.moysan@foss.st.com>
References: <20230112104446.1140551-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.178]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_06,2023-01-12_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@dh-electronics.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 08/10] ARM: dts: stm32: adopt generic iio
	bindings for adc channels on dhcom
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

Use STM32 ADC generic bindings instead of legacy bindings on
DHCOM board.

The STM32 ADC specific binding to declare channels has been deprecated,
hence adopt the generic IIO channels bindings, instead.
The STM32MP151 device tree now exposes internal channels using the
generic binding. This makes the change mandatory here to avoid a mixed
use of legacy and generic binding, which is not supported by the driver.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
index c06edd2eacb0..343ceaf8cd96 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
@@ -82,15 +82,19 @@ &adc {
 	status = "okay";
 
 	adc1: adc@0 {
-		st,min-sample-time-nsecs = <5000>;
-		st,adc-channels = <0>;
 		status = "okay";
+		channel@0 {
+			reg = <0>;
+			st,min-sample-time-ns = <5000>;
+		};
 	};
 
 	adc2: adc@100 {
-		st,adc-channels = <1>;
-		st,min-sample-time-nsecs = <5000>;
 		status = "okay";
+		channel@1 {
+			reg = <1>;
+			st,min-sample-time-ns = <5000>;
+		};
 	};
 };
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
