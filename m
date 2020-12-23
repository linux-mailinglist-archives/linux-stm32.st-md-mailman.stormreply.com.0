Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5385A2E1B73
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Dec 2020 12:08:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EAC83C57183;
	Wed, 23 Dec 2020 11:08:35 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18FECC5660F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Dec 2020 11:08:34 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id i5so2339131pgo.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Dec 2020 03:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gRczQcEVREVIHP/xCIGe+pHjWpZBhd9/8Bmyk1xi1h0=;
 b=Tdm+aRo5fz3I6o6oofiQYP4Dg5J+sA3cDlWHv8d/4XsG4r8Eylj/i+aIK+XiBTRHb/
 XIY8Y3JA71pVKMxR8MSTEUeKDtuyefm1g9aCi74H4BU1zKeNNbE4lh2RqvES7a/p42Y4
 EOp0tEPBR3XlgULoCOO+Df6derhRdWd/w/kRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gRczQcEVREVIHP/xCIGe+pHjWpZBhd9/8Bmyk1xi1h0=;
 b=k3TGbRjvrDTdwSgYDel406bcVJDiaYPVN+AoO/2bpZvmV5eMAyYYavJM1eAwpFlIgy
 9J108Q6EWhRUJSZSByDyeGe4hUpgeLviFPBg+8wsgbLGmszOR+qoZDieZF6U8sgzHb3y
 S5G+NZSIJZDSojffjt++bOLi4eAe2G6FozyW7qCqzmkKgmz8ixytHUwT2+o1pie4ZlPR
 N9rTPV601ItF3tHE19BbLhRPChlfBSzLPPhZzeQCKc5GDsNDgtZt6MlHoNbLr2Y0kXty
 bg77mS7ccNxJ9p3vL+l44bsD+lW2Q5OIbGL8qMswqoUOR+DOYPYNZZoKhgd1KlWgK8Ae
 KkDA==
X-Gm-Message-State: AOAM530RefMym8d1kWZgBq+sSAJvC5s7EUScpsDerwcrZ4TKL2vqLU4y
 XlTOkjEEQlAhLfd8HxXthh1rVQ==
X-Google-Smtp-Source: ABdhPJxI0lVlTeQudtwo04v0ZQt+J5cepsKS4VBuncWNGWBA6WddhHvJkit9Q34ifSZGrmUAvmjknQ==
X-Received: by 2002:a63:4746:: with SMTP id w6mr563080pgk.377.1608721713343;
 Wed, 23 Dec 2020 03:08:33 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a884:eca4:40c1:8784:571c])
 by smtp.gmail.com with ESMTPSA id d4sm23031093pfo.127.2020.12.23.03.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Dec 2020 03:08:32 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Wed, 23 Dec 2020 16:37:57 +0530
Message-Id: <20201223110757.126937-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Add STM32MP1 I2C6 SDA/SCL
	pinmux
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

Add SDA/SCL pinmux lines for I2C6 on STM32MP1.

This support adds both in default and sleep states.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index 20a59e8f7a33..2036c1d0d798 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -2018,6 +2018,23 @@ pins {
 		};
 	};
 
+	i2c6_pins_a: i2c6-0 {
+		pins {
+			pinmux = <STM32_PINMUX('Z', 6, AF2)>, /* I2C6_SCL */
+				 <STM32_PINMUX('Z', 7, AF2)>; /* I2C6_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c6_sleep_pins_a: i2c6-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('Z', 6, ANALOG)>, /* I2C6_SCL */
+				 <STM32_PINMUX('Z', 7, ANALOG)>; /* I2C6_SDA */
+		};
+	};
+
 	spi1_pins_a: spi1-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('Z', 0, AF5)>, /* SPI1_SCK */
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
