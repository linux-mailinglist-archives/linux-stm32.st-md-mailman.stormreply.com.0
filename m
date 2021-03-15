Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC8133AF01
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Mar 2021 10:44:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A6AFC57A41;
	Mon, 15 Mar 2021 09:44:37 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3793DC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 09:44:36 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id y67so6225358pfb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 02:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+b9sWME9s06yIBLOEvf5WrW2EmjZFwJwqifh5Bs79ks=;
 b=Myituj1qTSZfJC3Hp4o2Z4CYtaGyZHHQLhU6ZS6rQ5EDWBFB/JsHTR9Hgyb0SOjTcw
 ntOkd6NmlStBkXRjztO0g0mb/YnZbG0v5akINg/2pV/9qxiX6vQ25oAh46rvbqoM9HFQ
 TZXL730poJwkJirQcaBUpg2rsvWhQ3Qls3BsN1GtNngMDwjLb4WClDK2zGKc7FJjciRn
 DXknXwATZY37RIjubZGrXbpgmaBM7Fim2tHQRegMnSI3/5yTGCOC2l4ZowNMVtm2Jl8B
 wg7ndnR4eO6Fy2wSLbou4+L1j7mNLTFCZwiyPExEPU7xh0649FO/R46sVx6n9+JdXhuI
 lPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+b9sWME9s06yIBLOEvf5WrW2EmjZFwJwqifh5Bs79ks=;
 b=Dw3ieHmWwV/NYcA4vt/kJ99FTQok7KzXpZhjeTGXHgeyatQ9uhl+BX/b8x2LuT59Bm
 i+IDZd5iyTfHvwrw3576mMCrCV49LGFbE+UQ2Qa6zR9070zr00HI1exgg+eSLtx2SKV3
 CxWwL3eiD+b505xztXdCUPDrAX5n9jNjFMg3vMZyTXXykE9kxUgaExdU6JH/De5J3tfY
 fKXkf+QuAFgoyRIHmlT80d2eSDci0FRCFigi7lC4XYgsdTG1Jj2aevyrF2g7vy5L+pwz
 eEabd+93LeNGkPQ0greVbfbrk07ecH1lfpbLWOpkG51Ayz+iDkDf6SBlhgwgfsWNmMYy
 x8gQ==
X-Gm-Message-State: AOAM533Ivon3TNBoL6RCYfvfCd940OhiQHnwNme39izCPOPJoepMB0X9
 tDt7/Lc4+9QNGwN/eDTrPaA=
X-Google-Smtp-Source: ABdhPJwDc35fAvaJM4ILflo7oBaMuGLN4ekfPrxGNP4kOGjDyeaKeI8jYDKP42cSl9FI02PMi9FmWQ==
X-Received: by 2002:aa7:9841:0:b029:1f8:f326:a3b3 with SMTP id
 n1-20020aa798410000b02901f8f326a3b3mr9487795pfq.7.1615801474820; 
 Mon, 15 Mar 2021 02:44:34 -0700 (PDT)
Received: from localhost.localdomain ([120.245.122.54])
 by smtp.gmail.com with ESMTPSA id 14sm12780811pfy.55.2021.03.15.02.44.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Mar 2021 02:44:34 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, alexandre.torgue@foss.st.com, a.fatoum@pengutronix.de,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com,
 gregkh@linuxfoundation.org, erwan.leray@st.com, erwan.leray@foss.st.com,
 linux-serial@vger.kernel.org
Date: Mon, 15 Mar 2021 17:43:48 +0800
Message-Id: <1615801436-3016-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1615801436-3016-1-git-send-email-dillon.minfei@gmail.com>
References: <1615801436-3016-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v3 1/9] Documentation: arm: stm32: Add
	stm32h750 value line doc
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: dillon min <dillon.minfei@gmail.com>

This patchset add support for soc stm32h750, stm32h750 has mirror
different from stm32h743

item            stm32h743     stm32h750
flash size:     2MiB          128KiB
adc:            none          3
crypto-hash:    none          aes/hamc/des/tdes/md5/sha

detail information can be found at:
https://www.st.com/en/microcontrollers-microprocessors/stm32h750-value-line.html

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 Documentation/arm/index.rst                    |  1 +
 Documentation/arm/stm32/stm32h750-overview.rst | 33 ++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 Documentation/arm/stm32/stm32h750-overview.rst

diff --git a/Documentation/arm/index.rst b/Documentation/arm/index.rst
index b4bea32472b6..d4f34ae9e6f4 100644
--- a/Documentation/arm/index.rst
+++ b/Documentation/arm/index.rst
@@ -52,6 +52,7 @@ SoC-specific documents
    stm32/stm32f746-overview
    stm32/overview
    stm32/stm32h743-overview
+   stm32/stm32h750-overview
    stm32/stm32f769-overview
    stm32/stm32f429-overview
    stm32/stm32mp157-overview
diff --git a/Documentation/arm/stm32/stm32h750-overview.rst b/Documentation/arm/stm32/stm32h750-overview.rst
new file mode 100644
index 000000000000..c8ce59ec3bd1
--- /dev/null
+++ b/Documentation/arm/stm32/stm32h750-overview.rst
@@ -0,0 +1,33 @@
+==================
+STM32H750 Overview
+==================
+
+Introduction
+------------
+
+The STM32H750 is a Cortex-M7 MCU aimed at various applications.
+It features:
+
+- Cortex-M7 core running up to @480MHz
+- 128K internal flash, 1MBytes internal RAM
+- FMC controller to connect SDRAM, NOR and NAND memories
+- Dual mode QSPI
+- SD/MMC/SDIO support
+- Ethernet controller
+- USB OTFG FS & HS controllers
+- I2C, SPI, CAN busses support
+- Several 16 & 32 bits general purpose timers
+- Serial Audio interface
+- LCD controller
+- HDMI-CEC
+- SPDIFRX
+- DFSDM
+
+Resources
+---------
+
+Datasheet and reference manual are publicly available on ST website (STM32H750_).
+
+.. _STM32H750: https://www.st.com/en/microcontrollers-microprocessors/stm32h750-value-line.html
+
+:Authors: Dillon Min <dillon.minfei@gmail.com>
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
