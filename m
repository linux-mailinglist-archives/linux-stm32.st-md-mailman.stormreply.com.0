Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A0525D98F
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Sep 2020 15:23:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CBB9C3FADF;
	Fri,  4 Sep 2020 13:23:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D283C3FAD8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Sep 2020 13:23:13 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 084DMWMg007079; Fri, 4 Sep 2020 15:23:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=7fozBuXU3Cbd4IFH/r62M8Ur8q8NxDDJWRTMXFRdk9g=;
 b=B/uuqjBhphDFCBQDV0YZoyLJb26WBFQ7nuxgfZcET3bLpTQmOe16OKEnlmANxUp2XYfv
 pQY0xw9iUPHzvgOVB3Z19Mu7cFt1cir8jRp5JPswQQC+F4VK7Z/yhR5Ir9YCp1NjTwDL
 9GBkMmUGUQHWrN1520J2qkUOOOqYnDXd0JALna2iDWmZLP9CQvuLj8pGcR/CwDnQ8QxB
 3eSWYMl13z7TSUERhjQ+bbVkK0OUWSFvPp6KrLyccvYlMBeFLXOb9pjUImlS/1RCd4Do
 +XZEcuVabiv0P5dld/kwoz6vfJasT8GHYaxV5LP2JNiwXgq1IWkOzPGixZCl5L+SwLvT kA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 337dwhsvhc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Sep 2020 15:23:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 90C4410002A;
 Fri,  4 Sep 2020 15:22:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 76B172AD2B4;
 Fri,  4 Sep 2020 15:22:59 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 4 Sep 2020 15:22:59 +0200
From: Christophe Kerello <christophe.kerello@st.com>
To: <robh+dt@kernel.org>, <alexandre.torgue@st.com>, <linux@armlinux.org.uk>
Date: Fri, 4 Sep 2020 15:20:41 +0200
Message-ID: <1599225643-5558-1-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-04_07:2020-09-04,
 2020-09-04 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/2] add FMC2 EBI controller support
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

This patchset enables FMC2 EBI support on STM32MP1 SOCs.

Christophe Kerello (2):
  ARM: multi_v7_defconfig: add FMC2 EBI controller support
  ARM: dts: stm32: add FMC2 EBI support for stm32mp157c

 arch/arm/boot/dts/stm32mp151.dtsi     | 43 +++++++++++++++++++++++------------
 arch/arm/boot/dts/stm32mp157c-ev1.dts | 16 +++++++------
 arch/arm/configs/multi_v7_defconfig   |  1 +
 3 files changed, 39 insertions(+), 21 deletions(-)

-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
