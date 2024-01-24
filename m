Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6210B83A7EB
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jan 2024 12:33:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2622BC6DD77;
	Wed, 24 Jan 2024 11:33:47 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B638CC6DD74
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jan 2024 11:33:44 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-40e9101b5f9so59046005e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jan 2024 03:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1706096024; x=1706700824;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WphLFokV77snya9flF2ShSJ6MCXN7QDFds6UuGxFul8=;
 b=AKy26wgZEBBdFUGzj70Dn3gV+QCHJwOwov+bn70mVF9tgWXp2D3c3XHuYw5ym0Wk4M
 V2qBGY2lDDPJEwZfEXvT8+CID84S4LXv/JlbKlqtKaL02XTXj2IpcTpuTTxTaxOGDJK/
 23bVnUv35FMChcv4OM1A/IpM+olV4MxdjNQDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706096024; x=1706700824;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WphLFokV77snya9flF2ShSJ6MCXN7QDFds6UuGxFul8=;
 b=wGUSrAlz76xSa9iLOW+UXzUW65li4NP/YLDKWfD/ndF/Qw2DxZEvRXqPbGXesGBUdW
 fekp3/+jEIj1jP0Cdh2yd7E+aRAF0jAqUxy0xcS2aOE6Vr60IvFL3ZR/xFGulSJaYswm
 EQ+ovQ93nUe/rn9Dw33NW3GLnwgwZlSz35VvbankXo59lXCO+XNBO1+9fQtxh9XGb9A6
 MfzI2n35zVbLIYDerajCUfQZ2HEM+7+vUj7xIQhAe8bt6OlPiHWLL1TwepnSKb5p5znO
 bi67Qi3Q57yIvxx52SuUBTaD+nWQoin5mUfM0rzI670ap+I04ANsax3oLZUOd786johZ
 E1KQ==
X-Gm-Message-State: AOJu0YyyXkYUzAUoBlRNhcnLVnLL1/7StPNCdiLr8zsfTLQOaPMzuEC3
 V99CuWY80I4jdh9Au+6ZpL5hobAEIOP3jfgx4sIM/sUijuyrqOVblXEjqqTFQrk=
X-Google-Smtp-Source: AGHT+IGOUkv5923WUqPQ5SE+T1OnkUB/eAKV+nDxqcTwfy3veeTmgeesBlzUJorJkQ+SmHn5MBZNWw==
X-Received: by 2002:a05:600c:993:b0:40e:4b49:51ab with SMTP id
 w19-20020a05600c099300b0040e4b4951abmr1002281wmp.158.1706096024345; 
 Wed, 24 Jan 2024 03:33:44 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. (mob-5-90-60-192.net.vodafone.it.
 [5.90.60.192]) by smtp.gmail.com with ESMTPSA id
 i18-20020adffdd2000000b003393249d5dbsm8447950wrs.4.2024.01.24.03.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 03:33:44 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Wed, 24 Jan 2024 12:33:11 +0100
Message-ID: <20240124113336.658198-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124113336.658198-1-dario.binacchi@amarulasolutions.com>
References: <20240124113336.658198-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v9 2/5] ARM: dts: stm32: add DSI support on
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

Changes in v9:
- Drop 'interrupts' property to fix yaml checks

 arch/arm/boot/dts/st/stm32f769.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 arch/arm/boot/dts/st/stm32f769.dtsi

diff --git a/arch/arm/boot/dts/st/stm32f769.dtsi b/arch/arm/boot/dts/st/stm32f769.dtsi
new file mode 100644
index 000000000000..4e7d9032149c
--- /dev/null
+++ b/arch/arm/boot/dts/st/stm32f769.dtsi
@@ -0,0 +1,20 @@
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
