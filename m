Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 980669BBB71
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5268CC78F8F;
	Mon,  4 Nov 2024 17:18:38 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 823B8C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 20:24:17 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-37d4fa7d3baso658451f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 13:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730233457; x=1730838257;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6tTSvfcY2engLoiGHPIJF53AHZxPkJrdqu/6M46fx3k=;
 b=Bwkt6U0F+5xE58pSzhCkiD59D2mS9y40iRsTXsatO7oxXN5MaWZthmZjFsyPPtkW/j
 F/K8GvnSIQpUbDR71rOXCcv5djehteAVV3X179Lgny3zWHgjWSLLn8UpfGFvFUwmQ27u
 OyTY5/XzNu3d4FDAj7XCF6bkPYYdyYZnGuLkSC+UfjW9TM1dpczZojHFkrixSbt880nw
 CGZ+UKXaPaXWDPUtCd7TQjukN8g6lw4xfExC3PbnSk6HGZ5tsBxU2Us1uAllqpZCIl6i
 zDVoXh4Unum70YGd5rI/fshoQesGuoQg/2fdTd47hS4SupEFKSn/puKt9y78aoKv2wJm
 fz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730233457; x=1730838257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6tTSvfcY2engLoiGHPIJF53AHZxPkJrdqu/6M46fx3k=;
 b=KrpmaiVhXSmM/mds6Cb39Bo44eEHMHmTACSPH7QSalaipsZ4HBfXQpUI0ia0/t5AJe
 CwZFL/js/YcWtD9jgpoG++4Cm5/qKtLihvr4+t7wblJvKa8BE9HZoXcnASVjwfED3uEn
 5tM3fjF4ykpaAGSOe5xKUO4nDQtFl6nX9nPkvjGDV1ih2XBnitSX1jjGeJKqEePtMOY8
 m4EsuQMZU4deLPJlLTEnMDbGQtKvP4rJfQT2nxm4tJg+PHfjgO/xaCHU7Ae3r/XeT9CE
 sCo2SyB6RQWZf4fOJnGBxHSz9zQ2t2ryJcvxWLM5sRWrUHisEXgPHYReRhShPhgSyNXs
 w0QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuGWvcRNofU0nlUpoSm24RYilnJHP+coVTZJk8+wnCWEdcgzfogK6u0psBS3LYXpR0pa4YVVKNXif39A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxlv5LeFDxnA3RpxvOBID5fJpQ3JlVWrBC+KxQFgdxK0otqOoDZ
 yZo1R+7pwqTPK7uB4oRQfO547zLCAsXwhLRi+xR0uGXowfCB/xUV0nr18g==
X-Google-Smtp-Source: AGHT+IFZHa2p/2WYHjMbWD4QkGM4Xxq/XW82V4PVd0qgCPADVWpPLohHrOfpWMas0eZt6gssOojehw==
X-Received: by 2002:a5d:648c:0:b0:374:cc10:bb42 with SMTP id
 ffacd0b85a97d-380610f0ea9mr4649702f8f.2.1730233456731; 
 Tue, 29 Oct 2024 13:24:16 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch.
 [84.72.156.211]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 13:24:15 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Date: Tue, 29 Oct 2024 20:23:40 +0000
Message-Id: <20241029202349.69442-15-l.rubusch@gmail.com>
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
Subject: [Linux-stm32] [PATCH v4 14/23] ARM: dts: socfpga: add Enclustra
	base-board dtsi
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

Add generic Enclustra base-board support for the Mercury+ PE1, the
Mercury+ PE3 and the Mercury+ ST1 board. The carrier boards can be
freely combined with the SoMs Mercury+ AA1, Mercury SA1 and
Mercury+ SA2.

Signed-off-by: Andreas Buerkler <andreas.buerkler@enclustra.com>
Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 .../socfpga_enclustra_mercury_pe1.dtsi        | 33 +++++++++++
 .../socfpga_enclustra_mercury_pe3.dtsi        | 55 +++++++++++++++++++
 .../socfpga_enclustra_mercury_st1.dtsi        | 15 +++++
 3 files changed, 103 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_pe1.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_pe3.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_st1.dtsi

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_pe1.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_pe1.dtsi
new file mode 100644
index 000000000..abc4bfb7f
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_pe1.dtsi
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+&i2c_encl {
+	status = "okay";
+
+	eeprom@57 {
+		status = "okay";
+		compatible = "microchip,24c128";
+		reg = <0x57>;
+		pagesize = <64>;
+		label = "user eeprom";
+		address-width = <16>;
+	};
+
+	lm96080: temperature-sensor@2f {
+		status = "okay";
+		compatible = "national,lm80";
+		reg = <0x2f>;
+	};
+
+	si5338: clock-controller@70 {
+		compatible = "silabs,si5338";
+		reg = <0x70>;
+	};
+
+};
+
+&i2c_encl_fpga {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_pe3.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_pe3.dtsi
new file mode 100644
index 000000000..bc57b0680
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_pe3.dtsi
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+&i2c_encl {
+	i2c-mux@74 {
+		status = "okay";
+		compatible = "nxp,pca9547";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x74>;
+
+		i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			eeprom@56 {
+				status = "okay";
+				compatible = "microchip,24c128";
+				reg = <0x56>;
+				pagesize = <64>;
+				label = "user eeprom";
+				address-width = <16>;
+			};
+
+			lm96080: temperature-sensor@2f {
+				status = "okay";
+				compatible = "national,lm80";
+				reg = <0x2f>;
+			};
+
+			pcal6416: gpio@20 {
+				status = "okay";
+				compatible = "nxp,pcal6416";
+				reg = <0x20>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+		};
+	};
+};
+
+&i2c_encl_fpga {
+	status = "okay";
+
+	i2c-mux@75 {
+		status = "okay";
+		compatible = "nxp,pca9547";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x75>;
+	};
+};
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_st1.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_st1.dtsi
new file mode 100644
index 000000000..4c00475f4
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_st1.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+&i2c_encl {
+	si5338: clock-controller@70 {
+		compatible = "silabs,si5338";
+		reg = <0x70>;
+	};
+};
+
+&i2c_encl_fpga {
+	status = "okay";
+};
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
