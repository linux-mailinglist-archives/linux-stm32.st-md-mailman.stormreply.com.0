Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1431835E528
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Apr 2021 19:40:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C70C7C58D58;
	Tue, 13 Apr 2021 17:40:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D6DCC57B79
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Apr 2021 17:40:35 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DHWLTQ025271; Tue, 13 Apr 2021 19:40:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=pZ9s/N4lfu05HqEWvS2/jUO/gf8ZaUn/1iPWaeBL6gE=;
 b=uRcjaPdUe34wNzIXpnwi73magRFgB096RjbKGaaJzULmjXgXJSdEBGdqsoLQ9azelkov
 hI1h/slpMONIc14wLAa6f6iwikByOLFuNubPl9/sCnGCwIPKMXkj2vRhH/UdKeuq/B4I
 aQBA+K9t5nAeZsuGqnB3DbNheTn6x8D1/Hk7jrjieZu22oPcFHTll5c7lqpRRO1frmjH
 q8fFqIXNK4vQSphrlKd1yoXl27mftv8MPTzMeKmIpAXozbX4QEVHWQRyedpAOEtruHgB
 mNRsoUG159HuD1iW9ViW1rpA2wPA/LSrHioZcUYw+KxrRVPCazydwzm5mzd8P6YDGRyJ MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37w3mbv1ar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 19:40:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 75C9810002A;
 Tue, 13 Apr 2021 19:40:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 63CA92159E9;
 Tue, 13 Apr 2021 19:40:20 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 13 Apr 2021 19:40:19
 +0200
From: Erwan Le Ray <erwan.leray@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 13 Apr 2021 19:40:11 +0200
Message-ID: <20210413174015.23011-1-erwan.leray@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_12:2021-04-13,
 2021-04-13 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/4] stm32 usart add fifo threshold
	configuration
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

This series adds the support for two optional DT properties to configure
RX and TX FIFO thresholds:
 - rx-threshold
 - tx-threshold
This replaces hard-coded 8 bytes threshold. No functional change expected
if unspecified (keep 8 as default).

Changes in v2:
Change added properties naming and factorize it in serial.yaml as proposed
by Rob Herring. 

Erwan Le Ray (3):
  dt-bindings: serial: add RX and TX FIFO properties
  dt-bindings: serial: stm32: override FIFO threshold properties
  dt-bindings: serial: 8250: update TX FIFO trigger level

Fabrice Gasnier (1):
  serial: stm32: add FIFO threshold configuration

 .../devicetree/bindings/serial/8250.yaml      |  1 -
 .../devicetree/bindings/serial/serial.yaml    | 10 ++++
 .../bindings/serial/st,stm32-uart.yaml        | 27 +++++++++-
 drivers/tty/serial/stm32-usart.c              | 53 ++++++++++++++++---
 drivers/tty/serial/stm32-usart.h              |  8 +--
 5 files changed, 85 insertions(+), 14 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
