Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D124662ED1
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Jan 2023 19:24:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CA46C6904C;
	Mon,  9 Jan 2023 18:24:08 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A547C69048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jan 2023 18:24:06 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id az20so3263670ejc.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Jan 2023 10:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IyvoS4lwvIpyEoyklIwrERImFtUVOqbD9XwAm5ABwfM=;
 b=Em2qQJ7rFEjYkZdoCry2iyVJCDZzqkWRMTzhgGNjO+cpHZb1MqFbrE3G8pZC7dkfKh
 xQjLkDRJr04LNOnP3omQC1x0RLQclqRc/G13V4NXXA446J5edO08vTeBMC9IbS1F1Rwu
 Dvg0X6VxJH9iChHXi5Bnr1oSSfI2gOpxEbOcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IyvoS4lwvIpyEoyklIwrERImFtUVOqbD9XwAm5ABwfM=;
 b=Gy0U/hleYVN6aFq/IJlmxFPfXMOvRIprx9tIfLO7jDJIX3Ra2lPieSFDCSykpQh3+m
 LtxVyJ2HjEHGvCocc3GkG30XfWBAMkSxZfCARmTpzpBs+F/Ot3mCpNLtTlHYnj1yV+DS
 kf13xo++WycRjN/2RAiQ4WU5+VoCSMBKF5uTiGSmmRhhyxSrZn2UFxPLMJJfi2jMdW3j
 epe+Wat6GlXsfhiGTGR53Z/PAEZPcsxi5jATPmtJ+wHq8xyeyEeZ60ixnsYJ76fwz+rJ
 c76rKqR9ZiLwGdRl3M++UVV5F22eR7bvsDj4ij2cFY+MMUpccEOly/MXQfPfacN/KMwJ
 Rq2g==
X-Gm-Message-State: AFqh2kqZGvPDs/eP2Az5L9yJ5XWtSU6eS3gcyWvJwhTKFGvrYEoIkzSZ
 CReJMiDRhcXf8tlwmjEPyxM/pQ==
X-Google-Smtp-Source: AMrXdXuAWf3obP0O2U9Of1B+8WU1d8adQ+eaAjxTYDRZkG9FzhsZfn5BB6FfOrkaxBgYFCusBIeDWw==
X-Received: by 2002:a17:907:2388:b0:7c0:e0d9:d20d with SMTP id
 vf8-20020a170907238800b007c0e0d9d20dmr53677519ejb.37.1673288645715; 
 Mon, 09 Jan 2023 10:24:05 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch
 (host-80-180-23-57.retail.telecomitalia.it. [80.180.23.57])
 by smtp.gmail.com with ESMTPSA id
 kz22-20020a17090777d600b007c1633cea13sm4093653ejc.12.2023.01.09.10.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 10:24:05 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon,  9 Jan 2023 19:23:53 +0100
Message-Id: <20230109182356.141849-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230109182356.141849-1-dario.binacchi@amarulasolutions.com>
References: <20230109182356.141849-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [Linux-stm32] [PATCH v6 3/5] ARM: dts: stm32: add CAN support on
	stm32f429
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

Add support for bxcan (Basic eXtended CAN controller) to STM32F429. The
chip contains two CAN peripherals, CAN1 the master and CAN2 the slave,
that share some of the required logic like clock and filters. This means
that the slave CAN can't be used without the master CAN.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v6:
- move can1 node before gcan to keep ordering by address.

Changes in v4:
- Replace the node can@40006400 (compatible "st,stm32f4-bxcan-core")
  with the gcan@40006600 node ("sysnode" compatible). The gcan node
  contains clocks and memory addresses shared by the two can nodes
  of which it's no longer the parent.
- Add to can nodes the "st,gcan" property (global can memory) which
  references the gcan@40006600 node ("sysnode compatibble).

Changes in v3:
- Remove 'Dario Binacchi <dariobin@libero.it>' SOB.
- Add "clocks" to can@0 node.

 arch/arm/boot/dts/stm32f429.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index c31ceb821231..809b2842ded9 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -362,6 +362,35 @@ i2c3: i2c@40005c00 {
 			status = "disabled";
 		};
 
+		can1: can@40006400 {
+			compatible = "st,stm32f4-bxcan";
+			reg = <0x40006400 0x200>;
+			interrupts = <19>, <20>, <21>, <22>;
+			interrupt-names = "tx", "rx0", "rx1", "sce";
+			resets = <&rcc STM32F4_APB1_RESET(CAN1)>;
+			clocks = <&rcc 0 STM32F4_APB1_CLOCK(CAN1)>;
+			st,can-master;
+			st,gcan = <&gcan>;
+			status = "disabled";
+		};
+
+		gcan: gcan@40006600 {
+			compatible = "st,stm32f4-gcan", "syscon";
+			reg = <0x40006600 0x200>;
+			clocks = <&rcc 0 STM32F4_APB1_CLOCK(CAN1)>;
+		};
+
+		can2: can@40006800 {
+			compatible = "st,stm32f4-bxcan";
+			reg = <0x40006800 0x200>;
+			interrupts = <63>, <64>, <65>, <66>;
+			interrupt-names = "tx", "rx0", "rx1", "sce";
+			resets = <&rcc STM32F4_APB1_RESET(CAN2)>;
+			clocks = <&rcc 0 STM32F4_APB1_CLOCK(CAN2)>;
+			st,gcan = <&gcan>;
+			status = "disabled";
+		};
+
 		dac: dac@40007400 {
 			compatible = "st,stm32f4-dac-core";
 			reg = <0x40007400 0x400>;
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
