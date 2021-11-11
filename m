Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6065544D961
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Nov 2021 16:46:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17D5AC5EC72;
	Thu, 11 Nov 2021 15:46:08 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F8F3C5EC70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Nov 2021 15:46:06 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 t5-20020a17090a4e4500b001a0a284fcc2so4929483pjl.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Nov 2021 07:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IHt50f9mlyj2/SGCeb4ttMHVOWoii0nmE+uZwCQwvss=;
 b=pJ+aj0QcW5CArcwgJ/NlNf7LjHw/5Dte0pH8KK1eCFpa3e3bzsXEOjr0mZfAd97E87
 wneccpy8j5SVG3wQuitDaYXf3q+k4h3nGJYGTDSsR/tMAZyDl4IFpSOQvlzkInw3kAR2
 Md4gPyfxT+6FZ+yPkZo0DiItVLsxp4GaQPqB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IHt50f9mlyj2/SGCeb4ttMHVOWoii0nmE+uZwCQwvss=;
 b=i03ajPh40hOlW8JmSgRBj/4I3uwR77X9mv7A/aOiGS5jjwd8zFEIIMQfyjzI8SpYvu
 k22qi4tBXXn0Z8S9DYV8IDA25N8zgH5qPBYDEa3p0HJBbVDa/bgONsfrKLWtiUN+2EG7
 HK8tLv3wrPfqLBhU1K98ce7dzcT+OJWxv1tujDmW6m7KMbixXl6RA0jy1wy5OR+5MaPw
 syfpngVeUhzZgN/Mjq0X1pjfeuT8BUXCyUxnt+Vb3QYqWu4HTwZBIOA/kTeQ20Q1wdKt
 K8V9NvJCEHykUbKnz3XHyuiCWitw3eiRwZ+xMkucAjWi9YBP1Qii0ny/OiPdhNEQv/p/
 wZDg==
X-Gm-Message-State: AOAM531ZIlL4zuOivAaJmURmfSFqYscAc7wXv2FvJdnETnZ6dLbGYP1w
 ILK9Cb+5i77Io1iozfqX75fsYw==
X-Google-Smtp-Source: ABdhPJxC6ZgyozJNOpUT/48/RGwMj3ZvL6O5TXHm+OR45a6ap3fs4/22wlkQl/SgvLOHLCzAQ+3q/Q==
X-Received: by 2002:a17:90a:17a5:: with SMTP id
 q34mr27153922pja.122.1636645564865; 
 Thu, 11 Nov 2021 07:46:04 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:3041:135c:4e21:846c])
 by smtp.gmail.com with ESMTPSA id m15sm2782122pjf.49.2021.11.11.07.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 07:46:04 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 11 Nov 2021 21:15:55 +0530
Message-Id: <20211111154557.852637-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/3] ARM: dts: stm32: Enable LVDS panel on
	i.Core STM32MP1 EDIMM2.2
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

Engicam i.Core STM32MP1 EDIMM2.2 Starter Kit has plugged with
7" LVDS panel.

Engicam i.Core STM32MP1 SoM has SN65DSI84 DSI to LVDS bridge.

This patch adds a display pipeline to connect DSI to SN65DSI84
to 7" LVDS panel.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../stm32mp157a-icore-stm32mp1-edimm2.2.dts   | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
index ec9f1d1cd50f..d80b4415e761 100644
--- a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
+++ b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
@@ -24,6 +24,91 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&gpiod 13 GPIO_ACTIVE_HIGH>;
+		default-on;
+	};
+
+	panel {
+		compatible = "yes-optoelectronics,ytc700tlag-05-201c";
+		backlight = <&backlight>;
+		power-supply = <&v3v3>;
+
+		port {
+			panel_out_bridge: endpoint {
+				remote-endpoint = <&bridge_out_panel>;
+			};
+		};
+	};
+};
+
+&dsi {
+	status = "okay";
+	phy-dsi-supply = <&reg18>;
+
+	ports {
+		port@0 {
+			reg = <0>;
+			dsi_in_ltdc: endpoint {
+				remote-endpoint = <&ltdc_out_dsi>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dsi_out_bridge: endpoint {
+				remote-endpoint = <&bridge_in_dsi>;
+			};
+		};
+	};
+};
+
+&i2c6 {
+	i2c-scl-falling-time-ns = <20>;
+	i2c-scl-rising-time-ns = <185>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c6_pins_a>;
+	pinctrl-1 = <&i2c6_sleep_pins_a>;
+	status = "okay";
+
+	bridge@2c {
+		compatible = "ti,sn65dsi84";
+		reg = <0x2c>;
+		enable-gpios = <&gpiof 15 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				bridge_in_dsi: endpoint {
+					remote-endpoint = <&dsi_out_bridge>;
+					data-lanes = <0 1>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				bridge_out_panel: endpoint {
+					remote-endpoint = <&panel_out_bridge>;
+				};
+			};
+		};
+	};
+};
+
+&ltdc {
+	status = "okay";
+
+	port {
+		ltdc_out_dsi: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&dsi_in_ltdc>;
+		};
+	};
 };
 
 &sdmmc1 {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
