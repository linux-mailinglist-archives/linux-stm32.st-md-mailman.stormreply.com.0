Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9742382C20F
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jan 2024 15:49:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50994C6DD78;
	Fri, 12 Jan 2024 14:49:13 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53F53C6DD7B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jan 2024 14:49:10 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a2d04888d3dso4307066b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jan 2024 06:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705070950; x=1705675750;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mmQnQzOW0HVCglZmRdERbSkiK/7LfpA/GFNr/QR6hMQ=;
 b=ZuLC+NfmTSWgKLOC84/UD+4r41dHgck1oSV7hXgLPGGy42i5OyQMKoxOMRZZdnkpWQ
 p5BDDGerPVAzcEt6JchDfXPwDW6CowQo4oiggn07gvukhD385St4s9cOKWe8D81iy9Em
 KLyPACl+qcmmtTJxgwNj6YD9E7l6Meq+bFXr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705070950; x=1705675750;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mmQnQzOW0HVCglZmRdERbSkiK/7LfpA/GFNr/QR6hMQ=;
 b=sfb9Xn1RKoJyOZLUerLbMbzhkbCzSFWGgYreC4IgiZoqKPuOWfefgDLOAf2kvOMBau
 AmkH9e21lM76XODlZclaOMocQhTeejv8y+nV2mgda6jG2W7Fo0bpljJmfzi7SYY90pRv
 wJJF0viMWipasM1Z4w8lksiEBUFLgaoO4GEdB4r2WKpqkPZuqp5bMI2BASv4W7l5kQFF
 fshUNfaeypq6cUT7LywRa3aWXEzINyYlEqgZyNjtX9u/ulkBQ0iAcvErcwCaju86CkPQ
 0A276Zz1Jld5duiNC+8lmp3aZPX38f9dFtZizIdgqM2IG3ga2L0/0wO7V3VrC/0BaZe6
 Oubg==
X-Gm-Message-State: AOJu0YxdN4TSKZIibKs7/UHlt+/Egjt0Trh4DUjaMIP5K02r7rI5Yd3T
 MeAZY+zPWZjtVBaCiJYE5aG8ZbapDpmivA==
X-Google-Smtp-Source: AGHT+IHYE6WynxzGM2phhAonl7tB+VThaQnxrNudcqv2wkwoAxXrc2uhBIkAE0+iaAAt7os+42i7Ew==
X-Received: by 2002:a17:906:5ac3:b0:a26:edeb:7635 with SMTP id
 x3-20020a1709065ac300b00a26edeb7635mr740160ejs.91.1705070949914; 
 Fri, 12 Jan 2024 06:49:09 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 ([95.236.91.90]) by smtp.gmail.com with ESMTPSA id
 y11-20020a170906524b00b00a233515c39esm1869372ejm.67.2024.01.12.06.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 06:49:09 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 12 Jan 2024 15:48:22 +0100
Message-ID: <20240112144902.40044-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112144902.40044-1-dario.binacchi@amarulasolutions.com>
References: <20240112144902.40044-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v8 2/5] ARM: dts: stm32: add DSI support on
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
