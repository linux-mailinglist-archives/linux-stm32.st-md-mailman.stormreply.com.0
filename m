Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 904A232731A
	for <lists+linux-stm32@lfdr.de>; Sun, 28 Feb 2021 16:44:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D8A4C57B6F;
	Sun, 28 Feb 2021 15:44:27 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1221FC36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Feb 2021 15:44:26 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id o6so9840456pjf.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Feb 2021 07:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P8xuLB+PW3vzd/2H+nv/FYwlg2xPXL9X/0ZCidUY03A=;
 b=GTHfepeMME8ETHJ9D17UUQlIWYTFf4lYClQwCQIUOC1oKAGJgzR3euzonM0vWhJci7
 TSppLrKhyfNsWCsXIJqzg5FXr0v1J95UnRMiUrzOyX8byY+RtVKhUubnX9B9qNo442jJ
 Fnnv6pSzMiAS8udimqeZ651R7iVF1iwjSC0cY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P8xuLB+PW3vzd/2H+nv/FYwlg2xPXL9X/0ZCidUY03A=;
 b=RkHFBUfHyxnatyBb+NMe6ftagIAS+HomMt6CMrcSydbYodmFp2Ihv3IsZdBabFeXhQ
 iA/vhyDuGdNZQQMOIbBALNNq2WBPZLcZlkw96Js7G0J72VuTLohMVSQm0smpdd37BwMv
 R3Aat3JNFPUuqRj5kyANXK5UasBw7N+BUjw1ttIdTtFQ/LP+GNrCHU51Imem6Sjdrlin
 Ogibi5nP2d4IeBs8jtdcRIfU7m4/2hOdNrMegyekb8099qGLgiXH/moTt2+xi9tSoCb1
 lXmjuy97YtFzjn6g6ohKqUde/RCaYJdokvepD8Ecp4KLFb7OmwyVWMWbcm7QuyRfUy0P
 WAkw==
X-Gm-Message-State: AOAM531ZpJz252zBy3I8OTT8/B04K0AOo34oZMAd2GBQLj+56feTaRqr
 zfv+Zh3nSXm4CrW10ErgB7JsMQ==
X-Google-Smtp-Source: ABdhPJxfIBewbERSLjK/TGwJqJEMQTPLphwQZKKTzUvXvWHtlP24xZS8O3qwJbFmLnm3mZesUyhs+g==
X-Received: by 2002:a17:903:1cc:b029:de:98bb:d46d with SMTP id
 e12-20020a17090301ccb02900de98bbd46dmr11601415plh.54.1614527064698; 
 Sun, 28 Feb 2021 07:44:24 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([103.161.30.225])
 by smtp.gmail.com with ESMTPSA id j3sm13522133pgk.24.2021.02.28.07.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 07:44:24 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Sun, 28 Feb 2021 21:13:23 +0530
Message-Id: <20210228154323.76911-11-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228154323.76911-1-jagan@amarulasolutions.com>
References: <20210228154323.76911-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 10/10] ARM: dts: stm32: Add Engicam i.Core
	STM32MP1 EDIMM2.2 Starter Kit
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

Engicam EDIMM2.2 Starter Kit is an EDIMM 2.2 Form Factor Capacitive
Evaluation Board.

Genaral features:
- LCD 7" C.Touch
- microSD slot
- Ethernet 1Gb
- Wifi/BT
- 2x LVDS Full HD interfaces
- 3x USB 2.0
- 1x USB 3.0
- HDMI Out
- Mini PCIe
- MIPI CSI
- 2x CAN
- Audio Out

i.Core STM32MP1 is an EDIMM SoM based on STM32MP157A from Engicam.

i.Core STM32MP1 needs to mount on top of this Evaluation board for
creating complete i.Core STM32MP1 EDIMM2.2 Starter Kit.

Add support for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- none 

 arch/arm/boot/dts/Makefile                    |  1 +
 .../stm32mp157a-icore-stm32mp1-edimm2.2.dts   | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 6dc39bddaf7e..e86c46d7ca66 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1074,6 +1074,7 @@ dtb-$(CONFIG_ARCH_STM32) += \
 	stm32mp157a-microgea-stm32mp1-microdev2.0.dtb \
 	stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dtb \
 	stm32mp157a-icore-stm32mp1-ctouch2.dtb \
+	stm32mp157a-icore-stm32mp1-edimm2.2.dtb \
 	stm32mp157a-stinger96.dtb \
 	stm32mp157c-dhcom-pdk2.dtb \
 	stm32mp157c-dhcom-picoitx.dtb \
diff --git a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
new file mode 100644
index 000000000000..ec9f1d1cd50f
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) STMicroelectronics 2019 - All Rights Reserved
+ * Copyright (c) 2020 Engicam srl
+ * Copyright (c) 2020 Amarula Solutons(India)
+ */
+
+/dts-v1/;
+#include "stm32mp157.dtsi"
+#include "stm32mp157a-icore-stm32mp1.dtsi"
+#include "stm32mp15-pinctrl.dtsi"
+#include "stm32mp15xxaa-pinctrl.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Engicam i.Core STM32MP1 EDIMM2.2 Starter Kit";
+	compatible = "engicam,icore-stm32mp1-edimm2.2",
+		     "engicam,icore-stm32mp1", "st,stm32mp157";
+
+	aliases {
+		serial0 = &uart4;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&sdmmc1 {
+	bus-width = <4>;
+	disable-wp;
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc1_b4_pins_a>;
+	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
+	st,neg-edge;
+	vmmc-supply = <&v3v3>;
+	status = "okay";
+};
+
+&uart4 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&uart4_pins_a>;
+	pinctrl-1 = <&uart4_sleep_pins_a>;
+	pinctrl-2 = <&uart4_idle_pins_a>;
+	status = "okay";
+};
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
