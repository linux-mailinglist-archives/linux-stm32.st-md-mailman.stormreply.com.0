Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A51D11B7DC3
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Apr 2020 20:21:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D595C36B0B;
	Fri, 24 Apr 2020 18:21:41 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 948D5C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 18:21:40 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id x4so11618592wmj.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 11:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rAYQCmL6IU2xY3DJLIY0s7M6/A1t7zEK7ce+EUTohJo=;
 b=u84fygdIrsBH86qD5SGKghp8DXnyg7qSkbkmLvLVWlwrhonzzdwSW1AYHFK2yC/R69
 flipLGa2VPJBxThDXoOGxXceU68RpDespacc5xLSVhQuQrggJfatmOb3NS8uqhOYjjHK
 Ik8EwKPUQ+yevL2z43tW5Ns1QKy33nWsAPcXkosdOoJ1sCHRInDMfUemRBoUoanJvqBh
 MzVSsQqJzwGEADQ9ezgfUJjXTp6RnkXL7CM++U8+PpgAAsAglMXPgYMYN/0ZBYagHU+q
 CNlrZmZ/7cdf1e1QeBs2xHdoRHYW3ugIgJX1sUCWfLG2LeiHDRppV19l8Q7QBIadWLe6
 Wh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rAYQCmL6IU2xY3DJLIY0s7M6/A1t7zEK7ce+EUTohJo=;
 b=pq8vxlMpmRTEbETsbI+kKAxOLT37PxpRzkOBWT3iemhmoDjSkmEvNy5vf5JPUxU63k
 7S5KLsBVxBk7cRVIZ2i49CtUVYKkK6P/T1B/Mt28qqDwc7NTbuwW8VGE64spGXBI2thw
 xVwtlLnY3I6tgdiFihdaVIYtKZWzGejzV298lNF3REQW1NSXepA62NimyqDhe6nS5naB
 YwisSSEEW0uMhnmamIMHlxZX7aHOtsymj2pYEbO+vAJtzP11lU7Cksg6BD/rHEKeULYK
 f42WCqLD2hFINL96siqhbiFbSrmhLNKbZIOSqlAGCsk/5an7O/o+5xHSZsaPShnacyDt
 6Usw==
X-Gm-Message-State: AGi0PubFh6XER8rUUc/eAPlO+bHrc2cryFyT3ccz9axC+AxxHF9UCWR2
 eMPHxhozBLY5ugYbH7y5KXI=
X-Google-Smtp-Source: APiQypLUjLMhouWE33cxL9vt13Udxx8+F7+VXu6HcQFVF3uBl85CsetfpYO5KrT/E0cXXHX9BYHFwA==
X-Received: by 2002:a1c:5683:: with SMTP id k125mr11193868wmb.17.1587752500199; 
 Fri, 24 Apr 2020 11:21:40 -0700 (PDT)
Received: from localhost.localdomain
 ([2a04:2413:8140:d480:18da:1e39:90cf:b88b])
 by smtp.gmail.com with ESMTPSA id f8sm9338788wrm.14.2020.04.24.11.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 11:21:39 -0700 (PDT)
From: Adrian Pop <pop.adrian61@gmail.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Fri, 24 Apr 2020 21:21:39 +0300
Message-Id: <20200424182139.32190-1-pop.adrian61@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: Adrian Pop <pop.adrian61@gmail.com>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2/2] arm: dts: stm32f769-disco: Enable MIPI
	DSI display support
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

Signed-off-by: Adrian Pop <pop.adrian61@gmail.com>
---
 arch/arm/boot/dts/stm32f746.dtsi      | 34 ++++++++++++++++++
 arch/arm/boot/dts/stm32f769-disco.dts | 50 +++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f746.dtsi b/arch/arm/boot/dts/stm32f746.dtsi
index 93c063796780..202bb6edc9f1 100644
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
+			size = <0x10F000>;
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
index 1626e00bb2cb..30ebbc193e82 100644
--- a/arch/arm/boot/dts/stm32f769-disco.dts
+++ b/arch/arm/boot/dts/stm32f769-disco.dts
@@ -153,3 +153,53 @@ &usbotg_hs {
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
+		reg = <0>; /* dsi virtual channel (0..3) */
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
+	dma-ranges;
+	status = "okay";
+
+	port {
+		ltdc_out_dsi: endpoint {
+			remote-endpoint = <&dsi_in>;
+		};
+	};
+};
-- 
2.26.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
