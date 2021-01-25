Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDEE3027AF
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Jan 2021 17:22:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC229C5663B;
	Mon, 25 Jan 2021 16:22:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 015BDC36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Jan 2021 16:22:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10PGLvT4018304; Mon, 25 Jan 2021 17:21:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=to : cc : from :
 subject : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=r5v0keWguisfnI56Tic9HGrT2U4F4xL64Njgu4tlmVI=;
 b=qAcyUUEFj2NRsLP0H3PuuFqvES9uHDtfxIC6p3I3JTaqskfzHZfy5QthmlU2AjPnC/8m
 QDNVlVgDHD4elEOPZudQxGey56A9+bX5hUpfS2NyRfHsnwdyQLshUCTXLHKCrHSzymRt
 l+wgXJgBUgT/IozQSA+U/UIDDMOnIW8neptbITs56yd2uKaPdGGfbMDHGuP4OgwtbJOZ
 nT7QnFrJph3LAE7a8Nfo5KnizyJn/ZEeMYHJ2hd4DArEWVfZz1M/locM5rBz0AgDt3Us
 nVV8O/LEzial2eiYvyQyW5GhxWT2jjkwWgvhaST676jJGi5vMqHjVYEYjl3OEj6mTbmI YQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 368bjn3w5x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jan 2021 17:21:57 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 56301100034;
 Mon, 25 Jan 2021 17:21:55 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 323D8219835;
 Mon, 25 Jan 2021 17:21:55 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 25 Jan
 2021 17:21:54 +0100
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin
 Hilman <khilman@baylibre.com>, SoC Team <soc@kernel.org>, arm-soc
 <arm@kernel.org>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <b7379980-857e-736a-85d8-58e2bd300141@foss.st.com>
Date: Mon, 25 Jan 2021 17:21:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-25_06:2021-01-25,
 2021-01-25 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: [Linux-stm32] [GIT PULL] STM32 DT fixes for v5.11 #1
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

Please consider this first round of STM32 DT fixes for v5.11. It 
concerns DHCOM/DHCOR fixes.

Thanks
Alex

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v5.11-fixes-1

for you to fetch changes up to 83d411224025ac1baab981e3d2f5d29e7761541d:

   ARM: dts: stm32: Fix GPIO hog flags on DHCOM DRC02 (2021-01-14 
18:17:26 +0100)

----------------------------------------------------------------
STM32 DT fixes for v5.11, round 1

Highlights:
-----------

  -Fixes are for DHCOM/DHCOR boards:
   - Fix DRC02 uSD card detect polarity
   - use uSD card detect on DHCOM
   - Disable uSD WP on DHCOM
   - Disable TSC2004 on DRC02
   - Fix GPIO hogs on DHCOM boards

----------------------------------------------------------------
Marek Vasut (7):
       ARM: dts: stm32: Fix polarity of the DH DRC02 uSD card detect
       ARM: dts: stm32: Connect card-detect signal on DHCOM
       ARM: dts: stm32: Disable WP on DHCOM uSD slot
       ARM: dts: stm32: Disable optional TSC2004 on DRC02 board
       ARM: dts: stm32: Fix GPIO hog names on DHCOM
       ARM: dts: stm32: Fix GPIO hog flags on DHCOM PicoITX
       ARM: dts: stm32: Fix GPIO hog flags on DHCOM DRC02

  arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi   | 16 +++++++++++-----
  arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi |  4 ++--
  arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi     |  3 ++-
  3 files changed, 15 insertions(+), 8 deletions(-)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
