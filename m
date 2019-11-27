Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 666F010AE0E
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Nov 2019 11:46:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19616C36B0B;
	Wed, 27 Nov 2019 10:46:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF6E3C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 10:46:16 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xARAgL7E002710; Wed, 27 Nov 2019 11:46:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=AfM+ZEMb0CjRpx4WonEZ50fg5isv/g8XPgB1p+eqsd4=;
 b=E7pjnlJQo5I+OUI5agfXbT8pqNABXyQBlEo0IsEo9o7hmnKoy40vHSxIHuTxCPiyb3ET
 MK3zXfj1z+n+zf72KoOt7ETcMjYNb09GiUVnbzQW/nzRiTV02M51fc7prxiu1hBzabPO
 imnSjp6FD7ypRBQhH6kWlbQV8f1zjkZjIqJXIMF1MxUED10Rz9l7P9u0nuFXqAtO0JJZ
 UWamJ4at5N6IPPzFGa/cIoXht/v7apQkv0i/VcfUg084YRlc4X6jZo/5hgrhTaY0Owd9
 hxfCtwMq0urikkPuMStsxXHu/vOrcrr2PxilaxYMxDj512WSVbnlWZFp/aYg9tiOp2Ur fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2whcxj3269-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2019 11:46:02 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 14F4810002A;
 Wed, 27 Nov 2019 11:46:02 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EF7EF2B242E;
 Wed, 27 Nov 2019 11:46:01 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 27 Nov 2019 11:46:01
 +0100
From: Alain Volmat <alain.volmat@st.com>
To: <wsa@the-dreams.de>, <robh+dt@kernel.org>
Date: Wed, 27 Nov 2019 11:46:01 +0100
Message-ID: <1574851561-25501-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_02:2019-11-27,2019-11-27 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/4] stm32: i2c: Add suspend/resume & add
	sleep pinctrls
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

This small series add missing sleep pinctrl in boards device-tree including
i2c-stm32f7 nodes.
The driver is also enhanced to add support for PM_SLEEP suspend/resume.

Alain Volmat (4):
  ARM: dts: stm32: add i2c4 sleep pinctrl on stm32mp157a-dk1
  ARM: dts: stm32: add i2c4 sleep pinctrl on stm32mp157c-ed1
  ARM: dts: stm32: add i2c2/i2c5 sleep pinctrl on stm32mp157c-ev1
  i2c: i2c-stm32f7: add PM_SLEEP suspend/resume support

 arch/arm/boot/dts/stm32mp157a-dk1.dts |   3 +-
 arch/arm/boot/dts/stm32mp157c-ed1.dts |   3 +-
 arch/arm/boot/dts/stm32mp157c-ev1.dts |   6 +-
 drivers/i2c/busses/i2c-stm32f7.c      | 118 ++++++++++++++++++++++++++++++++--
 4 files changed, 119 insertions(+), 8 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
