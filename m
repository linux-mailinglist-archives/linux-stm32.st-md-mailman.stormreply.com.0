Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9B87477E4
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jul 2023 19:34:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8C69C6B45B;
	Tue,  4 Jul 2023 17:34:16 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 417F3C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jul 2023 17:34:13 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-9924ac01f98so713469266b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Jul 2023 10:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1688492053; x=1691084053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E82hjoqhMKWrCTgt/fXbmQjWVshoS0GVNipXIUdN9/k=;
 b=MknyirkMO5L5olTeZIB+6FibKKcCcnwpxx/lCEzrasyo2VaFLkGQnFAE3XfyPXBBrd
 5JxMLWQ7UgqdselInS83IA00I+bXOSMIaqZdnLoXYlsLnBsPk9jsj1FkP2NEBYAB8Itd
 3avYV1f8udp3EgWdoV4qLZSWIHNNmDKUnRAkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688492053; x=1691084053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E82hjoqhMKWrCTgt/fXbmQjWVshoS0GVNipXIUdN9/k=;
 b=ikJ0mZ3asmLB9QedKaFmXHOmQdpzOJTeGX2KHph41jruF1ubSNR3V8qVwOiwMYscH9
 ZbE2UnTvqc+fvqzNwJEoYqW1o2NRPGbQrMl26pPjkHSo2r02dNQTPQfPpe8NgJmLNVwJ
 GhAJ0T8O9392YtC4QCejn1cx0tF8rBOrxhb08iahEfbZ7Y/nVwkF1ErlxQ2r6T54X+Dz
 6rdGbulcmaBqO4yupVDqp49PupJBc4Xe2e5dxvDLPEpCnS2VW48c8mDoddhMTnf/9FI1
 1kgRSZ2UtBlKXvwyBann14ix2B+zE5uyisva5OhTEiRKNO9jgzHYRJPfK4Kn5vy64TTd
 qWEA==
X-Gm-Message-State: ABy/qLaOKO+SHnW7YvZzzxV79d42s3uRUliKDkbsn8vass2ToSyJCaPn
 rjOqv13zmGZ8wHPgUDuqL0Edfg==
X-Google-Smtp-Source: APBJJlEUTY/dtc0SSVLyoiRR0j7AGo68Z6RwBaNZuNo7uqPpDBL2Z2MiKGW2gWb95F8odAa5qV455Q==
X-Received: by 2002:a17:906:a88b:b0:988:4a48:6ff3 with SMTP id
 ha11-20020a170906a88b00b009884a486ff3mr10024044ejb.30.1688492052935; 
 Tue, 04 Jul 2023 10:34:12 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-58-49-236.retail.telecomitalia.it. [82.58.49.236])
 by smtp.gmail.com with ESMTPSA id
 v24-20020a1709064e9800b00992ca779f42sm6724645eju.97.2023.07.04.10.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 10:34:12 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Tue,  4 Jul 2023 19:34:07 +0200
Message-Id: <20230704173407.590544-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230704173407.590544-1-dario.binacchi@amarulasolutions.com>
References: <20230704173407.590544-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] ARM: dts: stm32: add touchscreen on
	stm32f746-disco board
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

The patch adds support for touchscreen on the stm32f746-disco board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32f746-disco.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32f746-disco.dts b/arch/arm/boot/dts/st/stm32f746-disco.dts
index c11616ed5fc6..4830ccd48cb3 100644
--- a/arch/arm/boot/dts/st/stm32f746-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f746-disco.dts
@@ -45,6 +45,7 @@
 #include "stm32f746-pinctrl.dtsi"
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "STMicroelectronics STM32F746-DISCO board";
@@ -99,6 +100,22 @@ &i2c1 {
 	status = "okay";
 };
 
+&i2c3 {
+	pinctrl-0 = <&i2c3_pins_a>;
+	pinctrl-names = "default";
+	clock-frequency = <400000>;
+	status = "okay";
+
+	touchscreen@38 {
+		compatible = "edt,edt-ft5306";
+		reg = <0x38>;
+		interrupt-parent = <&gpioi>;
+		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <480>;
+		touchscreen-size-y = <272>;
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
