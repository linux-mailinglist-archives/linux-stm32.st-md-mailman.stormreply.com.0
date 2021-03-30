Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FA434E3A6
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Mar 2021 10:58:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CCEAC5719E;
	Tue, 30 Mar 2021 08:58:39 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 988D2C57B54
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Mar 2021 08:58:36 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id v8so5808692plz.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Mar 2021 01:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=v9G2KuPIg00fMkHFtxzc36ViAJiRyj7R2G3zNb7KNvo=;
 b=hPsn56mwY+F0xi8rkTRM9xqDEsa2cBbCaN0oUfCF37/qW4kLGxOzvWJvKRHx7NvvyC
 SmV4dAzrGLeOVnlg72NqYGXZJJgXXd2OwJuBEMR/xeULu8iwMsKDSnrU/QIaLaXDNuf2
 yzL4irYPCDLf+oJuzeLhwuZnH2blmdviTXjkyTetHHngdYr0KRgslMkrcFCNDKLyGWnC
 xav0MGI/F7jekmFUcm6zApkqi2ZzSZCEYdw/e8TtxwmJ1K9bVV7K1hoUqQCswDugT9gx
 LOoRn3yQzQspSmC70c6MxE4uOt0xgLlGG+AiEykzvRXr/hUulMhorKvjll4FdvBfXESY
 8S+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=v9G2KuPIg00fMkHFtxzc36ViAJiRyj7R2G3zNb7KNvo=;
 b=AQ+oPLEcLHAsHeB1gZ0kcZHBaaAYAHm+FqqAXi2BVabU8PGcbj7aXbBzehtFeaHbHE
 /Hmq26ZDYtK8acMqsldshaMINB37F0vNh5gYh2DnnhJk0icEIdpC3jtPxlIne/THEsSh
 G/3JbxaehEBy9uJJyFqiVxzQD980INnq601QWZT/nPjPoYB6HG1MJ7sx1fiO/MNZv0Ui
 h/bFVfYLU95GPfxkUI2vsGzB+QWmTDXqIeTDrZioqF4Dob7F9XOzHLWFIvDVIWfUOETh
 o8E5STect5utEmgTfFsIFNnMrEYvVstfRGDvIoVvPZ4+tfuQ7D71UeB7csv1m28DM2Bk
 23rQ==
X-Gm-Message-State: AOAM532zV2nIP68YTi1GjcS931idg5RquDI2/AskS/ykUO1BRkoFrUio
 yXlauuUzgJ1EpmtEZ8ivTe0=
X-Google-Smtp-Source: ABdhPJxe3KK+4Nqy5pQI1XwboPWMy5d6xSYu8sF6E23d0LEZA2IVhbeDRqckAk3uauw67+swQjM1Tw==
X-Received: by 2002:a17:902:7407:b029:e4:9b2c:528b with SMTP id
 g7-20020a1709027407b02900e49b2c528bmr32968487pll.6.1617094715188; 
 Tue, 30 Mar 2021 01:58:35 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id y8sm20952642pfp.140.2021.03.30.01.58.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Mar 2021 01:58:34 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh@kernel.org, valentin.caron@foss.st.com, Alexandre.torgue@foss.st.com,
 rong.a.chen@intel.com, a.fatoum@pengutronix.de, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, afzal.mohd.ma@gmail.com, gregkh@linuxfoundation.org,
 erwan.leray@foss.st.com, erwan.leray@st.com, linux-serial@vger.kernel.org,
 lkp@intel.com, patrice.chotard@foss.st.com
Date: Tue, 30 Mar 2021 16:58:19 +0800
Message-Id: <1617094704-10040-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617094704-10040-1-git-send-email-dillon.minfei@gmail.com>
References: <1617094704-10040-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v8 1/6] Documentation: arm: stm32: Add
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
v8: no changes

 Documentation/arm/index.rst                    |  1 +
 Documentation/arm/stm32/stm32h750-overview.rst | 34 ++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)
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
index 000000000000..0e51235c9547
--- /dev/null
+++ b/Documentation/arm/stm32/stm32h750-overview.rst
@@ -0,0 +1,34 @@
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
+
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
