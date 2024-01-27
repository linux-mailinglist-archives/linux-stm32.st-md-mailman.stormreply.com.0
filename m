Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF00783EDEC
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Jan 2024 16:29:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73FAAC6DD95;
	Sat, 27 Jan 2024 15:29:03 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 342ABC6DD94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Jan 2024 15:29:02 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2cf588c4dbcso2997571fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Jan 2024 07:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1706369341; x=1706974141;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rQ9PYTfLUcfjyRJqgcRWuTdkFl4CeqFScaddJa4Lyi0=;
 b=lQzYtkZib9abSJySfigEOkllG+5aiAfIvI2jGTYNxSgwnKnNSsikPunHMzL+cBmj4c
 jKa10hOE8LRtDNYY1hnFD2uyPG8Jh2ql/NmQQgZKw6hp6l8uBwQv3J4d+x89eUJwY2nP
 MNLRzd8Wfk1noTQ4tU6uktwW5een4ca5buVwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706369341; x=1706974141;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rQ9PYTfLUcfjyRJqgcRWuTdkFl4CeqFScaddJa4Lyi0=;
 b=LFO/MFFZKecenqyLSMsGpYAZaGBjXR8dRlUMK6itSYn2Xn74+8ms9kqDBfcH+2bXqG
 G3U/IsXvvdboNe88PuNGGwBE5ZMwdmAtsB6kp3twdSDUiXJKQqDAwks9GLcJEwfofgdE
 R3yTgbOJHdOmUMlU85Hr03XXKl5STFDTt7sQcP76i7CPrL66C3Nct28Z/C2XdvR/JHn7
 P4tdnZQQ5eP4qwGN9mPgbHqSQ1bPjFt5QC/4RqlCEsdrCNUqTvrYa1XnVsyasrEWvomS
 vQ0J0hEYEW76DLPEM1OpkKKbzrjNTAzp4vi0xQK48XrEilhhmcE6NtgUC9fL9E9NcUkO
 ZZaQ==
X-Gm-Message-State: AOJu0Ywix+pVFL8sVmdaYYW4tT7F3E6jlV24SCf2htiEjZ+mJTeseSRs
 8+cqh0vT+iR5YJ4YLDli6ul3hWu5vt1zo4FbVt+EBpQR2tcWqwgDTtydlfNLH4E=
X-Google-Smtp-Source: AGHT+IFbqC5mI6d85g/WTmEICTQPFRXc2Q3MZ26rVAnIhbQylAq8FLk78zQxkd8AP9QrJIUphT0u1g==
X-Received: by 2002:a2e:965a:0:b0:2cd:143c:9283 with SMTP id
 z26-20020a2e965a000000b002cd143c9283mr1436284ljh.27.1706369341158; 
 Sat, 27 Jan 2024 07:29:01 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-21-103-141.retail.telecomitalia.it. [79.21.103.141])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a056402344500b0055974a2a2d4sm1745220edc.39.2024.01.27.07.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jan 2024 07:29:00 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sat, 27 Jan 2024 16:28:48 +0100
Message-ID: <20240127152853.65937-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240127152853.65937-1-dario.binacchi@amarulasolutions.com>
References: <20240127152853.65937-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v10 4/5] ARM: dts: stm32: add display support
	on stm32f769-disco
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

The patch adds display support on the stm32f769-disco board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v10:
- Drop backlight. From a closer analysis of the schematics
  en.MB1225-F769I-B01_Schematic.pdf and en.mb1166-default-a09-schematic.pdf,
  it is noticed that the GPIO I14 is connected to an unmounted
  resistor (n/a), making the backlight functionality via GPIO unusable.

Changes in v9:
- Rename panel-dsi@0 to panel@0 to fix yaml warnings

Changes in v8:
- Remove unit name from 'ltdc/port/endpoint@0' to fix the compiling
  warning:
  ../arch/arm/boot/dts/st/stm32f769-disco.dts:189.28-191.5: Warning
  (unit_address_vs_reg): /soc/display-controller@40016800/port/endpoint@0: node
  has a unit name, but no reg or ranges property

 arch/arm/boot/dts/st/stm32f769-disco.dts | 64 +++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32f769-disco.dts b/arch/arm/boot/dts/st/stm32f769-disco.dts
index 660f85984164..52c5baf58ab9 100644
--- a/arch/arm/boot/dts/st/stm32f769-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f769-disco.dts
@@ -41,7 +41,7 @@
  */
 
 /dts-v1/;
-#include "stm32f746.dtsi"
+#include "stm32f769.dtsi"
 #include "stm32f769-pinctrl.dtsi"
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -60,6 +60,19 @@ memory@c0000000 {
 		reg = <0xC0000000 0x1000000>;
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		linux,dma {
+			compatible = "shared-dma-pool";
+			linux,dma-default;
+			no-map;
+			size = <0x100000>;
+		};
+	};
+
 	aliases {
 		serial0 = &usart1;
 	};
@@ -114,6 +127,45 @@ &clk_hse {
 	clock-frequency = <25000000>;
 };
 
+&dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dsi_in: endpoint {
+				remote-endpoint = <&ltdc_out_dsi>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dsi_out: endpoint {
+				remote-endpoint = <&dsi_panel_in>;
+			};
+		};
+	};
+
+	panel0: panel@0 {
+		compatible = "orisetech,otm8009a";
+		reg = <0>; /* dsi virtual channel (0..3) */
+		reset-gpios = <&gpioj 15 GPIO_ACTIVE_LOW>;
+		power-supply = <&vcc_3v3>;
+		status = "okay";
+
+		port {
+			dsi_panel_in: endpoint {
+				remote-endpoint = <&dsi_out>;
+			};
+		};
+	};
+};
+
 &i2c1 {
 	pinctrl-0 = <&i2c1_pins_b>;
 	pinctrl-names = "default";
@@ -122,6 +174,16 @@ &i2c1 {
 	status = "okay";
 };
 
+&ltdc {
+	status = "okay";
+
+	port {
+		ltdc_out_dsi: endpoint {
+			remote-endpoint = <&dsi_in>;
+		};
+	};
+};
+
 &rtc {
 	status = "okay";
 };
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
