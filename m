Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF0BA9E081
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Apr 2025 09:44:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DF8BC78F86;
	Sun, 27 Apr 2025 07:44:20 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF846C78F86
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Apr 2025 07:44:18 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so23949845e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Apr 2025 00:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1745739858; x=1746344658;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Da7zIFrpu0j7h2mGPrNiJuERzcQJY6X/JIb6xBtGQ24=;
 b=iICi9pXwTqnTigjmVGm+4aPKg+aSB8NR1A6fjm2XOR36hxRAmrvspHI1/mFVSlSBaI
 jzxhQxLMlOT4beKV5UL+zjyyB4raPrISGtMUoXl41X57C9stnMIK4P8dBeOzn2femzJj
 y0ltnQUU2v2pJqj5AfKazrBOAM3cMS+ZOPC5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745739858; x=1746344658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Da7zIFrpu0j7h2mGPrNiJuERzcQJY6X/JIb6xBtGQ24=;
 b=YCMVLWgKWpQ5+jzu8C4Qk7M0EU+fmfjov6WhWIILtdwtHzYrAz2HZ3YoNbTpgNkcSY
 7Zs7I5wxD24BXcAVXz7FJuxgVZYU9W88CNq/bVSWsqO80DO7kMos4GHLYTgMye+byEvC
 EAgioVuiI6cxVUt974FpjzGmL5hQUK7i0HCoSIpadfhOsgfA5IL9sWV2LC60xb5ayfd8
 x/J7m0l9rwdEj03ZoJz17k9BoYLESF2MmkOwAcFScNSKcuUcY7Jpbx9su+Wn705yxD41
 91aXmeGZggOTlzYiIUy40GODbZvw+Bdv6A8jjnP5wk9UhE+augZs0DPmTKvsN7JB7VVL
 +C2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHgU5QZbEJhfmyOstkb/Z6wBDiRjjnUsfbKlEyDjYexJ589OB+T1NvsT7IQcfUEiwcE3UcJn1o3CxcwQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx6IwTyGdzZ8iqKd+o8C25YoSFyJ9hCLxpnHYjW9p3jEjMTDa0i
 2oFdoEzFp1LrBat8pNVbYhBvjAYl+l+bzsELwWPmT4zls5NzzKM4xqqyXATSRu8=
X-Gm-Gg: ASbGnctV4/jC8BiYHEqPex7l9iMN0GPlbJX0cSNZiV5MIfV1wqBcoG3V3nb5M47ihsl
 SN+nmO41ySjiNVUpN1AQdJTXTSAViDOuM9BeQnFT4XtBot5cNbzlx12Ucw/zkpPntIi+9Ft/YQ6
 D0qx+8reBGH0o8ZYbs1vQZ7DWm8a4Kayjs5BOKCTmcR+38NE+sJr6xLNKqKT3Lkvix5BktOJPgM
 NjOVa2ojDxO0RMzxS9KzglHkOpauRLr1S33fiL5hsb8P8vuYnScwcwY3NvhK0NkDY8vAvmrvlQp
 v3kTf/WLQgkJOeQX2bgVb2U1fsboFwK26Vk5bq3BvSGqDp98A/1U4d1jvSJtO8SbzK5iGkDDhJU
 +srs3pg==
X-Google-Smtp-Source: AGHT+IEuupyIlTgaign30DDDz9KUfwF9305jfDutvCc5oP7891e/+Sd1Sp7bK1ZWlfa2LaTwV1N8Ag==
X-Received: by 2002:a05:600c:4509:b0:43c:f8fc:f69a with SMTP id
 5b1f17b1804b1-440ab77d34amr40034595e9.4.1745739858133; 
 Sun, 27 Apr 2025 00:44:18 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.180])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a52f8915sm87682015e9.7.2025.04.27.00.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Apr 2025 00:44:17 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sun, 27 Apr 2025 09:43:26 +0200
Message-ID: <20250427074404.3278732-8-dario.binacchi@amarulasolutions.com>
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
Subject: [Linux-stm32] [PATCH 7/8] ARM: dts: stm32: add an extra pin map for
	USART1 on stm32h743
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

Add an additional pin map configuration for using the USART1 controller
on the stm32h743 MCU.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi
index 96022afd0168..8a6db484383d 100644
--- a/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi
@@ -237,6 +237,19 @@ pins2 {
 		};
 	};
 
+	usart1_pins_b: usart1-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('A', 9, AF7)>; /* USART1_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('A', 10, AF7)>; /* USART1_RX */
+			bias-disable;
+		};
+	};
+
 	usart2_pins_a: usart2-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('D', 5, AF7)>; /* USART2_TX */
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
