Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2091507F2
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Feb 2020 15:05:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7C91C36B0C;
	Mon,  3 Feb 2020 14:05:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64EAEC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2020 14:04:57 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 013E3FB8024566; Mon, 3 Feb 2020 15:04:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=XaMLWgqr4Xu77AIeiVKHfV8cYiwTa5gMgIJBRfBE5Lo=;
 b=QlPIB6ZTSsoef/Cyl9ah+UU1M+sGUlRTwSDAfkQobpOheFKOcTKMHR9jebJbfJm8AhWT
 cxeojwBqJRzHOsDVIU9wVldfto4mOu3swUrapCJvIsO1a506houyUG65Aq3l4amO6XBc
 kVUoStlXEiWMyVhWTfkX0obNIOpiUYO/byUtWsYqJYFYDumlBdI3D9Q0jzxM6f8vAG++
 vOU6S1VTsSg9gqSfLAahOsYEkPmO/snCpLAU6u1IDObzpqdG4ZSuzhtDo0NOLY3yI/71
 QQuUzgg5rvbFpy6Vxch7cZ+5VCspElUxpyY5ZgMrCMbPbWNyeHSlJE7ZPG2vcEONBYWN 8w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xw13nhbae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Feb 2020 15:04:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 84C31100039;
 Mon,  3 Feb 2020 15:04:42 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 75DF72AAB83;
 Mon,  3 Feb 2020 15:04:42 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 3 Feb 2020 15:04:42
 +0100
From: Erwan Le Ray <erwan.leray@st.com>
To: Russell King <linux@armlinux.org.uk>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>,
 Olof Johansson <olof@lixom.net>
Date: Mon, 3 Feb 2020 15:04:23 +0100
Message-ID: <20200203140425.26579-3-erwan.leray@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200203140425.26579-1-erwan.leray@st.com>
References: <20200203140425.26579-1-erwan.leray@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-03_04:2020-02-02,
 2020-02-03 signatures=0
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 Clement Peron <peron.clem@gmail.com>, Gerald Baeza <gerald.baeza@st.com>,
 Nathan Huckleberry <nhuck15@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 2/4] ARM: debug: stm32: add UART early
	console configuration for STM32F7
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
index 4f982ef1d0ec..5ff66c294a5a 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -1213,12 +1213,13 @@ choice
 
 	config STM32F7_DEBUG_UART
 		bool "Use STM32F7 UART for low-level debug"
-		depends on ARCH_STM32
+		depends on MACH_STM32F746 || MACH_STM32F769
 		select DEBUG_STM32_UART
 		help
 		  Say Y here if you want kernel low-level debugging support
 		  on STM32F7 based platforms, which default UART is wired on
-		  USART1.
+		  USART1, but another UART instance can be selected by modifying
+		  CONFIG_DEBUG_UART_PHYS.
 
 		  If unsure, say N.
 
@@ -1620,7 +1621,7 @@ config DEBUG_UART_PHYS
 	default 0x3e000000 if DEBUG_BCM_KONA_UART
 	default 0x3f201000 if DEBUG_BCM2836
 	default 0x4000e400 if DEBUG_LL_UART_EFM32
-	default 0x40011000 if STM32F4_DEBUG_UART
+	default 0x40011000 if STM32F4_DEBUG_UART || STM32F7_DEBUG_UART
 	default 0x40028000 if DEBUG_AT91_SAMV7_USART1
 	default 0x40081000 if DEBUG_LPC18XX_UART0
 	default 0x40090000 if DEBUG_LPC32XX
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
