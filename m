Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B87A38223
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Feb 2025 12:45:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D37C0C78F87;
	Mon, 17 Feb 2025 11:45:22 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 433CAC71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2025 11:45:16 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-38f32c1c787so1663940f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2025 03:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1739792716; x=1740397516;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4wD4WIcZmxg1bV/511uzbm9dEqsTwVeyjkL26ur+v0E=;
 b=do46TQx8Vo1KFhtHZv+tLk+KDNG0F6DWoRwydGn9Tj7ItL6Q/PQ4tAwXWwC6YsgkUk
 sibMawe8qurZhN2707T9fDTaQLoZrPb85E4DCZkPTmSe7Fm7WtxxdVZFj2gc+NqVjPSG
 2sZmnjQZPjQ6IYZCOjAycIG8BSrADbN4st6ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739792716; x=1740397516;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4wD4WIcZmxg1bV/511uzbm9dEqsTwVeyjkL26ur+v0E=;
 b=wr7GEPb1FQ6wf6aPBKw8v+kPA+fdQu/d3J+H21CDg7h20YcDU4Y623l2aVuS6rEGTv
 3q0ZoKdO93ac9hbS2ZHe/daoIPiVYb1f97AU9+ripSP2SFEumPsw0eThmFnyKJWLdyph
 +hj75gjz+8n6x0kwurVKFFLjZT1jLe6veKaXzb/unTLrc/FtQnduHaX77ibmb9mdXpqM
 /NMNtYWMDoY2K+Vk1yYUWUPlmnlo1mtyqwn3naX/Qvfb+4MZV4HxWCWDTNZlU25wWPCM
 0t3mg5mt4T9bLmV7ZRjZhIrlS65U1tsN8G1wKVb1Gi56zlHvCoPaAunDB2xSNPQQC+2s
 G47A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXx/gR0pvKrNQl3M3c3wASYUm+Vn1T5Tm0ZWLg9FtOiQZUR6orfbEkB9BxRM3e0EL6/RNuJOhgPm9olBA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzGu9F0Fm1to48YQHxgYe/x8FHjsiuvR+OK2/C1OHzl+4NSF2TU
 FNHqoF1B0DZbY1C6OkdiwUVtzkS3QtGb2lYnh43NEh26gHLRvtu6uqZdfwW7Jsg=
X-Gm-Gg: ASbGncsszHN+HVAB+f7YZYC66OKRdZB4pablnKL3n5NaaP0ttoRVWBUo6/b3RsxonhA
 Ls5qaHMaAPmaScOHO/8zds+0A3UmapBEn+MbS/urXrlUOfQRmvAmOJ5rFdbqEXhIMGo2HEIsX23
 2o/khICt4qgbs9XXaXHYX+t2V2RLLpvpngay1ZxH7jKIeDEoxZPQbBKKEHH8ScHkYw4Tu07DdeB
 fBodRLnfoRBZI+GO1ED5yylTxOwNcdg2ubTDXAZeDBOlatKWNCZGVHnUIFgnd5+y8kKNDY3a32l
 FAEVjE1W6qVnnP/WEwTzBrY1zAAbXaY51U0md8zbysefZD1DWtmFuYdFVE8L1727v7FEPMO+M+y
 d5tUpFNfGWmk=
X-Google-Smtp-Source: AGHT+IH4HZR8AI05mEm9pkEq128S5TzlgBTTQQpv9pmG8gm704yEZzj5BkD0hyM6Bc9Lk5oPYaBLNg==
X-Received: by 2002:a5d:470d:0:b0:38f:2a49:f6a5 with SMTP id
 ffacd0b85a97d-38f33f271c2mr7154894f8f.15.1739792715727; 
 Mon, 17 Feb 2025 03:45:15 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2001:b07:6474:ebbf:78d7:ec72:38e9:87de])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbe0sm12181637f8f.39.2025.02.17.03.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 03:45:15 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 17 Feb 2025 12:45:08 +0100
Message-ID: <20250217114513.1098844-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: rename LEDs nodes for
	stm32f769-disco
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

Associate the LED node name with the corresponding board silkscreen for
more precise identification. In fact, the board has a total of seven
LEDs, some of which are user-controllable (i. e. usr{1,2,3}), while
others are directly controlled by hardware (e. g. power, overcurrent,
...). All these LEDs are either green or red, so using the names
led-green and led-red for the two LEDs mapped in the DTS does not
simplify their identification on the board.

Moreover, this patch is a prerequisite for adding the usr3 LED, which
has not been included in the DTS.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32f769-disco.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32f769-disco.dts b/arch/arm/boot/dts/st/stm32f769-disco.dts
index 52c5baf58ab9..d52e36aedcfb 100644
--- a/arch/arm/boot/dts/st/stm32f769-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f769-disco.dts
@@ -79,11 +79,11 @@ aliases {
 
 	leds {
 		compatible = "gpio-leds";
-		led-green {
+		led-usr2 {
 			gpios = <&gpioj 5 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
 		};
-		led-red {
+		led-usr1 {
 			gpios = <&gpioj 13 GPIO_ACTIVE_HIGH>;
 		};
 	};
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
