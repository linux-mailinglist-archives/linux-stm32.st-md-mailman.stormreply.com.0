Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC06F3D3B0F
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jul 2021 15:28:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B95CC5A4D2;
	Fri, 23 Jul 2021 13:28:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5BB3C57B6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jul 2021 13:28:34 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16NDBbPh018862; Fri, 23 Jul 2021 15:28:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=MGC4xO1+H+VuQg4eXW77rjhpuQlz4ADBsLC6hpf0qgM=;
 b=4daggNb7hF2V0KLGOFi6EcpOkzkotlCWUNYkQo9habwCX2oyZ0MpYi8i5lt/w2hTs6Nn
 JL4E7FEK2SkBiXml5TK5GZVhUn9kPy8ypzR9I+BQELlZVB2BMG8vyQ5ySPxDMF3zc19i
 nUvbicqaR2r3thvzB5/0DQdMqvXVjhXQSgvsZNpwOa9wImSQfUTWAPQjqdaMA5+6GfNs
 kYiiPCOYowXisk9sO3hzWjBX7xhii/NNszNLBGxvjNa6XWD/+Idx0QfKy15KZd4xdx8B
 VapngGMhDgRiLZAau1SH7bTz8aRqy006pBkF/B5gm1ATbYk32GoYgRfRtQ4YbxNcdsqp sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39ygng458u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jul 2021 15:28:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 877D310002A;
 Fri, 23 Jul 2021 15:28:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 76535221783;
 Fri, 23 Jul 2021 15:28:15 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 23 Jul 2021 15:28:15
 +0200
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, <arnd@arndb.de>, Olof Johansson
 <olof@lixom.net>, <robh+dt@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>
Date: Fri, 23 Jul 2021 15:28:07 +0200
Message-ID: <20210723132810.25728-5-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
References: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-23_05:2021-07-23,
 2021-07-23 signatures=0
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/7] ARM: stm32: add initial support for
	STM32MP13 family
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

This patch adds initial support of STM32MP13 microprocessor family
based on Arm Cortex-A7. New Cortex-A infrastructure (gic, timer,...)
are selected if ARCH_MULTI_V7 is defined.

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
index 57699bd8f107..98145031586f 100644
--- a/arch/arm/mach-stm32/Kconfig
+++ b/arch/arm/mach-stm32/Kconfig
@@ -48,6 +48,14 @@ config MACH_STM32MP157
 	select ARM_ERRATA_814220
 	default y
 
+config MACH_STM32MP13
+	bool "STMicroelectronics STM32MP13x"
+	select ARM_ERRATA_814220
+	default y
+	help
+	  Support for STM32MP13 SoCs:
+	  STM32MP131, STM32MP133, STM32MP135
+
 endif # ARMv7-A
 
 endif
diff --git a/arch/arm/mach-stm32/board-dt.c b/arch/arm/mach-stm32/board-dt.c
index a766310d8dca..2ccaa11aaa56 100644
--- a/arch/arm/mach-stm32/board-dt.c
+++ b/arch/arm/mach-stm32/board-dt.c
@@ -18,6 +18,9 @@ static const char *const stm32_compat[] __initconst = {
 	"st,stm32f769",
 	"st,stm32h743",
 	"st,stm32h750",
+	"st,stm32mp131",
+	"st,stm32mp133",
+	"st,stm32mp135",
 	"st,stm32mp157",
 	NULL
 };
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
