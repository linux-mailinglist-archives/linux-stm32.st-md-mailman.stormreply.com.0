Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C38594E74A7
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Mar 2022 15:02:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67F94C628A9;
	Fri, 25 Mar 2022 14:02:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C8CAC6049F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Mar 2022 14:02:02 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22P9DWkq012594;
 Fri, 25 Mar 2022 15:01:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=sfoK/AhKJde6QAFBNaKF8n1bgeG1b/nnFL7Tu8qPyAc=;
 b=JOTsJ8ro+zgneByNYKdRjOxqA/io05I1zjzN2eEi95mjj73355qpKXS94wJeKzki8vfo
 /gamEFyNxgWYsmocJ6SFegbG63Xn4812cP4KMVql+NJNJSD0W5m84LlKVNarjM7pd7mb
 frp48Qt9gE6ADDSRAhOzYnntm0U0II1Thr6yVwOHuO0zodyBifGIrwd7E+SQzjAhwgJf
 WcejZLoom1neNj03dcWG0jyb7yznxY+b2sCgg3bdzcdpD0AtnLEP0H3uTibVpqxmABVe
 7YBI1QougA/waoNM22WpGEsvp2BCaMHGrppYjwopHQ/9XLYX7uQ7LN4bNCkhZIn22Crs gQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ew6xm1j8q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 15:01:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 614F110002A;
 Fri, 25 Mar 2022 15:01:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 57ECB222CB6;
 Fri, 25 Mar 2022 15:01:46 +0100 (CET)
Received: from [10.201.21.172] (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 25 Mar
 2022 15:01:45 +0100
Message-ID: <57b4f49d-ae93-89d4-20ed-43fdd580e0d3@foss.st.com>
Date: Fri, 25 Mar 2022 15:01:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>
References: <20220317111944.116148-1-yann.gautier@foss.st.com>
 <20220317111944.116148-3-yann.gautier@foss.st.com>
 <CAPDyKFqzzKgLHWiy26QW0hvM9kZEATS_c2mXkTuGiFpPaW8YKw@mail.gmail.com>
 <668661ca-271b-9a4f-6482-62f1b0190bb2@foss.st.com>
 <CAPDyKFr3YGd4mytykFMAtESMg9fsRaAKZo5CHBN4hrUa8ekE8g@mail.gmail.com>
From: Yann Gautier <yann.gautier@foss.st.com>
In-Reply-To: <CAPDyKFr3YGd4mytykFMAtESMg9fsRaAKZo5CHBN4hrUa8ekE8g@mail.gmail.com>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-25_04,2022-03-24_01,2022-02-23_01
Cc: Ludovic Barre <ludovic.barre@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] mmc: mmci: stm32: use a buffer for
 unaligned DMA requests
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

