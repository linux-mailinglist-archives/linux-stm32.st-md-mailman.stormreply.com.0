Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B124C595A9
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jun 2019 10:08:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60414C1634D;
	Fri, 28 Jun 2019 08:08:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0E39C16349
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2019 08:08:28 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5S86bL9020381; Fri, 28 Jun 2019 10:08:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=OkJkWdO3ZoRZHiMztQUd9Pc0c3rpuXyKwA33SFtPdis=;
 b=xMZPk79Nw36AwFGsijRPGGVDagkAqM4WO+0RiHwIGMHiIqaZjqsAKo3y9N5X0uPR2Ogs
 FdXLh7nt5Xivm/T0Ugd3M1eBy6XCczmS+cSngYs+FFM3A+X9nw2gSAgLf6/3DInv7Phs
 c2QI/TTpDnVM3wH/bBu/wTIYUU+0h5aoQe8DBDV/Aaotb52iQObeqNUSEZitstXzvjIj
 amzsL6YfcM4T8MjYoeoQwFBfv5rTQxRpCnqT9JunHoZ+N3jaKkzl30YNkY5RU/1NYs8y
 CqX2qjsJw+bmoYwo96rtICsd2SPkyxGs9tJ8V/kYoM/RcceIjknW3gYM+RzuuRc5PBOj fA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t9d2gvcwq-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 28 Jun 2019 10:08:15 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7149431;
 Fri, 28 Jun 2019 08:08:14 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 51A6616AF;
 Fri, 28 Jun 2019 08:08:14 +0000 (GMT)
Received: from localhost (10.75.127.47) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 28 Jun 2019 10:08:13 +0200
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <alexandre.torgue@st.com>
Date: Fri, 28 Jun 2019 10:08:05 +0200
Message-ID: <1561709289-11174-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-28_03:, , signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/4] regulator: add support for the STM32 ADC
	booster
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

Add support for the 3.3V booster regulator embedded in stm32h7 and stm32mp1
devices, that can be used to supply ADC analog input switches.
It's useful to reach full ADC performance when their supply is below 2.7V
(vdda by default).

Fabrice Gasnier (4):
  dt-bindings: regulator: add support for the stm32-booster
  regulator: add support for the stm32-booster
  ARM: multi_v7_defconfig: enable STM32 booster regulator
  ARM: dts: stm32: add booster for ADC analog switches on stm32mp157c

 .../bindings/regulator/st,stm32-booster.txt        |  18 +++
 arch/arm/boot/dts/stm32mp157c.dtsi                 |   6 +
 arch/arm/configs/multi_v7_defconfig                |   1 +
 drivers/regulator/Kconfig                          |  11 ++
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/stm32-booster.c                  | 132 +++++++++++++++++++++
 6 files changed, 169 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/st,stm32-booster.txt
 create mode 100644 drivers/regulator/stm32-booster.c

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
