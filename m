Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DF914ED96
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jan 2020 14:41:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 419AAC36B0D;
	Fri, 31 Jan 2020 13:41:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFA86C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2020 13:41:50 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00VDbWws016217; Fri, 31 Jan 2020 14:41:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=AxV9vH56OpkskaoqHe+T5VRZT2jdcBi4jBwKkhXoGY0=;
 b=vccN881pVI4JhpYtbs2DHTzPY1otktC9JzbGzUlt/USyFoW/6+cR3FBJIutK6X7zNJ6v
 NLAzbo6OD5DMHPfhtVSXzIxXa1sArcqXi6O4ztiiwwpoaI8bKqe3HTQ6i0p64RbXq1Q5
 bu8dq7yWvspdaFhTITpTBT2vUfDG/4uFLJPc8NY2RPYJY84IdPJbcTiEZG8XJVu6//M1
 dQh1Lz5xYyuvJpvRukcxsOBRRWEzsidW/II/FYJ8BRRWP86jYEJL1RN/IS8LazGfSQ12
 NvvpQ56kNJd9sVx5xNEoAyjeSa4roXHbB5dUyrHrZqdCnS0hYsX4jCQk66Oj6k9ceq97 8g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrbpbec48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2020 14:41:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DF64A100034;
 Fri, 31 Jan 2020 14:41:35 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CC2732BC7D9;
 Fri, 31 Jan 2020 14:41:35 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jan 2020 14:41:35
 +0100
From: Erwan Le Ray <erwan.leray@st.com>
To: Russell King <linux@armlinux.org.uk>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>,
 Olof Johansson <olof@lixom.net>
Date: Fri, 31 Jan 2020 14:41:20 +0100
Message-ID: <20200131134123.27775-2-erwan.leray@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200131134123.27775-1-erwan.leray@st.com>
References: <20200131134123.27775-1-erwan.leray@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-31_03:2020-01-31,
 2020-01-31 signatures=0
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 Clement Peron <peron.clem@gmail.com>, Gerald Baeza <gerald.baeza@st.com>,
 Nathan Huckleberry <nhuck15@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/4] ARM: debug: stm32: add UART early
	console configuration for STM32F4
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

Early console is hardcoded on USART1 in current implementation.
With this patch, default UART instance is USART1, but other UART instances
can be configured by setting physical and virtual base addresses in
menuconfig.

Signed-off-by: Erwan Le Ray <erwan.leray@st.com>

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 8bcbd0cd739b..4f982ef1d0ec 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -1201,12 +1201,13 @@ choice
 
 	config STM32F4_DEBUG_UART
 		bool "Use STM32F4 UART for low-level debug"
-		depends on ARCH_STM32
+		depends on MACH_STM32F429 || MACH_STM32F469
 		select DEBUG_STM32_UART
 		help
 		  Say Y here if you want kernel low-level debugging support
 		  on STM32F4 based platforms, which default UART is wired on
-		  USART1.
+		  USART1, but another UART instance can be selected by modifying
+		  CONFIG_DEBUG_UART_PHYS.
 
 		  If unsure, say N.
 
@@ -1619,6 +1620,7 @@ config DEBUG_UART_PHYS
 	default 0x3e000000 if DEBUG_BCM_KONA_UART
 	default 0x3f201000 if DEBUG_BCM2836
 	default 0x4000e400 if DEBUG_LL_UART_EFM32
+	default 0x40011000 if STM32F4_DEBUG_UART
 	default 0x40028000 if DEBUG_AT91_SAMV7_USART1
 	default 0x40081000 if DEBUG_LPC18XX_UART0
 	default 0x40090000 if DEBUG_LPC32XX
@@ -1713,7 +1715,7 @@ config DEBUG_UART_PHYS
 		DEBUG_S3C64XX_UART || \
 		DEBUG_BCM63XX_UART || DEBUG_ASM9260_UART || \
 		DEBUG_SIRFSOC_UART || DEBUG_DIGICOLOR_UA0 || \
-		DEBUG_AT91_UART
+		DEBUG_AT91_UART || DEBUG_STM32_UART
 
 config DEBUG_UART_VIRT
 	hex "Virtual base address of debug UART"
@@ -1823,7 +1825,7 @@ config DEBUG_UART_VIRT
 		DEBUG_S3C64XX_UART || \
 		DEBUG_BCM63XX_UART || DEBUG_ASM9260_UART || \
 		DEBUG_SIRFSOC_UART || DEBUG_DIGICOLOR_UA0 || \
-		DEBUG_AT91_UART
+		DEBUG_AT91_UART || DEBUG_STM32_UART
 
 config DEBUG_UART_8250_SHIFT
 	int "Register offset shift for the 8250 debug UART"
diff --git a/arch/arm/include/debug/stm32.S b/arch/arm/include/debug/stm32.S
index 1abb32f685fd..b0c7034b33d9 100644
--- a/arch/arm/include/debug/stm32.S
+++ b/arch/arm/include/debug/stm32.S
@@ -4,8 +4,6 @@
  * Author:   Gerald Baeza <gerald.baeza@st.com> for STMicroelectronics.
  */
 
-#define STM32_UART_BASE			0x40011000	/* USART1 */
-
 #ifdef CONFIG_STM32F4_DEBUG_UART
 #define STM32_USART_SR_OFF		0x00
 #define STM32_USART_TDR_OFF		0x04
@@ -20,8 +18,8 @@
 #define STM32_USART_TXE			(1 << 7)	/* Tx data reg empty */
 
 .macro	addruart, rp, rv, tmp
-	ldr	\rp,      =STM32_UART_BASE	@ physical base
-	ldr	\rv,      =STM32_UART_BASE      @ virt base /* NoMMU */
+	ldr	\rp, =CONFIG_DEBUG_UART_PHYS @ physical base
+	ldr	\rv, =CONFIG_DEBUG_UART_VIRT @ virt base
 .endm
 
 .macro  senduart,rd,rx
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
