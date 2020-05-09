Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C75D21CBE3C
	for <lists+linux-stm32@lfdr.de>; Sat,  9 May 2020 08:58:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91F1EC36B15;
	Sat,  9 May 2020 06:58:39 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DB3EC36B14
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  9 May 2020 06:58:37 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 18so2155863pfv.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 May 2020 23:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=e7MiLH7+SCtzdt0PBk2oBWo6WTMfe3HTrl4Wg7fT5b8=;
 b=vXdN8oypTs3z11xY+tYCbwNsJsWc09M2NTfdgk362GzYGjuOhmweKw0fBqIjtJRioO
 4Bv2v2sRxvLiDGjJmyCn4v9XqjuvHLlmlaZuKER9aC77SYKfRPygWHeEDqeDeL19wvXG
 jDY2fx0dJy2qJOM28eDgrAOcySYfq1+V+jbso60kjUwVPh0IlCO8X2HxsSQiJ+TkQnc6
 RybMCGAZu6zTMRecBvOtL6h9sG6cXQ1va2DRKE1o14L5aOXP3Hb920UtA8Fz075lIUSA
 plWojAKpTbjrEFwUcnUiTwXg7Db3GhsX7TRNppYgWIgcJ7INMfsd9Q19BWcwqPdLlQl3
 q+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=e7MiLH7+SCtzdt0PBk2oBWo6WTMfe3HTrl4Wg7fT5b8=;
 b=Wai8YUaoqlli/sNEaiAeazV4ZSWZsI50Xnvl3ApRUIQXogm4GkmTRk27Iu/gejcqqu
 IX9INqsl0I2Cz/4bfZ4Rq3+IQpBQ2dSmXrtbEVcOv69a0AzqLujpjAez679cJLPikbCr
 vLmiPqN5U5T0pPVjJ3YG6XkyEZpywhLvLi56JeFyhQSpB6Cl6IIG3wCIrlcYIsqiUMl7
 S6UjVvsrKT7W02NEB2uhQzkkXLx6lK4jJRJbK35Uk+87rksyCAHpD8TXEgATxxoXo1n4
 vX9ssd23NPrDjMoFlgMFQovCX2kB4f2x4Z57gytR/8xRU2uiQhV+Tt559s3jcWkJXE5O
 Sx8A==
X-Gm-Message-State: AGi0PuZb48GyyDNUq7Fj3x83cTwNRp/qfIuU/nMSbbbPLeKv+mWy8xf+
 w4KAgScIaV1TcRwnSOedHzs=
X-Google-Smtp-Source: APiQypK3wT9LttykvZaRfxnpnUFiKYc9Ap/hkzHYXBDRd2HlFmINnaeauCt6vlHaxkkOFfT6f8Szuw==
X-Received: by 2002:aa7:8509:: with SMTP id v9mr6968735pfn.110.1589007516067; 
 Fri, 08 May 2020 23:58:36 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id w192sm3811572pff.126.2020.05.08.23.58.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 May 2020 23:58:35 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 broonie@kernel.org, p.zabel@pengutronix.de
Date: Sat,  9 May 2020 14:58:22 +0800
Message-Id: <1589007503-9523-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589007503-9523-1-git-send-email-dillon.minfei@gmail.com>
References: <1589007503-9523-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, dillonhua@gmail.com,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 dillon min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/3] ARM: dts: stm32: enable l3gd20 on
	stm32429-disco board
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: dillon min <dillon.minfei@gmail.com>

Enable l3gd20 on stm32429-disco board.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 arch/arm/boot/dts/stm32f429-disco.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
index 30c0f67..d365358 100644
--- a/arch/arm/boot/dts/stm32f429-disco.dts
+++ b/arch/arm/boot/dts/stm32f429-disco.dts
@@ -49,6 +49,8 @@
 #include "stm32f429.dtsi"
 #include "stm32f429-pinctrl.dtsi"
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "STMicroelectronics STM32F429i-DISCO board";
@@ -127,3 +129,25 @@
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&spi5 {
+	status = "okay";
+	pinctrl-0 = <&spi5_pins>;
+	pinctrl-names = "default";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	cs-gpios = <&gpioc 1 GPIO_ACTIVE_LOW>;
+	dmas = <&dma2 3 2 0x400 0x0>,
+	       <&dma2 4 2 0x400 0x0>;
+	dma-names = "rx", "tx";
+	l3gd20: l3gd20@0 {
+		compatible = "st,l3gd20-gyro";
+		spi-max-frequency = <10000000>;
+		st,drdy-int-pin = <2>;
+		interrupt-parent = <&gpioa>;
+		interrupts = <1 IRQ_TYPE_EDGE_RISING>,
+				<2 IRQ_TYPE_EDGE_RISING>;
+		reg = <0>;
+		status = "okay";
+	};
+};
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
