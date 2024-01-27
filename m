Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D3183EDEB
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Jan 2024 16:29:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6748BC6DD72;
	Sat, 27 Jan 2024 15:29:03 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5672DC6DD96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Jan 2024 15:29:00 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-55d2d9fe0e0so1227671a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Jan 2024 07:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1706369340; x=1706974140;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6KiKuozUcISQEJW2rOZI/i2DyGSQ+9yO5T+hEH7AHSM=;
 b=X2TprR1NMgFO3Oj7FevugyLiIyRcC5WOxe8q5+PtRVFlh9V2M3N/R3rSQm8NeciOSX
 p1LsuD13s7ZOCBpwo2+XyFX5f5JQAC/3xKWosEPGMJnJqqExkSRxYfu9AIpUVkW/bNQT
 vMk5E/OZsN8FX2YCFsgeO4rgUObzjUzPcxgeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706369340; x=1706974140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6KiKuozUcISQEJW2rOZI/i2DyGSQ+9yO5T+hEH7AHSM=;
 b=dmmkafvfi0BkklUmMU5++fr3RAzGx6vhtUwFyHgWUv6YuI+TiHPP+dudnaC66ts0WC
 0YJ1QnqcABKUsjTVPM5cP9xNI9obgPDi6QuuuUCbltH5ZAjBbZNGY7HUVhN6C7wlEFQr
 V+Z4RtAaD/UAMhaVuCveP9YhBWf8gTXupf5sdB4b9Zzzx2+pQ5ktu3p82M/WYKQLTXM3
 q0DsfN0pv4+T5jtFJJqQFHBXphQgjGH9oHj1hTwmT+pDUlGlfiZ1764N1/y/doxHLdsf
 8amU/50dgXavTzfpc+ghBd7t3WofvxosEUqQ7nau3WKCE+0rao9g+3Yge7gzAQM9YYEo
 GwIw==
X-Gm-Message-State: AOJu0YyKQ56yxoWH2iE4Av+/IkhKnPdakmJY93z5xgyDMpojd+wJGIgR
 ZReSMqZ27tGhBcfdw/MeKBGSo08LsK7SWmax5pH409c2c9F00ORr0O83kBjhdaw=
X-Google-Smtp-Source: AGHT+IHYGT/EsWMOJvw8h0S7Y3X/sGKFYomtz3ewPFsQwcBQzIL4gC/HgECQbyWQfrr5bGKL+KloFQ==
X-Received: by 2002:a05:6402:6d6:b0:55c:fe2b:9973 with SMTP id
 n22-20020a05640206d600b0055cfe2b9973mr1188891edy.13.1706369340021; 
 Sat, 27 Jan 2024 07:29:00 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-21-103-141.retail.telecomitalia.it. [79.21.103.141])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a056402344500b0055974a2a2d4sm1745220edc.39.2024.01.27.07.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jan 2024 07:28:59 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sat, 27 Jan 2024 16:28:47 +0100
Message-ID: <20240127152853.65937-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240127152853.65937-1-dario.binacchi@amarulasolutions.com>
References: <20240127152853.65937-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v10 3/5] ARM: dts: stm32: rename mmc_vcard to
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

(no changes since v9)

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
