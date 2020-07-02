Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 072B3212B32
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Jul 2020 19:26:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C663EC36B27;
	Thu,  2 Jul 2020 17:25:59 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BA0AC36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 17:25:58 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id lx13so12028084ejb.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Jul 2020 10:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zKcCJcC7Q8PJoAnihwGAVpWoMYH3cBF0KesdV2Y/nys=;
 b=FhXBAjOqlpaiC3ecnywt7k95es1/ZcfGA2/Gx5kmRKXUkyFJUnS9n9AKAKBNfVEFZu
 l4kdLm+DrynoKo9ekZIcOqixss6+IcrN03lfi6UVV9JqFh/R1YHSDsOqvy/jfYgCjHKh
 RKiNjq14ffb2BZZmdIxNh86k98oCaLiI8/jFJfWn/roJ6rhoYreJvRlffrGJ9NkM3UUA
 8MgNfuJ+gvf3/B5eXepTWwLdO9ktFHxu2q7QJa6V+y1uAfTJ56RI4kUSD30d4pCKViaA
 u5W5efPo+o5uI3Dkgkuovaxet2I4Nv2SZnvsdV1etAWmRwW/0NCntDejkYeoPlTiLNoC
 cU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zKcCJcC7Q8PJoAnihwGAVpWoMYH3cBF0KesdV2Y/nys=;
 b=Vy6aS/pQwXOKIONYoeg6aLV8e2nPPdWlIklGdpdgTW2ePFiBPgi1YEqyr7rqbsN8KE
 CucEFVgMve9ae+Ex/81JWWVkXpDY8sYqXoPbnbTDAwB2THUB3blSPI8b2k3S0+khCe5R
 EiYjvPsKVb82xyZ+Xnv2b30jio3mxVeFGXVGXZRhk3K9SSc22h1riUia5f+4aTuKcRR7
 kKuJWrbOieOIg4MGdHS50FovPG7SIOmywnCNjyKo0whm5zyCyOmz1+HTm8aeeOWfiiDN
 dgd8ZrYZlUhaa4YsK1HMw9hR37a4jmEdK3kAQFNvu7oe5uu6fBOuR0cf3D7uuq0JDrSg
 FuSw==
X-Gm-Message-State: AOAM531QurZSD3C9jBTll7z1ArNSW1zEbHlmIX69q1abWLcC3Tj90v/M
 TrrzAcPIxAROUuak6r7kNNs=
X-Google-Smtp-Source: ABdhPJxtGmXlNc6yvDyDRwEnvG2TlYq3vDDk0QPmRiikQO1uJuM5hDhP7g7t9l1Vpp7ZexHL4J5WnQ==
X-Received: by 2002:a17:907:426c:: with SMTP id
 nx20mr28068480ejb.548.1593710757680; 
 Thu, 02 Jul 2020 10:25:57 -0700 (PDT)
Received: from localhost.localdomain ([2a04:2413:8140:6d80:2142:c138:da0:5086])
 by smtp.gmail.com with ESMTPSA id p4sm7427033eji.123.2020.07.02.10.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 10:25:57 -0700 (PDT)
From: Adrian Pop <pop.adrian61@gmail.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>
Date: Thu,  2 Jul 2020 20:27:14 +0300
Message-Id: <20200702172714.158786-2-pop.adrian61@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200702172714.158786-1-pop.adrian61@gmail.com>
References: <20200702172714.158786-1-pop.adrian61@gmail.com>
MIME-Version: 1.0
Cc: Adrian Pop <pop.adrian61@gmail.com>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 2/2] ARM: dts: stm32: Enable MIPI DSI
	display support.
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

STM32f769-disco features a 4" MIPI DSI display: add support for it.
On Cortex-M7 DMA can't use cached memory. For this reason I use a dedicated
memory pool for DMA with no-cache attribute which is located at the end of
 RAM.

Signed-off-by: Adrian Pop <pop.adrian61@gmail.com>
---
 arch/arm/boot/dts/stm32f746.dtsi      | 34 +++++++++++++++++++
 arch/arm/boot/dts/stm32f769-disco.dts | 49 +++++++++++++++++++++++++++
 2 files changed, 83 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f746.dtsi b/arch/arm/boot/dts/stm32f746.dtsi
index 93c063796780..577a812ca01c 100644
--- a/arch/arm/boot/dts/stm32f746.dtsi
+++ b/arch/arm/boot/dts/stm32f746.dtsi
@@ -48,6 +48,19 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		linux,dma {
+			compatible = "shared-dma-pool";
+			linux,dma-default;
+			no-map;
+			reg = <0xc0f00000 0x100000>;
+		};
+	};
+
 	clocks {
 		clk_hse: clk-hse {
 			#clock-cells = <0>;
@@ -75,6 +88,27 @@ clk_i2s_ckin: clk-i2s-ckin {
 	};
 
 	soc {
+		ltdc: display-controller@40016800 {
+			compatible = "st,stm32-ltdc";
+			reg = <0x40016800 0x200>;
+			interrupts = <88>, <89>;
+			resets = <&rcc STM32F7_APB2_RESET(LTDC)>;
+			clocks = <&rcc 1 CLK_LCD>;
+			clock-names = "lcd";
+			status = "disabled";
+		};
+
+		dsi: dsi@40016c00 {
+			compatible = "st,stm32-dsi";
+			reg = <0x40016c00 0x800>;
+			interrupts = <98>;
+			clocks = <&rcc 1 CLK_F769_DSI>, <&clk_hse>;
+			clock-names = "pclk", "ref";
+			resets = <&rcc STM32F7_APB2_RESET(DSI)>;
+			reset-names = "apb";
+			status = "disabled";
+		};
+
 		timer2: timer@40000000 {
 			compatible = "st,stm32-timer";
 			reg = <0x40000000 0x400>;
diff --git a/arch/arm/boot/dts/stm32f769-disco.dts b/arch/arm/boot/dts/stm32f769-disco.dts
index 1626e00bb2cb..a9e81b49809c 100644
--- a/arch/arm/boot/dts/stm32f769-disco.dts
+++ b/arch/arm/boot/dts/stm32f769-disco.dts
@@ -153,3 +153,52 @@ &usbotg_hs {
 	pinctrl-names = "default";
 	status = "okay";
 };
+
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
+				remote-endpoint = <&dsi_in_panel>;
+			};
+		};
+
+	};
+
+	panel: panel {
+		compatible = "orisetech,otm8009a";
+		reg = <0>;
+		reset-gpios = <&gpioj 15 GPIO_ACTIVE_LOW>;
+		status = "okay";
+
+		port {
+			dsi_in_panel: endpoint {
+				remote-endpoint = <&dsi_out>;
+			};
+		};
+	};
+};
+
+&ltdc {
+	status = "okay";
+
+	port {
+		ltdc_out_dsi: endpoint {
+			remote-endpoint = <&dsi_in>;
+		};
+	};
+};
-- 
2.27.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
