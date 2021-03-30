Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 791A834DE5C
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Mar 2021 04:29:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D9E4C5718B;
	Tue, 30 Mar 2021 02:29:14 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BBA3C57B54
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Mar 2021 02:29:11 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id o2so5363744plg.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Mar 2021 19:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ANuxb7gF/2uSjo8wAVVkzCbU+cgTOCTj6IKlURPEBH4=;
 b=WqOGyjGK0dUpRDlIHt2FK03UP/unGRyJqJf7lTtjsRwFDnJnxR4DTtEDF8R/JB/8HT
 c2AE8dHUpRXfWSHUoJfRXqckycLvUrQbF5+nUaDNrCQm1sPT+THiNZHEXAXeHb5PBpe8
 07foIprOHyBxfl3/gDvpFRU/tUdRWsxuNLB/7og1d9bjeiwtIsd6WQQhAILiGxia+luz
 rGleDSazC/0ENNVLmLuhnnAnm5fv7rMFAMKbUXX0oOSc4fs+db1saUD+KfIB40/jaMBI
 n4Hr5OHg8Zm0amxnMXoChz8Hf5cW75Giy9q4JkllPHP2QKkSIPUw6kyjk9lkNKhaPg3o
 n2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ANuxb7gF/2uSjo8wAVVkzCbU+cgTOCTj6IKlURPEBH4=;
 b=VgagvWI0nN/B6QjHvqSDKZ/UPNrPn/0rP1kwyua4+hI4uztqHYaGdrPnoAYmz2fdcu
 qi32CHS5SdyKqPk2fPq1EvOh+03K7/gRRNUJlZnuhty+qqwcRZzws+9UiwFf8Rc6VZDq
 AE8e0p1tk9ET4HjfLcB9pqpYT5/1v30FgYbePprMX0l4P/T9NejHzu5j3ldJMsmvmu3a
 L4bgtEnQopeaG8H16GQ6w/ftcDlk7KmqPefklTQG9OHTFJjbRR5rcwc6Vy0112n9rsO7
 3wv5fc9sSarweL2qmoyX6aBKKnRHmvjFwxgkD9WJ7oJpyjBIjcguq2PxZm+7YZKz6LYV
 y97Q==
X-Gm-Message-State: AOAM533qMAR3LaWYwnAgu/f2HZ/8aKKTsL9wkact/4M00UeiDsgepEWB
 PAw9hIdD8vAI6OwDNRLthcw+J0SKmW6QqwVj
X-Google-Smtp-Source: ABdhPJwdALX+37u6+nPfUkSA0LqCb29AuIL/icgTQRftJeqnQf4tdEwYJO4k4sfSU8UAEYLhO7SvBQ==
X-Received: by 2002:a17:903:2285:b029:e6:faf5:eaff with SMTP id
 b5-20020a1709032285b02900e6faf5eaffmr30957762plh.70.1617071349721; 
 Mon, 29 Mar 2021 19:29:09 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id i13sm17681385pgi.3.2021.03.29.19.29.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Mar 2021 19:29:09 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh@kernel.org, valentin.caron@foss.st.com, Alexandre.torgue@foss.st.com,
 rong.a.chen@intel.com, a.fatoum@pengutronix.de, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, afzal.mohd.ma@gmail.com, gregkh@linuxfoundation.org,
 erwan.leray@foss.st.com, erwan.leray@st.com, linux-serial@vger.kernel.org,
 lkp@intel.com, patrice.chotard@foss.st.com
Date: Tue, 30 Mar 2021 10:28:53 +0800
Message-Id: <1617071338-9436-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617071338-9436-1-git-send-email-dillon.minfei@gmail.com>
References: <1617071338-9436-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v7 1/6] Documentation: arm: stm32: Add
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
v7: no changes

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
