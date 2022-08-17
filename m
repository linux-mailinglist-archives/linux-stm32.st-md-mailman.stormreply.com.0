Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F65596ED8
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Aug 2022 14:59:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7B83C640F0;
	Wed, 17 Aug 2022 12:59:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DC3AC03FCB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Aug 2022 12:59:01 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27HCYcdS007849;
 Wed, 17 Aug 2022 14:58:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=KNZl0X08yaVQSxf6OQMI9RKfqIUKh/weq3c89Z5IdgY=;
 b=23XUq7dghBYzUh+of21349Uk3dkMDdnW6WZrdP1Dr639I2ADKo8lhZ0ZC3qLzTmscP2t
 UV0uIPPQwh10ZXtjtDhRG+WkuMaBr39UGSWVHNUTzTLPgVycOWLpOrKJfSrLcQv2WmB2
 ALhkAcLoZeYWMiFXOzLevPMK5vuPzissS9HBRHaYqLSP1gIMDNLLDR+tjTumNgCwCyKZ
 QY9BJkDpqqrSAqvqKyZgGJ2IkbHERK6HG7QG4rTYLK8vk9rp+QxYdxsAI/CKwSy92+sQ
 K5ZWBP03NwCA8jE+weti9dKMTie/kYMRiDPKKzH+RT7U2jX49rrF18HPzeFGB0tLxAYs AA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3hx2uhn37p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Aug 2022 14:58:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0872E10002A;
 Wed, 17 Aug 2022 14:58:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 02977231533;
 Wed, 17 Aug 2022 14:58:23 +0200 (CEST)
Received: from localhost (10.75.127.50) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 17 Aug
 2022 14:58:22 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
Date: Wed, 17 Aug 2022 14:57:58 +0200
Message-ID: <20220817125758.5975-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <202208131739.gJvcs9ls-lkp@intel.com>
References: <202208131739.gJvcs9ls-lkp@intel.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-17_08,2022-08-16_02,2022-06-22_01
Cc: kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [Linux-stm32] [PATCH] irqchip/stm32-exti: Remove check on always
	false condition
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

The field drv_data is assigned during driver's probe, where it's
already checked to be not NULL.

Remove the always false check '!host_data->drv_data'.

This fixes a warning "variable dereferenced before check" detected
by '0-DAY CI Kernel Test Service'.

Fixes: c297493336b7 ("irqchip/stm32-exti: Simplify irq description table")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Link: https://lore.kernel.org/lkml/202208131739.gJvcs9ls-lkp@intel.com/
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/irqchip/irq-stm32-exti.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
index a73763d475f0..6a3f7498ea8e 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -716,7 +716,7 @@ static int stm32_exti_h_domain_alloc(struct irq_domain *dm,
 
 	irq_domain_set_hwirq_and_chip(dm, virq, hwirq, chip, chip_data);
 
-	if (!host_data->drv_data || !host_data->drv_data->desc_irqs)
+	if (!host_data->drv_data->desc_irqs)
 		return -EINVAL;
 
 	desc_irq = host_data->drv_data->desc_irqs[hwirq];

base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
