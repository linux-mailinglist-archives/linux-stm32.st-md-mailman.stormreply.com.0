Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 506419F92A9
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Dec 2024 13:57:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5317C78038;
	Fri, 20 Dec 2024 12:57:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79829C78031
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Dec 2024 12:57:21 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKBdHpJ005350;
 Fri, 20 Dec 2024 13:57:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 gf94z3PIFbHYymMM5mkmDn7wyg3IsJqIi74hdr2FxBI=; b=ZMW1iKsO/3SQBomK
 pKNWXjbu9vcyHGqtuZCpYu6q/COiXx4flHrI6zXsON0N7IPetEIArCo0qzNxKlaQ
 Y020C/K8QwXag+G+lzxwPbRHDw+Kby2F21mcg9aB7UoROdwwYS9x5gzBIti2WpJx
 4uvaCTob/C5/lvvfHUNKm/1mX+lp0KoLMf/0moQm8QLSlgmVRED6wRUsodH/2p85
 QayThQLslGIeGclr1RQI10a7oGFLwMh8+bgtPInxjNB66lnfDyFH/a2IP4F9FALb
 FrLTStcdVQqM6K9xMcGUL3V9gukKVVADYzjOCalod90i0Bod+HHmLVD1uJd3vDhA
 bbZ29w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43n4vu1b29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Dec 2024 13:57:01 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E15E240054;
 Fri, 20 Dec 2024 13:55:53 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 33CE227665F;
 Fri, 20 Dec 2024 13:55:13 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 20 Dec
 2024 13:55:12 +0100
From: <patrice.chotard@foss.st.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Petr Mladek <pmladek@suse.com>, Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 20 Dec 2024 13:55:06 +0100
Message-ID: <20241220125506.3157268-5-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241220125506.3157268-1-patrice.chotard@foss.st.com>
References: <20241220125506.3157268-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: soc@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 4/4] ARM: configs: stm32: Remove useless
	flags in STM32 defconfig
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

As stm32_defconfig is dedicated to STM32 MCUs, disable
CONFIG_COMMON_CLK_STM32MP flag which is only used by STM32 MPUs.

Disable CONFIG_SUSPEND, CONFIG_ADVISE_SYSCALLS, CONFIG_IO_URING
CONFIG_POSIX_TIMERS, CONFIG_GCC_PLUGINS, it will reduce the kernel
image size for these platforms which embed a low amount of memory.

Tested on STM32F746-DISCO board which embeds 8MB of memory.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/configs/stm32_defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
index d62a0c0b7ce5..77048b5e1ec4 100644
--- a/arch/arm/configs/stm32_defconfig
+++ b/arch/arm/configs/stm32_defconfig
@@ -6,12 +6,15 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_EXPERT=y
 # CONFIG_UID16 is not set
+# CONFIG_POSIX_TIMERS is not set
 CONFIG_BASE_SMALL=y
 # CONFIG_FUTEX is not set
 # CONFIG_EPOLL is not set
 # CONFIG_SIGNALFD is not set
 # CONFIG_EVENTFD is not set
 # CONFIG_AIO is not set
+# CONFIG_IO_URING is not set
+# CONFIG_ADVISE_SYSCALLS is not set
 # CONFIG_MMU is not set
 CONFIG_ARCH_STM32=y
 CONFIG_CPU_V7M_NUM_IRQ=240
@@ -20,6 +23,8 @@ CONFIG_DRAM_BASE=0x90000000
 # CONFIG_ATAGS is not set
 CONFIG_XIP_KERNEL=y
 CONFIG_XIP_PHYS_ADDR=0x08008000
+# CONFIG_SUSPEND is not set
+# CONFIG_GCC_PLUGINS is not set
 CONFIG_BINFMT_FLAT=y
 # CONFIG_COREDUMP is not set
 # CONFIG_VM_EVENT_COUNTERS is not set
@@ -60,6 +65,7 @@ CONFIG_DMADEVICES=y
 CONFIG_STM32_DMA=y
 CONFIG_STM32_DMAMUX=y
 CONFIG_STM32_MDMA=y
+# CONFIG_COMMON_CLK_STM32MP is not set
 CONFIG_IIO=y
 CONFIG_STM32_ADC_CORE=y
 CONFIG_STM32_ADC=y
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
