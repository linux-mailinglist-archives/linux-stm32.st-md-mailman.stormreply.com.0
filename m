Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE4F90FEDD
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 10:32:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88DA5C6B47A;
	Thu, 20 Jun 2024 08:32:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2256AC6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 08:32:28 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45K63HHq006860;
 Thu, 20 Jun 2024 10:32:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=803EkENHynDGBNPyuFeckl
 OjrPyiTzP1D6XfKjBU6F8=; b=C4ex9Ngkph6gWEpz/e8H8c7P6ml0ZdcCj60L+i
 9uNp1VPsii04OjetwkRXJjjmgm55cdTfQXaVBSXb092x1BZimnfpOfmpXKnrqQYl
 8cBcJCqdMxMygvK5KDK674jJsuEsH4UHLRDpN+tbq74CJx6QTPhFzYUaqMTrxZRF
 ikuudAJHLUj3BhqT1gcFwmoT28Tu+95FkW8s+1zz9cB8MzslePIOFO6dFnT6OBTO
 joKmT5m3MDyGZn1He0Z130SjQuGMIhb9PlGnmX8AKEiXZOniwH3Qyht738P+/iMb
 kKJmFuxyAqqNzbbNciAygajnmaXY9q4FbR0oWLK+0AaxG+Uw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yuj9t77sq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jun 2024 10:32:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 705A840044;
 Thu, 20 Jun 2024 10:31:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 237FA2128CD;
 Thu, 20 Jun 2024 10:31:20 +0200 (CEST)
Received: from localhost (10.48.87.171) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 20 Jun
 2024 10:31:19 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Russell King <linux@armlinux.org.uk>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Date: Thu, 20 Jun 2024 10:31:07 +0200
Message-ID: <20240620083115.204362-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.48.87.171]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_06,2024-06-19_01,2024-05-17_01
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 0/8] irqchip/stm32-exti: split MCU and MPU
	code, allow module build
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

The file 'irq-stm32-exti.c' contains two drivers:
- EXTI for ARMv7m STM32 MCUs;
- EXTI for ARMv7a & ARMv8a STM32MPxxx MPUs.

The current arrangement causes some issue:
- the growing code for MPUs uses precious space on memory constraint
  MCUs devices;
- the driver for MPU cannot be built as module;
- there are risks to break one of the two drivers while working on
  the other.

Since there are only 4 minor functions shared among the two drivers:
- stm32_exti_set_type();
- stm32_chip_resume();
- stm32_chip_suspend();
- stm32_exti_chip_init();

this series splits the file in two independent files, each containing
a single driver.
To guarantee bisect-ability, the series first introduces some hook in
Kconfig, then splits the file and at the end enables module build on
MPU while cleaning-up Kconfig.
The symbols in the MPU file are renamed to better match the new name
of the driver.

The patches are created with 'git format-patch -C' to correctly show
the deleted parts and the tiny modifications between the original
monolithic file and the two extracted ones.

The series is rebased on irq/core branch of tip as it depends on a
previous series already queued for v6.10 merge window.


v1 -> v2
- fix module dependency from IRQ_DOMAIN_HIERARCHY, detected by kernel
  test robot <lkp@intel.com>

v2 -> v3
- rebase on v6.10-rc1, fixing one conflict

Antonio Borneo (8):
  irqchip/stm32-exti: add CONFIG_STM32MP_EXTI
  ARM: stm32: use different EXTI driver on ARMv7m and ARMv7a
  arm64: Kconfig: select STM32MP_EXTI on STM32 platforms
  irqchip/stm32-exti: split MCU and MPU code
  irqchip/stm32mp-exti: rename internal symbols
  irqchip/stm32mp-exti: allow build as module
  ARM: stm32: allow build irq-stm32mp-exti driver as module
  arm64: Kconfig: allow build irq-stm32mp-exti driver as module

 arch/arm/mach-stm32/Kconfig        |   2 +-
 arch/arm64/Kconfig.platforms       |   1 -
 drivers/irqchip/Kconfig            |   9 +
 drivers/irqchip/Makefile           |   1 +
 drivers/irqchip/irq-stm32-exti.c   | 670 +-------------------------
 drivers/irqchip/irq-stm32mp-exti.c | 737 +++++++++++++++++++++++++++++
 6 files changed, 752 insertions(+), 668 deletions(-)
 create mode 100644 drivers/irqchip/irq-stm32mp-exti.c


base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
