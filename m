Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B30413A95A
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2020 13:33:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C85AC36B0D;
	Tue, 14 Jan 2020 12:33:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2A14C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2020 12:33:53 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00ECXGIh004903; Tue, 14 Jan 2020 13:33:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=NtNtpTywFRxlwwiU8XggPJSlwYsAOE1UVCac4kloP4A=;
 b=uGkZEg9TS86fMNjklnyni2wXKhu4WEum5uiTX3h/LPqCmRjhFGbTBf8ldTuM/0gCYqnJ
 VNltSZJWYGrrND67U5bwy0ygRuLxpExhqbQye5AaA8j17Bo84a8s9mlVKLP8bcg0XjEB
 FwN4CO5L+WGRpniYCvoDC7juBizu3u4yEho1ycqWY6PY7edVPJpgaKOTWrcHZUkIVj6F
 s8wiStAt53o2a2yudfTwX7oZrFQfWFSJZZ6CjYctL+QDEnjZDkMzYE0Op5e2s2lGfB5v
 fTK4cIecG3AT4Nvhj4MI3Es8Pf9B445WKMSENRMzhNakP74/qCKKaXwT2sZumxwuY7rs Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xf78s5f01-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jan 2020 13:33:38 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6B3B0100039;
 Tue, 14 Jan 2020 13:33:33 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 507582AD9EB;
 Tue, 14 Jan 2020 13:33:33 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 14 Jan 2020 13:33:33
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
Date: Tue, 14 Jan 2020 13:33:27 +0100
Message-ID: <20200114123329.3792-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-14_03:2020-01-13,
 2020-01-14 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2] Convert STM32 UART bindings to yaml
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

The goal of this series is to convert STM32 UART bindings to json-schema.
Since STM32 UART bindings use rs485 bindings it is also the opportunity
to convert them to json-schema.

Benjamin Gaignard (2):
  dt-bindings: serial: Convert rs485 bindings to json-schema
  dt-bindings: serial: Convert STM32 UART to json-schema

 Documentation/devicetree/bindings/serial/rs485.txt | 32 +--------
 .../devicetree/bindings/serial/rs485.yaml          | 45 ++++++++++++
 .../devicetree/bindings/serial/st,stm32-uart.yaml  | 80 ++++++++++++++++++++++
 .../devicetree/bindings/serial/st,stm32-usart.txt  | 57 ---------------
 4 files changed, 126 insertions(+), 88 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/serial/rs485.yaml
 create mode 100644 Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
 delete mode 100644 Documentation/devicetree/bindings/serial/st,stm32-usart.txt

-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
