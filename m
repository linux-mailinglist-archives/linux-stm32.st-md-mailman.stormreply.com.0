Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F0181FFC5
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Dec 2023 14:52:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB3D7C6B47E;
	Fri, 29 Dec 2023 13:52:23 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06BFEC6B457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Dec 2023 13:52:23 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-555aa7fd668so1092304a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Dec 2023 05:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703857942; x=1704462742;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e3yxjZOhlVwQSVQZtiupnCrzdwjrfUb/s2Kg9VCWikE=;
 b=lAL8JsN5tM5nNKFEwnhX7mOI1Of1KG/8hhQN+vRnnt4PYv5qyG7eJZWBzevIN+FkHH
 GiVCDX5k13o+EwYkEKsTYZU87sTr8sJgyi6WJ1Kf1M01GgAPOBqXxFGbA0kmTDSuUGIB
 y7lg5d2gis0MdPUdLg2DJkE7ASgO2tjhXnBaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703857942; x=1704462742;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e3yxjZOhlVwQSVQZtiupnCrzdwjrfUb/s2Kg9VCWikE=;
 b=LzKTaCo+y5ywaG2keHxoGe2UgoItAhnc4DYogG02m+3V7GDzxawz/lQft6O2Iz8wdU
 TSlbnSr66CKRVqwBxtxrOcIK6DBDSntpd0T9w69ip7OhHnDNgbKwMuRouA/JtzjEt+G4
 6m+3+OCux2MeRJttSX8S3/C8eStwcDNUeqTqv79sC+YV7XxBYdWtn0Vw9896wC/jTv9U
 d2JcTeUUsnqoc0hVvKvX6DemyiqjX7rUl9nZPHGMQZdZcBjROEHYrn8r+9TrCz9YJJZb
 8TPK6IKzEMNeVRtpxR+woEFg1MfU9KGLYQhCMHSFtnNTpaqWwMgCm8mLycP0r8/Zs75B
 WlBw==
X-Gm-Message-State: AOJu0YyGemxBpggxgA04wkRDO9CsfAbhtGGQJ9zc20qn7ng8fsynJSyG
 4N7vLfpU1Sdyuw6wwnBV9mxwBOkpHN0hJg==
X-Google-Smtp-Source: AGHT+IHRgqRnjhOkX+w9MAhyQ0DVwta1ng+YsGn8+8NteDB8vVnsNWx0NfIMbbWqBpifCAsLemAC0A==
X-Received: by 2002:a50:8e13:0:b0:54c:4837:9a99 with SMTP id
 19-20020a508e13000000b0054c48379a99mr8369965edw.64.1703857942639; 
 Fri, 29 Dec 2023 05:52:22 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-49-57-70.retail.telecomitalia.it. [79.49.57.70])
 by smtp.gmail.com with ESMTPSA id
 i16-20020aa7c710000000b00553b243b1a8sm11019160edq.92.2023.12.29.05.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Dec 2023 05:52:22 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 29 Dec 2023 14:51:18 +0100
Message-ID: <20231229135154.675946-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231229135154.675946-1-dario.binacchi@amarulasolutions.com>
References: <20231229135154.675946-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/8] ARM: dts: stm32: rename mmc_vcard to
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
