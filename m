Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2517A3821B
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Feb 2025 12:43:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 996C4C7803C;
	Mon, 17 Feb 2025 11:43:42 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6C28C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2025 11:43:35 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4396a24118dso27465415e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2025 03:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1739792615; x=1740397415;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZrzveV3yJfkPYl/HtQGv60ZGdyQJcVgInP4M19o5eMg=;
 b=JLdQcY6KKi/XxF2q8p+Uy8bF/OpOo2DGPMwRQ4rmmAY9K9xPOn9S3q8BcsyM5M+WJc
 H2DIdRKmm2juUzQo2FA2tkCb6NpoMck1E26DWxscdirUtG8Mk1/cjTX9v37k1Ab8pyXl
 4TeG4VQ+SK8eOX23qq0cAR612Ao0OaC9zuQAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739792615; x=1740397415;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZrzveV3yJfkPYl/HtQGv60ZGdyQJcVgInP4M19o5eMg=;
 b=r4GnJ31JnjqWl36VoVCsZhGIQWDsZuhXNK3H7dSIQdRa2TqjIlk3tmeeXYp21tXee+
 86Yo4ro8ZfvZxU/RgE1qYNs7NkBO7R2Whz/rtUk5NDWjMY/vwr5VZKhygcQg7umUQUuy
 IdwtSfog+9wkNPlrxqSkeHDXf4FuYkslkWBinTcgvhImym5GxsH6OT4pOAD4b3OB7vhB
 NzuYMOOhiFrfQy7KKtjMoC9ZYz1kntdqMlyjnF1p5dSui52D/wJTvV6tZSO8wEZlz8LY
 XxXS5Hep98pNlUxnZmkFJhumVGjn46BhDx08w77cy8/dBPKIcVdGJ00bxLxMQ7LyeCBF
 WyjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhA6nLTz7UYtEgf+wZH/+RJt++GV6dqPYzNk+iOKS+6a6uzDd5fV6rLWtZl3cDoVOOsLPwu+EF0IyqRQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx+zU+gPz39ycBg1Ab7no6ycpKLNNQ2Jqu2RUO7efzbc2oBx5nu
 7uwh9Rho25C0iP295GrfwwnB/f6KjnmWVNeTEuqIrnop79YmoKxhrvYg3ucnqZ0=
X-Gm-Gg: ASbGnctWKDifTPUnbTPpkQ12VfZgFI0lNXErYPyRRoZ2GebUBSGq/fkezQvan9iZKx4
 KOoUrLqgTPH7VGDkF6nlXYBmJ5HgmxyM6W5DPUrPJliwoseNWjeGMoR5xJqSyNwSNDRI+O+VJJ1
 9QZPM4OCw9cBetLsIz5/iza9tZ3ojA4eMvUOoEe+4c0XP9+rSSAQ8Rn4RTI6aeZpFCd1d05SugD
 MRe0rLqTv+jHWZ8o87PWVUBbaeG/X6XeM4GVv97x/u9r27DnQv2WEo01fQwt107QTLbeaKzTPzo
 2N1ALxlZLGEB0V97ZDW2Ri3wVlNx+dr0An8IbdvwUNKsQRa5jzuaCuE0Niz/gCcDz5sDGromwVk
 rC5Qyx38XPOs=
X-Google-Smtp-Source: AGHT+IF609P3CALKCKzz+rtZjz9vss0xU2nv7oly2Unvy2CCr8jtqlkrTWn26An774F51BMNCDUg9g==
X-Received: by 2002:a05:600d:1b:b0:439:7c0b:13f6 with SMTP id
 5b1f17b1804b1-4397c0b19fbmr45089825e9.31.1739792615169; 
 Mon, 17 Feb 2025 03:43:35 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2001:b07:6474:ebbf:78d7:ec72:38e9:87de])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43987088ecbsm18918465e9.31.2025.02.17.03.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 03:43:34 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 17 Feb 2025 12:43:22 +0100
Message-ID: <20250217114332.1098482-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: add led to stm32f746
	Discovery board
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

Add node for the user led.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32f746-disco.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32f746-disco.dts b/arch/arm/boot/dts/st/stm32f746-disco.dts
index 087de6f09629..8bdd10644bf1 100644
--- a/arch/arm/boot/dts/st/stm32f746-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f746-disco.dts
@@ -78,6 +78,14 @@ aliases {
 		serial0 = &usart1;
 	};
 
+	leds {
+		compatible = "gpio-leds";
+		led-usr {
+			gpios = <&gpioi 1 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
 	usbotg_hs_phy: usb-phy {
 		#phy-cells = <0>;
 		compatible = "usb-nop-xceiv";
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
