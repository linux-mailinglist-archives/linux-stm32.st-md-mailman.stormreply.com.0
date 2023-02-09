Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 311956903E4
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Feb 2023 10:33:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E83B7C6A60C;
	Thu,  9 Feb 2023 09:33:55 +0000 (UTC)
Received: from mr85p00im-zteg06021501.me.com (mr85p00im-zteg06021501.me.com
 [17.58.23.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FC12C6A5E9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Feb 2023 09:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1675934358; bh=SZhlB5Amphohnu89nA8T+9EvfjDSfEbmKX2qUghxvcs=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=o/NxLQ9PU1l9X2sTMiXYxKhsPVmuzHGBO9PUsOvwhybe6UaP3w5cBwtG4Zdsj1UEh
 N95VLTGsgxOg5d+OLa1AF9ChzM4EYIltiU99YPlgqCcEpojXv2bE3I3sXw9N2VlXkx
 lEvu2MqlCqSNulpnjZvUm8HBJW1R5k2gKvmTSVaDOXNn/K2FWUqCaRpbIeihtVlAVc
 bdEoU4cx3ZZutCWfUme4wy3t5yKPE8MlpWC+/KKeVimmtCzf9Q37gr2Bp5fHSZYWbb
 Pg/W84KNZoKWpUAlpaKOmP/kU+Aih71SROAeduaqG184O+t7TI5E+jh/RqI/z9W+fc
 WdZHNkF4+XPCA==
Received: from localhost (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
 by mr85p00im-zteg06021501.me.com (Postfix) with ESMTPSA id
 255E927945ED; Thu,  9 Feb 2023 09:19:18 +0000 (UTC)
From: Alain Volmat <avolmat@me.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Date: Thu,  9 Feb 2023 10:16:59 +0100
Message-Id: <20230209091659.1409-12-avolmat@me.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209091659.1409-1-avolmat@me.com>
References: <20230209091659.1409-1-avolmat@me.com>
MIME-Version: 1.0
X-Proofpoint-GUID: 8Huc_KYpmbvx0eZVYoyHvKSEhimig7mi
X-Proofpoint-ORIG-GUID: 8Huc_KYpmbvx0eZVYoyHvKSEhimig7mi
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2302090088
X-Mailman-Approved-At: Thu, 09 Feb 2023 09:33:54 +0000
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Alain Volmat <avolmat@me.com>
Subject: [Linux-stm32] [PATCH 11/11] ARM: debug: removal of STiH415/STiH416
	related debug uart
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

Remove the entries related to the debug uart addresses for
platforms STiH415 and STiH416 which are no more supported.

Signed-off-by: Alain Volmat <avolmat@me.com>
---
 arch/arm/Kconfig.debug | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index c345775f035b..e7307eeb2abb 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -1205,26 +1205,6 @@ choice
 		  Say Y here if you want kernel low-level debugging support
 		  on ST SPEAr13xx based platforms.
 
-	config DEBUG_STIH41X_ASC2
-		bool "Use StiH415/416 ASC2 UART for low-level debug"
-		depends on ARCH_STI
-		help
-		  Say Y here if you want kernel low-level debugging support
-		  on STiH415/416 based platforms like b2000, which has
-		  default UART wired up to ASC2.
-
-		  If unsure, say N.
-
-	config DEBUG_STIH41X_SBC_ASC1
-		bool "Use StiH415/416 SBC ASC1 UART for low-level debug"
-		depends on ARCH_STI
-		help
-		  Say Y here if you want kernel low-level debugging support
-		  on STiH415/416 based platforms like b2020. which has
-		  default UART wired up to SBC ASC1.
-
-		  If unsure, say N.
-
 	config DEBUG_STIH418_SBC_ASC0
 		bool "Use StiH418 SBC ASC0 UART for low-level debug"
 		depends on ARCH_STI
@@ -1597,8 +1577,6 @@ config DEBUG_LL_INCLUDE
 	default "debug/renesas-scif.S" if DEBUG_RMOBILE_SCIFA4
 	default "debug/s3c24xx.S" if DEBUG_S3C24XX_UART || DEBUG_S3C64XX_UART
 	default "debug/s5pv210.S" if DEBUG_S5PV210_UART
-	default "debug/sti.S" if DEBUG_STIH41X_ASC2
-	default "debug/sti.S" if DEBUG_STIH41X_SBC_ASC1
 	default "debug/sti.S" if DEBUG_STIH418_SBC_ASC0
 	default "debug/stm32.S" if DEBUG_STM32_UART
 	default "debug/tegra.S" if DEBUG_TEGRA_UART
@@ -1728,9 +1706,7 @@ config DEBUG_UART_PHYS
 	default 0xfc00c000 if DEBUG_AT91_SAMA5D4_USART3
 	default 0xfcb00000 if DEBUG_HI3620_UART
 	default 0xfd883000 if DEBUG_ALPINE_UART0
-	default 0xfe531000 if DEBUG_STIH41X_SBC_ASC1
 	default 0xfe800000 if ARCH_IOP32X
-	default 0xfed32000 if DEBUG_STIH41X_ASC2
 	default 0xff690000 if DEBUG_RK32_UART2
 	default 0xffc02000 if DEBUG_SOCFPGA_UART0
 	default 0xffc02100 if DEBUG_SOCFPGA_ARRIA10_UART1
@@ -1759,7 +1735,6 @@ config DEBUG_UART_PHYS
 		DEBUG_BCM63XX_UART || DEBUG_ASM9260_UART || \
 		DEBUG_DIGICOLOR_UA0 || \
 		DEBUG_AT91_UART || DEBUG_STM32_UART || \
-		DEBUG_STIH41X_ASC2 || DEBUG_STIH41X_SBC_ASC1 || \
 		DEBUG_STIH418_SBC_ASC0
 
 config DEBUG_UART_VIRT
@@ -1827,9 +1802,7 @@ config DEBUG_UART_VIRT
 	default 0xfcfe8600 if DEBUG_BCM63XX_UART
 	default 0xfd000000 if DEBUG_SPEAR3XX || DEBUG_SPEAR13XX
 	default 0xfd064200 if DEBUG_AT91_LAN966_FLEXCOM
-	default 0xfd531000 if DEBUG_STIH41X_SBC_ASC1
 	default 0xfd883000 if DEBUG_ALPINE_UART0
-	default 0xfdd32000 if DEBUG_STIH41X_ASC2
 	default 0xfe010000 if STM32MP1_DEBUG_UART
 	default 0xfe017000 if DEBUG_MMP_UART2
 	default 0xfe018000 if DEBUG_MMP_UART3
@@ -1871,7 +1844,6 @@ config DEBUG_UART_VIRT
 		DEBUG_BCM63XX_UART || DEBUG_ASM9260_UART || \
 		DEBUG_DIGICOLOR_UA0 || \
 		DEBUG_AT91_UART || DEBUG_STM32_UART || \
-		DEBUG_STIH41X_ASC2 || DEBUG_STIH41X_SBC_ASC1 || \
 		DEBUG_STIH418_SBC_ASC0
 
 config DEBUG_UART_8250_SHIFT
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
