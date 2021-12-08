Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F6B46D3FC
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Dec 2021 14:05:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B51FC5F1EC;
	Wed,  8 Dec 2021 13:05:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1ED64C5F1E1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Dec 2021 13:05:50 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B89suIU020237;
 Wed, 8 Dec 2021 14:05:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=YruwVjLhOuyRwp87HtHoBSfI756j7x4WprXuWb8kmQU=;
 b=ULNIpxXU26WqGpYwneKnj2WsdbtDWMOK+z/UR44DMk6spe0WYDyWEuw6LFiU/M79TE4s
 Z0zHnN6BfMLvTcbgyirlrDNAdX5o2wg63MPS05e8D2wrAc8+QQ8OH9xs6CkEJ7YUziOB
 PF8JnSbutOCP/rfo65VW29DEsQbs+LaeJ5gRg8gxWg6rY/cWnbo9TISFsWdV5Un9AWFI
 mzZ/AKvo3dFIaxS8bTmwsDC44Dq6BSS60GmJYvR3TKGC7SWkMQGmq3+0NVBc4XFmWrOB
 2+EjLb5sr9fLyJRPs0YgTgZuYRhRs0XxctR7ZpRfmD4n5VsWsXcNtHvgmwPD93nFniaA gA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cttga922r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 14:05:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8D6F810002A;
 Wed,  8 Dec 2021 14:05:31 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8242B24DE9D;
 Wed,  8 Dec 2021 14:05:31 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 8 Dec 2021 14:05:31
 +0100
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob
 Herring <robh+dt@kernel.org>
Date: Wed, 8 Dec 2021 14:04:53 +0100
Message-ID: <20211208130456.4002-1-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-08_04,2021-12-08_01,2021-12-02_01
Cc: alexandre.torgue@foss.st.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 0/3] Add STM32MP13 EXTI support
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

Enhance stm32-exti driver to support STM32MP13 SoC. This SoC uses the same
hardware version than STM32MP15. Only EXTI line mapping is changed and
following EXTI lines are supported: GPIO, RTC, I2C[1-5], UxART[1-8],
USBH_EHCI, USBH_OHCI, USB_OTG, LPTIM[1-5], ETH[1-2].

regards
Alex

Alexandre Torgue (3):
  dt-bindings: interrupt-controller: stm32-exti: document
    st,stm32mp13-exti
  irqchip/stm32-exti: add STM32MP13 support
  ARM: dts: stm32: Enable EXTI on stm32mp13

 .../interrupt-controller/st,stm32-exti.yaml   |  1 +
 arch/arm/boot/dts/stm32mp131.dtsi             |  7 +++
 drivers/irqchip/irq-stm32-exti.c              | 50 +++++++++++++++++++
 3 files changed, 58 insertions(+)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
