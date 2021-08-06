Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8AF3E28FC
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Aug 2021 12:58:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4925C597BC;
	Fri,  6 Aug 2021 10:58:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 508ACC57182
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Aug 2021 10:58:33 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176Apvov022607; Fri, 6 Aug 2021 12:58:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=to : cc : from :
 subject : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=3v5wrbxNai9vUx7PEbA9Luax+ZtNpOotFBfg0Aba5Ks=;
 b=D7CaSI8lTDajembzoxRr5OqK46fkjpjjohg1IhrjViaataQ3WSE9FKFkU0V1PtCQ/4oe
 XTX73HqS+sMqLZOVBNI7W3ZwgQQt6TlI0FQ4IiWXtiz7UaNpxiJgebq8GB6iVy4blgr9
 un+e6TmS+MTwtPE6Mp4DH2JlIlqk3a9VGAI5sHGN3akDeBc4l3FMAGYyXKX43edgWOzy
 df7qQXgBPNFtt1sj4edgteb2dvPi1k6UNpuoXxPBEnJgvW5AJYu729gWsPxYgtyIcXDj
 dNFJJvAh8G4IuphZSjn4wj2sSxaG1GBDbsEHOEovZ0PBJrTx8X6/jrHIcntUQj7S0VMD ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a91q08pru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 12:58:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CAAB6100034;
 Fri,  6 Aug 2021 12:58:18 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B6C9821ED4E;
 Fri,  6 Aug 2021 12:58:18 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 6 Aug
 2021 12:58:18 +0200
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin
 Hilman <khilman@baylibre.com>, SoC Team <soc@kernel.org>, arm-soc
 <arm@kernel.org>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <e4f0bea3-4065-38d5-f1b2-007e4094c4a8@foss.st.com>
Date: Fri, 6 Aug 2021 12:58:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-06_03:2021-08-05,
 2021-08-06 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: [Linux-stm32] [GIT PULL] STM32 DT changes for v5.15 #1
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

Please consider this first round of STM32 DT updates for v5.15. A small 
PR containing mainly dtbs_check warnings fix for ST and DH boards.

regards
Alex

The following changes since commit 15f68f027ebd961b99a1c420f96ff3838c5e4450:

   ARM: dts: stm32: Fix touchscreen IRQ line assignment on DHCOM 
(2021-07-30 15:34:51 +0200)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v5.15-1

for you to fetch changes up to 1e6bc5987a5252948e3411e5a2dbb434fd1ea107:

   ARM: dts: stm32: Update AV96 adv7513 node per dtbs_check (2021-07-30 
15:38:11 +0200)

----------------------------------------------------------------
STM32 DT for v5.15, round 1

Highlights:
----------

-MPU:
  - ST boards:
   - Add coporcessor detach mailbox on ED and DKx boards
   - Fix dtbs_check SAI warnings

  - DH boards:
   -Fix some dtbs_check warnings: usb, backlight, hdmi

----------------------------------------------------------------
Arnaud Pouliquen (2):
       ARM: dts: stm32: Add coprocessor detach mbox on stm32mp157c-ed1 board
       ARM: dts: stm32: Add coprocessor detach mbox on stm32mp15x-dkx boards

Marek Vasut (5):
       ARM: dts: stm32: Set {bitclock,frame}-master phandles on DHCOM SoM
       ARM: dts: stm32: Add backlight and panel supply on DHCOM SoM
       ARM: dts: stm32: Add usbphyc_port1 supply on DHCOM SoM
       ARM: dts: stm32: Set {bitclock,frame}-master phandles on ST DKx
       ARM: dts: stm32: Update AV96 adv7513 node per dtbs_check

  arch/arm/boot/dts/stm32mp157c-ed1.dts              |  4 ++--
  arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi     |  4 ++++
  arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi      | 25 
++++++++++++++++++----
  arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi |  6 ++----
  arch/arm/boot/dts/stm32mp15xx-dkx.dtsi             | 12 +++++------
  5 files changed, 35 insertions(+), 16 deletions(-)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
