Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2093385BD
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Mar 2021 07:24:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D19DDC57192;
	Fri, 12 Mar 2021 06:24:45 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78AF3C56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 06:24:44 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id 18so1161901pfo.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 22:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qjbDTQ7WcmhFUnalAhXH6DnuMDJuzq69+97XUCv4p4c=;
 b=MuibLYrsntGNyTt1r0LoAiJ0PeMM5UtNUeKFiSWUnai8Hqzuz/pRRpc02BrtWxCWqh
 9K9v2iNQ8Mc86j1tyXxtuc1EAYT/4vyUIWzFgugQZArNO+T1WWfKSvcRoZ9/JP3gJ8oN
 jvmRE5lNwr0qRDTB9MccAd1BmoTNk9f/frQ3TRsLUJWUS9kw6kTXyfLqR5YqTX/KQ6bS
 dkmo8nf8lsM6u4n7m18sqpzsM0ednU0+GPyGLSrv6Qjy7VB08Ezvm+dch3YTjuvlIwSs
 up7o3C2yQtQbUNv8JDv1X3OC2D0J9anQVcbEpRUFhZs96zMOGqCUETzRfx82p8K1Lgow
 7lqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qjbDTQ7WcmhFUnalAhXH6DnuMDJuzq69+97XUCv4p4c=;
 b=L0DQoDCy/Ze0u/WzeZiIldUavKGaQxs4q3tA3IoZ64B1QgZOKPbRA18wTBGWgQxqXP
 fyVSl5vFu6GMdf5kKQdOgZuVvpVqt093WbKWIBZbVkzZ+jHA15YZ6DWWTqefbp3tua2J
 NWxT8c2fvpFnWBR0o6XajXQ8AsRxbUzBcQspmnJYeVuGwRzANdzQIfqR3n+2eOjTMtzw
 qjE5j0Plnbx9llPT+aNDTP2A8KfoZPDVRdqQAoxatMMX4qHyvFgfeJVtWI17arieLtVl
 BXkJcC5YNOQEFlgfmxrGCnOCYGnxGx9XNNPAoOZNKFXNDfPHIgJopeBK86Ca9aEgozMM
 AbCw==
X-Gm-Message-State: AOAM533khQF131Xv7+wJ7ptbpm8mWCTnljBRG+IMo4ZmULMzByFjOwIz
 kZC69ojBFM5p8iVAS96Ahz0=
X-Google-Smtp-Source: ABdhPJxbjZ6qUg1ngRlB/TqgKbzFMVXYniLRutnx43Y0LYhqvskb9Ii9TQVogb2tc/H1c8FuhA3F2Q==
X-Received: by 2002:a63:4420:: with SMTP id r32mr10289694pga.25.1615530282930; 
 Thu, 11 Mar 2021 22:24:42 -0800 (PST)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id h6sm4048406pfb.157.2021.03.11.22.24.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Mar 2021 22:24:42 -0800 (PST)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, alexandre.torgue@foss.st.com, a.fatoum@pengutronix.de,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com
Date: Fri, 12 Mar 2021 14:24:27 +0800
Message-Id: <1615530274-31422-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615530274-31422-1-git-send-email-dillon.minfei@gmail.com>
References: <1615530274-31422-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v2 1/8] Documentation: arm: stm32: Add
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
v2: just add more commit message description

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
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
