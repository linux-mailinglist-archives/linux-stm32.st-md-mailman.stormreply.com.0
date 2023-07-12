Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F8274FF2E
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jul 2023 08:29:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11833C6B45C;
	Wed, 12 Jul 2023 06:29:25 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0607FC6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 06:29:24 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-98df3dea907so797272866b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 23:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1689143363; x=1691735363;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QIHZ9R3luUe4h54VtlXXPhHVEQN7PHyTj2OXRY7l0a4=;
 b=nQ5MMGz6V0Ctiba8knaHIj7gFUUj3nYQBV/sFw4uU/wuarxFZps0zaiCEe3BzfYyny
 I0pkEyQoTSQqrtp34Be3hrW2vv+FhKjh5t9WZ0MaBkOJSJzGOZ4Bz8HljgqjD6UTm6nh
 okJm9ogtaCbJYqjZTnvTN/9VpTWwJPXFzO4Og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689143363; x=1691735363;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QIHZ9R3luUe4h54VtlXXPhHVEQN7PHyTj2OXRY7l0a4=;
 b=Ct/X9v3dCF+2+ND6KB1k3ypWNBbZfYiakPzdRo2LzKghgBHFldk7B7SZP8Ar63vuZa
 I5O00gionf15ZAsMkM0ytfScd3m7bFx/TC8D1foEd0MaVPUkOuCQ9Hm2PeIBeeE512Va
 8BQ5EuJfa7g79upUSClKV3UNmy5o3MM+Esg+G+Pzs05ECJ2vnwi+xUB5Qxsf8v70a8j6
 4O64doWPuljufdTImfBxhTcTgFZR5FjMlUgSkqa5YzbWtYB4XDFyDEFJl+hDBLBRTMLf
 rpWeD8ItLXZdICBPieW+zv2vhSl1tQDp1LtF2EO0L//L6Ja+IkJts0by/g7eEx59DTPF
 n/Uw==
X-Gm-Message-State: ABy/qLbxEkT3kNvI6joWu7mJVV7lHttX4daUxCgXeCzJkC6lFtEhNDt7
 X96/dlIZH90A0TWJ0wmFlh3nfQ==
X-Google-Smtp-Source: APBJJlF6kaM0+Fj/YeEAF0tg4VcXht5KPiPTGDDsWu1QP0RK4apL9ZGQ+NdBjHGi5HVQe+wd3fhqyg==
X-Received: by 2002:a17:906:3504:b0:982:bb95:5014 with SMTP id
 r4-20020a170906350400b00982bb955014mr14341745eja.64.1689143363363; 
 Tue, 11 Jul 2023 23:29:23 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (host-82-58-49-236.retail.telecomitalia.it. [82.58.49.236])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a170906371500b009890e402a6bsm2065390ejc.221.2023.07.11.23.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 23:29:22 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Wed, 12 Jul 2023 08:29:16 +0200
Message-Id: <20230712062918.2248573-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230712062918.2248573-1-dario.binacchi@amarulasolutions.com>
References: <20230712062918.2248573-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 1/3] ARM: dts: stm32: add ltdc support on
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

 arch/arm/boot/dts/st/stm32f746.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32f746.dtsi b/arch/arm/boot/dts/st/stm32f746.dtsi
index d1802efd067c..36eda1562e83 100644
--- a/arch/arm/boot/dts/st/stm32f746.dtsi
+++ b/arch/arm/boot/dts/st/stm32f746.dtsi
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
