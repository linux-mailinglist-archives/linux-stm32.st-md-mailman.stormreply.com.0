Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E405274224A
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Jun 2023 10:37:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B386C6B457;
	Thu, 29 Jun 2023 08:37:38 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CED8C6B456
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jun 2023 08:37:37 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3094910b150so472772f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jun 2023 01:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1688027857; x=1690619857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2jBqOeBntw2+ThpWf4KE8BMuMRq2HYj3RR0u0oHiddc=;
 b=P2631v8dfVuMAiCd79tBEx+XlHMPVMM1s0utHNOk/OYNwwPZaMZEJixyVemwzZqFjF
 t4dHA97W45eek30hweiCwgGvewOewA8URInIRt9tABHEHIl/mM5LxhhdVucJG4bOBRqB
 T5XTqEN5BrRD/8nop9mB18fbbs7Ung9qxkWn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688027857; x=1690619857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2jBqOeBntw2+ThpWf4KE8BMuMRq2HYj3RR0u0oHiddc=;
 b=JqLpMYfB/Dd5NIAZTLFBrjdmTj9JwTpEpNroPBuR1D1tJCeCcDMkBnbo/KJgeJchjK
 MG7DblWB1/TIFejkWwu0KeQtrIDDThAe7qIkyeZURuoe2Rh03SSF3Kiv+Ea+ynwN8amn
 bTnHoi3AkmbuLxHStlhF5tF4X8X4rbW3y/M8mH+FAzP1B5h+d8bQpAf/5zGw+xrJcRwb
 TIK/AEzwOvXruJM98Qn+AyPzWxnyfvl2hDeLX10cA61NyigpA9B2JKZkFlooL3ozcY8m
 B6F0gu6GSBFZimmK0lyyTufTzOF8Rf4Eve+tgH7Vp/9QkcLWURPj6MVbCS1ag+YbIDbs
 UadQ==
X-Gm-Message-State: ABy/qLaG1A3AC5ztgvKE/k95hUnUwTOKrH9rd3KaYNg7G3RiIhiq2sQ1
 PtFGpg4ekqebqXN4h28DNU75rg==
X-Google-Smtp-Source: APBJJlFNU32ts4pU3Y3+UfcDK8gH6yx9+i1081/a9sl3Gib8BPeKZ1Y66EZL7iLlvMTB6NA3u+d2+Q==
X-Received: by 2002:adf:cf0d:0:b0:314:1aed:8f5f with SMTP id
 o13-20020adfcf0d000000b003141aed8f5fmr527463wrj.34.1688027857170; 
 Thu, 29 Jun 2023 01:37:37 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.praguecc.cz (90-182-211-1.rcp.o2.cz.
 [90.182.211.1]) by smtp.gmail.com with ESMTPSA id
 cw13-20020a056000090d00b003112f836d4esm15266322wrb.85.2023.06.29.01.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 01:37:36 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 29 Jun 2023 10:37:24 +0200
Message-Id: <20230629083726.84910-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230629083726.84910-1-dario.binacchi@amarulasolutions.com>
References: <20230629083726.84910-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 1/3] ARM: dts: stm32: add ltdc support on
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
