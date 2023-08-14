Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD58177B9F7
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Aug 2023 15:28:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70AD2C6B479;
	Mon, 14 Aug 2023 13:28:54 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6DF0C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Aug 2023 13:28:53 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-99bf1f632b8so610399966b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Aug 2023 06:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1692019733; x=1692624533;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nzDesMH0Rl8r5eYsX/SIRdNEzTscR6QCg7fSNhCB0vk=;
 b=MQgLNcDYQmvN7uT6SDWKD3NsfK4SledTLTrDPRLfkNlRqZC6jYQJviTAMkbpRD6B8L
 rEvMsDFoOWVc8ZQMwPCWnrOGeRfv0ClQH5mPeBGH12edBFScvSlgwlaEsDzDJ012ogQF
 HIBGaZ5G5asPiSgniOZ4j+HV2/FCk2hD8vsis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692019733; x=1692624533;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nzDesMH0Rl8r5eYsX/SIRdNEzTscR6QCg7fSNhCB0vk=;
 b=eWAGT4Gk3vyHPCNQuO6/u64Q2MzJ95mLH5LJmwV9V2XiyrkFavdYh/17GTpmyxZQm4
 TAyM/WISxa3NPRy9JSiHH1EJGcS58nXPd1icF0PdmkbJPgX7R91BpyBB90YLDtsQm/X7
 mEn+0AWIqwJ4XpgwX4nzvpw7/n/KEdYBbrsZ+i9cZHnm2+BmkaZLzNBTArT9ZvWs49wn
 qS/Ggx26mYhIJ+Hmzt88hSPGzpWWG/OZSLOchQ4mHUn4YfYNYonXXWWLMycq3cv5yzlI
 CJ9hea8uT/9u0OTZTr2XAhvFrGkFX3T0FQ6efiTBlVhCh7lXWo9LCXzOnzOIxNekd3mh
 O+RA==
X-Gm-Message-State: AOJu0Yzyd1SMsOWBxcmSV/SrTB5c48mI7Xel3cHYZG25G4O5U075/uCw
 /Cd6NvmcTW+dTUzdqpLmuC9nFQ==
X-Google-Smtp-Source: AGHT+IETZ6FarzVDypPuqWg73eGRUFR/48vMRN3Lk2qC2taThkHQZ1OzGY5Od1lINS8WuYxn/U+QSw==
X-Received: by 2002:a17:907:1def:b0:99c:22e3:3eed with SMTP id
 og47-20020a1709071def00b0099c22e33eedmr8170672ejc.73.1692019733450; 
 Mon, 14 Aug 2023 06:28:53 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-180-23-204.pool80180.interbusiness.it. [80.180.23.204])
 by smtp.gmail.com with ESMTPSA id
 e3-20020a170906248300b0099d02ca4327sm5662066ejb.54.2023.08.14.06.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 06:28:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 14 Aug 2023 15:28:43 +0200
Message-Id: <20230814132844.113312-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230814132844.113312-1-dario.binacchi@amarulasolutions.com>
References: <20230814132844.113312-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v8 3/4] ARM: dts: stm32: rename mmc_vcard to
	vcc-3v3 on stm32f746-disco
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

In the schematics of document UM1907, the power supply for the micro SD
card is the same 3v3 voltage that is used to power other devices on the
board. By generalizing the name of the voltage regulator, it can be
referenced by other nodes in the device tree without creating
misunderstandings.

This patch is preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/boot/dts/st/stm32f746-disco.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32f746-disco.dts b/arch/arm/boot/dts/st/stm32f746-disco.dts
index c11616ed5fc6..4e785039ba5a 100644
--- a/arch/arm/boot/dts/st/stm32f746-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f746-disco.dts
@@ -79,9 +79,9 @@ vcc5v_otg_fs: vcc5v-otg-fs-regulator {
 		regulator-always-on;
 	};
 
-	mmc_vcard: mmc_vcard {
+	vcc_3v3: vcc-3v3 {
 		compatible = "regulator-fixed";
-		regulator-name = "mmc_vcard";
+		regulator-name = "vcc_3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 	};
@@ -101,7 +101,7 @@ &i2c1 {
 
 &sdio1 {
 	status = "okay";
-	vmmc-supply = <&mmc_vcard>;
+	vmmc-supply = <&vcc_3v3>;
 	cd-gpios = <&gpioc 13 GPIO_ACTIVE_LOW>;
 	pinctrl-names = "default", "opendrain";
 	pinctrl-0 = <&sdio_pins_a>;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
