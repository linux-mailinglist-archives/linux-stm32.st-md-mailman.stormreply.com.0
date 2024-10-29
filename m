Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F36F9BBB78
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00682C7A829;
	Mon,  4 Nov 2024 17:18:39 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66AC0C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 20:24:29 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-37d5231f71cso685557f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 13:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730233469; x=1730838269;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y0rrp5xrTxl0hGh1RK0+7VZvEHCMBhzUuqSkpHc7vyU=;
 b=LEQ2JeSDjqbP46750aAw6/JqdPifuKz0z0R1F1b6MC0N1yDzPhj4LpO3u4eEntl2/n
 QV77wYHVyhM9DNEVyL6HtK1qh0xO7oWlH1Wtnyjj7QttVjfukYV6HBPBlYRAjSlirGo+
 WWTipq0IVxNHYHivsM2u/OqhGseyTn3s0OH1bf62NYDyoH7f/hzysKf5d1/giPFoLf7j
 GssC8QNZ5kBas/dFbuU926oDf74T4WAJrGG/S9f1DAoa1GSV1gtGLr6zkOSlXVOvwq09
 krZp8bE4P2Fuzmb1rNEBdNkZ88PmBEtUgmkFPE2VwdPfoB4P5Xu0T6qN9YDCnrBFDkP2
 3eeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730233469; x=1730838269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y0rrp5xrTxl0hGh1RK0+7VZvEHCMBhzUuqSkpHc7vyU=;
 b=cRLGC8wXCJp/NvoefugJimoALcs5oSCMXXgVS4JgqQT+PIGxmE2JaD5HuHpTwgR1B2
 Jsu2JWwV4wfvRLVIdVb3ZrD16FeQP31YaRb0l+W89ifP2AldbeT2/96mTbIZLyyEFF/7
 cdPv8+Sv5iBW4cPiAXNrYFuvteAOFLGgth+5F01O3fUH6vPp80Gl7QSjH9F6HlDRV+RZ
 t6Y8uTlFh/6byNp+mvs0U5S39Q9ZMacJG2Nt9w8JBWViuu14GX5rZWIdiKNCUhV/SkMe
 OyNHUKHTOBD0p9qacefGiFcHoBn1yjsNZa7O1ouKJeIJvKxgdgioK03azvt6X7RvFX2H
 yB9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpImbHaOrgyuat4dcJ5PaGZhxUFn35Auzxf4u9VVr6hgsq7ESvW3XIOpS7P3lQDD+v8u0j0Cg+2w5Eaw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywm490HJj0lvDHeJMkiQkU3q0E5M1CzzduPVuYuOnX+jkn4Y+jn
 +DKwwl5KzgZSooE0JYMHPmsnDZr1Y/96iBjhuJeGdmU6mm917iXZ
X-Google-Smtp-Source: AGHT+IEhYwBOUVTvTj3Hj0ZMICPfIHBCtNgFSxbtpX78XFkcd9rCEeOvpqOMJ3bxsigpakj/rBHQPA==
X-Received: by 2002:a05:600c:3b13:b0:431:55f3:d34b with SMTP id
 5b1f17b1804b1-4319aca248dmr50351615e9.3.1730233468766; 
 Tue, 29 Oct 2024 13:24:28 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch.
 [84.72.156.211]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 13:24:28 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Date: Tue, 29 Oct 2024 20:23:47 +0000
Message-Id: <20241029202349.69442-22-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029202349.69442-1-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 Nov 2024 17:18:35 +0000
Cc: marex@denx.de, devicetree@vger.kernel.org, conor+dt@kernel.org,
 pabeni@redhat.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dinguyen@kernel.org,
 edumazet@google.com, joabreu@synopsys.com, l.rubusch@gmail.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, s.trumtrar@pengutronix.de,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 21/23] ARM: dts: socfpga: removal of
	generic PE1 dts
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

Remove the older socfpga_arria10_mercury_pe1.dts, since it is duplicate,
the hardware is covered by the combination of Enclustra's .dtsi files.

The older .dts was limited to only the case of having an Enclustra
Mercury+ AA1 on a Mercury+ PE1 base board, booting from sdmmc. This
functionality is provided also by the generic Enclustra dtsi and dts
files, in particular socfpga_arria10_mercury_aa1_pe1_sdmmc.dts. Since
both .dts files cover the same, the older one is to e replaced in
favor of the more modularized approach.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
Acked-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 arch/arm/boot/dts/intel/socfpga/Makefile      |  1 -
 .../socfpga/socfpga_arria10_mercury_pe1.dts   | 55 -------------------
 2 files changed, 56 deletions(-)
 delete mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dts

diff --git a/arch/arm/boot/dts/intel/socfpga/Makefile b/arch/arm/boot/dts/intel/socfpga/Makefile
index c467828ae..d95862e34 100644
--- a/arch/arm/boot/dts/intel/socfpga/Makefile
+++ b/arch/arm/boot/dts/intel/socfpga/Makefile
@@ -2,7 +2,6 @@
 dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += \
 	socfpga_arria5_socdk.dtb \
 	socfpga_arria10_chameleonv3.dtb \
-	socfpga_arria10_mercury_pe1.dtb \
 	socfpga_arria10_socdk_nand.dtb \
 	socfpga_arria10_socdk_qspi.dtb \
 	socfpga_arria10_socdk_sdmmc.dtb \
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dts
deleted file mode 100644
index cf533f76a..000000000
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dts
+++ /dev/null
@@ -1,55 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright 2023 Steffen Trumtrar <kernel@pengutronix.de>
- */
-/dts-v1/;
-#include "socfpga_arria10_mercury_aa1.dtsi"
-
-/ {
-	model = "Enclustra Mercury+ PE1";
-	compatible = "enclustra,mercury-pe1", "enclustra,mercury-aa1",
-		     "altr,socfpga-arria10", "altr,socfpga";
-
-	aliases {
-		ethernet0 = &gmac0;
-		serial0 = &uart0;
-		serial1 = &uart1;
-	};
-};
-
-&gmac0 {
-	status = "okay";
-};
-
-&gpio0 {
-	status = "okay";
-};
-
-&gpio1 {
-	status = "okay";
-};
-
-&gpio2 {
-	status = "okay";
-};
-
-&i2c1 {
-	status = "okay";
-};
-
-&mmc {
-	status = "okay";
-};
-
-&uart0 {
-	status = "okay";
-};
-
-&uart1 {
-	status = "okay";
-};
-
-&usb0 {
-	status = "okay";
-	dr_mode = "host";
-};
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
