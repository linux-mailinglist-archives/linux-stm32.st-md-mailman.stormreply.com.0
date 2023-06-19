Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB6A735C75
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jun 2023 18:55:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85C09C6B442;
	Mon, 19 Jun 2023 16:55:40 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D675C6A61E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 16:55:39 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-76243a787a7so271332985a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 09:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1687193738; x=1689785738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2jBqOeBntw2+ThpWf4KE8BMuMRq2HYj3RR0u0oHiddc=;
 b=fbehQPIELgMVuXKfNJ14ftlH1Mu99NGxZxmpav7OC/ejP2ZFu0DfrtcQSHiuGYciyl
 tH35FlqjRv13W3FryjHB+CgK9dBSRixA2OFqEyIJpPpFixhBr5rLl+n7IHU5g3U7IfSp
 px1owPuMpfK+cfi67OBColLfqKhxm6jvxVXoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687193738; x=1689785738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2jBqOeBntw2+ThpWf4KE8BMuMRq2HYj3RR0u0oHiddc=;
 b=GsMIJzRASctNE+dKXmz0gAfu+W6hySqY+vaCuAwP1tEhwHekIoCHl58ILRCmAiUS+Z
 HJSFL+t10BvnJiXPEA0nt3eOmsuOmH5FzYO6/36wpuZQkpe0+YK6jsivBAr1DBAL5oai
 ihDw8LDIM5RtA9DKYa+0ADw2XI5R/ksnIoHDmzDUm8iyN/E5aA3UNhdoZoZtNRDD6+iZ
 6nyOcycAucgDKDxpTz/9G25ZlQQC3UWMyygcKHP1AAsCYB0zCNKw8lx/cAK3a7td2ijX
 TxE24SJflC8KCgERMR48ypOLCRuJ097gKBIpFFsLSyfTeq8l56XOEMA+pdQ/Z9Yu3Dut
 dSuQ==
X-Gm-Message-State: AC+VfDz7g488dG4eqO1h1hNVa72OwsLK1kpXBKxcotC8jMVx9tNjvlSF
 B7pKsITtlmzOOEMXZHZhAJWI5w==
X-Google-Smtp-Source: ACHHUZ7s9mMwA0UYhOrHV96GHITp2mcagElZVTFGi4BdgoRv2nHLvaYcNEfGRjJJhUoLnGeLKw344Q==
X-Received: by 2002:a05:620a:4055:b0:75b:23a0:dea4 with SMTP id
 i21-20020a05620a405500b0075b23a0dea4mr12989246qko.34.1687193738121; 
 Mon, 19 Jun 2023 09:55:38 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch
 (host-79-25-27-4.retail.telecomitalia.it. [79.25.27.4])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a05620a15f700b0075d49ce31c3sm109103qkm.91.2023.06.19.09.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 09:55:37 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 19 Jun 2023 18:55:20 +0200
Message-Id: <20230619165525.1035243-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230619165525.1035243-1-dario.binacchi@amarulasolutions.com>
References: <20230619165525.1035243-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 1/6] ARM: dts: stm32: add ltdc support on
	stm32f746 MCU
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

Add LTDC (Lcd-tft Display Controller) support.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/boot/dts/stm32f746.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f746.dtsi b/arch/arm/boot/dts/stm32f746.dtsi
index dc868e6da40e..9c4ba0b7f239 100644
--- a/arch/arm/boot/dts/stm32f746.dtsi
+++ b/arch/arm/boot/dts/stm32f746.dtsi
@@ -507,6 +507,16 @@ pwm {
 			};
 		};
 
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
 		pwrcfg: power-config@40007000 {
 			compatible = "st,stm32-power-config", "syscon";
 			reg = <0x40007000 0x400>;
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
