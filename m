Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E61673488E2
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Mar 2021 07:19:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4004C57B78;
	Thu, 25 Mar 2021 06:19:35 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA936C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Mar 2021 06:19:33 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 a22-20020a17090aa516b02900c1215e9b33so2265418pjq.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Mar 2021 23:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FekWW96f8sKoFK8LSZN/PYb2w/ql5dj/T82FBFJxA4g=;
 b=GYZY9ldqL4FRRCDeMiDDOJmrCCVCV7UTn3cx/pGIv3mUV0irQ4xwpB1nM6Aw8O5pmg
 YS2S1l2opLfBOCSwa0fpUmfP80TYrlIjO0K5DKBJeaagBZeO7LVJTLUyxp/HZXf9b1Vu
 5d69LQzDCYSTTxQrarGvi7l/VlaHQDfpcuT7WPvKg43fgBNsrpOn6KHWJM2cJKsPI4O1
 MsBLiluSCFqAs0M9xkKtF5r2WZlDa232xkDfxgZIJlXwvw5v+fBLWiT9451dg5ysplZG
 TzIUNlp1mz/zbaennKwMe7LZRCxeIpF7+oDgzMFFzDj183ygTL05YemJoP8O4YD/xwIa
 u1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FekWW96f8sKoFK8LSZN/PYb2w/ql5dj/T82FBFJxA4g=;
 b=Wyo3Vh69yIqOXrGsuGF8akAdB/PkcnoB6f+N1hpwslunOic7hZ9g/KpyuNLMwz7GGe
 sbNuhGL+N3fP1gN3JFSNWvBo4titg8xJN5HE3zuKoqOh6F2ErC+G708ddEgIp8PE4M+w
 GXXdLS9+MVvGkXV/x6KG8JJ1pLKA0V61t+/V8GTgGqDqef9AZP9hlwnUyHZF3QPY1BfJ
 f8uOwg1xmlCZdQQqLIlnvSyC8nIXmux1qLnZps4HreNsVmKvW2iP152swt2w3Acu2wEy
 ZU/w81PKc6pATnBhX07k++XHWUMj6STnbUKRq9UdLF5tkkRkbiY4e/3sXzcIidSqoYcq
 ITtA==
X-Gm-Message-State: AOAM532kMsM0LpKqF7s7e+T0921ESzgpJEqj1nxbFSR18cH5BCzweMh4
 4mkWbAXieCzngyLhE+JRcZs=
X-Google-Smtp-Source: ABdhPJy7NKbAmOUkLnoCcU1jypf6//r5IO91+4LIWXhptNEZMeaDjcYCHRDKJ39P1X7ynMijw5O/kA==
X-Received: by 2002:a17:90a:e298:: with SMTP id
 d24mr7229367pjz.171.1616653172478; 
 Wed, 24 Mar 2021 23:19:32 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id b19sm4393086pfo.7.2021.03.24.23.19.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Mar 2021 23:19:32 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh@kernel.org, valentin.caron@foss.st.com, Alexandre.torgue@foss.st.com,
 rong.a.chen@intel.com, a.fatoum@pengutronix.de, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com,
 gregkh@linuxfoundation.org, erwan.leray@foss.st.com, erwan.leray@st.com,
 linux-serial@vger.kernel.org, lkp@intel.com
Date: Thu, 25 Mar 2021 14:19:16 +0800
Message-Id: <1616653162-19954-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616653162-19954-1-git-send-email-dillon.minfei@gmail.com>
References: <1616653162-19954-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v5 1/9] Documentation: arm: stm32: Add
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

v5: no changes

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
