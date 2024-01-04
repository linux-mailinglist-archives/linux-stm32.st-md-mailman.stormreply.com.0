Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A6D823D9C
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jan 2024 09:42:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D535C6C83B;
	Thu,  4 Jan 2024 08:42:18 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62128C6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jan 2024 08:42:16 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-55539cac143so320386a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Jan 2024 00:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704357736; x=1704962536;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mmQnQzOW0HVCglZmRdERbSkiK/7LfpA/GFNr/QR6hMQ=;
 b=FB3j8npVjif80jTkJ6m5/FVwdS5xoH+0UngvgxjHOE+MeCrmdMbR3HeDklZbm6SxNy
 /mMC7xdhnH7vWk1EUd2c7wHY3VzJ52p787ug1r7YVrj/p8qyOIF23QzJFxIjprQD4PLL
 7pzXKbaqn+TyRSt0u5rQGD3IynhiKsEZs1RiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704357736; x=1704962536;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mmQnQzOW0HVCglZmRdERbSkiK/7LfpA/GFNr/QR6hMQ=;
 b=pYvj3MyzIhTa9MfeX227WjX8V5LZ1obixrZeBJ6CSeeoc3Kwav371vtnfratKbl5fo
 aUx1q5n2KdprsEjf5cfwfrNwsXIwBmZjrsrkk2Oy/bZokRvKSLQgCXZrP1O2scwpd/CA
 tT+kY96atsBKQfNwVFnOz8T/OjNOEc9EBuxqSqTZfE7kKsUq0Jl48snJsyq3ThYFK7Q/
 uZH5MDNoWnKwkKkhGMO3HSsPJaZ0Laaw8d2vf3xPEm2Ww7iMG0JMr6RpjxJdBAQyB9nm
 wr3QD4K4N0WO3Q44O6yXUdSePcsToax2FLHnWXNpBSzlb3eTXNTXMZOb2Zmat4X4xWJK
 KJkw==
X-Gm-Message-State: AOJu0YxySfInR8S8D1ZfAD+JlncERoQovTeKNQe7I2ZDnvT33NKBwF8S
 /sKTEilHwqXz+P6o+9sL3E0ZoRDQd5N4Ng==
X-Google-Smtp-Source: AGHT+IHSYPcVifjg7WaTw/q5gyvP9LIwxVEzE68+cuj6LtkM0cSU6dPkyvmWyHhxnoLtxki+J+/I7Q==
X-Received: by 2002:a17:906:c244:b0:a23:35d2:cf97 with SMTP id
 bl4-20020a170906c24400b00a2335d2cf97mr149261ejb.64.1704357735999; 
 Thu, 04 Jan 2024 00:42:15 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (net-93-150-255-34.cust.vodafonedsl.it. [93.150.255.34])
 by smtp.gmail.com with ESMTPSA id
 wh14-20020a170906fd0e00b00a233efe6aa7sm13495704ejb.51.2024.01.04.00.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jan 2024 00:42:15 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Thu,  4 Jan 2024 09:41:42 +0100
Message-ID: <20240104084206.721824-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240104084206.721824-1-dario.binacchi@amarulasolutions.com>
References: <20240104084206.721824-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 2/8] ARM: dts: stm32: add DSI support on
	stm32f769
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

Add support for MIPI DSI Host controller. Since MIPI DSI is not
available on stm32f746, the patch adds the "stm32f769.dtsi" file
containing the dsi node inside.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/boot/dts/st/stm32f769.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 arch/arm/boot/dts/st/stm32f769.dtsi

diff --git a/arch/arm/boot/dts/st/stm32f769.dtsi b/arch/arm/boot/dts/st/stm32f769.dtsi
new file mode 100644
index 000000000000..e09184f7079c
--- /dev/null
+++ b/arch/arm/boot/dts/st/stm32f769.dtsi
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ */
+
+#include "stm32f746.dtsi"
+
+/ {
+	soc {
+		dsi: dsi@40016c00 {
+			compatible = "st,stm32-dsi";
+			reg = <0x40016c00 0x800>;
+			interrupts = <98>;
+			clocks = <&rcc 1 CLK_F769_DSI>, <&clk_hse>;
+			clock-names = "pclk", "ref";
+			resets = <&rcc STM32F7_APB2_RESET(DSI)>;
+			reset-names = "apb";
+			status = "disabled";
+		};
+	};
+};
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
