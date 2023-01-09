Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF6A662ED2
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Jan 2023 19:24:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6349FC69053;
	Mon,  9 Jan 2023 18:24:09 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A6C6C69048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jan 2023 18:24:07 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id ud5so22356800ejc.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Jan 2023 10:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jfErmyZAWFClEhl0ayKENaiIcOOkglWFws7K0nbLI8s=;
 b=keYgJ2y3nl5URethgnUoaSGHv3Qr1qCaZizWzyh3ecUHLBUFAOR+b0RCOE0XQ/QD0X
 dhlXZZ4fBWTRdK5q3Ef7VW5Cs9igbU9BkjasBP0WiF2ebvrFYvw9xBJe/tyRlKNdendY
 mN1/SXhIEecvDAHuF1wycidjyRVeJ3uPadn2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jfErmyZAWFClEhl0ayKENaiIcOOkglWFws7K0nbLI8s=;
 b=ugrtB02o4JQcIbspLnSp2/0C6WSCcopgqG5aabUdlgDGeLn7n9t/lEHPlcpLqgQr02
 XAEZ3iBl17Dh8o+UQL296SybsfaOvZqNHusJleR1yYLKxcTvwTTwNPTfVWEcuK4HowtL
 DfNpuNfeJ/00sl1n9tEfZrj0rxVT79KDx1wMYb/8MLl9Wv9mViEFyVzycK+oMtVEuO8d
 aUgx3dLPgF++1vASHjkEu3i/zJzJRNBjtnqlOgD7LKkMtjJckw2vWKJhnc+AsukvbryN
 voDd1BiHuSyWkl/QaA8IqYS8rC96WFi7s4wAJypFaUnpYTzOMCJ6VPGlBDG4/OrASquX
 xPwA==
X-Gm-Message-State: AFqh2kodx66iyGclaHbo9VGQQEwnbXCCb+ZhmqxtLKJsIL6of/wVPRae
 Fz458keWSu+HaSwG8QnsDubRNA==
X-Google-Smtp-Source: AMrXdXtO6fIJ3sOc41BMC9psPV+e6x5DXYY7cI4VJRUluWdF9f+T6K4XqawFGBAk0fbrbk81UWuMbw==
X-Received: by 2002:a17:907:2113:b0:84d:4b39:1448 with SMTP id
 qn19-20020a170907211300b0084d4b391448mr3081519ejb.67.1673288647150; 
 Mon, 09 Jan 2023 10:24:07 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch
 (host-80-180-23-57.retail.telecomitalia.it. [80.180.23.57])
 by smtp.gmail.com with ESMTPSA id
 kz22-20020a17090777d600b007c1633cea13sm4093653ejc.12.2023.01.09.10.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 10:24:06 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon,  9 Jan 2023 19:23:54 +0100
Message-Id: <20230109182356.141849-5-dario.binacchi@amarulasolutions.com>
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
Subject: [Linux-stm32] [PATCH v6 4/5] ARM: dts: stm32: add pin map for CAN
	controller on stm32f4
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

Add pin configurations for using CAN controller on stm32f469-disco
board. They are located on the Arduino compatible connector CN5 (CAN1)
and on the extension connector CN12 (CAN2).

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v3)

Changes in v3:
- Remove 'Dario Binacchi <dariobin@libero.it>' SOB.
- Remove a blank line.

Changes in v2:
- Remove a blank line.

 arch/arm/boot/dts/stm32f4-pinctrl.dtsi | 30 ++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
index 500bcc302d42..8a4d51f97248 100644
--- a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
@@ -448,6 +448,36 @@ pins2 {
 					slew-rate = <2>;
 				};
 			};
+
+			can1_pins_a: can1-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('B', 9, AF9)>; /* CAN1_TX */
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('B', 8, AF9)>; /* CAN1_RX */
+					bias-pull-up;
+				};
+			};
+
+			can2_pins_a: can2-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('B', 13, AF9)>; /* CAN2_TX */
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('B', 5, AF9)>; /* CAN2_RX */
+					bias-pull-up;
+				};
+			};
+
+			can2_pins_b: can2-1 {
+				pins1 {
+					pinmux = <STM32_PINMUX('B', 13, AF9)>; /* CAN2_TX */
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('B', 12, AF9)>; /* CAN2_RX */
+					bias-pull-up;
+				};
+			};
 		};
 	};
 };
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
