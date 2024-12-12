Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1639EE289
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Dec 2024 10:20:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB3C7C78F71;
	Thu, 12 Dec 2024 09:20:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4EC96C7802C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2024 09:20:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC6PcM0025503;
 Thu, 12 Dec 2024 10:20:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 HjDi2PEX6tMG3AujQ/N2jgctUN3yYamP6j1mFZotwQA=; b=k57Lu+Nkn4AQpLR7
 W12vax/Wj7Ht3/SwpzZX2+QYUOqePP5ge5u2tr9QQOAHRZi8F93fon321x7tdVJ4
 cNE37EIz/MlN9CLwNCKUa4YyFgigJicxUXZBlPqgThqoF7cZAxkdv1wzMsPy8j1M
 rYbm6rkw0YIPAhXxkikbWjdDpXWKqgVB346Qrrt06jfXL5iVnqUb6FNvdsIcH7c4
 zb9MAB0sjoxPhR5HShKdHHtYX7K+jo4OBSgqMbWuEn1jieYgxgNi4tUrsHJ0NNpt
 yGGgEb3tijcqEY4fb69LNl+ZsRXwKFf61VCbfLq7OzrkmdlOzJmfBUMicF//nrqR
 bHeuzQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ftj70qp0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Dec 2024 10:20:09 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8D07F40051;
 Thu, 12 Dec 2024 10:19:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5D3DE24FC03;
 Thu, 12 Dec 2024 10:18:12 +0100 (CET)
Received: from localhost (10.129.178.65) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 12 Dec
 2024 10:18:12 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 12 Dec 2024 10:17:39 +0100
MIME-Version: 1.0
Message-ID: <20241212-csi_dcmipp_mp25-v4-15-fbeb55a05ed7@foss.st.com>
References: <20241212-csi_dcmipp_mp25-v4-0-fbeb55a05ed7@foss.st.com>
In-Reply-To: <20241212-csi_dcmipp_mp25-v4-0-fbeb55a05ed7@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>, Hans
 Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.14.1
X-Originating-IP: [10.129.178.65]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v4 15/15] arm64: dts: st: enable
 imx335/csi/dcmipp pipeline on stm32mp257f-ev1
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

Enable the camera pipeline with a imx335 sensor connected to the
dcmipp via the csi interface.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

---

v2:
  - correct regulators & camera node names
  - removal of powerdown property within imx335 node
  - removal of useless status property within imx335 node
  - correct imx335 reset-gpio polarity
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 85 ++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 6f393b082789..a6a57cbcf730 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -27,6 +27,38 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	clocks {
+		clk_ext_camera: clk-ext-camera {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <24000000>;
+		};
+	};
+
+	imx335_2v9: regulator-2v9 {
+		compatible = "regulator-fixed";
+		regulator-name = "imx335-avdd";
+		regulator-min-microvolt = <2900000>;
+		regulator-max-microvolt = <2900000>;
+		regulator-always-on;
+	};
+
+	imx335_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "imx335-ovdd";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	imx335_1v2: regulator-1v2 {
+		compatible = "regulator-fixed";
+		regulator-name = "imx335-dvdd";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x1 0x0>;
@@ -50,6 +82,40 @@ &arm_wdt {
 	status = "okay";
 };
 
+&csi {
+	vdd-supply =  <&scmi_vddcore>;
+	vdda18-supply = <&scmi_v1v8>;
+	status = "okay";
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+			csi_sink: endpoint {
+				remote-endpoint = <&imx335_ep>;
+				data-lanes = <1 2>;
+				bus-type = <4>;
+			};
+		};
+		port@1 {
+			reg = <1>;
+			csi_source: endpoint {
+				remote-endpoint = <&dcmipp_0>;
+			};
+		};
+	};
+};
+
+&dcmipp {
+	status = "okay";
+	port {
+		dcmipp_0: endpoint {
+			remote-endpoint = <&csi_source>;
+			bus-type = <4>;
+		};
+	};
+};
+
 &ethernet2 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&eth2_rgmii_pins_a>;
@@ -81,6 +147,25 @@ &i2c2 {
 	i2c-scl-falling-time-ns = <13>;
 	clock-frequency = <400000>;
 	status = "okay";
+
+	imx335: camera@1a {
+		compatible = "sony,imx335";
+		reg = <0x1a>;
+		clocks = <&clk_ext_camera>;
+		avdd-supply = <&imx335_2v9>;
+		ovdd-supply = <&imx335_1v8>;
+		dvdd-supply = <&imx335_1v2>;
+		reset-gpios = <&gpioi 7 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
+
+		port {
+			imx335_ep: endpoint {
+				remote-endpoint = <&csi_sink>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <594000000>;
+			};
+		};
+	};
 };
 
 &i2c8 {

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
