Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7891429D0B3
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Oct 2020 16:29:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37BF8C3FADA;
	Wed, 28 Oct 2020 15:29:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 798BCC36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Oct 2020 15:29:14 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09SFQuWO000892; Wed, 28 Oct 2020 16:28:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : subject : to : cc
 : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=PqMaZZVlKTaaHH0y2l86SRNS6hwuqKkdTjLNWRBK0aY=;
 b=y9uGofYaaistuRRmGKNcMAuCFUTQxm1+YpJGLJ++zPNnki/RE+TIM7Wvkk8q+74KKSsm
 een8cz2gokbWDiyZllnaNlrz2KExO98jrFowQa2w2cgv/003UV1WgvQ9g1uE97DQcsNo
 OvgSMRj5UoADiUdjq8bN5+9It6hDj9EK9mR52LEzC7rdfjRX5QOuGLWg0+6WqjBGW044
 gLfelQ5yo6VQzLl9Z5R51RAJ5WZ8X44+G+idZAKIKHKrPAxDsBF+n9ssMQG/eyiFebhH
 V09pxaHJKA4MBGz2I11FNMnHJISTmqNnxyybRjTf0suB9EibdwwLPMqQ7UScRAjueogL ZA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34ccf3te5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 16:28:57 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 006B810002A;
 Wed, 28 Oct 2020 16:28:56 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CA1F1255D01;
 Wed, 28 Oct 2020 16:28:56 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.49) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 28 Oct
 2020 16:28:56 +0100
From: Alexandre Torgue <alexandre.torgue@st.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin
 Hilman <khilman@baylibre.com>, SoC Team <soc@kernel.org>, arm-soc
 <arm@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>, Ahmad Fatoum
 <a.fatoum@pengutronix.de>, Marek Vasut <marex@denx.de>
Message-ID: <4ac236b3-b980-f653-f644-53e586570724@st.com>
Date: Wed, 28 Oct 2020 16:28:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-28_07:2020-10-28,
 2020-10-28 signatures=0
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: [Linux-stm32] [GIT PULL] STM32 DT fixes for v5.10 #1
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

On v5.10-rc1 STM32 boards cannot boot. It is linked to a change in 
regulator framework which highlights that our supplies are not well 
described. This PR fixes it for STM32 boards that I have on my desk: ED1 
and DKx.

I assume that same patch has to be done for other STM32 boards, but as I 
don't have schematics I can't provide it. So a round2 has to be done for:
- stinger96
- MC-1
- Odyssey SOM
- DHCOR /DHCOM

Mani, Marek, Ahmad, Marcin can you please have a look on it and provide 
patches (then I'll provide round2). Thanks in advance.


Regards
Alex


The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v5.10-fixes-1

for you to fetch changes up to 728a7e225ad807b4b4de3be3fb653424199f8a76:

   ARM: dts: stm32: Describe Vin power supply on stm32mp157c-edx board 
(2020-10-28 15:08:24 +0100)

----------------------------------------------------------------
STM32 DT fixes for v5.10, round 1

Highlights:
-----------

  -On STM32MP157 DK & ED boards: Add Vin supply description to avoid
   random kernel crash due to vref_ddr regulator issue.

----------------------------------------------------------------
Pascal Paillet (2):
       ARM: dts: stm32: Describe Vin power supply on stm32mp15xx-dkx board
       ARM: dts: stm32: Describe Vin power supply on stm32mp157c-edx board

  arch/arm/boot/dts/stm32mp157c-ed1.dts  | 15 +++++++++++++++
  arch/arm/boot/dts/stm32mp15xx-dkx.dtsi | 17 +++++++++++++++++
  2 files changed, 32 insertions(+)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
