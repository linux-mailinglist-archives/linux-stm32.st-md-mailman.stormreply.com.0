Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC80466E183
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Jan 2023 15:58:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80223C65E45;
	Tue, 17 Jan 2023 14:58:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AEE52C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Jan 2023 14:58:32 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30HDJpvZ013254; Tue, 17 Jan 2023 15:58:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=selector1;
 bh=i0f9H0o1PTwLSWnVG5Id0wgZka+r1gH8QtJHFE8DAlg=;
 b=Z88Z8M4wF7E/ncIdaIH/HG1VcctbXPlaLUvjmag8rIIyO8f/z7YMazOHHiBua4Ws/B7x
 DKKNfIW33MlbZGtmYIlVzmNoKru93jbg0faFvHGwXiR98B4ig2pORfqzfkj5LZvcIno1
 oVwOFkEWTHUyxRm0b9/tgWdkkMrxZ/q1kedX6uFvsoMB1F7oIh4zOhadhMBtLbg+Yy23
 2Z6g58LmQugZUVN23vcrakm0CZn8xNjV0DvHQpgiZej9NdvBjZE9016YikY8Zp2VxpUK
 k2NBNmG025rKCv+Y80kL06zS9eu+9bgVO3IzTjk9r49CZ3LTPKTsRm2o9YRCtlg90uFV FQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3n5mc4kqxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 15:58:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 24C4910002A;
 Tue, 17 Jan 2023 15:58:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CC3C521B50E;
 Tue, 17 Jan 2023 15:58:06 +0100 (CET)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 17 Jan
 2023 15:58:06 +0100
Message-ID: <3fe26bf9-297b-5c78-682b-37fa6d8b6190@foss.st.com>
Date: Tue, 17 Jan 2023 15:58:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin
 Hilman <khilman@baylibre.com>, arm-soc <arm@kernel.org>, SoC Team
 <soc@kernel.org>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_06,2023-01-17_01,2022-06-22_01
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: [Linux-stm32] [GIT PULL] STM32 DT fixes for v6.2 #1
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

Hi ARM SoC maintainers,

Please consider this first round of STM32 DT fixes for v6.2 cycle.

Thanks
Alex

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v6.2-fixes-1

for you to fetch changes up to 175281f80695569c7f9cf062e5d0ddc4addc109f:

   ARM: dts: stm32: Fix qspi pinctrl phandle for stm32mp151a-prtt1l 
(2023-01-17 14:48:44 +0100)

----------------------------------------------------------------
STM32 DT fixes for v6.2, round 1

Highlights:
-----------

  -STM32MP15:
   - Fix missing chip select phandle in several stm32mp15x based boards.

----------------------------------------------------------------
Patrice Chotard (4):
       ARM: dts: stm32: Fix qspi pinctrl phandle for stm32mp15xx-dhcor-som
       ARM: dts: stm32: Fix qspi pinctrl phandle for stm32mp15xx-dhcom-som
       ARM: dts: stm32: Fix qspi pinctrl phandle for 
stm32mp157c-emstamp-argon
       ARM: dts: stm32: Fix qspi pinctrl phandle for stm32mp151a-prtt1l

  arch/arm/boot/dts/stm32mp151a-prtt1l.dtsi        | 8 ++++++--
  arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi | 8 ++++++--
  arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi     | 8 ++++++--
  arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi     | 8 ++++++--
  4 files changed, 24 insertions(+), 8 deletions(-)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
