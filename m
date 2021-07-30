Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 363823DB9DD
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jul 2021 15:59:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2745C57B6F;
	Fri, 30 Jul 2021 13:59:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBF18C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jul 2021 13:59:05 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16UDulHZ028639; Fri, 30 Jul 2021 15:58:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=MzQ8oKCDaWhRsIkt9+RoUCYLRwvPQ1J5VN1nlqw5bMc=;
 b=KejYSZ5zYGOU6ukv2YMLt6/gryAGqEkvys3qwFa6OAh7ukNrjKh3Z9Oe8jLYsSlIqnQF
 9Wv6r/Ov5SFm89IZd0iaSLWjiBs/9Q5fs493T5amqRgwICNmbdx12mbBTU05K1oDCge9
 E55nbqUZu+pRZlFjukKdSzEeY3virOFaKlsXW1TmIIdpsVKUJAWWHt1HxxPwgDxcMUdQ
 vWS6gkUJnKff7d8XOx2KC2XpZi+NGj5U1LdekZ4UU8/Qpi4qJql/F5fUUcnZgTrvkLUp
 F5CmKBOBeGvXv0Fc0Da5gjVHFB67/PjXufkRxZ8vbuu13j/jSA5BbWEvFA58q8I871Ue eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a4fvygu6y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jul 2021 15:58:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B636710002A;
 Fri, 30 Jul 2021 15:58:55 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 93A7A23150B;
 Fri, 30 Jul 2021 15:58:55 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 30 Jul
 2021 15:58:54 +0200
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin
 Hilman <khilman@baylibre.com>, SoC Team <soc@kernel.org>, arm-soc
 <arm@kernel.org>
Message-ID: <c0b6031b-2de7-2ef8-71b2-a0af8f475932@foss.st.com>
Date: Fri, 30 Jul 2021 15:58:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-30_05:2021-07-30,
 2021-07-30 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: [Linux-stm32] [GIT PULL] STM32 DT fixes for v5.14 #1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Arnd, Olof and Kevin,

Please consider this first round of STM32 DT fixes for v5.14. It 
concerns DHCOM/DHCOR fixes.

Thanks
Alex


The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v5.14-fixes-1

for you to fetch changes up to 15f68f027ebd961b99a1c420f96ff3838c5e4450:

   ARM: dts: stm32: Fix touchscreen IRQ line assignment on DHCOM 
(2021-07-30 15:34:51 +0200)

----------------------------------------------------------------
STM32 DT fixes for v5.14, round 1

Highlights:
-----------

  -Fixes are for DHCOM/DHCOR boards:
   - Set HW RTC ad default RTC
   - Disable EDPD LAN8710 feature as it is not a stable feature.
   - Fix touchscreen IRQ line assignment

----------------------------------------------------------------
Marek Vasut (3):
       ARM: dts: stm32: Prefer HW RTC on DHCOM SoM
       ARM: dts: stm32: Disable LAN8710 EDPD on DHCOM
       ARM: dts: stm32: Fix touchscreen IRQ line assignment on DHCOM

  arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi | 24 
++++++++++++++----------
  arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi  |  5 ++++-
  2 files changed, 18 insertions(+), 11 deletions(-)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
