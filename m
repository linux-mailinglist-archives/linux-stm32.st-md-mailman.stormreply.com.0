Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE6F725433
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jun 2023 08:31:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30BEFC6905A;
	Wed,  7 Jun 2023 06:31:50 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39DCBC65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jun 2023 06:31:49 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-30c2bd52f82so6998144f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Jun 2023 23:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1686119509; x=1688711509;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tlm5X0f1SJIUHEa+Ch7CRBAmlhS5LXsyaOP8GZ1/KKI=;
 b=bzMNTxZK/4hAhbCJfyfkajbjSZHcrJlJ/ANGEgI8Xc2LZi/1j3XIaARW8OaUk1oUNt
 xVXHCzLxMc+NJPP7tmKJXtlG0YFtoAOv6eKRl6cIeAXRzBEeZFxDxGMzfM6EQiFdDCoG
 UlbJzxvd+HoA7k7tgjRYe/4BsTTBBkPNUkICY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686119509; x=1688711509;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tlm5X0f1SJIUHEa+Ch7CRBAmlhS5LXsyaOP8GZ1/KKI=;
 b=GIUt+9DJaqK+DKMBJmFxmu/k7W9Da2d0fsj0P5NMgIkoAEx6wpzZCL002S10KogYul
 d2iHpgAofadYyJWe4CXwU2dnagSeZdfqf1swRMEI3UtIf0Vc+bwqa0NPhNWqDhzopufe
 OEL4qBBsKznYv90sZoqetD7chkBO+j24uTwEyhcM0d4Dt46jAdQXZyqa/iYZQg52yFgL
 TbMIBMPFU6zJy2vYR0WGT/MYZmSdNx9NuapGNIKahPPCSXJEC0KRoAK0ALvO5aVm9zGh
 vctaS+nruTpQ2w5OY2/Z1+9h59a2QXjtmazRktR+ZuIfgAWffloUCeS/tPvnDmC0qKJq
 X/0g==
X-Gm-Message-State: AC+VfDyXV9fDisO3l8wwPQ6Sf6Qoi0xtMmOzWUB4ciFLyOiwRzwNR3fG
 O+9tg2QwkTfE/XDhtxHsBR4zzw==
X-Google-Smtp-Source: ACHHUZ6ixe3R4kTg2jdLqsiTsvsMwIkzn0sw/3lIsOWGtuw4V3ztP1iDpCLGs/weEh3bWDKm3W6iSg==
X-Received: by 2002:adf:eac1:0:b0:30e:5729:b5a5 with SMTP id
 o1-20020adfeac1000000b0030e5729b5a5mr1086540wrn.38.1686119508799; 
 Tue, 06 Jun 2023 23:31:48 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([37.159.114.163])
 by smtp.gmail.com with ESMTPSA id
 m6-20020adff386000000b0030630120e56sm14385127wro.57.2023.06.06.23.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 23:31:48 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Wed,  7 Jun 2023 08:31:36 +0200
Message-Id: <20230607063139.621351-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230607063139.621351-1-dario.binacchi@amarulasolutions.com>
References: <20230607063139.621351-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RESEND PATCH v2 3/6] ARM: dts: stm32: support
	display on stm32f746-disco board
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

Add support to Rocktech RK043FN48H display on stm32f746-disco board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/boot/dts/stm32f746-disco.dts | 51 +++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f746-disco.dts b/arch/arm/boot/dts/stm32f746-disco.dts
index c11616ed5fc6..cda423b6a874 100644
--- a/arch/arm/boot/dts/stm32f746-disco.dts
+++ b/arch/arm/boot/dts/stm32f746-disco.dts
@@ -60,10 +60,41 @@ memory@c0000000 {
 		reg = <0xC0000000 0x800000>;
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			no-map;
+			size = <0x80000>;
+			linux,dma-default;
+		};
+	};
+
 	aliases {
 		serial0 = &usart1;
 	};
 
+	backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&gpiok 3 GPIO_ACTIVE_HIGH>;
+		status = "okay";
+	};
+
+	panel_rgb: panel-rgb {
+		compatible = "rocktech,rk043fn48h";
+		backlight = <&backlight>;
+		enable-gpios = <&gpioi 12 GPIO_ACTIVE_HIGH>;
+		status = "okay";
+		port {
+			panel_in_rgb: endpoint {
+				remote-endpoint = <&ltdc_out_rgb>;
+			};
+		};
+	};
+
 	usbotg_hs_phy: usb-phy {
 		#phy-cells = <0>;
 		compatible = "usb-nop-xceiv";
@@ -99,6 +130,26 @@ &i2c1 {
 	status = "okay";
 };
 
+&dma1 {
+	status = "okay";
+};
+
+&dma2 {
+	status = "okay";
+};
+
+&ltdc {
+	pinctrl-0 = <&ltdc_pins_a>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	port {
+		ltdc_out_rgb: endpoint {
+			remote-endpoint = <&panel_in_rgb>;
+		};
+	};
+};
+
 &sdio1 {
 	status = "okay";
 	vmmc-supply = <&mmc_vcard>;
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
