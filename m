Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7314D86FE
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Mar 2022 15:34:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47C99C60467;
	Mon, 14 Mar 2022 14:34:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F7D4C5F1F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Mar 2022 14:34:56 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22EEYU37010648;
 Mon, 14 Mar 2022 15:34:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=kLY/rp9XFBnEGTA7AmSGnAI46HT15qqSZH0qqiHDQ8g=;
 b=Ic7xYf3r6l+v/jgFyCGeiHGfK1zwxEQ3yKLbO5UJoXWt1SRSUiBhYc48mv9lxeQz2iNY
 DRzNNoYmP9gYv+n01Ww9nBWFuesipS0x59ZssrsuXwxigqhtGPF3cWM5lauC7jM64UJk
 /SZSEYv7d8S+DMY4dq3uYfPIovLEab4QfJxb7P3bliS/HudISyUxxClUCBok4tqYiAJS
 r7unIxSb8zS8m9/OE6Tv8QO1IoseujmjZn/izJ4OgIaa4TCC77wIAI+bSyolw1pqD3b3
 0+dLIycC1HFlaoNtTGm2uPvKTitW97yuXLkQhA1wxLXa+SfhanqE1N9WSDyZbuZb3XHn tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3et7kd0007-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 15:34:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 41DA410002A;
 Mon, 14 Mar 2022 15:34:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 36755227895;
 Mon, 14 Mar 2022 15:34:30 +0100 (CET)
Received: from [10.201.21.172] (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 14 Mar
 2022 15:34:29 +0100
Message-ID: <9e4fbf6a-1309-3aee-fcb0-be7c2c683892@foss.st.com>
Date: Mon, 14 Mar 2022 15:34:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>
References: <20220314095225.53563-1-yann.gautier@foss.st.com>
 <20220314125554.190574-1-yann.gautier@foss.st.com>
 <CAPDyKFruN9Xwk4uqFumwBdcn4SjKQcSQVBbALa3kVxY4mVzOnQ@mail.gmail.com>
From: Yann Gautier <yann.gautier@foss.st.com>
In-Reply-To: <CAPDyKFruN9Xwk4uqFumwBdcn4SjKQcSQVBbALa3kVxY4mVzOnQ@mail.gmail.com>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_04,2022-03-14_01,2022-02-23_01
Cc: Ludovic Barre <ludovic.barre@foss.st.com>, Marek Vasut <marex@denx.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Grzegorz Szymaszek <gszymaszek@short.pl>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 kernel@dh-electronics.com, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] mmc: mmci: manage MMC_PM_KEEP_POWER
	per variant config
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

On 3/14/22 14:03, Ulf Hansson wrote:
> On Mon, 14 Mar 2022 at 13:56, Yann Gautier <yann.gautier@foss.st.com> wrote:
>>
>> Add a disable_keep_power field in variant_data struct. The
>> MMC_PM_KEEP_POWER flag will be enabled if disable_keep_power is not set.
>> It is only set to true for stm32_sdmmc variants.
>>
>> The issue was seen on STM32MP157C-DK2 board, which embeds a wifi chip.
>> It doesn't correctly support low power on this board. The Wifi chip
>> awaits an always-on regulator, but it was connected to v3v3 which is off
>> in low-power sequence. MMC_PM_KEEP_POWER should then be disabled.
> 
> Just to make sure I get this correct.
> 
> Why can't the regulator stay on during system suspend? The point is,
> we don't need an always on regulator to cope with this.
> 
> Kind regards
> Uffe

Hi Ulf,

This v3v3 regulator powers most of the devices on this board. So we need 
to switch it off to gain power in suspend mode.


Yann

> 
>>
>> The flag can still be enabled through DT property:
>> keep-power-in-suspend.
>>
>> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
>> ---
>> Update in v2:
>> Reword commit message to better explain the issue.
>>
>> Resend the patch alone. It was previoulsy in a series [1] for which the
>> other patches will be reworked.
>>
>> [1] https://lore.kernel.org/lkml/20220304135134.47827-1-yann.gautier@foss.st.com/
>>
>>   drivers/mmc/host/mmci.c | 5 ++++-
>>   drivers/mmc/host/mmci.h | 1 +
>>   2 files changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
>> index 45b8608c935c..0e2f2f5d6a52 100644
>> --- a/drivers/mmc/host/mmci.c
>> +++ b/drivers/mmc/host/mmci.c
>> @@ -274,6 +274,7 @@ static struct variant_data variant_stm32_sdmmc = {
>>          .busy_detect            = true,
>>          .busy_detect_flag       = MCI_STM32_BUSYD0,
>>          .busy_detect_mask       = MCI_STM32_BUSYD0ENDMASK,
>> +       .disable_keep_power     = true,
>>          .init                   = sdmmc_variant_init,
>>   };
>>
>> @@ -301,6 +302,7 @@ static struct variant_data variant_stm32_sdmmcv2 = {
>>          .busy_detect            = true,
>>          .busy_detect_flag       = MCI_STM32_BUSYD0,
>>          .busy_detect_mask       = MCI_STM32_BUSYD0ENDMASK,
>> +       .disable_keep_power     = true,
>>          .init                   = sdmmc_variant_init,
>>   };
>>
>> @@ -2172,7 +2174,8 @@ static int mmci_probe(struct amba_device *dev,
>>          host->stop_abort.flags = MMC_RSP_R1B | MMC_CMD_AC;
>>
>>          /* We support these PM capabilities. */
>> -       mmc->pm_caps |= MMC_PM_KEEP_POWER;
>> +       if (!variant->disable_keep_power)
>> +               mmc->pm_caps |= MMC_PM_KEEP_POWER;
>>
>>          /*
>>           * We can do SGIO
>> diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
>> index e1a9b96a3396..2cad1ef9766a 100644
>> --- a/drivers/mmc/host/mmci.h
>> +++ b/drivers/mmc/host/mmci.h
>> @@ -361,6 +361,7 @@ struct variant_data {
>>          u32                     opendrain;
>>          u8                      dma_lli:1;
>>          u32                     stm32_idmabsize_mask;
>> +       u8                      disable_keep_power:1;
>>          void (*init)(struct mmci_host *host);
>>   };
>>
>> --
>> 2.25.1
>>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
