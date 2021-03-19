Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A97E342505
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Mar 2021 19:43:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B96C2C58D6A;
	Fri, 19 Mar 2021 18:43:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77E6FC58D5F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 18:43:46 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12JIg4Ew015189; Fri, 19 Mar 2021 19:43:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=NPu0SQFlkOCX+qmhQ+j64KF8f3/y6YEU37vn3mYEYAc=;
 b=w1phgrACItWeKULr0mI9kpZDks4AoskO5tNLv7fG0LXAn0gla9YjO/+zCyN3SwEB4gub
 vT4B/8X8czkBJlVVLe9BM99nfxCtN9vFGhloE+4iyX63xUEvrvs7ubi8nnHSNKURkJVi
 PMq1SFtQKursBzBa9mJb5AewuO87mMlTspY9olcKltZMYWz4mwi8oD6eS7cyKs+mEQUo
 A3I9FrNZesErxzGDC5qr2o8uk7bI+8OSes7qMIgSa9W221nbZzzKuhvq0KvtpDvtHsnj
 IvhhYG1ayc1HAnsFRubXx7dNY+OF5nkt8wz+mMk8/rURUHGF2ZhP67V2oZ/2AHTqWGBA vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37a8prk02j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Mar 2021 19:43:26 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E0EAF10002A;
 Fri, 19 Mar 2021 19:43:25 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D17E62721FC;
 Fri, 19 Mar 2021 19:43:25 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 19 Mar 2021 19:43:25
 +0100
From: Erwan Le Ray <erwan.leray@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier
 <maz@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 19 Mar 2021 19:42:51 +0100
Message-ID: <20210319184253.5841-4-erwan.leray@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210319184253.5841-1-erwan.leray@foss.st.com>
References: <20210319184253.5841-1-erwan.leray@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-19_10:2021-03-19,
 2021-03-19 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/5] irqchip/stm32: add usart instances exti
	direct event support
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

Add following usart instances exti direct event support (used for UART wake
up).
- exti 26 (USART1) is mapped to GIC 37
- exti 27 (USART2) is mapped to GIC 38
- exti 28 (USART3) is mapped to GIC 39
- exti 29 (USART6) is mapped to GIC 71
- exti 31 (UART5) is mapped to GIC 53
- exti 32 (UART7) is mapped to GIC 82
- exti 33 (UART8) is mapped to GIC 83

Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>

diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
index 8662d7b7b262..b9db90c4aa56 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -193,7 +193,14 @@ static const struct stm32_desc_irq stm32mp1_desc_irq[] = {
 	{ .exti = 23, .irq_parent = 72, .chip = &stm32_exti_h_chip_direct },
 	{ .exti = 24, .irq_parent = 95, .chip = &stm32_exti_h_chip_direct },
 	{ .exti = 25, .irq_parent = 107, .chip = &stm32_exti_h_chip_direct },
+	{ .exti = 26, .irq_parent = 37, .chip = &stm32_exti_h_chip_direct },
+	{ .exti = 27, .irq_parent = 38, .chip = &stm32_exti_h_chip_direct },
+	{ .exti = 28, .irq_parent = 39, .chip = &stm32_exti_h_chip_direct },
+	{ .exti = 29, .irq_parent = 71, .chip = &stm32_exti_h_chip_direct },
 	{ .exti = 30, .irq_parent = 52, .chip = &stm32_exti_h_chip_direct },
+	{ .exti = 31, .irq_parent = 53, .chip = &stm32_exti_h_chip_direct },
+	{ .exti = 32, .irq_parent = 82, .chip = &stm32_exti_h_chip_direct },
+	{ .exti = 33, .irq_parent = 83, .chip = &stm32_exti_h_chip_direct },
 	{ .exti = 47, .irq_parent = 93, .chip = &stm32_exti_h_chip_direct },
 	{ .exti = 48, .irq_parent = 138, .chip = &stm32_exti_h_chip_direct },
 	{ .exti = 50, .irq_parent = 139, .chip = &stm32_exti_h_chip_direct },
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
