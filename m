Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E152F7F9CB4
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Nov 2023 10:34:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 908D8C6B457;
	Mon, 27 Nov 2023 09:34:24 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 721FBC6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Nov 2023 09:34:23 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-54a95657df3so5664640a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Nov 2023 01:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701077663; x=1701682463;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xxjZg22ov6gQx8JLukqacT0gU0Tul8TKlesYhtgUQmM=;
 b=OcmIOZ4tEaFSFvWnTwGoSwmBJbPnLqrkOjAnN1PP7x/xS5W8pIerxIYIkQ5wQMPovo
 xZgpKrzYHnojxGD84YnhvDfSdpQKURxzVyHNYdjsXyx9IUoPwUehMGveY009vJmr8RTA
 Sn/1nU9NvJiAxpjJdf+DbEqhQ3m4wEi0cJVi32EZE/n+Qe0mk/P/9LXqfhsz0GjdWFAh
 7edp2Td5GFxp+VD/88ZX12tZmuMM4odK5sNs6CvP+1uA7CU67aWfSw+9njlfnJqrxa7x
 Sty2pYbalilJgXsJ1p+tZaPD/LfWthPehE5SiZQdZ5GhqN7d1D9TwIcziYOXSvOPjMpZ
 D42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701077663; x=1701682463;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xxjZg22ov6gQx8JLukqacT0gU0Tul8TKlesYhtgUQmM=;
 b=oYqrHbW5qF93wa/80BfMAC2Yt3/WlQ0JVbody7HF1D/BFsUSjHI53Aj2y8Q6ZXzcMa
 B2xb7bV28emCofC3ttydRsUkl6DpEI6N2Is3obw4y/TgF2ElD4NMt0zikq6f2Bp1JACv
 9vA6WfTAIz3Aj7hDWA0PHnFz9W5RAkJD12VmMyitcUhYOGZfkqbSTg/kvnUkQpplLz+X
 Gzm7omGzlGauIs3JnykfdzYOzCFTa51VcC1nj4n96GRSeuAct9UW0wIYuZJ8a8NjfSDn
 llrUxnZHv9R0FzSDSqVqEQ3ZGtNnrTiPq+jR1MFMIUyVZ00h6liPojSzCj/sSSegovHg
 ttSA==
X-Gm-Message-State: AOJu0YyZTwRCTpwKFKBz5PGfmd7SJGaWPImJkrqVAgwqg3hQXFAU5ivY
 +qLaRPXcGSsry3o4hHD4ay+cTQ==
X-Google-Smtp-Source: AGHT+IHwjo3iCYneHAx17+3mDf/thozieQyTXj1EWQg79jKTCz1jo/XMchH7SbSIGHpMDbSOO2DORA==
X-Received: by 2002:a17:906:109b:b0:a0c:fe2f:c445 with SMTP id
 u27-20020a170906109b00b00a0cfe2fc445mr3149996eju.69.1701077662724; 
 Mon, 27 Nov 2023 01:34:22 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109]) by smtp.gmail.com with ESMTPSA id
 s20-20020a1709066c9400b009fd585a2155sm5452587ejr.0.2023.11.27.01.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 01:34:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 27 Nov 2023 10:34:20 +0100
Message-Id: <20231127093420.20473-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH v2] ARM: dts: stm32: minor whitespace cleanup
	around '='
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

The DTS code coding style expects exactly one space before and after '='
sign.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Split previous commit touching entire 'st' directory.
---
 arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts | 2 +-
 arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts | 2 +-
 arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts | 2 +-
 arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
index afcd6285890c..69d693ae26dd 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
@@ -59,7 +59,7 @@ &m4_rproc {
 	/delete-property/ st,syscfg-holdboot;
 	resets = <&scmi_reset RST_SCMI_MCU>,
 		 <&scmi_reset RST_SCMI_MCU_HOLD_BOOT>;
-	reset-names =  "mcu_rst", "hold_boot";
+	reset-names = "mcu_rst", "hold_boot";
 };
 
 &rcc {
diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts
index 39358d902000..89bfb4143ba7 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts
@@ -65,7 +65,7 @@ &m4_rproc {
 	/delete-property/ st,syscfg-holdboot;
 	resets = <&scmi_reset RST_SCMI_MCU>,
 		 <&scmi_reset RST_SCMI_MCU_HOLD_BOOT>;
-	reset-names =  "mcu_rst", "hold_boot";
+	reset-names = "mcu_rst", "hold_boot";
 };
 
 &rcc {
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
index 07ea765a4553..ca7a3a0f16af 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
@@ -64,7 +64,7 @@ &m4_rproc {
 	/delete-property/ st,syscfg-holdboot;
 	resets = <&scmi_reset RST_SCMI_MCU>,
 		 <&scmi_reset RST_SCMI_MCU_HOLD_BOOT>;
-	reset-names =  "mcu_rst", "hold_boot";
+	reset-names = "mcu_rst", "hold_boot";
 };
 
 &rcc {
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
index 813086ec2489..f6510b93f912 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
@@ -70,7 +70,7 @@ &m4_rproc {
 	/delete-property/ st,syscfg-holdboot;
 	resets = <&scmi_reset RST_SCMI_MCU>,
 		 <&scmi_reset RST_SCMI_MCU_HOLD_BOOT>;
-	reset-names =  "mcu_rst", "hold_boot";
+	reset-names = "mcu_rst", "hold_boot";
 };
 
 &rcc {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
