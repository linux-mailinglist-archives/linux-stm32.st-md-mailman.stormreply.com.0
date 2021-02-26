Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA05325DDA
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Feb 2021 08:03:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68761C57B61;
	Fri, 26 Feb 2021 07:03:34 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B596C57B59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Feb 2021 07:03:33 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id i14so3830316pjz.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Feb 2021 23:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6WNcoMTUVL/TQoEetougRy4ClMiduSo3uj9jsME+M3w=;
 b=p0mtj1P1EFejlCrQoCdFRU1deZhOgK3WbhtkB055ej+7A69R6fWJUKeiYulaRBnrD2
 IQ8DJ6bj+INlUjj/SchigUxG11fQ9wHl+RqW8A/6qUlIZs41qIwrChUhGg99FWMCNRx3
 pEBM+RY3YaykzMmrH9kklIh63j58ykLaSId4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6WNcoMTUVL/TQoEetougRy4ClMiduSo3uj9jsME+M3w=;
 b=GrHVf8XTqyTvZDoO5QRX7reHPHw1ngaoWFWeDqZMYQBynAGm2LcW1SNzjGMf4jLWo+
 2g/q72jPqZ+dc2bQLqmk7BckaM9IeEWEANw2BYNTiq9CBAsO3IFipwnfnUGyVObyrbyb
 AszCvrtOX8/+96/NUvT6EnYvPzj0n4UxvwlBEQXz3v20oHhWfnv2pdhIs2qqRkbc5UZF
 cuCuSOR8x0RwsIZcx0UJjzoLGWV9nqKZFTv7nX1nueNeiFiqAyDr1geYLkreAn6femsq
 U9UumfkAeYaCADSG+lFoTEY/2FMdXww+CHrCp6F2fEKLqNojRl04W8bqfFwJiHGAFZAO
 GGRg==
X-Gm-Message-State: AOAM5303hyHExUdXjUqpbDkLvYJK7CldqIYLKRdcQ2LDR0XLDqZYryTg
 +Lo81WsVgA5c8j9TtovYV6cFLg==
X-Google-Smtp-Source: ABdhPJwZN2h/0zXAuejlOgsfpF4c33i3nD75c5BT9LXteQeL3N2t+TE+ru9CFOP8YtLNqcOPmKuEoA==
X-Received: by 2002:a17:902:b902:b029:e4:156d:68be with SMTP id
 bf2-20020a170902b902b02900e4156d68bemr1758350plb.19.1614323011778; 
 Thu, 25 Feb 2021 23:03:31 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([103.161.30.220])
 by smtp.gmail.com with ESMTPSA id f7sm7592156pjh.45.2021.02.25.23.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 23:03:31 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Fri, 26 Feb 2021 12:32:56 +0530
Message-Id: <20210226070304.8028-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210226070304.8028-1-jagan@amarulasolutions.com>
References: <20210226070304.8028-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 Francesco Utel <francesco.utel@engicam.com>, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Mirko Ardinghi <mirko.ardinghi@engicam.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 02/10] ARM: dts: stm32: Add Engicam
	MicroGEA STM32MP1 SoM
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

MicroGEA STM32MP1 is an EDIMM SoM based on STM32MP157A from Engicam.

General features:
- STM32MP157AAC
- Up to 1GB DDR3L-800
- 512MB Nand flash
- I2S

MicroGEA STM32MP1 needs to mount on top of Engicam MicroDev carrier
boards for creating complete platform solutions.

Add support for it.

Signed-off-by: Matteo Lisi <matteo.lisi@engicam.com>
Signed-off-by: Francesco Utel <francesco.utel@engicam.com>
Signed-off-by: Mirko Ardinghi <mirko.ardinghi@engicam.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- none

 .../dts/stm32mp157a-microgea-stm32mp1.dtsi    | 147 ++++++++++++++++++
 1 file changed, 147 insertions(+)
 create mode 100644 arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1.dtsi

diff --git a/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1.dtsi b/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1.dtsi
new file mode 100644
index 000000000000..97d569107bfe
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1.dtsi
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) STMicroelectronics 2019 - All Rights Reserved
+ * Copyright (c) 2020 Engicam srl
+ * Copyright (c) 2020 Amarula Solutons(India)
+ */
+
+/ {
+	compatible = "engicam,microgea-stm32mp1", "st,stm32mp157";
+
+	memory@c0000000 {
+		reg = <0xc0000000 0x10000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		mcuram2: mcuram2@10000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10000000 0x40000>;
+			no-map;
+		};
+
+		vdev0vring0: vdev0vring0@10040000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10040000 0x1000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@10041000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10041000 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@10042000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10042000 0x4000>;
+			no-map;
+		};
+
+		mcuram: mcuram@30000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x30000000 0x40000>;
+			no-map;
+		};
+
+		retram: retram@38000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x38000000 0x10000>;
+			no-map;
+		};
+	};
+
+	vin: regulator-vin {
+		compatible = "regulator-fixed";
+		regulator-name = "vin";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	vddcore: regulator-vddcore {
+		compatible = "regulator-fixed";
+		regulator-name = "vddcore";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+		vin-supply = <&vin>;
+	};
+
+	vdd: regulator-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		vin-supply = <&vin>;
+	};
+
+	vddq_ddr: regulator-vddq-ddr {
+		compatible = "regulator-fixed";
+		regulator-name = "vddq_ddr";
+		regulator-min-microvolt = <1350000>;
+		regulator-max-microvolt = <1350000>;
+		regulator-always-on;
+		vin-supply = <&vin>;
+	};
+};
+
+&dts {
+	status = "okay";
+};
+
+&fmc {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&fmc_pins_a>;
+	pinctrl-1 = <&fmc_sleep_pins_a>;
+	status = "okay";
+
+	nand-controller@4,0 {
+		status = "okay";
+
+		nand@0 {
+			reg = <0>;
+			nand-on-flash-bbt;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+	};
+};
+
+&ipcc {
+	status = "okay";
+};
+
+&iwdg2{
+	timeout-sec = <32>;
+	status = "okay";
+};
+
+&m4_rproc{
+	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
+			<&vdev0vring1>, <&vdev0buffer>;
+	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
+	mbox-names = "vq0", "vq1", "shutdown";
+	interrupt-parent = <&exti>;
+	interrupts = <68 1>;
+	status = "okay";
+};
+
+&rng1 {
+	status = "okay";
+};
+
+&rtc{
+	status = "okay";
+};
+
+&vrefbuf {
+	regulator-min-microvolt = <2500000>;
+	regulator-max-microvolt = <2500000>;
+	vdda-supply = <&vdd>;
+	status = "okay";
+};
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
