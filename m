Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 120254AC477
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Feb 2022 16:55:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD8F9C60465;
	Mon,  7 Feb 2022 15:55:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92720C60460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Feb 2022 15:55:39 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 213ETuTu031139;
 Thu, 3 Feb 2022 18:16:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=TKIA8solX6AXS+UL0s0pv/PZH7DNrdl6t5DJPlGj+18=;
 b=oM6zlwo5yH+NR+YaJ/QzGE2A5Clxi9atZ4IDoohx3OWYXj5CT39kE52EDVvJzbgaEx7g
 LDfHVIJm8OjK+WQF3GUwGhn5p7Y6lTO2Ndp5s/Gocg10trv+esjpi2tGtQej/EeQOAPh
 IT38uO9+/jyfQ0BAWLGyxjOqGT40Cb6Ea1Rqx4HQVP7LogAY/6SO9PGQj5iuxJw+iOSV
 iTSqxyqc0JtB7QYR3Y3S1n0TdFVPRqF91r78M9oNM5VE1FqcT+VqOyGBdzPnYvj9rVbp
 cv3BpxSmxpXJuvCDAppW/oMnQL9XBtWP9HpbteTvaCXohjuh7w+JEdUu0VQhKjNiL0nX Pg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e01qkcyyq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 18:16:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D4AC110002A;
 Thu,  3 Feb 2022 18:16:47 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CC9FA22F7AB;
 Thu,  3 Feb 2022 18:16:47 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 3 Feb 2022 18:16:47
 +0100
From: Erwan Le Ray <erwan.leray@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 3 Feb 2022 18:16:42 +0100
Message-ID: <20220203171644.12231-1-erwan.leray@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_06,2022-02-03_01,2021-12-02_01
Cc: linux-serial@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Gerald Baeza <gerald.baeza@st.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2] STM32 enable gpio irqs as wakeup irqs for
	uart port
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

This patchset allows to use mctrl_gpio pins as wakeup source.
Add a new API to enable / disable wake_irq for serial mctrl_gpio pins.
Use this API in STM32 usart driver to enable / disable mctrl_gpio pins
wake_irq in suspend / resume procedure.

Erwan Le Ray (2):
  serial: mctrl_gpio: add a new API to enable / disable wake_irq
  serial: stm32: enable / disable wake irqs for mcrtl_gpio wakeup
    sources

 drivers/tty/serial/serial_mctrl_gpio.c | 38 ++++++++++++++++++++++++++
 drivers/tty/serial/serial_mctrl_gpio.h | 18 ++++++++++++
 drivers/tty/serial/stm32-usart.c       |  3 +-
 3 files changed, 58 insertions(+), 1 deletion(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
