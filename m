Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBA553E5B6
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Jun 2022 18:29:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55331C5E2C6;
	Mon,  6 Jun 2022 16:29:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22220C0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jun 2022 16:29:10 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 256GECvV017704;
 Mon, 6 Jun 2022 18:28:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=chSL3S1/PxFhKEkOoYMX6E496arnOJvXvKlnQ3BHkEI=;
 b=KMzIc9Z3OcDESomgwoBKaVeph7avvEznvuN5rlhhJ4y+d7ZJsFF1ytOqSFenMTfjpDKc
 R/gth9nq+/m+U3S+TuB1WOBJdsZG67RupZmUoswMUvEGaq7QAjMD6z3hXspG+mseEyf+
 lX6+Ox9QDZqL2cV9jdHtkGX90QjWX3IaubReFDSDzmSD1+xtK8lqmw8mqiH+GBwiEP+g
 X5av7S3V9rI30ZzsbQo3D0clUiuIBnb1ZV3futaxjYya0OvvTg2I0Wd7s7Vy3t7UixD1
 T/P8+sTtPzR2DQzyfi/hjjsFF7s/oInjqrOyDXO9UFF3I71PpvitGWLE6jTtDFpwhD/X /Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gfxr23axu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jun 2022 18:28:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C7CE210002A;
 Mon,  6 Jun 2022 18:28:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C0C14231DC0;
 Mon,  6 Jun 2022 18:28:40 +0200 (CEST)
Received: from localhost (10.75.127.49) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 6 Jun
 2022 18:28:40 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
Date: Mon, 6 Jun 2022 18:27:51 +0200
Message-ID: <20220606162757.415354-1-antonio.borneo@foss.st.com>
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
Cc: Ludovic Barre <ludovic.barre@foss.st.com>,
 Loic Pallardy <loic.pallardy@foss.st.com>,
 Pascal Paillet <p.paillet@foss.st.com>
Subject: [Linux-stm32] [PATCH v2 0/6] irqchip/stm32-exti: Fixes and
	simplifications
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

This series address some code fix for irq-stm32-exti driver and
simplifies the table that remaps the interrupts from exti to gic.


v1->v2
 - Properly format the commit title and expand the commit msg;
 - drop the patch v1 4/7:
   "irqchip/stm32-exti: forward irq_request_resources to parent"
   in favor of the generic:
   https://lore.kernel.org/lkml/20220512160544.13561-1-antonio.borneo@foss.st.com/
   "genirq: Don't return error on missing optional
   irq_request_resources()";
 - use consistently UNDEF_REG for non existing EMR registers;
 - rebase on v5.19-rc1.


Alexandre Torgue (1):
  irqchip/stm32-exti: Tag emr register as undefined for stm32mp15

Antonio Borneo (3):
  irqchip/stm32-exti: Prevent illegal read due to unbounded DT value
  irqchip/stm32-exti: Read event trigger type from event_trg register
  irqchip/stm32-exti: Simplify irq description table

Loic Pallardy (1):
  irqchip/stm32-exti: Fix irq_mask/irq_unmask for direct events

Ludovic Barre (1):
  irqchip/stm32-exti: Fix irq_set_affinity return value

 drivers/irqchip/irq-stm32-exti.c | 250 +++++++++++++++----------------
 1 file changed, 124 insertions(+), 126 deletions(-)


base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.36.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
