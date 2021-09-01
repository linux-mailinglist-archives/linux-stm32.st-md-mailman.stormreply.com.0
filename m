Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE443FD471
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Sep 2021 09:33:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C5DAC5A4F3;
	Wed,  1 Sep 2021 07:33:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1E27C57196
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Sep 2021 07:33:05 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 1813nd5a002907;
 Wed, 1 Sep 2021 09:32:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=3jRYf6kgi/Y3vs9PQibwlh0dqREUThB8xo5tLdQ+5rs=;
 b=LIbGaAv+MLdeGDQftd4OlnQ7hYD+9he6Cz85BVjwK0+ZtVaLtAqOjkbryvDMVeyzRDYL
 uAQIW1fyKXIvhHQwbjfGSL4JYyygTTrPlMAWlUxHTGo0Vl9UDPZqIFOyOd5gHyUvzRVL
 CgQm3xXh1B3Xy8qcjBzVhYCdsizFX+P6L5u+810pnToGLcTNYTRuIefUVlYoRZ6edocP
 FIMeUmQC/lZuh8+rcKAoHiuLVKA+csMCU7wFtgoZ2eBWLoeh0Ty90PVVENnz6RKVDKEj
 JYAziuE3pjyZQcrxwDI61Hrhr3m4/x3ClwGqwdfWaVTNDv2WRBzhbIKxzWygiENinKTh nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3aspy4byqe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 09:32:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8A03F10002A;
 Wed,  1 Sep 2021 09:32:47 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 589282128DE;
 Wed,  1 Sep 2021 09:32:47 +0200 (CEST)
Received: from lmecxl0504.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 1 Sep
 2021 09:32:46 +0200
To: Ulf Hansson <ulf.hansson@linaro.org>
References: <ccb2dad1-c8c1-9f19-92c4-7faf2b787e6d@foss.st.com>
 <CAPDyKFqMJmJRLNYF=gWvAEH8wtJzrxrZ9KLz62t4XNsD84vr=Q@mail.gmail.com>
From: Yann Gautier <yann.gautier@foss.st.com>
Message-ID: <8b2f3a6a-150d-4e78-7bbc-6d1de9fae000@foss.st.com>
Date: Wed, 1 Sep 2021 09:32:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFqMJmJRLNYF=gWvAEH8wtJzrxrZ9KLz62t4XNsD84vr=Q@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-01_02,2021-08-31_01,2020-04-07_01
Cc: Ludovic BARRE - foss <ludovic.barre@foss.st.com>,
 DTML <devicetree@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Christophe ROULLIER-SCND-02 <christophe.roullier@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] Question about MMC_PM_KEEP_POWER in MMCI driver
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

On 8/30/21 3:43 PM, Ulf Hansson wrote:
> On Wed, 25 Aug 2021 at 16:34, Yann Gautier <yann.gautier@foss.st.com> wrote:
>>
>> Hi,
>>

Hi Linus,

Thanks for the advice.

>> In drivers/mmc/host/mmci.c, MMC_PM_KEEP_POWER is unconditionally enabled.
>> This prevents correct low-power sequence on STM32MP157C-DK2 board which
>> embeds a Wifi chip brcm,bcm4329-fmac (this wifi part has not yet been
>> sent upstream).
> 
> Exactly why doesn't this work with the STM32MP157C-DK2 board?
> 
It is more the opposite.
We had that patch in our downstream for a while, and this was possible 
due to changes in wifi driver.
But I'll check all that precisely, and make some more tests.

>>
>> This MMC_PM_KEEP_POWER can be taken from DT with the property
>> keep-power-in-suspend. This is what is done for other MMC drivers.
> 
> The DT property is what should have been used for mmci as well.
> 
>>
>> I wonder what should be the best solution for this.
>>
>> 1) Remove MMC_PM_KEEP_POWER from the driver, and modify all SoC device
>> tree files embedding a arm,pl18x with adding keep-power-in-suspend;
>> property (except stm32mp151.dtsi file).
>> This can be easy to do (~10 files to modify). But that could be more
>> board dependent, if an SDIO chip is plugged on this MMC IP.
>> And the name keep-power-in-suspend can be misleading as it only applies
>> to SDIO.
>>
>> 2) Remove MMC_PM_KEEP_POWER from the driver, and modify board DT files
>> with the property. This could be a difficult task to find all those
>> boards. And this should be applied only for SDIO configs.
>>
>> 3) Just modify the driver to apply this capability for all MMCI chips
>> but STM32. This could be done in the dedicated file, in
>> sdmmc_variant_init() function. But some boards based on STM32MP15 chip
>> might want to keep this capability.
> 
> I would suggest option 3).
> 
> As a matter of fact, we also allow MMC_PM_KEEP_POWER to become set
> when parsing the DTB via calling mmc_of_parse(). So just changing the
> default value (don't set MMC_PM_KEEP_POWER) for the stm32 variant,
> would do the trick I think.
> 
OK, I'll do that, in mmci.c file, keeping the possibility to have the DT 
property set even for stm32 variant.

> Kind regards
> Uffe
> 
Best regards,
Yann
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
