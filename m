Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18893354DBB
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Apr 2021 09:21:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D295AC57B6D;
	Tue,  6 Apr 2021 07:21:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 514D5C5718B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Apr 2021 07:21:41 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1367H7Fc007447; Tue, 6 Apr 2021 09:21:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=98McyI4svfF5KndUNWGyXXAvHiKV60OEgW91gDPLjCE=;
 b=RN6N+EPtFLJuKAQRtc/wR7QIUYLt8hkTSY8blMcCRjPnfkuwYnOuHuELDcpqOH1fRFWe
 0Qg+5vRO7LBP0pfqGn8I4G/k5xHZDDC6SVoyAQhjIE/rC6KVchnDW3TKShMNHzMTAxoH
 LZ/ELilmRj92sdi9sehyQWxgRKYFsMbEVFMHm2Kd4Ktd1KkHWh/9PdcRuVRUuWZCehiN
 B6JMWwK6MFDLbB84EkXKXdkKIy7Z+EYSyz5wdEBWrIdWPjmXbgdRutmX18GlGnetulLN
 1wswdiY+Cczjam9dk2DZYtyW8upvrCUys8viCiqa3z/S3d6VB2ABqguGBz7zXQmVj1T2 GA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37r6u731ws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 09:21:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 845B810002A;
 Tue,  6 Apr 2021 09:21:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 707C121E66A;
 Tue,  6 Apr 2021 09:21:26 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 6 Apr 2021 09:21:26
 +0200
From: Erwan Le Ray <erwan.leray@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 6 Apr 2021 09:21:20 +0200
Message-ID: <20210406072122.27384-1-erwan.leray@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-06_01:2021-04-01,
 2021-04-06 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2] stm32 usart add fifo threshold
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

This series adds the support for two optional DT properties, to configure
RX and TX FIFO thresholds:
 - st,rx-fifo-threshold-bytes
 - st,tx-fifo-threshold-bytes
This replaces hard-coded 8 bytes threshold. No functional change expected
if unspecified (keep 8 as default).

Erwan Le Ray (1):
  dt-bindings: serial: stm32: add fifo threshold configuration

Fabrice Gasnier (1):
  serial: stm32: add fifo threshold configuration

 .../bindings/serial/st,stm32-uart.yaml        | 31 ++++++++++-
 drivers/tty/serial/stm32-usart.c              | 53 ++++++++++++++++---
 drivers/tty/serial/stm32-usart.h              |  8 +--
 3 files changed, 79 insertions(+), 13 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
