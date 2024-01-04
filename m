Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7A3823CA2
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jan 2024 08:24:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B7E8C6C83D;
	Thu,  4 Jan 2024 07:24:18 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68C54C6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jan 2024 07:24:17 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-554fe147ddeso225802a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Jan 2024 23:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704353057; x=1704957857;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/mPDNXnb7QOonc0RYCjpM23Kv+HuP4dW7ug+KwP2qeg=;
 b=osJYawAbtmfekhtFsJ1g0gTYHGE+i9LCfbSod5RnLRFaNv/4zN4oROu+OwKpjbZG44
 zlIkd9qYnKzYVPiSnuEKb/L880Pl1Ob/6jpOwvZQX6ATlCNfjbEtcD85whnL4dtYJgDf
 8s9BTlDt3VYxU17l0uzwcUWSUhnGhlyp8PRIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704353057; x=1704957857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/mPDNXnb7QOonc0RYCjpM23Kv+HuP4dW7ug+KwP2qeg=;
 b=ATJSUCw6HunWsSJq9mrOKMLIMnn8JnPRWmsgSTBQwK9FHc3gnZOj+hH7vEoVqLBEl0
 2lZ2hQLgABNe5NGN/Qg174F5V3EdlmBRj9z9a5om8ADwuWSPy/17yKt6trrFcerp+piO
 SdPEnXPLCkGbcBxghdKLyt3UfJlJT9DbGbOTwTHPEItT/QI9g7YJekKF1lcAwTAdJl1P
 jOwpAuoTjOsDuOm9Xw8Xgiw35TajN0ndaZW9FFIH4SYlBT+Qbm4KoEoCNVRcgWF2fd4N
 E3d0Q0kjm3pqXzppEoSAUm50KTi4wxX9qNRhYrPp6gNYdls4mmIA0Rxl8iVknP2VzHu3
 ByOw==
X-Gm-Message-State: AOJu0Yw6vZTlkGpox0x35apR2ZDj/tEaxwk967g3ZU2r7kqAvnuwoELz
 IJ8U2UnBp6myS0mC+jQRHA3SXQ8wzJssJw==
X-Google-Smtp-Source: AGHT+IGbhhZ5MqRf1nGZNrp4OpJ+DbAWZ+3Z4dyfPxAV2i1YTbF7RzAqNCf2zXHbQ+3z2GAYZ9ZhPA==
X-Received: by 2002:aa7:d504:0:b0:553:861a:4963 with SMTP id
 y4-20020aa7d504000000b00553861a4963mr59063edq.65.1704353057013; 
 Wed, 03 Jan 2024 23:24:17 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i..
 (net-93-150-255-34.cust.vodafonedsl.it. [93.150.255.34])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a056402000300b00553772c2968sm18530735edu.82.2024.01.03.23.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 23:24:16 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Thu,  4 Jan 2024 08:23:39 +0100
Message-ID: <20240104072407.41290-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240104072407.41290-1-dario.binacchi@amarulasolutions.com>
References: <20240104072407.41290-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 3/8] ARM: dts: stm32: rename mmc_vcard to
	vcc-3v3 on stm32f769-disco
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

In the schematics of document UM2033, the power supply for the micro SD
card is the same 3v3 voltage that is used to power other devices on the
board. By generalizing the name of the voltage regulator, it can be
referenced by other nodes in the device tree without creating
misunderstandings.

This patch is preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/boot/dts/st/stm32f769-disco.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32f769-disco.dts b/arch/arm/boot/dts/st/stm32f769-disco.dts
index 5d12ae25b327..8632bd866272 100644
--- a/arch/arm/boot/dts/st/stm32f769-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f769-disco.dts
@@ -92,9 +92,9 @@ usbotg_hs_phy: usb-phy {
 		clock-names = "main_clk";
 	};
 
-	mmc_vcard: mmc_vcard {
+	vcc_3v3: vcc_3v3 {
 		compatible = "regulator-fixed";
-		regulator-name = "mmc_vcard";
+		regulator-name = "vcc_3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 	};
@@ -128,7 +128,7 @@ &rtc {
 
 &sdio2 {
 	status = "okay";
-	vmmc-supply = <&mmc_vcard>;
+	vmmc-supply = <&vcc_3v3>;
 	cd-gpios = <&gpioi 15 GPIO_ACTIVE_LOW>;
 	broken-cd;
 	pinctrl-names = "default", "opendrain", "sleep";
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
