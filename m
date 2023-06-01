Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FADC71F025
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Jun 2023 19:03:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08E0DC6A61E;
	Thu,  1 Jun 2023 17:03:49 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5280C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jun 2023 17:03:46 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2af31dc49f9so15638171fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 01 Jun 2023 10:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1685639026; x=1688231026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AYXAD9NgGprUIQkhXdsDo3LP+5BIf2ORjzEhEoh2Q0k=;
 b=YEyE4MplOuffKToNXoByaO0YIRahiBQrlXYzMq3NE7mD9SvEWvtIpQ4QjKuUjOkj1T
 U4ul77rYN2OwXiwDemsBFLPmcJRebNTIAm5Kwkux5fhC6HvvbvE+lDFgsh0rMaXTPln/
 Y4fjlsmXpHr9EpCjwT0j/eKuVIyvv6ArA2k8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685639026; x=1688231026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AYXAD9NgGprUIQkhXdsDo3LP+5BIf2ORjzEhEoh2Q0k=;
 b=Tt2uEQ3SMFhz5JYIlvLL1SYtoAVLnC13MYr4Qwo4Y7JurhUOYpGykMXmOi64f7oa7E
 gnlaKuK2M755jlK8yqqufoVbxfOogi5A03T+q4EJJTfA0Sm111stYCf343qptDgEVE/F
 d/krApk86psEcJiSCOoVlvW38Q8FvRRzwDghX3MsmodQwQfJJS9CCSOOQtj/NihZxa5A
 BamVPDu0ds3Q9CIBSXHLc+xM7uTpVm0AQJGlzmiE+bY5mbJVMRd9AJor4zeRLdn4Hd+3
 3p5EPUQ7BcehCV9eu4Idj6d1Ah0kzJ3xi+5YGVeWBLSl+SOFssUH5dPsIMG1HYksX8Rt
 hSFw==
X-Gm-Message-State: AC+VfDwLSLzU7pPaMJ3bATPZELT/oOrkq/4zJ5XUcI3mWALj2sryDOxN
 IbvR0qdHc+tRW5E2nnB2T2Qa5A==
X-Google-Smtp-Source: ACHHUZ7y/MadAmcG8+tiTZ3xPXcxTCxSt8Z6tfaDt1Gboo+wMV/9REfMseHNxiYgmiOmCfOJtQKSNA==
X-Received: by 2002:a2e:8eca:0:b0:2b0:5a04:a5b6 with SMTP id
 e10-20020a2e8eca000000b002b05a04a5b6mr69305ljl.8.1685639026117; 
 Thu, 01 Jun 2023 10:03:46 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-248-31-20.retail.telecomitalia.it. [95.248.31.20])
 by smtp.gmail.com with ESMTPSA id
 bh25-20020a170906a0d900b0096165b2703asm10658522ejb.110.2023.06.01.10.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 10:03:45 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Thu,  1 Jun 2023 19:03:15 +0200
Message-Id: <20230601170320.2845218-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230601170320.2845218-1-dario.binacchi@amarulasolutions.com>
References: <20230601170320.2845218-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/6] ARM: dts: stm32: add ltdc support on
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
