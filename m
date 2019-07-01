Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1445B694
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jul 2019 10:15:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E54BD2686F
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jul 2019 08:15:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0971FD2686A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jul 2019 08:15:15 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x618CiNV016226; Mon, 1 Jul 2019 10:14:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=hFwLxNltwxLPb7ENYweaemIXvQCfpR8maLmH6iPD0zc=;
 b=lYFRMiACJlg8tAf3KRmNIm/mkd2Juy85VeyEwdJ5oG1eXZy+z6LNV5/iMZdUQVuxw0Vm
 V4sOxi8s41OX/D27ZLAkk9nHe71A6vbvd89cSO++VpwrZvGHtustTFL4rNcffIoekLxw
 l8Gm2OZK80o1s/OEQ79r4paEtrJbfnqdGdR6agMJ339v7irgX89Db+6jiLEfVW4VKCoO
 1qls3Zi/h9Swd0w7Yf9/5iBnVqlR3m7GS+wVSvL96S0tF6MZ9CS/M0QLhL0Il7zxuK7O
 FfA39gYW4L7RTfWyRs7nCkoHXWwth9q42y0vuqoe4TT+D1A+ebcuFe3pKFVruXUDoQsB Gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tdwf0kn6f-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 01 Jul 2019 10:14:35 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BB55043;
 Mon,  1 Jul 2019 08:14:33 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 921D4191D;
 Mon,  1 Jul 2019 08:14:33 +0000 (GMT)
Received: from localhost (10.75.127.49) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 1 Jul 2019 10:14:33 +0200
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <alexandre.torgue@st.com>
Date: Mon, 1 Jul 2019 10:14:21 +0200
Message-ID: <1561968865-22037-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-01_06:, , signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/4] regulator: add support for the STM32
	ADC booster
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

Changes in v2:
- rebase on top of for-next branch

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
