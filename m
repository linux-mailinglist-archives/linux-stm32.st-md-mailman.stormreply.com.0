Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E872632A1C0
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Mar 2021 15:07:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9140AC57189;
	Tue,  2 Mar 2021 14:07:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED049C5660F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Mar 2021 14:07:26 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122E0rVV003184; Tue, 2 Mar 2021 15:06:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=B/YQiWDteqAy1if94IzoLqwuQ5Yxhjv54jSJ587Pt5c=;
 b=rrwW2S2e16/v+wy9LH7QS1EXJ13aPTwEtUvid3GPu7UE8T3l+XY3bZ7FTCM8Tb9C/cb/
 IRQj/0PYDIeNsHQQ4o2Q4ZvqMToglbxMcx6HsmLTjyPtloykSXXAiMRas3VfDkpraHHc
 bDvHWvlFnRfORTs9DoXmmYXlBu18LK7lznof/puoH31Q5L26DNBFYyIO18mySRcQQBZ8
 pc8PBN7wZ9cAKb9kB3a923dq2U/58tknSBofszH3jUq9VH7GjI/0SAtRYGy6xsyIHLtg
 oGOxmkyquZ8ijP+CAL7kra09+0wO7iHS8fYZeeNHWD7/6YRfLhK/ldLu79GeHkEikofh yA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 370xehqcv6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:06:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BAB51100034;
 Tue,  2 Mar 2021 15:06:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9512923A2E1;
 Tue,  2 Mar 2021 15:06:51 +0100 (CET)
Received: from lmecxl0504.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Mar
 2021 15:06:50 +0100
To: Ulf Hansson <ulf.hansson@linaro.org>
References: <20210225145454.12780-1-yann.gautier@foss.st.com>
 <CAPDyKFo-98OWNg4QJ1cgY2QwYFB9d-6tVrMs0RYt6-=cU3-73w@mail.gmail.com>
From: Yann Gautier <yann.gautier@foss.st.com>
Message-ID: <3c1f963c-e3bf-cedf-307c-dfbc96260e9c@foss.st.com>
Date: Tue, 2 Mar 2021 15:06:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFo-98OWNg4QJ1cgY2QwYFB9d-6tVrMs0RYt6-=cU3-73w@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_06:2021-03-01,
 2021-03-02 signatures=0
Cc: =?UTF-8?Q?Marek_Va=c5=a1ut?= <marex@denx.de>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] mmc: mmci: manage
 MMC_CAP_NEED_RSP_BUSY for stm32 variant
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

On 3/2/21 11:40 AM, Ulf Hansson wrote:
> On Thu, 25 Feb 2021 at 15:55, Yann Gautier <yann.gautier@foss.st.com> wrote:
>>
>> To properly manage commands awaiting R1B responses, the capability
>> MMC_CAP_NEED_RSP_BUSY is enabled in mmci driver, for stm32 variant.
>> The issue was seen on STM32MP157C-EV1 board, with an erase command,
>> with secure erase argument, letting the card stuck, possibly waiting
>> for 4 hours before timeout.
>>
>> Fixes: 94fe2580a2f3 ("mmc: core: Enable erase/discard/trim support for all mmc hosts")
>>
>> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
>> ---
>> This is somehow a v2 for patch [1].
>> Changes:
>> - Only apply MMC_CAP_NEED_RSP_BUSY to stm32 variant
>> - Cap the used timeout written to MMCIDATATIMER (when using
>> MMC_CAP_NEED_RSP_BUSY, cmd->busy_timeout may be greater than
>> host->max_busy_timeout)
>>
>>   [1] https://patchwork.kernel.org/project/linux-mmc/patch/20210204120547.15381-2-yann.gautier@foss.st.com/
>>
>>   drivers/mmc/host/mmci.c             | 8 +++++++-
>>   drivers/mmc/host/mmci_stm32_sdmmc.c | 1 +
>>   2 files changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
>> index 17dbc81c221e..89e0e9ccfb71 100644
>> --- a/drivers/mmc/host/mmci.c
>> +++ b/drivers/mmc/host/mmci.c
>> @@ -1242,7 +1242,13 @@ mmci_start_command(struct mmci_host *host, struct mmc_command *cmd, u32 c)
>>                  if (!cmd->busy_timeout)
>>                          cmd->busy_timeout = 10 * MSEC_PER_SEC;
>>
>> -               clks = (unsigned long long)cmd->busy_timeout * host->cclk;
>> +               if (host->mmc->caps & MMC_CAP_NEED_RSP_BUSY &&
>> +                   host->mmc->max_busy_timeout &&
>> +                   cmd->busy_timeout > host->mmc->max_busy_timeout)
> 
> We are already within "if (host->variant->busy_timeout ....", a few
> lines above, which means this can be simplified into:
> 
> if (cmd->busy_timeout > host->mmc->max_busy_timeout)
> 
>> +                       clks = (unsigned long long)host->mmc->max_busy_timeout * host->cclk;
>> +               else
>> +                       clks = (unsigned long long)cmd->busy_timeout * host->cclk;
>> +
>>                  do_div(clks, MSEC_PER_SEC);
>>                  writel_relaxed(clks, host->base + MMCIDATATIMER);
>>          }
>> diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
>> index 51db30acf4dc..2ad577618324 100644
>> --- a/drivers/mmc/host/mmci_stm32_sdmmc.c
>> +++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
>> @@ -522,6 +522,7 @@ void sdmmc_variant_init(struct mmci_host *host)
>>
>>          host->ops = &sdmmc_variant_ops;
>>          host->pwr_reg = readl_relaxed(host->base + MMCIPOWER);
>> +       host->mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
> 
> To make it more clear that this is for variants having the
> ->busy_timeout flag set, I suggest to move this into mmci_probe().
> 
>>
>>          base_dlyb = devm_of_iomap(mmc_dev(host->mmc), np, 1, NULL);
>>          if (IS_ERR(base_dlyb))
>> --
>> 2.17.1
>>
> 
> Well, I decided to help out a bit. I have amend the patch according to
> the above and extended the commit message with some valuable
> information, based upon our earlier discussions.
> 
> Patch is applied at my fixes branch with a stable tag, please have a
> look, test and shout at me if there is something that looks wrong!
> 
> Thanks and kind regards
> Uffe
> 

Hi Ulf,

Thanks a lot for the updated patch.
I've tested it on STM32MP157C-EV1. The MMC_TEST full campaigns for both 
SD-card and eMMC run OK.


Best regards,
Yann
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
