Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9612D8294B9
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jan 2024 09:07:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4EA41C6DD75;
	Wed, 10 Jan 2024 08:07:50 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88303C6DD74
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jan 2024 08:07:48 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a28ee72913aso843288266b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jan 2024 00:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704874068; x=1705478868;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mmQnQzOW0HVCglZmRdERbSkiK/7LfpA/GFNr/QR6hMQ=;
 b=fevPL4mO1bM/YivXYxQpT7M6pX3ukZZ+FvMtle7TjYfRrDoRZrU3+ICO+zh/YDICiN
 JEIq404bAGE+Hq5Ei12v/6o+kgKe36p9yBN1oKdeeVj7obMWShcyPEUm/hQ5xzTldObj
 9WbPg1Pt6ktxQ6HH0eH6JD42aTg7hZMOnaLIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704874068; x=1705478868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mmQnQzOW0HVCglZmRdERbSkiK/7LfpA/GFNr/QR6hMQ=;
 b=vrjPiF2p0AMAfNhfYQ0JXdjUK4JSX63CmavI/PkV6UqNpyu9uFuc87OuCzeti/ooDD
 UcETlJYkdCtzwhNRMDEX4V5rr/eZbLHC8jcA6uWk+oOr9DBygIpLEquZ9gLhWnuYz2Et
 5XTzzxQRdC74FJq2nBxFk9meykBRJLpOSPAHjph5mDYW3AMqTlpE58QUWMJLGdcvDA88
 d76+KSHCYkE8r/46GUxdFzjvqYE/wo538HgImzCJKCeczIrjieXTA08GcrRImB1Sgzvs
 I6Ngqp/DXYYLQ4Yi12fNh2tV/KVVvhOrRl6jnjchxhRe1qivda09vRy+VDd20qyZP448
 pXxg==
X-Gm-Message-State: AOJu0YzYslhw1WvKmHQIHJsTbIx9ggED55Y7pOLDnwfK35sGBTNVwG9A
 j4i1TqbzqHk9vodilifdqRg2+rAiCkx/Fg==
X-Google-Smtp-Source: AGHT+IHakONTvxlOlGWYkwBCq3122M58Sq1eIRqDaFbZ4S8+1qtPJZCssB1FfT53d7/wvY8lO2dxGA==
X-Received: by 2002:a17:906:c346:b0:a28:b34d:8694 with SMTP id
 ci6-20020a170906c34600b00a28b34d8694mr684643ejb.62.1704874068185; 
 Wed, 10 Jan 2024 00:07:48 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-2-38-81.retail.telecomitalia.it. [87.2.38.81])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a1709061dcc00b00a2af672cdd8sm1833341ejh.161.2024.01.10.00.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 00:07:47 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Wed, 10 Jan 2024 09:05:48 +0100
Message-ID: <20240110080729.3238251-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240110080729.3238251-1-dario.binacchi@amarulasolutions.com>
References: <20240110080729.3238251-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 2/5] ARM: dts: stm32: add DSI support on
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
