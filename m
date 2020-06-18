Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 297081FF2A2
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jun 2020 15:07:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7CEAC36B0D;
	Thu, 18 Jun 2020 13:07:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BE87C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jun 2020 13:07:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05ID2ZVd030156; Thu, 18 Jun 2020 15:07:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=8ffjSa1WBrW1OVyG9ClDZn5fyYDO6RsbX3ADHi53fhU=;
 b=s1m/o/mkC+rtXapEsEMy6XitXk0X4Rw7fZ4xISMw/A3QuhT+G0EoZiewQJXRhdPcw7Qw
 JO4dqSi5wxxmOSftJMxZ7PfA0VlqnFy7sIKhiJN7L8pBXEPhQ83k9kNIC1xbxg7Yt8dz
 IebUJ4YDYmSAmsEYyhBjG+weAVHSAlD/frSxrhH61VN3pANhlEOEjjoqqwERhxsvsQB6
 ZF22HaSJy5NyHDBSf8ZMloLf5IzPWLfI112Flp3eZXU9WZfL5s30sQ6xmzetsaKMev5E
 y7SftYRXIB4YdLhjqryOxxWg2CNIJL5N7v7ZqJfhjaDKBxhweFnUbUVz8ZFPtZ1ZpxMC sA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31q64cb3fd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 15:07:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0BA3310002A;
 Thu, 18 Jun 2020 15:06:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E95052AAA6C;
 Thu, 18 Jun 2020 15:06:58 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 18 Jun 2020 15:06:58
 +0200
From: Erwan Le Ray <erwan.leray@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>
Date: Thu, 18 Jun 2020 15:06:46 +0200
Message-ID: <20200618130651.29836-1-erwan.leray@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-18_12:2020-06-18,
 2020-06-18 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 0/5] STM32 add usart nodes support
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

Add the support of uart instances available on STM32MP157 boards:
- usart3 on stm32mp157c-ev1, stm32mp157a-dk1, and stm32mp157c-dk2
- uart7 on stm32mp157a-dk1 and stm32mp157c-dk2
- usart2 on stm32mp157c-dk2

Erwan Le Ray (5):
  ARM: dts: stm32: add usart2, usart3 and uart7 pins in
    stm32mp15-pinctrl
  ARM: dts: stm32: add usart3 node to stm32mp15xx-dkx boards
  ARM: dts: stm32: add usart3 node to stm32mp157c-ev1
  ARM: dts: stm32: add uart7 support to stm32mp15xx-dkx boards
  ARM: dts: stm32: add usart2 node to stm32mp157c-dk2

 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 138 +++++++++++++++++++++++
 arch/arm/boot/dts/stm32mp157a-dk1.dts    |   2 +
 arch/arm/boot/dts/stm32mp157c-dk2.dts    |  11 ++
 arch/arm/boot/dts/stm32mp157c-ev1.dts    |  15 +++
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi   |  17 +++
 5 files changed, 183 insertions(+)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
