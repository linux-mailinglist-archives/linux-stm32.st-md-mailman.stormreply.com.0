Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E3C8BE327
	for <lists+linux-stm32@lfdr.de>; Tue,  7 May 2024 15:11:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B91BC6DD6B;
	Tue,  7 May 2024 13:11:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35C77CFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 May 2024 13:11:52 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4479G0lr006786;
 Tue, 7 May 2024 15:11:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=XIk/vz4CZvRDP46S7QF0CjZaFR83xkL+/AG9b+2atfg=; b=z4
 r4fhYiVgS3LB/q0RE8qBs0BfPz1fTRDISLhKoYyyBk/Q3Q87NbzRa2TgwGMmiBqC
 qJzzcldSLaTLt7nZExrElCvEoV114nz0+Upp6r1Qu2aFlKNer6igxfGOhYeT2Kq6
 XKMaPvqFH7Z+/YDVyOgJGHqiZ4CJRfoHjmaYboHnwrmaF1NIZYTdv6HPdTA4Ltv2
 0FpFDNKQlRD9eMhbF4Q/mImNaHrGF86UNVYCBS4D0hWy+780zjIVBWw6zfAxQ9qI
 +ihuRVWgEfhTNS5bcEazLtmWEJ03Da9LVh0MOnl92fEOfiwoSz7D0VKswCLnJv1/
 qIPkWAHWgfMMPvOEcECw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xwxk1j0du-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 May 2024 15:11:33 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DD72D40045;
 Tue,  7 May 2024 15:11:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E013C21B53C;
 Tue,  7 May 2024 15:10:55 +0200 (CEST)
Received: from localhost (10.48.87.171) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 7 May
 2024 15:10:55 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Russell King <linux@armlinux.org.uk>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Date: Tue, 7 May 2024 15:10:44 +0200
Message-ID: <20240507131051.980313-2-antonio.borneo@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v2 1/8] irqchip/stm32-exti: add
	CONFIG_STM32MP_EXTI
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

To guarantee bisect-ability during split of stm32-exti in MCU and
MPU code, introduce CONFIG_STM32MP_EXTI. It will be used in arch
configuration.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/irqchip/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 14464716bacbb..798bd50f8ab23 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -392,6 +392,10 @@ config LS_SCFG_MSI
 config PARTITION_PERCPU
 	bool
 
+config STM32MP_EXTI
+	bool
+	select STM32_EXTI
+
 config STM32_EXTI
 	bool
 	select IRQ_DOMAIN
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
