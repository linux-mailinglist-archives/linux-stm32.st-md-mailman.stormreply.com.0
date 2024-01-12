Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B7B82C210
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jan 2024 15:49:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62500C6DD7A;
	Fri, 12 Jan 2024 14:49:13 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86D57C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jan 2024 14:49:11 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a2bdc3a3c84so323546966b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jan 2024 06:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705070951; x=1705675751;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QAtJVjLEM4PpD1LfLOq0lj7khrRF1/PVKMI6rTwwftg=;
 b=jWYqoXs4QAfZEHmOXiwmtmXbFffvpUrOy4wzgYF7V86W1w9ThWhyUujdlvGXU+hTrv
 Hu+z8pCTgNxLQRE3lvfb6MMyd5ni1AlhHSCeyoBOsp+LkkT53MfRAp30LgkIBO9MpSDc
 wjqJsDj/yLaYslfi6N6MNnfsl6VBkwyDFaQVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705070951; x=1705675751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QAtJVjLEM4PpD1LfLOq0lj7khrRF1/PVKMI6rTwwftg=;
 b=G9F2/KLXdfNwRdb+RmVY9wgufofTdKmlHXPXcA/v5f2OZjv+9DcHECc1Hv9w9zWWXw
 iZO2MRyU0BN9qvKZoNJe5WH9FqYuhIPSkVv9K4Z2Wx6ncDNzpPxJNCaaU5BXSp6xvaLs
 sdN7IgZ7SUhdDaA/nylhcfZWZoE25sc2M/OZGJO212pwhqneBsx2PpQf34+K+tqiiglH
 xXhTqk4CfI87mwUWvDxmjhpQ2W4yOV1g+aOQDq9uppFlObPiDnqTfhI/3nitOhX61b7w
 G34yp21secf0DJrrJ3cc3Ysa+sJnx4bJu0YUXlgl+ArTLVJUFfBP7ssMDJ/o72lu2g9d
 IPhg==
X-Gm-Message-State: AOJu0YwrJZKot415VgaCGG5/+1VyzBOZCQAlOP3ifNKXNRbVfp6/p8xj
 RnylkzwVIusOuwIzBNnbowCN7U9SHjU/2Q==
X-Google-Smtp-Source: AGHT+IGnASLVa+5h7B/dg8g2MVP/TIO2T1WEegpWrRvX6D1NsF09O7sDLnBQYxbYnr6URa2E6UrKUQ==
X-Received: by 2002:a17:906:1e89:b0:a2c:2094:5d46 with SMTP id
 e9-20020a1709061e8900b00a2c20945d46mr679423ejj.81.1705070951050; 
 Fri, 12 Jan 2024 06:49:11 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 ([95.236.91.90]) by smtp.gmail.com with ESMTPSA id
 y11-20020a170906524b00b00a233515c39esm1869372ejm.67.2024.01.12.06.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 06:49:10 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 12 Jan 2024 15:48:23 +0100
Message-ID: <20240112144902.40044-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112144902.40044-1-dario.binacchi@amarulasolutions.com>
References: <20240112144902.40044-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v8 3/5] ARM: dts: stm32: rename mmc_vcard to
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

Changes in v8:
- Add Reviewed-by tag of Raphael Gallais-Pou

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
