Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD98053E5B8
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Jun 2022 18:29:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73D1AC5F1D7;
	Mon,  6 Jun 2022 16:29:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64467C5EC56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jun 2022 16:29:12 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 256DGp1j017522;
 Mon, 6 Jun 2022 18:28:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=X3R3dd9ZyKVc3FVNHzLE7U3uNwNEI+eXY7lzN95+kzo=;
 b=FGq04MMr2hzi+slj8HcJS2HdUBYOzHU+D2OcWJC2Kzi7+jUYMvcAflQsnL2e4/OKdBC9
 JNJkjgt4/VwYwS+HWj/KVTOP642DGwYqZMsypDAO2F2Wfuc08qtK/9fqq3zjFhfSbcz5
 4Aywv1fKxO7R0+yBTiYzpgPvoIhhCGlihp30NN1w/PjVlIj88jmMVWJeKoWRr2kxZ5Zy
 FkhB+z7MaWQ2+id5ADHOtoC/dfHrX449ZBVNjVmmYAOAo/eUtvdDyXLeXKb8hU7Y0oGw
 eVbIHnIugUK4oE5sbdQVk+2J4pkhIGpP+pcDpcQhsqetieWKfKrPEwVgbLLHoy/8efAN 8Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gfx9huhk3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jun 2022 18:28:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C7B0C100039;
 Mon,  6 Jun 2022 18:28:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C1507231DC0;
 Mon,  6 Jun 2022 18:28:41 +0200 (CEST)
Received: from localhost (10.75.127.49) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 6 Jun
 2022 18:28:41 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
Date: Mon, 6 Jun 2022 18:27:53 +0200
Message-ID: <20220606162757.415354-3-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220510164123.557921-1-antonio.borneo@foss.st.com>
References: <20220510164123.557921-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-06_04,2022-06-03_01,2022-02-23_01
Cc: Loic Pallardy <loic.pallardy@foss.st.com>,
 Ludovic Barre <ludovic.barre@foss.st.com>,
 Pascal Paillet <p.paillet@foss.st.com>
Subject: [Linux-stm32] [PATCH v2 2/6] irqchip/stm32-exti: Fix
	irq_mask/irq_unmask for direct events
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

The driver has to mask/unmask the corresponding flag in the
Interrupt Mask Register (IMR).
This is already done for configurable event, while direct events
only forward the mask/unmask request to the parent.

Use the existing stm32_exti_h_mask()/stm32_exti_h_unmask() for
direct events too.

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
2.36.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
