Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E73FA8BE332
	for <lists+linux-stm32@lfdr.de>; Tue,  7 May 2024 15:12:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF1FDC78002;
	Tue,  7 May 2024 13:12:55 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DB21C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 May 2024 13:12:54 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4479aUoW023705;
 Tue, 7 May 2024 15:12:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=e0iJNwbkjqx7aPApDiTXKG/i88K6O8VACabscAgkWYE=; b=Js
 /RmPp/u1aG14AjDgaD9yNgaVH7mBjiU+UJ9gSkUrtKZuPFftFfDgfcCHXf7zwDhw
 O81wXMx3EOomItoQWLbLqB4JMAjFf9fqMekk9QZvqjBlfvSon8+GJDh/lPaqBZju
 ZPyIvFKT0aU6+UgWxhWsc6ZqNLvXcvK2NUdJj2GpSQh6mEr1PrON4pSFtdRWGrcQ
 1jv34QsIcOj0L+jpZG5OG25n/yxG3xgi4M/aI54PoiF43fuizlUYsWtI0b47Ao7m
 NTEC1AEFdVYL3qb28WmLd9vwvX/5FfiUgVT9v/xyCA16P6k5cvoWFq/8YHdgQVVT
 HEvOb85lYRNXNZmybEqw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xwyyk9yj5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 May 2024 15:12:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4119840046;
 Tue,  7 May 2024 15:12:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6A77521B53E;
 Tue,  7 May 2024 15:12:02 +0200 (CEST)
Received: from localhost (10.48.87.171) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 7 May
 2024 15:12:02 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Russell King <linux@armlinux.org.uk>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Date: Tue, 7 May 2024 15:10:51 +0200
Message-ID: <20240507131051.980313-9-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240507131051.980313-1-antonio.borneo@foss.st.com>
References: <20240507131051.980313-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.171]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_06,2024-05-06_02,2023-05-22_02
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 8/8] arm64: Kconfig: allow build
	irq-stm32mp-exti driver as module
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

Drop auto-selecting the driver, so it can be built either as a
module or built-in.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm64/Kconfig.platforms | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index da85e0d49686f..24335565bad56 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -302,7 +302,6 @@ config ARCH_STM32
 	select GPIOLIB
 	select PINCTRL
 	select PINCTRL_STM32MP257
-	select STM32MP_EXTI
 	select ARM_SMC_MBOX
 	select ARM_SCMI_PROTOCOL
 	select COMMON_CLK_SCMI
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
