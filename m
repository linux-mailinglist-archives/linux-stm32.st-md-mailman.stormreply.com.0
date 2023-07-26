Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BEA762C67
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 09:03:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FF56C6A61A;
	Wed, 26 Jul 2023 07:03:29 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 261A5C6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 07:03:28 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-4fbf09a9139so10063921e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 00:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690355007; x=1690959807;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+Sp6Oh3kIZYgwY/6PAzwynsD4VZMj8j6x6i38EBvjv4=;
 b=k13+9VtFyhCyA5x2o3+p6BFUWl8Y6TGcK+ogwMkvvl5J81O/Se+A/TuSVB0nWIbUbQ
 eLmY/aMEhNS9VKXnuu/br+QfQIdjkoNYdFPmWxQWHi3E3X3B/7Qmj8QgZCWbIo3kd/am
 BKtbVu7bjEhU/rcld+xJvdH0tU3UkGNwB9aIR/EKRT9B+2ZW22Shf1ZbCr1N5GwCwsMo
 xW3VYzQTdAWOKkcBF/cOcspJm/vh4XL2rihv5wMspqOb+CiQA37T76CuxE3qZHyHaYUz
 l2fvbI8xagKyHKkbAAH1vziITBrrkGyyaqFMzfD13CzUIu/PjykZKvnzIL8VUDkVGvGt
 ur/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690355007; x=1690959807;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+Sp6Oh3kIZYgwY/6PAzwynsD4VZMj8j6x6i38EBvjv4=;
 b=MuHWUTCdHcnw0GkOccyvssXovPAN9bpnsrkJUyPxx9ZtwV3dl4CGuiHXveCtJ3kL5M
 iCHuNBvxHMfXjz+kEQP9TcfZ3bHgPB4FKKuw/98vjNRykIsPH9jb1qsboTK8rH+2DQbW
 IZiIXthj+hjaGCiEy/CWEMp3UE3VXtepOy7n+x1ppOnGvhZnUHplAeeOlGF1TPyopzhK
 9wmrFv/D9QshnonBdey8Jb27Sn7KungQF2jnQbaaMSc62G3xjMo2BG3oCvQB4vy9beYK
 JlU81RHpLk6oBwPua+TFbX7ie6fjT21TR3/zhlJiiI9XmAigZi7DUU7Vw0qHuUZODaSW
 EnKA==
X-Gm-Message-State: ABy/qLbaizrPtnRRHIQFuIIQFjT2YJRrQclqNW3aTFFJotgSkKrkp3y+
 tcxURt5UAUKynCKKxB48Dca7sg==
X-Google-Smtp-Source: APBJJlFWiuBO4vk/bvm/I48NbQmLqb+Rw/jod2Hiopmi/kTz7LGgnkmgmBKcX6/u4/1AX2YuxUoPVQ==
X-Received: by 2002:ac2:495b:0:b0:4fe:8b5:588a with SMTP id
 o27-20020ac2495b000000b004fe08b5588amr723344lfi.57.1690355006710; 
 Wed, 26 Jul 2023 00:03:26 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104]) by smtp.gmail.com with ESMTPSA id
 dy16-20020a05640231f000b005224f840130sm1572003edb.60.2023.07.26.00.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 00:03:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Date: Wed, 26 Jul 2023 09:03:15 +0200
Message-Id: <20230726070322.103871-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 1/8] AMR: dts: imx6sx-nitrogen6sx: drop
	incorrect regulator clock-names
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

regulator-fixed does not take "clock-names" property:

  imx6sx-nitrogen6sx.dtb: regulator-wlan: Unevaluated properties are not allowed ('clock-names' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts b/arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts
index a2c79bcf9a11..23ccca2dea44 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts
@@ -72,7 +72,6 @@ reg_wlan: regulator-wlan {
 		pinctrl-0 = <&pinctrl_reg_wlan>;
 		compatible = "regulator-fixed";
 		clocks = <&clks IMX6SX_CLK_CKO>;
-		clock-names = "slow";
 		regulator-name = "wlan-en";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
