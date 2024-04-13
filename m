Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E629D8A3E6C
	for <lists+linux-stm32@lfdr.de>; Sat, 13 Apr 2024 22:22:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFEAAC6C858;
	Sat, 13 Apr 2024 20:22:47 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12A98C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Apr 2024 20:22:47 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-56fffb1d14bso2661322a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Apr 2024 13:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713039766; x=1713644566;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mlncqStkvETVCUs6zj718afM59TCNUlcR1fhhEtKfCE=;
 b=fBN2si06JHslCgANCJeo1wMxe7pp79j0FvRyCWNRyWJll6+BYFFebJsk5E9nkjNetJ
 BKbBeBWmE0Pq4rbgBStlweOedK68yOOquGe+xFDuXciGwtWKgpxfrMoWNkutOYfbKYbE
 /gVDE9DxDs6ziqBSkK5bAbrzt4qLrU5b+nbLte4zwX/lGg3UqPr3/V0RuZ4vq4FscTXW
 E8iHk84qB5x5Llkn65CokCvj/YsnBNbEu5wzJx4aFiYqRDBObKNYCkPIHTbUMMUUBJeF
 Yfya/HEXcckQCnZhzbTU9QEqKWzi0/7ePfRfOnSGjZaPuVAWnnu7/6RkeihNQrgXQhck
 fANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713039766; x=1713644566;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mlncqStkvETVCUs6zj718afM59TCNUlcR1fhhEtKfCE=;
 b=tU39k9C4+I0q+PMzlkm3+6zK3OZz79d1SfB9rLf2dOK3tD4KdAUZHvWkOg5pD4kiIq
 R2NqncuXDEvUvBG5R9XujDBJl+JoSpIZvd8W6E++FsB6E8GX6oDX2imCR2Va6Pw7s9ez
 143aI3u0RrNk6p62/hU5Q8C7Ue5WnDDCnVPjflFEMdYyHseWzNO6CXM0xceHR1JZWnFJ
 MQGXya8BIWk3pAsIf9NsH5YCLDTcCUE35WaAH5cS4AJSikS9cOgMvLyvISr79LJYFA2J
 dbLN4CKoqjtiVwYcMaAvYuhrcFms5cp/t3mYp7TF8RRz6RQcAvG7AhGMY2m7xty45CHH
 KhuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCzhKOkR2+YSahvN5Ne7SsrIjHSkOmKvI/xQwAEFIuNGMtkbBGP7rxE1pVaYUiXu9XUPzEcUSOqit3v/FupKbFn66tl34Wk5kCOchHLeFA+yB8tiJwdrol
X-Gm-Message-State: AOJu0YwQMRj0hvXCloqQ7pcDz27Je4AvYfAHfmqGcTMIbHid11q8l5x9
 a4/RA1sMmPcBrppt3sRjgyZfY/SMFn9OdM/v3QQNH7HhS36a6CwKn2UEumSr3QI=
X-Google-Smtp-Source: AGHT+IFxJMdB4pyARx3Aawi3IFzs2nXj+ryWbAKjAxJvsPXVxaHcoc6IA0BRjiO7OEU63KcFBwK6Vg==
X-Received: by 2002:a05:6402:2483:b0:56f:e7fe:6416 with SMTP id
 q3-20020a056402248300b0056fe7fe6416mr7532268eda.5.1713039766540; 
 Sat, 13 Apr 2024 13:22:46 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-64.cable.dynamic.surfer.at.
 [84.115.213.64]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056402161000b0056e2f1d9152sm2881222edv.93.2024.04.13.13.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Apr 2024 13:22:46 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sat, 13 Apr 2024 22:22:16 +0200
MIME-Version: 1.0
Message-Id: <20240413-rtc_dtschema-v3-1-eff368bcc471@gmail.com>
References: <20240413-rtc_dtschema-v3-0-eff368bcc471@gmail.com>
In-Reply-To: <20240413-rtc_dtschema-v3-0-eff368bcc471@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713039763; l=881;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=Q2/PcLOdGvifsb0OrilHhlY/IiPhNM4DytJOdAt+KtY=;
 b=vW9T9O08KRg4Tk31a33U5au8ur+G1CxQM5yQmbHVaTcG7YJwzkC5L6cslsx1y2Cb6oKXWEHMV
 4EKBRC1ug7EBOBJOMAYRJc1q9ceXcMmj0g12hxQk14EElmgr3JwLwzl
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 1/4] arm: dts: nxp: lpc: lpc32xx: drop
	'clocks' form rtc
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

The RTC does not provide a controllable clock signal (it uses a fixed
32768 Hz crystal, the input clock of the SoC). Remove the 'clocks'
property to better describe the device and avoid errors when checking
the dts against the nxp,lpc3220-rtc binding.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 974410918f35..f78d67e672b4 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -384,7 +384,6 @@ rtc: rtc@40024000 {
 				reg = <0x40024000 0x1000>;
 				interrupt-parent = <&sic1>;
 				interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk LPC32XX_CLK_RTC>;
 			};
 
 			gpio: gpio@40028000 {

-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
