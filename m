Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 348FC34A638
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Mar 2021 12:15:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE7C9C58D5B;
	Fri, 26 Mar 2021 11:15:17 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C4D1C58D5C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 11:15:16 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so2314271pjv.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 04:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8LbC0yRdb6KnBRs4/oHMCPB8Wx+wfbQ7JrB27rdabEo=;
 b=ODurMsRARbMLi1n2YX5YSv2Re+1Sl/BpZkwEqgNmkSZe0/9NTRivo0xUNzhrSFYGsI
 Px5M3WxN65FyQHfJ7EW27bHJg76oKnCc/tIX0OoFPhmalG010qPebVHg9blNSXeDM9Xa
 fGx5NTh34AKMAM8BfnCpDm+T+4vOFS8fLoFE+QHRZr5xhlCgtCBIvZ6TBtAjllqsaAGI
 x0d+t1Sem/wtf1YUsMYvcuecD3OB339EQ7XfQqQOBmhHlcF9v3966VbZNg+HxfnPpTN9
 +lsGV/JIUC1js1Q3e9C+pURR3kuTXKZ95EN41n/fwkxcainx5746FZscQBx1sYivXOCM
 Lm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8LbC0yRdb6KnBRs4/oHMCPB8Wx+wfbQ7JrB27rdabEo=;
 b=mbHleglY8shEx2aULA2fUmXlrJtHwYeeETkbUP3h4WHfwLoWK5umcUvBWZn3DTd2c2
 wMUQdGi6MelRyD0OctkAx8BwtCtm0wlAuz0O4k061Sakew//Zm8ldkr89ZmTFCK+kgpi
 LsFTxGKZvP245iJiCfnLvYVaIoQqqfIpxGJN8YStuv5WlKwAdRN//G2XkG1/kKqFmWXM
 CFp0YJaPSmoNLc7gdiGCqEwEQF7ZxzGLndsG8PdVPC0hbKYuEMJyAdcO0nmqsQ5gJ0+y
 F5TUZolDG25vvN1eQx52B08uLfjvlOcS6loG4miKnm3vYsxbM1UuyTBj9seTPcWI4iwg
 CMYg==
X-Gm-Message-State: AOAM530chJ/CgcrIbcZNw2Q/BYS/D+yvROyQbEuvW3LZDMJIWmO6YhUM
 J33veiNgQkDf9GTepJIfRhlGEiITyHBBHfRD
X-Google-Smtp-Source: ABdhPJw4f1Ee2Hz0/Mm15LtPxz6VsG6K/k51kVXf8OiJcmT1EppkEPqKWTPnMhHhnWHobI9yDqBs9A==
X-Received: by 2002:a17:902:d341:b029:e6:9a9f:5614 with SMTP id
 l1-20020a170902d341b02900e69a9f5614mr14828314plk.48.1616757314991; 
 Fri, 26 Mar 2021 04:15:14 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id l3sm8108414pfc.81.2021.03.26.04.15.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Mar 2021 04:15:14 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh@kernel.org, valentin.caron@foss.st.com, Alexandre.torgue@foss.st.com,
 rong.a.chen@intel.com, a.fatoum@pengutronix.de, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com,
 gregkh@linuxfoundation.org, erwan.leray@foss.st.com, erwan.leray@st.com,
 linux-serial@vger.kernel.org, lkp@intel.com
Date: Fri, 26 Mar 2021 19:14:56 +0800
Message-Id: <1616757302-7889-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616757302-7889-1-git-send-email-dillon.minfei@gmail.com>
References: <1616757302-7889-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v6 1/9] Documentation: arm: stm32: Add
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

v6: no changes

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
