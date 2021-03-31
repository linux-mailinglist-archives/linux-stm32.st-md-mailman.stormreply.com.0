Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 530C934FB86
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Mar 2021 10:29:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1288FC57B5B;
	Wed, 31 Mar 2021 08:29:05 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECF78C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Mar 2021 08:29:01 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 x7-20020a17090a2b07b02900c0ea793940so788483pjc.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Mar 2021 01:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=F5NUtjS6dxfsjXtQ30HdpWBe6Y3/aPDV1SqF5ADpjiM=;
 b=ny/yYl4F1Pyjiht+n0Z24bFu+natEzx53+EwmBOKQUC4py/lz2p099lks0VXZZ3ys9
 KCXCofA4wVF5O1KIu4J/+VjdDZSCRIN6ZJpEcPXX6YzOh6lqjhieWlrOL7gPIMlyHKDq
 rujclv32Xv4aMtRAFb+vFoaoQEjEcwdE4JxVR6ZMUp4n42zFSH0PE053KswNQE/ikc/P
 BWpgyRGlL7RBK6bN3JNibVK7dVgfpWhNNmXpRs5QTCDLsIAxDeex+1p1Vjmx4lw5HfUD
 vWyYFRKbayN356VvQZsquLoGNjkTV4HejAwO3/9/pNEI6y/IeSNPqeIHQg7BgQImgxQv
 dAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=F5NUtjS6dxfsjXtQ30HdpWBe6Y3/aPDV1SqF5ADpjiM=;
 b=qUYeyYPShD55JVTHzIVfwgOrVSM9uWRLVu/Rcbts638K4pAlJ3Qhce0/lyOANj7TgX
 H7ZOgTxqajZDcDbF2zpNMakFn/xhutL+McEML3UwnoX1E1g2sb7u75zoVsXFYtJMxeIZ
 px2sbmVnb2ptU1DTPDSBNDLnpORrJ3c4ySt2iJkboWTuj+bWsAED5BXcfI4s3sD2Xlr0
 USbFbSvlVVvOXIWG8qHyulQwVXPRarHWaAseIFkH++QoMTiH0dqnSIrZmHqt0iZtuDCa
 UFlplIyGAoj8kYfCxLaMCNy7cj4tIQkzTEz5/yf7wInHGhMJoeuvKQfS10Wet5oM0eYt
 JNMw==
X-Gm-Message-State: AOAM5315C2wfY0AR7yF21zcS4vMKThSyIqRB7oE4iTgwNUpCefKeQBXF
 +qDQEN8XQTFIayM1UHsdswI=
X-Google-Smtp-Source: ABdhPJxbhPeX1fiW16IOjwj6m0w3Xq2M7a5cxBDHcx304ac76E5RljQgbU9jENBAgd7Chi3afCKj1Q==
X-Received: by 2002:a17:90a:17ea:: with SMTP id
 q97mr2466688pja.71.1617179340565; 
 Wed, 31 Mar 2021 01:29:00 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id v1sm1420991pjt.1.2021.03.31.01.28.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Mar 2021 01:29:00 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh@kernel.org, valentin.caron@foss.st.com, Alexandre.torgue@foss.st.com,
 rong.a.chen@intel.com, a.fatoum@pengutronix.de, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, afzal.mohd.ma@gmail.com, gregkh@linuxfoundation.org,
 erwan.leray@foss.st.com, erwan.leray@st.com, linux-serial@vger.kernel.org,
 lkp@intel.com, patrice.chotard@foss.st.com, corbet@lwn.net,
 linux-doc@vger.kernel.org, pali@kernel.org, mchehab+huawei@kernel.org,
 andrew@lunn.ch
Date: Wed, 31 Mar 2021 16:28:40 +0800
Message-Id: <1617179325-6383-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617179325-6383-1-git-send-email-dillon.minfei@gmail.com>
References: <1617179325-6383-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v9 1/6] Documentation: arm: stm32: Add
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
v9: no changes

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
