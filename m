Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA3973B998
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jun 2023 16:13:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44646C65E58;
	Fri, 23 Jun 2023 14:13:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A4F5C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 14:13:40 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35ND3Ss3032052; Fri, 23 Jun 2023 16:13:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=n7CnWGQap5G34zSVoJPQnyZJhA8mpXd2NmvWCwOewAw=;
 b=XtZ1w1ERDw5a3hKxJ6p8KQ0X9vB4G+cNJoItjibOB/BCZwEPFxr6TQXOTUmpsQ+svapw
 AWhB7meZjZTrzpc9zozV0ViwUAd9rn1gdCJCs5olaXmGSMdob2w2mQ9j0+nS01pAyqLY
 cIxppKbSneGlJ8NQz8nO0UEMi3yfkYgsxf39Ui7tzuQDc2AoyZn6mH8WMi32WtCt75Bq
 4z8TwRxTDl8fXbIBNmssdHDllVOM4877qOXjfSqxVV6OgatmmfT57ZycsMrYNxnWK57n
 lOK3ozRZf8wTvkODFQ81jGpUyDawj2ijDRtC3b4kOzkMqPt4a8UsLJlt6g0d7PiU89jI eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rd6mab0tg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jun 2023 16:13:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0917310002A;
 Fri, 23 Jun 2023 16:13:32 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 012E322D170;
 Fri, 23 Jun 2023 16:13:32 +0200 (CEST)
Received: from localhost (10.252.5.198) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 23 Jun
 2023 16:13:31 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Fri, 23 Jun 2023 16:09:43 +0200
Message-ID: <20230623140944.2613002-8-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230623140944.2613002-1-olivier.moysan@foss.st.com>
References: <20230623140944.2613002-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.5.198]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-23_08,2023-06-22_02,2023-05-22_02
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [RFC PATCH 7/7] ARM: dts: stm32: add dfsdm iio
	suppport
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

This DT is an example of backend iio device use for STM32 DFSDM.
DFSDM filter0 has a single input channel, while filter1 is configured
for scan mode with two input channels.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 arch/arm/boot/dts/stm32mp157c-ev1.dts | 62 +++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index ba8e9d9a42fa..ebd67a219df2 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -73,6 +73,24 @@ panel_backlight: panel-backlight {
 		default-on;
 		status = "okay";
 	};
+
+	sd_adc0: simple-sd-adc0 {
+		compatible = "sd-modulator";
+		io-backend-cells = <0>;
+		vref-supply = <&v3v3>;
+	};
+
+	sd_adc1: simple-sd-adc1 {
+		compatible = "sd-modulator";
+		io-backend-cells = <0>;
+		vref-supply = <&v3v3>;
+	};
+
+	sd_adc2: simple-sd-adc2 {
+		compatible = "sd-modulator";
+		io-backend-cells = <0>;
+		vref-supply = <&v3v3>;
+	};
 };
 
 &cec {
@@ -99,6 +117,50 @@ dcmi_0: endpoint {
 	};
 };
 
+&dfsdm {
+	spi-max-frequency = <2048000>;
+
+	clocks = <&rcc DFSDM_K>, <&rcc ADFSDM_K>;
+	clock-names = "dfsdm", "audio";
+	status = "disabled";
+
+	dfsdm0: filter@0 {
+		compatible = "st,stm32-dfsdm-adc";
+		st,filter-order = <3>;
+		status = "okay";
+
+		channel@1 {
+			reg = <1>;
+			label = "in1";
+			st,adc-channel-types = "SPI_R";
+			st,adc-channel-clk-src = "CLKOUT";
+			io-backend = <&sd_adc0>;
+		};
+	};
+
+	dfsdm1: filter@1 {
+		compatible = "st,stm32-dfsdm-adc";
+		st,filter-order = <3>;
+		status = "okay";
+
+		channel@2 {
+			reg = <2>;
+			label = "in2";
+			st,adc-channel-types = "SPI_R";
+			st,adc-channel-clk-src = "CLKOUT";
+			io-backend = <&sd_adc1>;
+		};
+
+		channel@3 {
+			reg = <3>;
+			label = "in3";
+			st,adc-channel-types = "SPI_F";
+			st,adc-channel-clk-src = "CLKOUT";
+			io-backend = <&sd_adc2>;
+		};
+	};
+};
+
 &dsi {
 	phy-dsi-supply = <&reg18>;
 	status = "okay";
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
