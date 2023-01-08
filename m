Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B25C661684
	for <lists+linux-stm32@lfdr.de>; Sun,  8 Jan 2023 17:26:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3CF6C6905B;
	Sun,  8 Jan 2023 16:26:05 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4DD3C6905D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  8 Jan 2023 16:26:04 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id r26so9194163edc.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 08 Jan 2023 08:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jfErmyZAWFClEhl0ayKENaiIcOOkglWFws7K0nbLI8s=;
 b=YSC3OP4TGn1VPvfygj0by5L4sf/6V9LnPq9OUQ8JOfL5ruwSYj3wXY1+xejQnk5f+j
 Hx7h0Jc9hPrOGPjrvaBVujgJZVLD/rargrN3b9zZvQcjjPHrj2HQ8PccN78orzy2TffZ
 gr23AF/OflooX70a36NEie4LyAUBvKqSlpBD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jfErmyZAWFClEhl0ayKENaiIcOOkglWFws7K0nbLI8s=;
 b=VOCElOc2FOjx8I3Q5ZiCj7fDUJljKSCmDMcjmOlzYXHa7ZHwZ98fv2hT4TQMqffecp
 2VofZVUFAuRERdX0RJ/rk7yZu5psuXguiz+uYDsC3hsS9XXTaVeca9Ksk+v4URQrWQtQ
 RfLmN8oTJ8T4buzXGQ7foecJ8lWtNCPtbp5cOfmPq8WBHuer1nLPWfmgba/nk5Ca+Whp
 Bbo79US9lfLzZf7ixuXjFUhqXCn6K0wuRDwOj15fBrX6f0O5qt32xOEDicxtvGF7TM6d
 JkKeWoKb42ZLr+wyLyh/4fxb+PgS+WaaBFm7vkw3aN/ZpblMcEIl+Wzelpe0v2oN3qRA
 WhVQ==
X-Gm-Message-State: AFqh2kpC6TOzAFsvLeYRfdyxIhtaZdI+RMLfgPGTGQssUU2DY7SpvO8d
 Ms1ZIScc8Ov4ZqB2N3nNcXbTpg==
X-Google-Smtp-Source: AMrXdXstskybOIlFfZ2yFlK+q9xGYyt7ZxAVwUMIGh3HiD2xyYSZZ0K6th4tIDlSvSfpyOAMvnJYjA==
X-Received: by 2002:a05:6402:5296:b0:461:dd11:c688 with SMTP id
 en22-20020a056402529600b00461dd11c688mr57289681edb.9.1673195164404; 
 Sun, 08 Jan 2023 08:26:04 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-180-23-57.pool80180.interbusiness.it. [80.180.23.57])
 by smtp.gmail.com with ESMTPSA id
 n3-20020aa7c443000000b00486074b4ce4sm2659614edr.68.2023.01.08.08.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 08:26:04 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sun,  8 Jan 2023 17:25:53 +0100
Message-Id: <20230108162554.8375-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230108162554.8375-1-dario.binacchi@amarulasolutions.com>
References: <20230108162554.8375-1-dario.binacchi@amarulasolutions.com>
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
Subject: [Linux-stm32] [RESEND RFC PATCH v5 4/5] ARM: dts: stm32: add pin
	map for CAN controller on stm32f4
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
