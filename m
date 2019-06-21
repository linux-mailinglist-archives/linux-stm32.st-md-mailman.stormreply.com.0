Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D184EB14
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2019 16:50:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60A62C10CB5
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2019 14:50:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A54CC10CB4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 14:50:53 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LEbCh7025330; Fri, 21 Jun 2019 16:50:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=HJ0CqY8bW91EX2SWPcZ15rMKds2BBP88CmgxAnUANf4=;
 b=k2RLRaZLXke5j7JsPj6TviyqvKK/1JGgzJJgk7D9i5hDYpiUCU0KM/MYd92FL/CPCVIx
 PhBoQRMc92hhBJ8vAquwmJHnX2eFd5XeE65QPa2CrUMQzNOpndLzG5iMlGJZfpLgpRbY
 8tOK11PkZ5GXkr1eLs2D+XYMHzoiQB5ycRyVetVhLMMptA/oJkS+xGFg/GmtmbzZ7yxK
 8tRSipbt9EMY1eb8AVgiYHqvhkHWKiYK1I1g3Q1t7LHBHQRP7tNuQVl69Y4JmkpkMZEd
 6pfM0ipmCgYiJanmnOpdaiiHcpVdXW5Uo+N3KDB/26i0h2K3Vy+UFkMqtbNB5W0/Ac9k HA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t7wxssnyu-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 16:50:36 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 569C53A;
 Fri, 21 Jun 2019 14:50:36 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2B1232BD7;
 Fri, 21 Jun 2019 14:50:36 +0000 (GMT)
Received: from localhost (10.75.127.49) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Fri, 21 Jun 2019 16:50:35 +0200
From: Christophe Kerello <christophe.kerello@st.com>
To: <robh+dt@kernel.org>, <mark.rutland@arm.com>, <alexandre.torgue@st.com>,
 <linux@armlinux.org.uk>, <olof@lixom.net>, <arnd@arndb.de>
Date: Fri, 21 Jun 2019 16:49:46 +0200
Message-ID: <1561128590-14621-1-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_10:, , signatures=0
Cc: devicetree@vger.kernel.org, Christophe Kerello <christophe.kerello@st.com>,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/4] ARM: dts: stm32: enable FMC2 NAND
	controller on stm32mp157c-ev1
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

This patchset adds and enables FMC2 NAND controller used on
stm32mp157c-ev1.

Christophe Kerello (4):
  ARM: dts: stm32: add FMC2 NAND controller support on stm32mp157c
  ARM: dts: stm32: add FMC2 NAND controller pins muxing on
    stm32mp157c-ev1
  ARM: dts: stm32: enable FMC2 NAND controller on stm32mp157c-ev1
  ARM: multi_v7_defconfig: add FMC2 NAND  controller support

 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 44 +++++++++++++++++++++++++++++++
 arch/arm/boot/dts/stm32mp157c-ev1.dts     | 16 +++++++++++
 arch/arm/boot/dts/stm32mp157c.dtsi        | 19 +++++++++++++
 arch/arm/configs/multi_v7_defconfig       |  1 +
 4 files changed, 80 insertions(+)

-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
