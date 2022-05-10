Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28564522179
	for <lists+linux-stm32@lfdr.de>; Tue, 10 May 2022 18:42:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2413C0D2BC;
	Tue, 10 May 2022 16:42:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59D90C0D2B8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 16:42:55 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24AD9BZE028201;
 Tue, 10 May 2022 18:42:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=QWngG9+xWY4MUBFAbNnXrMXXahmezHTgt/gHbcN7PIs=;
 b=DpvW3JFJz4SZbUOmAl21NnTnTv2kroZA2D/NZQqhwEELHJ4BF+G3JU3ZDrnSwfT6i1rR
 P/1ZDnwWjc1NwSPHFFpUk+ppa9IWqOV99Lw2k6PVVK502PEkxfbXWVkYFfQeB4QnNq52
 AE3QQxEEKmyiw2FicrVspOy4Ku4Fug9mpX41Sj04eBDI1FsGXXA5vtfOEiZi3X0jEB3N
 aCODeOL57qW1/p4bK8+H6L4kT1J6JOkk1Q3f+VeU90JTcBQXxBwgrKmCm4W/g57+XWrd
 G8RosAW5RfcrLkQW1YyFHQ8jtnBInWf9e7zWQm6N5yc32fb8Qo4Bn2redLBH5CCfLrX5 SQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwg411ey1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 18:42:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0F10210002A;
 Tue, 10 May 2022 18:42:29 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 090CA231524;
 Tue, 10 May 2022 18:42:29 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 10 May 2022 18:42:28
 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
Date: Tue, 10 May 2022 18:41:18 +0200
Message-ID: <20220510164123.557921-2-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220510164123.557921-1-antonio.borneo@foss.st.com>
References: <20220510164123.557921-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_04,2022-05-10_01,2022-02-23_01
Cc: Loic Pallardy <loic.pallardy@foss.st.com>,
 Ludovic Barre <ludovic.barre@foss.st.com>,
 Pascal Paillet <p.paillet@foss.st.com>
Subject: [Linux-stm32] [PATCH 2/7] irqchip/stm32-exti: manage IMR at each
	mask/unmask for direct event
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

From: Loic Pallardy <loic.pallardy@foss.st.com>

Enable EXTI line through IMR also on direct event.

Signed-off-by: Loic Pallardy <loic.pallardy@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/irqchip/irq-stm32-exti.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
index 10c9c742c216..1145f064faa8 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -691,8 +691,8 @@ static struct irq_chip stm32_exti_h_chip_direct = {
 	.name			= "stm32-exti-h-direct",
 	.irq_eoi		= irq_chip_eoi_parent,
 	.irq_ack		= irq_chip_ack_parent,
-	.irq_mask		= irq_chip_mask_parent,
-	.irq_unmask		= irq_chip_unmask_parent,
+	.irq_mask		= stm32_exti_h_mask,
+	.irq_unmask		= stm32_exti_h_unmask,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
 	.irq_set_type		= irq_chip_set_type_parent,
 	.irq_set_wake		= stm32_exti_h_set_wake,
-- 
2.36.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
