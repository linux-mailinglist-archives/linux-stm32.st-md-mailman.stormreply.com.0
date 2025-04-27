Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FABA9E07F
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Apr 2025 09:44:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1B51C78F96;
	Sun, 27 Apr 2025 07:44:17 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F261C78F6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Apr 2025 07:44:17 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4394a823036so35369305e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Apr 2025 00:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1745739857; x=1746344657;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3B1CHvp+/NAtdvYK3PDi2I49Nj4XN1T6BUHalQZm0Y8=;
 b=htbZ/lWwqHR8i4FwQG9sx3A1R/VexJVaafBdCWO06RDIQFdHVlIIkPpqWrpjiO4CN9
 GObMZCZx67pNZ1yr5g1xtqilyM0Sd+4zF3+/jvqMs4KuVUtrZM2cUJh8sYoVQBMbN+gp
 EOVTCCyvk/jo7ekBAHaQbz9e3/dhcBfYrFsV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745739857; x=1746344657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3B1CHvp+/NAtdvYK3PDi2I49Nj4XN1T6BUHalQZm0Y8=;
 b=Shlne7UVlHSv2gSjh5Jf5KvVjVSJdZucR5jo2Uy3t46YgSjnShG/dSGqkXenLSyV35
 pE/tO72PVrZP0FAp7b62sNC5JCtMZfP18ZRekx3Q/myzAnkOynpywk13eB77qRDrp6t3
 nA4wVQKyiBUNYUw31FDKvWdcnQv3BfA4D1mIXUADNDKh8l0Q/nM8B1U9Oi6mC6k6b3fl
 rdn7TSVlb3YTLm1rHw/2sNsdh5QzLUzqsw56iRdxrKsX2VS7wkO7UPnJyugbXvAWk0R+
 lcyAhEjHo801GOv/OtC8pFuambJ42cwEyE5irQkegJ/7HB0yq+ddsWqXXTRvvlq81JmX
 obyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHKnMzoSs4ZGtuWSEsV4nPYXu44OCjvmTOiXXL881eYm4b7F9bMwWpXxQbkZnV+yMre0DFPS7eFFI7Xw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwSnwCmEHYu5LQvai2I5JNlWuvnnqHELIqmkT9yNtPFnMKmBEJC
 qe8ua03phJjh6iFQ0rYSzpf9n6fIudOVrnD5B/7n1+4elYGMc8tuEh7VUXo7W0s=
X-Gm-Gg: ASbGncvFIjroAyJTaI2eaZNxnkMZlOmto8dxLVJ7LAVKbGPdotUB59FSli1w69ANIgf
 1JAYqa2D+XoN7mEsK8WNZ4bbKWxcdyY5hzuZ9lRfGTMNwd0UEhS8dHnn+w/gwmtarN9n9kOlZWJ
 6+bL6NQLpdTrIb4p15F1LMUiVH6mNX9nKDa44MAJLjHYcg6VEe2bwn/+16uJZOxr6Ko8wbvQk1B
 jGhBeft3dAaj5IIWEexYqWu8Bnv6H1QGj7CQijeCG2np0aIYmI1PEK69kmupzRm8KUsgL9dFjHK
 IjJSuJh9wAzRt1xQxV4ox81kbR3V2LKNybLLIwOhPpOEZPgYHu2vK+dLUMgMkuucnHeF3QRZ4eP
 zzjMGMQ==
X-Google-Smtp-Source: AGHT+IHZNrSu8FzIhEuFQ16NlJu+RuWVlKIcqsPehnQolCLBlqZN3KSAMIIbMcfsM4WNgYabQGztRg==
X-Received: by 2002:a05:600c:a15:b0:439:9e13:2dd7 with SMTP id
 5b1f17b1804b1-440a64c159cmr74151955e9.2.1745739856765; 
 Sun, 27 Apr 2025 00:44:16 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.180])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a52f8915sm87682015e9.7.2025.04.27.00.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Apr 2025 00:44:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sun, 27 Apr 2025 09:43:25 +0200
Message-ID: <20250427074404.3278732-7-dario.binacchi@amarulasolutions.com>
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
Subject: [Linux-stm32] [PATCH 6/8] ARM: dts: stm32: add pin map for UART8
	controller on stm32h743
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

Add a pin map configuration for using the UART8 controller on the
stm32h743 MCU.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi
index ad00c1080a96..96022afd0168 100644
--- a/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi
@@ -211,6 +211,19 @@ pins2 {
 		};
 	};
 
+	uart8_pins_a: uart8-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('J', 8, AF8)>; /* UART8_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('J', 9, AF8)>; /* UART8_RX */
+			bias-disable;
+		};
+	};
+
 	usart1_pins_a: usart1-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('B', 14, AF4)>; /* USART1_TX */
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
