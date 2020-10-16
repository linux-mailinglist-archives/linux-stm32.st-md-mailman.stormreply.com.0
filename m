Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FD4290752
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Oct 2020 16:41:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1558C424AF;
	Fri, 16 Oct 2020 14:41:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54B64C32EA3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Oct 2020 14:41:08 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09GEbTax028212; Fri, 16 Oct 2020 16:40:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=+xoyFgWKF9M39CdJct5WeDHycIdVDU9Tp6gD7JbDFWc=;
 b=uKNyqNJ2AOeJsSVMHI4yW8bTdNSOGr8huiK/mgyYPnQIAEy7lIk/LfI61fSQwnM8PHeV
 e5cmskMgfaGeeQF/8FqNVuswWsDC+epTZqvr8c+ocf6RyIXrJT6Odn3NkBph2jMpQKW/
 esG798Td+hmPCghum+39tRN1fPrgFVK+dLfI4NzZVZOwudyFPbrW9KADAxjujeYhULMB
 7J7XLVSu+yFb9Fe6b+0hCYckIuPEO/IpK/S9PieHMz4A1yc82OicP+sx8HTar6dUdvQc
 nv6yf6r9idDGkV5bMRFUC08vl16G2w2+vRKYnbZ8yR2gydNuL9zpXUJTG2A5ejUoXqhV uA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 343587kw0u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Oct 2020 16:40:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DA13D10002A;
 Fri, 16 Oct 2020 16:40:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B4E2A2AF739;
 Fri, 16 Oct 2020 16:40:42 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG1NODE3.st.com (10.75.127.3)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 16 Oct 2020 16:40:41
 +0200
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <tglx@linutronix.de>, <jason@lakedaemon.net>, <maz@kernel.org>,
 <alexandre.torgue@st.com>
Date: Fri, 16 Oct 2020 16:40:16 +0200
Message-ID: <1602859219-15684-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG1NODE3.st.com
 (10.75.127.3)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-16_07:2020-10-16,
 2020-10-16 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/3] Add STM32 LP timer EXTI interrupts
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

STM32 LP timer that's available on STM32MP15x can wakeup the platform
using EXTI interrupts.

This series add:
- LP timer EXTI - GIC interrupt events to EXTI driver and device-tree
- LP timer wakeup-source to device-tree

Fabrice Gasnier (3):
  irqchip/stm32-exti: Add all LP timer exti direct events support
  ARM: dts: stm32: Add LP timer irqs on stm32mp151
  ARM: dts: stm32: Add LP timer wakeup-source on stm32mp151

 arch/arm/boot/dts/stm32mp151.dtsi | 10 ++++++++++
 drivers/irqchip/irq-stm32-exti.c  |  4 ++++
 2 files changed, 14 insertions(+)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
