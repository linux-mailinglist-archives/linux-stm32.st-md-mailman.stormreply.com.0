Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CF3178C49
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Mar 2020 09:10:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5210C36B0E;
	Wed,  4 Mar 2020 08:10:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30AEEC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Mar 2020 08:10:25 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02487rv0032631; Wed, 4 Mar 2020 09:10:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Ic1C52dxdRVd8hopKHFmxL20NCwaptXElaVaPhP+rUE=;
 b=u6FbvwLMTti9eJsDBmKkvCAdcWlQHcVPaTZQa1CAlCVWbdVsR8z3WQm8rWX5mGHprAzY
 UDheNAzsQerzo9oF26Gt0wPFywt8/XZ8BjXzsvcrApxtZmqQmPxK/jrIIe3XEcf9hYsH
 /i38IKdL5CbjyNHVzaPQgSH4yxBwz7SQB82pKilAtkB+Ci+iO1L3echhIDpDBHE1Btur
 39xwg/rAuASlDHFKre50CDyR4vzHZqNqEtT1DFyp4gfiWDOBlQk1+ovqlN/ksAsZk/Og
 lO+89gvrrYTulefBJICTaWWZliGQqVRxot335MocEGI9kCJh0jP5BxNKQXMJswScNrMS lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yfem0ybx2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Mar 2020 09:10:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 01392100038;
 Wed,  4 Mar 2020 09:10:05 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DF0AC21FE85;
 Wed,  4 Mar 2020 09:10:05 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 4 Mar 2020 09:10:05 +0100
From: Yann Gautier <yann.gautier@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Wed, 4 Mar 2020 09:09:53 +0100
Message-ID: <20200304080956.7699-1-yann.gautier@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-04_01:2020-03-03,
 2020-03-04 signatures=0
Subject: [Linux-stm32] [PATCH 0/3] Update SDMMC nodes on STM32MP1 boards
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

This patchset updates the sdmmc nodes for STM32MP1.
For SD cards nodes, the cd-gpio property is used instead of broken-cd,
and the disable-wp property is added.
The last patch corrects the vqmmc regulator for eMMC on ED1/EV1 boards.

Yann Gautier (3):
  ARM:dts: stm32: add cd-gpios properties for SD-cards on STM32MP1
    boards
  ARM: dts: stm32: add disable-wp property for SD-card on STM32MP1
    boards
  ARM: dts: stm32: use correct vqmmc regu for eMMC on stm32mp1 ED1/EV1
    boards

 arch/arm/boot/dts/stm32mp157a-avenger96.dts | 3 ++-
 arch/arm/boot/dts/stm32mp157c-ed1.dts       | 5 +++--
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi      | 3 ++-
 3 files changed, 7 insertions(+), 4 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
