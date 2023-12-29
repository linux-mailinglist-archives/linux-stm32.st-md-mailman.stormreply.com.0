Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA6D81FFC9
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Dec 2023 14:52:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1627C6B460;
	Fri, 29 Dec 2023 13:52:27 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D42A3C6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Dec 2023 13:52:26 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-555144cd330so3945343a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Dec 2023 05:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703857946; x=1704462746;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G2Gi1EmHukIt0jQJzaSt07+yXVEQJCsMbb8bSZVal5c=;
 b=oR7pgfoHq0O0TF9eDs3ISAlHoqm8bF87TrUDReDZ3iJ+ki1TbvyFT9w4svoN8gN07T
 Uh2Vq931uLz47+/LrqVduMGyvTJEYrXSOBKXqwKe+X9rq4HQesdrv1i5BM2DvvsX3I0V
 lZA17SEjt0QZGMi9Ecdz00UywelmsTYcpgIWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703857946; x=1704462746;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G2Gi1EmHukIt0jQJzaSt07+yXVEQJCsMbb8bSZVal5c=;
 b=MiGjYf16HNNfpfuSRBRStNR51ZPZ47B/Ua6uN54NHUuEDAzNB2P9uhFxoxDWvB6wNu
 b+yX3rGPSF3Zoq+lVSo3iYG69lsSySMMN3F6vTiwW4ahMTIH0Rk27LO/VugsKElIHwGb
 EZz6S6iv72BMOWVFxj/MPbbY5OgPsw/8Ebjk2pM6vj0FFGNl+qDfaSJiaNjY3KckW5Cu
 2lk9gvYZU1ytY9kl7U9CHSgQEcoQswl/X4346G3EPhLAAV9jTDTrXHkkJkvZ++Lj72vH
 zfVgfqWRGr9L+SAtey2JgwIMerHaB8VD22jWwdjQHJ30EIeYRsZRDrRsW5bffxN5s895
 tfuw==
X-Gm-Message-State: AOJu0YxwPH2jhaMfDTC7yGawUCjYY9lM3ieIMSRRhdzf9zCa/dxaOzzP
 J5H+u9mwI1UMqQvZU4629SSAplsuHWUacQ==
X-Google-Smtp-Source: AGHT+IEctE0vxDNjGsPYtDGoNP/VOIJMMYfD87twpZ/CDwjvjob6YX2X37wqTrnYlHKSKBRUuJ7xkA==
X-Received: by 2002:a50:9313:0:b0:54b:25e8:c00b with SMTP id
 m19-20020a509313000000b0054b25e8c00bmr7540199eda.6.1703857946523; 
 Fri, 29 Dec 2023 05:52:26 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-49-57-70.retail.telecomitalia.it. [79.49.57.70])
 by smtp.gmail.com with ESMTPSA id
 i16-20020aa7c710000000b00553b243b1a8sm11019160edq.92.2023.12.29.05.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Dec 2023 05:52:26 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 29 Dec 2023 14:51:21 +0100
Message-ID: <20231229135154.675946-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231229135154.675946-1-dario.binacchi@amarulasolutions.com>
References: <20231229135154.675946-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Nyekjaer <sean@geanix.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 6/8] ARM: dts: add
	stm32f769-disco-mb1225-revb03-mb1166-reva09
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

As reported in the section 8.3 (i. e. Board revision history) of document
UM2033 (i. e. Discovery kit with STM32F769NI MCU) these are the changes
related to the board revisions addressed by the patch:
- Board MB1225 revision B-03:
  - Memory MICRON MT48LC4M32B2B5-6A replaced by ISSI IS42S32400F-6BL
- Board MB1166 revision A-09:
  - LCD FRIDA FRD397B25009-D-CTK replaced by FRIDA FRD400B25025-A-CTK

The patch only adds the DTS support for the new display which belongs to
to the Novatek NT35510-based panel family.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/Makefile                       |  1 +
 .../stm32f769-disco-mb1225-revb03-mb1166-reva09.dts | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 arch/arm/boot/dts/st/stm32f769-disco-mb1225-revb03-mb1166-reva09.dts

diff --git a/arch/arm/boot/dts/st/Makefile b/arch/arm/boot/dts/st/Makefile
index 7892ad69b441..390dbd300a57 100644
--- a/arch/arm/boot/dts/st/Makefile
+++ b/arch/arm/boot/dts/st/Makefile
@@ -23,6 +23,7 @@ dtb-$(CONFIG_ARCH_STM32) += \
 	stm32f469-disco.dtb \
 	stm32f746-disco.dtb \
 	stm32f769-disco.dtb \
+	stm32f769-disco-mb1225-revb03-mb1166-reva09.dts \
 	stm32429i-eval.dtb \
 	stm32746g-eval.dtb \
 	stm32h743i-eval.dtb \
diff --git a/arch/arm/boot/dts/st/stm32f769-disco-mb1225-revb03-mb1166-reva09.dts b/arch/arm/boot/dts/st/stm32f769-disco-mb1225-revb03-mb1166-reva09.dts
new file mode 100644
index 000000000000..ff7ff32371d0
--- /dev/null
+++ b/arch/arm/boot/dts/st/stm32f769-disco-mb1225-revb03-mb1166-reva09.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ */
+
+#include "stm32f769-disco.dts"
+
+&panel0 {
+	compatible = "frida,frd400b25025", "novatek,nt35510";
+	vddi-supply = <&vcc_3v3>;
+	vdd-supply = <&vcc_3v3>;
+	/delete-property/power-supply;
+};
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
