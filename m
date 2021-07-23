Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 877553D3BDC
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jul 2021 16:36:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B4A7C5719C;
	Fri, 23 Jul 2021 14:36:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D1CDC57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jul 2021 14:36:56 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16NEVTgp014144; Fri, 23 Jul 2021 16:36:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=n+jv0fD33/CgdMUX9dBcGBkC8K9zyQoTqjfbXyjDB8Y=;
 b=lv4XIk83ZU2zORjYXmjXjx0yb+/JSUq6dh4DKuicAwRqQKcsvB0foo/dKLya+MQAt+st
 5BHueZ+73OdUhW12SqHreULH16JcOth61rDZwMB3tf6gqTpXNnOLmRBJ8GoR0FHhhtzG
 1OamR/zyDlapBO5yA7UyL6h74GUf1LSSD5cFwg2LPBVt+9pA+cYcepIrLkwkujGF/F4v
 qfE4I3oRFkdZofJCZU+p9oBYlXdMCL5IsI3LZPtyXwEqbH9lm5IuKujBhgdhxvYZNxrG
 fmKIbe3Tvux3d3zjwZANvvuuTY/qaWlKO6KJMzQlvx63trEipuesJZZfdNH75Fq5rfd2 Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39yt3ehux8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jul 2021 16:36:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DD00B10002A;
 Fri, 23 Jul 2021 16:36:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C2BFA2248CE;
 Fri, 23 Jul 2021 16:36:40 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 23 Jul
 2021 16:36:39 +0200
To: Arnd Bergmann <arnd@arndb.de>
References: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
 <CAK8P3a1ax29ThCG867phtx1Xb12GgiJFcLDd8H9VLbsJQ1uoAw@mail.gmail.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <ce1fc3e3-190f-6174-a34c-41132807f64e@foss.st.com>
Date: Fri, 23 Jul 2021 16:36:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1ax29ThCG867phtx1Xb12GgiJFcLDd8H9VLbsJQ1uoAw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-23_08:2021-07-23,
 2021-07-23 signatures=0
Cc: DTML <devicetree@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Linus Walleij <linus.walleij@linaro.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Olof Johansson <olof@lixom.net>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 0/7] Add STM32MP13 SoCs and discovery
	board support
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

On 7/23/21 3:46 PM, Arnd Bergmann wrote:
> On Fri, Jul 23, 2021 at 3:28 PM Alexandre Torgue
> <alexandre.torgue@foss.st.com> wrote:
>>
>> This series enhance the STM32 MPU family by adding STM32MP13 SoCs support.
>> It adds machine support and device tree diversity to support the whole
>> stm32mp13 family (STM32MP131/STM32MP133/STM32MP135, plus security feature
>> diversity).
>>
>> Basically STM32MP13 SoCs embeds one Cortex A7, storage (SD/MMC/SDIO, QSPI FMC),
>> network (ETH, CAN), display (DCMIPP, LTDC, ...), audio(SAI, DFSDM, SPDIFRX),
>> com (USB EHCI/OHCI, USB OTG, I2C, SPI/I2S, U(S)ART).
>>
>> This series also adds STM32MP135F Discovery board support (stm32mp135f-dk). It
>> embeds a STM32MP135f SOC with 512 MB of DDR3. Several connections are available
>> on this board:
>>   - 4*USB2.0, 1*USB2.0 typeC DRD, SDcard, 2*RJ45, HDMI, Combo Wifi/BT, ...
>>
>> Only SD card, uart4 (console) and watchdog IPs are enabled in this commit.
>>
>> Note that file stm32mp135.dtsi doesn't define nodes but I add it now to ease adding
>> of new nodes in a (close) future.
> 
> I had a brief look and it seems all fine to me, nice work!
> 
> The only (very minor) thing I noticed is that the crypto engine device node
> has an unusual name 'cryp@' instead of the usual 'crypto@', but this is already
> the case on stm32mp157.
> 
> With this changed,
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de
> 

Thanks Arnd. I'll change "cryp: cryp@" by "cryp: crypto@" (either in V2 
or directly during the merge).

regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
