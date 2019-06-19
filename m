Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 871144B86B
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 14:31:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D05DC55183
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 12:31:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 214DEC5451D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 12:31:17 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5JCQNaU013623; Wed, 19 Jun 2019 14:30:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=VBdmw2B8JzIwHBf2DCzNhNhp/wewpseJ6FglA41KzDA=;
 b=HBwMhu88MDRfMzdTNuZfO7msKon03r30NvVEq2joa3SpqyF6u1Ahr7V9dClcMxhDJM+B
 A7qZQcbSgM6+aTpoCbJYmW3jWzqRmVRQjhk0pb8H/tcGYHulHlQtUarS0QZ/PO7F+CkC
 2E0oJwOUFujNxMUDTHXAKZD5O9758tLWN/GM4QhvojMXNyJp8qdBN1cECDIU/Lc2/hwq
 pFUSHe1weWajs/n7EHdyK18bIggS0X7ZXyoBTNQ8wqMKJDtDkT37Yo4IYo8ITP3T/LIy
 6RrDh29JksY8qR0EbBK1lvR6Jr1igmQSkGjGq/2lQGCnNbZ/CEjtkKi662oRKpshO82i ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t781uux8d-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 19 Jun 2019 14:30:52 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C468938;
 Wed, 19 Jun 2019 12:30:51 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 91CE227A7;
 Wed, 19 Jun 2019 12:30:51 +0000 (GMT)
Received: from localhost (10.75.127.47) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 19 Jun 2019 14:30:51 +0200
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <jic23@kernel.org>, <robh+dt@kernel.org>, <alexandre.torgue@st.com>
Date: Wed, 19 Jun 2019 14:29:53 +0200
Message-ID: <1560947398-11592-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_07:, , signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 mcoquelin.stm32@gmail.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, pmeerw@pmeerw.net, knaack.h@gmx.de,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/5] Add missing vdda-supply to STM32 ADC
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

Add missing vdda-supply, analog power supply, to STM32 ADC. When vdda is
an independent supply, it needs to be properly turned on or off to supply
the ADC.
This series proposes fixes for the dt-bindings, IIO driver and relevant
device tree files.

Fabrice Gasnier (5):
  dt-bindings: iio: adc: stm32: add missing vdda supply
  iio: adc: stm32-adc: add missing vdda-supply
  ARM: dts: stm32: remove fixed regulator unit address on stm32429i-eval
  ARM: dts: stm32: add missing vdda-supply to adc on stm32429i-eval
  ARM: dts: stm32: add missing vdda-supply to adc on stm32h743i-eval

 .../devicetree/bindings/iio/adc/st,stm32-adc.txt   |  1 +
 arch/arm/boot/dts/stm32429i-eval.dts               | 25 +++++++++++-----------
 arch/arm/boot/dts/stm32h743i-eval.dts              |  1 +
 drivers/iio/adc/stm32-adc-core.c                   | 21 +++++++++++++++++-
 4 files changed, 35 insertions(+), 13 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
