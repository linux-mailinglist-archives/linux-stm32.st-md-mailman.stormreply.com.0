Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 800CA83A7EC
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jan 2024 12:33:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39003C6DD7F;
	Wed, 24 Jan 2024 11:33:47 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57C5DC6DD76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jan 2024 11:33:46 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-40e5afc18f5so58029655e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jan 2024 03:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1706096026; x=1706700826;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OkfxdmU0fSILmYYOdSztVqfWXPtR0jIGfNt18pCRO9s=;
 b=GZkC6apQDgUA/zFXvVXEYsdwoOr2Ei+bUXCBdYObcigRwI/2rMaCJtZdpZFymzXBtm
 +ok+HxDPX+NFGfpIChUNOWL/zAENlRTSwvGZXuV9GcsfLnWZZhb+n9k9oDwRz7KV5FhK
 Mvrsui70CqI+r+hvy8fVvVkVJpibZyj3vwgqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706096026; x=1706700826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OkfxdmU0fSILmYYOdSztVqfWXPtR0jIGfNt18pCRO9s=;
 b=reOuA67+Y7uQZ6MlHHDVxZkc49cbUQyQnIYzx5rBAhxyknWoippl/Jm8zzi/INLzJt
 GEtRfdHwSTPDweCeF083oIWjtoGhYCODqJfpSPIDrd1l9Ouh84j/7YT8N1+BWpMrq5SH
 BTCJpOe7wzjX+/0wtpxIex/ELGEI79nHBMouhh9D0Bv4+FvYXDVplUw9uTnvoBG2Z+6k
 mPZ1oTl+tkfDiW8ACvKS4X/Mk6Kxk0h8uqYnvqyRySe8izIpSQrh/3V4nXP9eNxeRmrK
 Szyx+0HI24zzv+3z4AhvdrXeaJBN78sYoxmIts1ylHqgUB3KtnVogvebwWnSGL9xbeUa
 ukAQ==
X-Gm-Message-State: AOJu0YxZ3n3g8jbn4PRZM2W8jFSrdztE8Qs6gHAyw4XgcFhZX72X2keW
 1W0Zb9BlVZ7Xwt00kGgnwK9aLHvhlb08Sr/lQCMVAtF0MuMqg7nCuknQE3a9L3Q=
X-Google-Smtp-Source: AGHT+IGr/ZW6/8dj9YoCm1u2xarpFK1RUZV23e2EH6+HlGuITJNl1wXSobD3EeAEcvmo6EUmNmsCSQ==
X-Received: by 2002:a7b:c4c7:0:b0:40e:47df:3d18 with SMTP id
 g7-20020a7bc4c7000000b0040e47df3d18mr930101wmk.79.1706096026021; 
 Wed, 24 Jan 2024 03:33:46 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. (mob-5-90-60-192.net.vodafone.it.
 [5.90.60.192]) by smtp.gmail.com with ESMTPSA id
 i18-20020adffdd2000000b003393249d5dbsm8447950wrs.4.2024.01.24.03.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 03:33:45 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Wed, 24 Jan 2024 12:33:12 +0100
Message-ID: <20240124113336.658198-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124113336.658198-1-dario.binacchi@amarulasolutions.com>
References: <20240124113336.658198-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v9 3/5] ARM: dts: stm32: rename mmc_vcard to
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
Reviewed-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

---

Changes in v9:
- Rename vcc_3v3 to to vcc-3v3

Changes in v8:
- Add Reviewed-by tag of Raphael Gallais-Pou

 arch/arm/boot/dts/st/stm32f769-disco.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32f769-disco.dts b/arch/arm/boot/dts/st/stm32f769-disco.dts
index 5d12ae25b327..660f85984164 100644
--- a/arch/arm/boot/dts/st/stm32f769-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f769-disco.dts
@@ -92,9 +92,9 @@ usbotg_hs_phy: usb-phy {
 		clock-names = "main_clk";
 	};
 
-	mmc_vcard: mmc_vcard {
+	vcc_3v3: vcc-3v3 {
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
