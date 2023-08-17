Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C337D77EF1C
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Aug 2023 04:33:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 795DCC6B461;
	Thu, 17 Aug 2023 02:33:16 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7355C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 02:33:14 +0000 (UTC)
Received: from dggpemm500016.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RR8Bf0bJWzVkPj;
 Thu, 17 Aug 2023 10:31:06 +0800 (CST)
Received: from [10.67.108.26] (10.67.108.26) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 17 Aug
 2023 10:33:12 +0800
Message-ID: <97ed3bff-424c-3df3-47ed-e74c34412813@huawei.com>
Date: Thu, 17 Aug 2023 10:33:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, <andersson@kernel.org>,
 <mathieu.poirier@linaro.org>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <linux-remoteproc@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
References: <20230802095128.995428-1-chenjiahao16@huawei.com>
 <15e381f6-aabd-8a3a-7911-4e64828b0fdc@foss.st.com>
From: "chenjiahao (C)" <chenjiahao16@huawei.com>
In-Reply-To: <15e381f6-aabd-8a3a-7911-4e64828b0fdc@foss.st.com>
X-Originating-IP: [10.67.108.26]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
Subject: Re: [Linux-stm32] [PATCH -next] remoteproc: stm32: Clean up
 redundant dev_err_probe()
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


On 2023/8/16 20:46, Arnaud POULIQUEN wrote:
> Hi,
>
> On 8/2/23 11:51, Chen Jiahao wrote:
>> Referring to platform_get_irq()'s definition, the return value has
>> already been checked if ret < 0, and printed via dev_err_probe().
>> Calling dev_err_probe() one more time outside platform_get_irq()
>> is obviously redundant.
>>
>> Removing dev_err_probe() outside platform_get_irq() to clean up
>> above problem.
>>
>> Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>
>> ---
>>   drivers/remoteproc/stm32_rproc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
>> index 98234b44f038..a09eeb83ea5c 100644
>> --- a/drivers/remoteproc/stm32_rproc.c
>> +++ b/drivers/remoteproc/stm32_rproc.c
>> @@ -714,7 +714,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
>>   
>>   	irq = platform_get_irq(pdev, 0);
>>   	if (irq == -EPROBE_DEFER)
>> -		return dev_err_probe(dev, irq, "failed to get interrupt\n");
>> +		return irq;
> The IRQ is optional so using platform_get_irq_optional seems a better option to me.
>
> -  	irq = platform_get_irq(pdev, 0);
> +  	irq = platform_get_irq_optional(pdev, 0);

Hi,

Thanks for your reminding.

It seems that platform_get_irq is nothing more than platform_get_irq_optional,
except wrapping a dev_err_probe for error code checking. So using the former
one should also be OK.

Or have I missed anywhere else?

Best Regards,
Jiahao

>>   	if (irq == -EPROBE_DEFER)
>> 		return dev_err_probe(dev, irq, "failed to get interrupt\n");
> Thanks,
> Arnaud
>
>>   
>>   	if (irq > 0) {
>>   		err = devm_request_irq(dev, irq, stm32_rproc_wdg, 0,
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
