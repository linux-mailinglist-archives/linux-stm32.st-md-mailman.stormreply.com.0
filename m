Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D94A9E07E
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Apr 2025 09:44:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB796C78F94;
	Sun, 27 Apr 2025 07:44:17 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1484C78F96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Apr 2025 07:44:15 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so27475965e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Apr 2025 00:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1745739855; x=1746344655;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=URqZNBSvISpfkOaSlJCBjJ4EBAiXVSB4aYiQ2cb72Ks=;
 b=HQ17KLylDzfvr4P2j7hd3y0ZGZeGufcX7Ded0BEk0z0st7COBAjWPEM7ck+WR3fG29
 Fmj+a6zOfA7dg0j9WrkLEWR9/hmospk3EEazbEeFARL4J4OEqwCWAxRgC1oyrbdv8aBX
 wi+l5wUEOuNujTzm1dgfPZ/+q/+6UC7huctH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745739855; x=1746344655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=URqZNBSvISpfkOaSlJCBjJ4EBAiXVSB4aYiQ2cb72Ks=;
 b=BwOG+FMx1l7+wSDlXiqJdWbZ3Tldveqke7jAKh+OKT80Kit9r8NIX994pR5eA/q3AH
 n2Smcaj1Gr456xxC7yOZFQWZUlP0UN3XGti3AD9/y7hyF7bL5fydaj595du6tUC8hndo
 2NrM8QTYPDkIHMYzr/ldNIDC3zwq4HsVovqjCAXPkMzXP9gSBRUnJtV+5Dov5uibMAQu
 XGPqE6fTngyjq8X6QSmiwTfWthVkIbhvDid/S9PDmAsqpPQhXSexRr1syn4ANSUMByA3
 aX0UHOBksglpl1L/bWULYU5a7uu9bPhvP5UNtZIUJj2UjpFblmoDNiVH91AMxwfuTdqs
 GwOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX93xwCsKw65Bl15KPS3mpLBATZUA5ZVh+s1bYyR8JLm5g76EgTnrX1Lodkubf8FxEBbhtONZ/6mNtJw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzx4h5U1e/CAMMrF/S7XjHDuCMc7c1sYXGOMImDornS1g5gt6PW
 4eOruKg25AP5Q0K++fohu9/PmXKrQhpkZYFa6gLVs4SvM5Tw1UckPKSYWY+Cj6A=
X-Gm-Gg: ASbGncva1ZyUy4N89hCgy56s0DcinT7ytV96AWdhxCJIK/hd7uqkT4d8XM1VaZWiGgY
 NUZQcLOxDOPDUoFf3yuVq/4BKA6WYALzK4w75q6qUsdpvhSR2PczJRcHEfxqYgO5HF2oMEQziEH
 Z1pKQNtLFH/5avt8hHmEvxEG5Au1sir4Ct0f9VXiPJbNRMmaxIg8JMZl738uPF5CwyXDEmaRq9q
 RPjviahWWEw7MGhLumrlcf3ne7klDtvsHnqYmG0zxPP1Tzo8e215guLkWmkXH3RSG/6uNrlog3V
 hZ1EaLC5MaO1SeuNFk62XgBSi7KeEmUyvL9N4dZN84qzrqH91sL0RqcBq+q0Fi0sPUmdl+Wagrx
 /TPBWpw==
X-Google-Smtp-Source: AGHT+IHhG82qhDLAZy00txDJNFJskd3rBxAaXWQjSVQfnIUphGYgfQ2PTE3YQPQE1g+s3Wfi/jBgwQ==
X-Received: by 2002:a05:600c:3d0b:b0:43c:fc04:6d48 with SMTP id
 5b1f17b1804b1-440a6346aabmr74474805e9.0.1745739855396; 
 Sun, 27 Apr 2025 00:44:15 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.180])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a52f8915sm87682015e9.7.2025.04.27.00.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Apr 2025 00:44:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sun, 27 Apr 2025 09:43:24 +0200
Message-ID: <20250427074404.3278732-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
References: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 5/8] ARM: dts: stm32: add uart8 node for
	stm32h743 MCU
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

Add support for UART8 by applying the settings specified in the
reference manual RM0433.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32h743.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32h743.dtsi b/arch/arm/boot/dts/st/stm32h743.dtsi
index b8d4c44c8a82..2f19cfbc57ad 100644
--- a/arch/arm/boot/dts/st/stm32h743.dtsi
+++ b/arch/arm/boot/dts/st/stm32h743.dtsi
@@ -211,6 +211,14 @@ dac2: dac@2 {
 			};
 		};
 
+		uart8: serial@40007c00 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x40007c00 0x400>;
+			interrupts = <83>;
+			status = "disabled";
+			clocks = <&rcc UART8_CK>;
+		};
+
 		usart1: serial@40011000 {
 			compatible = "st,stm32h7-uart";
 			reg = <0x40011000 0x400>;
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
