Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D8CA7BF7A
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Apr 2025 16:35:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B86C0C7802F;
	Fri,  4 Apr 2025 14:35:29 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B29E2C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Apr 2025 14:35:28 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7c53b9d66fdso269650885a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Apr 2025 07:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1743777327; x=1744382127;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bK+c3D63UjZ8jufbmxbZOM/a2XsXZv8kRnKHQX4cpEI=;
 b=ixS461BZlukMBkgLHDOFAgKQzpANFtwrVLZjhoxLXOPt4JD72oMyzVijETLvmSOlwN
 Bo+GIzNx0X5Y8fZhf7J/AHqGEbi9/ExzFZB09GyiK/AKziNiReac0u3R6X4ECWxhA9RN
 cOp6QNGfi9X+djpf4pU42XTgA+u/LYiJemo58AzWeSBRc36dEmWIO6n2bDM0/RflXv6P
 hwb12rFcrRirakESxE+5kattm1qlUpmvyf2VWh0BDmDKqE6I2MUah2uQnZR47FptseKU
 KIL1EPEM4tI0uYwkKr1FG8sMnAEwjvOGqylPI0n8rUR6P8J9VvjncGy0pz6afnr6svjz
 Mijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743777327; x=1744382127;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bK+c3D63UjZ8jufbmxbZOM/a2XsXZv8kRnKHQX4cpEI=;
 b=daj47JxDyK12CBORZBoezUIH/aSTN57dNKz9XJvn8ZvNdsL5qNFMbd1NbGPuazqCw5
 qRY66BUpjAbns5o+0xmnXtW3ETnER4cgk1ynjjUOthUivXgq890MmZ0U7blFyEUnbhS2
 ipmucHaDojNgqMy/VTJ5d6eY4IuYj1/YHbLKcisQ8Y5VZCx0wfSLAqKPCfdxbIbk9bT3
 rIaf0wEi30ruAGSzc0y7L7x16NwkglNKYAgBrAxbQGr8ZDYY3Jn0YiqSovrMcJDeZekm
 jzuJ7JNVotsfNwuQJxXo0/FAFDuGNCnz+JJHwtmXVFM+21BmZa7a1zI2PAT8apKKruOp
 Ozzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJyrXuWvjnnHKfY+y1EC6acYTeNClA+O3WmTOyzBOfr7Tl5Qt48MIz4/JBUj0N5fHFjKfkt2snIunHWg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwDoo3kpRwVpDocmV0+AakzAKQNG4+MRSq5LkhIxZCZIg7Z0G4p
 H+5Ug0xdAHHNwPz4ZdqUuqSEopGixLXRzYnRm1i2YmBVtzPni/VVOK2WafGc/4U=
X-Gm-Gg: ASbGncue2YLG/mIrH8uywWrzt22NKpc1OKZvcd36P2cfZX2ayPetluncFBCLg+wnDbP
 E3FzPWpbrU/Z/GjWicvW+CxKjFc5+3Or6m0p9aqvPGSBaOM97cYWeVVoeJn6HR9ySEfcwxrpOUG
 Uxp+D60H7zArKnjVvdIZnCPMFzQEduO16YQeyh3BA9VPyuZ9IYGRy8jaHH46IR+Pp6M5bRV83at
 tc2jcENkUHHU8fdwV4FxeL+jtBEpm6Yag0uZ8//hdAlLaIBw5imq2Y+uZaf8B4xs9xOMAKq0g3D
 bnHvloJPedPjiLAjRC0v8SckQ7S28JfVkv3zErYheGpDNIiPkfizW91xMcPJUxQxCOg0sJS8g3I
 =
X-Google-Smtp-Source: AGHT+IGpe2CJgpCsJsGayaNpUYmgMLrht7bkJyklskD3eOS7aHMmjw5yzUjbFsf/0aNBZKBvoN2DUw==
X-Received: by 2002:a05:620a:170a:b0:7c5:50dd:5079 with SMTP id
 af79cd13be357-7c774d2779cmr487860885a.1.1743777327595; 
 Fri, 04 Apr 2025 07:35:27 -0700 (PDT)
Received: from localhost.localdomain ([50.212.55.90])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c76e735419sm224204585a.15.2025.04.04.07.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Apr 2025 07:35:27 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Date: Fri,  4 Apr 2025 10:35:14 -0400
Message-ID: <20250404143514.860126-1-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: add low power timer on
	STM32F746
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

Add device tree node for the low power timer on the STM32F746.

Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
 arch/arm/boot/dts/st/stm32f746.dtsi | 34 +++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32f746.dtsi b/arch/arm/boot/dts/st/stm32f746.dtsi
index 2537b3d47e6f..208f8c6dfc9d 100644
--- a/arch/arm/boot/dts/st/stm32f746.dtsi
+++ b/arch/arm/boot/dts/st/stm32f746.dtsi
@@ -43,6 +43,7 @@
 #include "../armv7-m.dtsi"
 #include <dt-bindings/clock/stm32fx-clock.h>
 #include <dt-bindings/mfd/stm32f7-rcc.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	#address-cells = <1>;
@@ -245,6 +246,39 @@ pwm {
 			};
 		};
 
+		lptimer1: timer@40002400 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-lptimer";
+			reg = <0x40002400 0x400>;
+			interrupts-extended = <&exti 23 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&rcc 1 CLK_LPTIMER>;
+			clock-names = "mux";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm-lp";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			trigger@0 {
+				compatible = "st,stm32-lptimer-trigger";
+				reg = <0>;
+				status = "disabled";
+			};
+
+			counter {
+				compatible = "st,stm32-lptimer-counter";
+				status = "disabled";
+			};
+
+			timer {
+				compatible = "st,stm32-lptimer-timer";
+				status = "disabled";
+			};
+		};
+
 		rtc: rtc@40002800 {
 			compatible = "st,stm32-rtc";
 			reg = <0x40002800 0x400>;
-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
