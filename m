Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D68551B2BDC
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Apr 2020 18:05:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98A37C36B0C;
	Tue, 21 Apr 2020 16:05:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B096C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 16:05:08 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03LFw0On028047; Tue, 21 Apr 2020 18:05:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=UcNZO3xM3HHi7oyXBYoDxOmNpVA61++TVvetEk1ioYo=;
 b=gpwzmxlAraMrYnBys2wZ1Z8KTScT7XhQJNfhOcWqyR4xrdrFY0QxI3nFNmcX4Dvcg2L1
 qe0aInvsmFaTebTz8WWgiM8MpMmEU9tud1XvRYH7sfXBIedOePiS4y6XMwqNt4k7Onoy
 7gLOYBIKl3JkYG0hEZdI6TkhHxDP8l0NMkEf9R+StcHiKSRnQVoMkYwUANiAIGsZIQ5t
 5H4+dJbGpnE2ZzvSG4Qc/L8ZX5cpoQrsp8wniLKPZ9K1TIqRNMn8K4HeN60FTN5wNZfP
 mOLBCXyMA0WAb1yDL6/8YMbUtoBcISPWEOUdliT4eLeZo8EW073xlJN/+wQEGRxIPNuw AA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fq11h5xj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Apr 2020 18:05:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 823EE10002A;
 Tue, 21 Apr 2020 18:05:00 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 65877210F9B;
 Tue, 21 Apr 2020 18:05:00 +0200 (CEST)
Received: from lmecxl0912.tpe.st.com (10.75.127.47) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 21 Apr
 2020 18:04:55 +0200
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20200401132237.60880-1-marex@denx.de>
 <971b9046-2d77-fdc6-2916-8b02ffb601d5@denx.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <b73cb2bf-e50b-ce52-8e53-d8b72fa273f0@st.com>
Date: Tue, 21 Apr 2020 18:04:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <971b9046-2d77-fdc6-2916-8b02ffb601d5@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-21_06:2020-04-20,
 2020-04-21 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [Linux-stm32] [PATCH V4 00/22] ARM: dts: stm32: Repair AV96
	board
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

Hi Marek

On 4/21/20 12:30 PM, Marek Vasut wrote:
> On 4/1/20 3:22 PM, Marek Vasut wrote:
>> The AV96 board device tree is completely broken and does not match the
>> hardware. This series fixes it up.
>>
>> Marek Vasut (22):
>>    ARM: dts: stm32: Add alternate pinmux for ethernet RGMII
>>    ARM: dts: stm32: Repair ethernet operation on AV96
>>    ARM: dts: stm32: Add missing ethernet PHY reset on AV96
>>    ARM: dts: stm32: Add missing ethernet PHY skews on AV96
>>    ARM: dts: stm32: Add alternate pinmux for SDMMC1 direction pins
>>    ARM: dts: stm32: Repair SDMMC1 operation on AV96
>>    ARM: dts: stm32: Repair PMIC configuration on AV96
>>    ARM: dts: stm32: Repair PMIC interrupt on AV96
>>    ARM: dts: stm32: Add alternate pinmux for SDMMC2 pins 4-7
>>    ARM: dts: stm32: Add eMMC attached to SDMMC2 on AV96
>>    ARM: dts: stm32: Add QSPI NOR on AV96
>>    ARM: dts: stm32: Add configuration EEPROM on AV96
>>    ARM: dts: stm32: Add alternate pinmux for SDMMC3 pins
>>    ARM: dts: stm32: Enable WiFi on AV96
>>    ARM: dts: stm32: Add alternate pinmux for USART2 pins
>>    ARM: dts: stm32: Enable Bluetooth on AV96
>>    ARM: dts: stm32: Add alternate pinmux for LTDC pins
>>    ARM: dts: stm32: Add bindings for HDMI video on AV96
>>    ARM: dts: stm32: Add alternate pinmux for SAI2 pins
>>    ARM: dts: stm32: Add bindings for audio on AV96
>>    ARM: dts: stm32: Add bindings for USB on AV96
>>    ARM: dts: stm32: Rename LEDs to match silkscreen on AV96
>>
>>   arch/arm/boot/dts/stm32mp15-pinctrl.dtsi    | 280 +++++++++++++++++
>>   arch/arm/boot/dts/stm32mp157a-avenger96.dts | 324 ++++++++++++++++++--
>>   2 files changed, 571 insertions(+), 33 deletions(-)
> 
> Alex, can you provide some review of this series ? It's been posted for
> three weeks now.
> 

Yes, I was waiting for Mani's review first (and I was a bit busy sorry).

All patches looks good for me. Maybe I'll squash some pinctrl patches to 
decrease number of patches.

One remaining questions about patch 7 ("Repair PMIC configuration on 
AV96). I saw a discussion on u-boot thread with pascal P., explaining 
that 800mv is not the minimal voltage acceptable for vddcore. What is 
the status ?

regards
alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
