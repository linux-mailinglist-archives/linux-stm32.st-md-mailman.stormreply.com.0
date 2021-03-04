Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9A332D78C
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Mar 2021 17:23:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A884C57B7C;
	Thu,  4 Mar 2021 16:23:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A38B0C57B75
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Mar 2021 16:23:23 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 124GC7h1021044; Thu, 4 Mar 2021 17:23:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=lnJmncdKhm8n4sa+Kk8o9wrMO4GjhYYAQDF83lOvOVg=;
 b=7MD43yeq6IAfOw3ObYTT7RUss2O4qSgCOx5L/rAEtctIE+gL+KrtpRF203jgtmxmLsDT
 /u5UrRX/NkS8AJImFNsDTTT9ZAqlrPeLdi0R/kaD6WLEsuhmuL5Qe6TG1VeQGB/W1Kbn
 CDOQAo2BAgh5G9euIG+9ZNItCtrvigfLL5o5UzJt2C8L170egXJ2rlqz4WQHF+O1jTfN
 HNqk3EAhyH3i5os6fel/CSV+ceeyXgVEsd5qrJpIl6cg3SRyfqYVqhup59ta7rYdfftq
 p7L+7y5lMI2OgIbPi8yzX3KHJyTXLS4nssFm0V6R+8ykXFbXdDqNqPqcsdaUkXZP3adn vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36yfc48j8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Mar 2021 17:23:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E447D10002A;
 Thu,  4 Mar 2021 17:23:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D167020741B;
 Thu,  4 Mar 2021 17:23:11 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Mar 2021 17:23:11
 +0100
From: Erwan Le Ray <erwan.leray@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 4 Mar 2021 17:22:55 +0100
Message-ID: <20210304162308.8984-1-erwan.leray@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-04_05:2021-03-03,
 2021-03-04 signatures=0
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 00/13] stm32 usart various fixes
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

Changes in v2:
Rebase on latest 5.12-rc1 requested by maintainer because of merge
conflict.

Erwan Le Ray (13):
  serial: stm32: fix probe and remove order for dma
  serial: stm32: fix startup by enabling usart for reception
  serial: stm32: fix incorrect characters on console
  serial: stm32: fix TX and RX FIFO thresholds
  serial: stm32: fix a deadlock condition with wakeup event
  serial: stm32: fix wake-up flag handling
  serial: stm32: fix a deadlock in set_termios
  serial: stm32: fix tx dma completion, release channel
  serial: stm32: call stm32_transmit_chars locked
  serial: stm32: fix FIFO flush in startup and set_termios
  serial: stm32: add FIFO flush when port is closed
  serial: stm32: fix tx_empty condition
  serial: stm32: add support for "flush_buffer" ops

 drivers/tty/serial/stm32-usart.c | 198 +++++++++++++++++++++----------
 drivers/tty/serial/stm32-usart.h |   3 -
 2 files changed, 135 insertions(+), 66 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
