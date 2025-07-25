Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A42CFB11B99
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Jul 2025 12:07:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C21B7C3F92E;
	Fri, 25 Jul 2025 10:07:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA9BAC3F92E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Jul 2025 10:07:10 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P9SFdu023018;
 Fri, 25 Jul 2025 12:06:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 f5aImXme3gOQU/pOSB7kqei5E9wyfdYQvACc7haullE=; b=k4z1YSuJwnBkaaRf
 5e9VqwahfNq2FQ18BP7SCTOfBYI9XIxroqtNMLVBTcV0+3BpgDboJENte2yy5TAE
 EwfXciyS/CjAzBLmVx6yk0qTKFSxi+ycJn+5EOMkRRf3EY70BNMoXqsPTWnybtJE
 39RkU6Wpz3K2B2q1lvwhMM0zyspkWlhA3OvMJGGTcHphIxB2JgwYILzuI49ayt68
 Fd9eNSZDrBbPdVM10d1rpud7dEt9h7Oj0u6F4kj3E3gMNYxeMtg0uAN2kH/2gBWW
 Tzg9M5rUHL7FJmAZpWcTdBAt7VX9s/ss++PHLlAXRYCV8ieC2lET/XlLysKnHWMy
 +4FYwg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 483w3m2hcm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Jul 2025 12:06:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5B7464005D;
 Fri, 25 Jul 2025 12:05:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CC12C7A19C2;
 Fri, 25 Jul 2025 12:04:36 +0200 (CEST)
Received: from localhost (10.252.19.90) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 12:04:36 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Fri, 25 Jul 2025 12:04:03 +0200
MIME-Version: 1.0
Message-ID: <20250725-drm-misc-next-v1-11-a59848e62cf9@foss.st.com>
References: <20250725-drm-misc-next-v1-0-a59848e62cf9@foss.st.com>
In-Reply-To: <20250725-drm-misc-next-v1-0-a59848e62cf9@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Christophe Roullier
 <christophe.roullier@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.19.90]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 11/12] arm64: dts: st: enable display support
 on stm32mp257f-ev1 board
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

Enable the following IPs on stm32mp257f-ev1 in order to get display:
   * LTDC
   * LVDS
   * WSVGA LVDS panel (1024x600)
   * Panel LVDS backlight as GPIO backlight
   * ILI2511 i2c touchscreen

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 79 ++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 2f561ad4066544445e93db78557bc4be1c27095a..b324b0c226ddf043e62f01245240f3e8d2b0a53c 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -86,6 +86,43 @@ mm_ospi1: mm-ospi@60000000 {
 			no-map;
 		};
 	};
+
+	panel_lvds: display {
+		compatible = "edt,etml0700z9ndha", "panel-lvds";
+		enable-gpios = <&gpiog 15 GPIO_ACTIVE_HIGH>;
+		backlight = <&panel_lvds_backlight>;
+		power-supply = <&scmi_v3v3>;
+		status = "okay";
+
+		width-mm = <156>;
+		height-mm = <92>;
+		data-mapping = "vesa-24";
+
+		panel-timing {
+			clock-frequency = <54000000>;
+			hactive = <1024>;
+			vactive = <600>;
+			hfront-porch = <150>;
+			hback-porch = <150>;
+			hsync-len = <21>;
+			vfront-porch = <24>;
+			vback-porch = <24>;
+			vsync-len = <21>;
+		};
+
+		port {
+			lvds_panel_in: endpoint {
+				remote-endpoint = <&lvds_out0>;
+			};
+		};
+	};
+
+	panel_lvds_backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&gpioi 5 GPIO_ACTIVE_HIGH>;
+		default-on;
+		status = "okay";
+	};
 };
 
 &arm_wdt {
@@ -183,6 +220,15 @@ imx335_ep: endpoint {
 			};
 		};
 	};
+
+	ili2511: ili2511@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		interrupt-parent = <&gpioi>;
+		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpiog 14 GPIO_ACTIVE_LOW>;
+		status = "okay";
+	};
 };
 
 &i2c8 {
@@ -230,6 +276,39 @@ timer {
 	};
 };
 
+&ltdc {
+	status = "okay";
+
+	port {
+		ltdc_ep0_out: endpoint {
+			remote-endpoint = <&lvds_in>;
+		};
+	};
+};
+
+&lvds {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			lvds_in: endpoint {
+				remote-endpoint = <&ltdc_ep0_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			lvds_out0: endpoint {
+				remote-endpoint = <&lvds_panel_in>;
+			};
+		};
+	};
+};
+
 &rtc {
 	status = "okay";
 };

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