On 3/25/22 14:43, Ulf Hansson wrote:
> On Thu, 24 Mar 2022 at 17:23, Yann Gautier <yann.gautier@foss.st.com> wrote:
>>
>> On 3/24/22 12:55, Ulf Hansson wrote:
>>> On Thu, 17 Mar 2022 at 12:19, Yann Gautier <yann.gautier@foss.st.com> wrote:
>>>>
>>>> In SDIO mode, the sg list for requests can be unaligned with what the
>>>> STM32 SDMMC internal DMA can support. In that case, instead of failing,
>>>> use a temporary bounce buffer to copy from/to the sg list.
>>>> This buffer is limited to 1MB. But for that we need to also limit
>>>> max_req_size to 1MB. It has not shown any throughput penalties for
>>>> SD-cards or eMMC.
>>>>
>>>> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
>>>> ---
>>>>    drivers/mmc/host/mmci_stm32_sdmmc.c | 80 +++++++++++++++++++++++------
>>>>    1 file changed, 63 insertions(+), 17 deletions(-)
>>>>
>>>> diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
>>>> index 4566d7fc9055..a4414e32800f 100644
>>>> --- a/drivers/mmc/host/mmci_stm32_sdmmc.c
>>>> +++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
>>>> @@ -43,6 +43,9 @@ struct sdmmc_lli_desc {
>>>>    struct sdmmc_idma {
>>>>           dma_addr_t sg_dma;
>>>>           void *sg_cpu;
>>>> +       dma_addr_t bounce_dma_addr;
>>>> +       void *bounce_buf;
>>>> +       bool use_bounce_buffer;
>>>>    };
>>>>
>>>>    struct sdmmc_dlyb {
>>>> @@ -54,6 +57,7 @@ struct sdmmc_dlyb {
>>>>    static int sdmmc_idma_validate_data(struct mmci_host *host,
>>>>                                       struct mmc_data *data)
>>>>    {
>>>> +       struct sdmmc_idma *idma = host->dma_priv;
>>>>           struct scatterlist *sg;
>>>>           int i;
>>>>
>>>> @@ -61,21 +65,23 @@ static int sdmmc_idma_validate_data(struct mmci_host *host,
>>>>            * idma has constraints on idmabase & idmasize for each element
>>>>            * excepted the last element which has no constraint on idmasize
>>>>            */
>>>> +       idma->use_bounce_buffer = false;
>>>>           for_each_sg(data->sg, sg, data->sg_len - 1, i) {
>>>>                   if (!IS_ALIGNED(sg->offset, sizeof(u32)) ||
>>>>                       !IS_ALIGNED(sg->length, SDMMC_IDMA_BURST)) {
>>>> -                       dev_err(mmc_dev(host->mmc),
>>>> +                       dev_dbg(mmc_dev(host->mmc),
>>>>                                   "unaligned scatterlist: ofst:%x length:%d\n",
>>>>                                   data->sg->offset, data->sg->length);
>>>> -                       return -EINVAL;
>>>> +                       idma->use_bounce_buffer = true;
>>>> +                       return 0;
>>>>                   }
>>>>           }
>>>>
>>>>           if (!IS_ALIGNED(sg->offset, sizeof(u32))) {
>>>> -               dev_err(mmc_dev(host->mmc),
>>>> +               dev_dbg(mmc_dev(host->mmc),
>>>>                           "unaligned last scatterlist: ofst:%x length:%d\n",
>>>>                           data->sg->offset, data->sg->length);
>>>> -               return -EINVAL;
>>>> +               idma->use_bounce_buffer = true;
>>>>           }
>>>>
>>>>           return 0;
>>>> @@ -84,18 +90,29 @@ static int sdmmc_idma_validate_data(struct mmci_host *host,
>>>>    static int _sdmmc_idma_prep_data(struct mmci_host *host,
>>>>                                    struct mmc_data *data)
>>>>    {
>>>> -       int n_elem;
>>>> +       struct sdmmc_idma *idma = host->dma_priv;
>>>>
>>>> -       n_elem = dma_map_sg(mmc_dev(host->mmc),
>>>> -                           data->sg,
>>>> -                           data->sg_len,
>>>> -                           mmc_get_dma_dir(data));
>>>> +       if (idma->use_bounce_buffer) {
>>>> +               if (data->flags & MMC_DATA_WRITE) {
>>>> +                       unsigned int xfer_bytes = data->blksz * data->blocks;
>>>>
>>>> -       if (!n_elem) {
>>>> -               dev_err(mmc_dev(host->mmc), "dma_map_sg failed\n");
>>>> -               return -EINVAL;
>>>> -       }
>>>> +                       sg_copy_to_buffer(data->sg, data->sg_len,
>>>> +                                         idma->bounce_buf, xfer_bytes);
>>>> +                       dma_wmb();
>>>> +               }
>>>> +       } else {
>>>> +               int n_elem;
>>>> +
>>>> +               n_elem = dma_map_sg(mmc_dev(host->mmc),
>>>> +                                   data->sg,
>>>> +                                   data->sg_len,
>>>> +                                   mmc_get_dma_dir(data));
>>>>
>>>> +               if (!n_elem) {
>>>> +                       dev_err(mmc_dev(host->mmc), "dma_map_sg failed\n");
>>>> +                       return -EINVAL;
>>>> +               }
>>>> +       }
>>>>           return 0;
>>>>    }
>>>>
>>>> @@ -112,8 +129,19 @@ static int sdmmc_idma_prep_data(struct mmci_host *host,
>>>>    static void sdmmc_idma_unprep_data(struct mmci_host *host,
>>>>                                      struct mmc_data *data, int err)
>>>>    {
>>>> -       dma_unmap_sg(mmc_dev(host->mmc), data->sg, data->sg_len,
>>>> -                    mmc_get_dma_dir(data));
>>>> +       struct sdmmc_idma *idma = host->dma_priv;
>>>> +
>>>> +       if (idma->use_bounce_buffer) {
>>>> +               if (data->flags & MMC_DATA_READ) {
>>>> +                       unsigned int xfer_bytes = data->blksz * data->blocks;
>>>> +
>>>> +                       sg_copy_from_buffer(data->sg, data->sg_len,
>>>> +                                           idma->bounce_buf, xfer_bytes);
>>>> +               }
>>>> +       } else {
>>>> +               dma_unmap_sg(mmc_dev(host->mmc), data->sg, data->sg_len,
>>>> +                            mmc_get_dma_dir(data));
>>>> +       }
>>>>    }
>>>>
>>>>    static int sdmmc_idma_setup(struct mmci_host *host)
>>>> @@ -137,6 +165,16 @@ static int sdmmc_idma_setup(struct mmci_host *host)
>>>>                   host->mmc->max_segs = SDMMC_LLI_BUF_LEN /
>>>>                           sizeof(struct sdmmc_lli_desc);
>>>>                   host->mmc->max_seg_size = host->variant->stm32_idmabsize_mask;
>>>> +
>>>> +               host->mmc->max_req_size = SZ_1M;
>>>> +               idma->bounce_buf = dmam_alloc_coherent(dev,
>>>> +                                                      host->mmc->max_req_size,
>>>> +                                                      &idma->bounce_dma_addr,
>>>> +                                                      GFP_KERNEL);
>>>> +               if (!idma->bounce_buf) {
>>>> +                       dev_err(dev, "Unable to map allocate DMA bounce buffer.\n");
>>>> +                       return -ENOMEM;
>>>
>> Hi Ulf,
>>
>>> If we fail to allocate the 1M bounce buffer, then we end up always
>>> using a PIO based mode, right?
>>>
>>> Perhaps we can allow the above allocation to fail, but then limit us
>>> to use DMA only when the buffers are properly aligned? Would that
>>> work?
>>>
>> We have never supported PIO mode with STM32 variant.
>> We only support DMA single buffer or DMA LLI.
>> As we cannot have DMA LLI for unaligned access, we'll default to single
>> mode.
> 
> Right, I was looking at the legacy variant, which uses PIO as
> fallback. Sorry for my ignorance.
> 
>> If allocation fails, it then won't work.
> 
> Right, but that's only part of the issue, I think.
> 
>> Maybe we shouldn't fail here, and just check idma->bounce_buf in
>> validate data function. If buffer is not allocated, we just return
>> -EINVAL as it was done before.
> 
> Yes, something along those lines. However, there is another problem
> too, which is that the allocation will be done for each instance of
> the host that is probed. In all cases but the SDIO case, this would be
> a waste, right?
> 
> Perhaps we should manage the allocation in the validate function too
> (de-allocation should be handled at ->remove()). In this way, the
> buffer will only be allocated when it's actually needed. Yes, it would
> add a latency while serving the *first* request that has unaligned
> buffers, but I guess we can live with that?
> 
Hi Ulf,

That makes sense, I'll rework the validate data function with this.
I'll push a new version soon.

Thanks,
Yann
>>
>> Best regards,
>> Yann
> 
> Kind regards
> Uffe
> 
>>
>>>> +               }
>>>>           } else {
>>>>                   host->mmc->max_segs = 1;
>>>>                   host->mmc->max_seg_size = host->mmc->max_req_size;
>>>> @@ -154,8 +192,16 @@ static int sdmmc_idma_start(struct mmci_host *host, unsigned int *datactrl)
>>>>           struct scatterlist *sg;
>>>>           int i;
>>>>
>>>> -       if (!host->variant->dma_lli || data->sg_len == 1) {
>>>> -               writel_relaxed(sg_dma_address(data->sg),
>>>> +       if (!host->variant->dma_lli || data->sg_len == 1 ||
>>>> +           idma->use_bounce_buffer) {
>>>> +               u32 dma_addr;
>>>> +
>>>> +               if (idma->use_bounce_buffer)
>>>> +                       dma_addr = idma->bounce_dma_addr;
>>>> +               else
>>>> +                       dma_addr = sg_dma_address(data->sg);
>>>> +
>>>> +               writel_relaxed(dma_addr,
>>>>                                  host->base + MMCI_STM32_IDMABASE0R);
>>>>                   writel_relaxed(MMCI_STM32_IDMAEN,
>>>>                                  host->base + MMCI_STM32_IDMACTRLR);
>>>
>>> Kind regards
>>> Uffe
>>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
