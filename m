Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 554653BB97A
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Jul 2021 10:41:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 096C0C57B53;
	Mon,  5 Jul 2021 08:41:47 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1070FC424BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jul 2021 08:41:43 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GJJxK6H6czZqtJ;
 Mon,  5 Jul 2021 16:38:29 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 5 Jul 2021 16:41:40 +0800
Received: from [10.174.176.221] (10.174.176.221) by
 dggema762-chm.china.huawei.com (10.1.198.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 5 Jul 2021 16:41:39 +0800
To: Vinod Koul <vkoul@kernel.org>, Johan Hovold <johan@kernel.org>
References: <20210517081826.1564698-1-yukuai3@huawei.com>
 <20210517081826.1564698-3-yukuai3@huawei.com>
 <YLRfZfnuxc0+n/LN@vkoul-mobl.Dlink>
 <b6c340de-b0b5-6aad-94c0-03f062575b63@huawei.com>
 <YLSk/i6GmYWGEa9E@vkoul-mobl.Dlink> <YLSqD+9nZIWJpn+r@hovoldconsulting.com>
 <YLi4VGwzrat8wJHP@vkoul-mobl> <YL3TlDqe4KSr3ICl@hovoldconsulting.com>
 <YL3ynd1KiJoe9y6+@vkoul-mobl>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <c8fcdaa1-f053-47aa-2dad-521b8f34b8d1@huawei.com>
Date: Mon, 5 Jul 2021 16:41:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <YL3ynd1KiJoe9y6+@vkoul-mobl>
X-Originating-IP: [10.174.176.221]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected
Cc: michal.simek@xilinx.com, yi.zhang@huawei.com, linux-kernel@vger.kernel.org,
 alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/3] dmaengine: usb-dmac: Fix PM reference
 leak in usb_dmac_probe()
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

Hi, Vinod

Are you still intrested in accepting this patch?

Thanks,
Yu Kuai

On 2021/06/07 18:19, Vinod Koul wrote:
> On 07-06-21, 10:06, Johan Hovold wrote:
>> On Thu, Jun 03, 2021 at 04:39:08PM +0530, Vinod Koul wrote:
>>> On 31-05-21, 11:19, Johan Hovold wrote:
>>>> On Mon, May 31, 2021 at 02:27:34PM +0530, Vinod Koul wrote:
>>>>> On 31-05-21, 14:11, yukuai (C) wrote:
>>>>>> On 2021/05/31 12:00, Vinod Koul wrote:
>>>>>>> On 17-05-21, 16:18, Yu Kuai wrote:
>>>>>>>> pm_runtime_get_sync will increment pm usage counter even it failed.
>>>>>>>> Forgetting to putting operation will result in reference leak here.
>>>>>>>> Fix it by replacing it with pm_runtime_resume_and_get to keep usage
>>>>>>>> counter balanced.
>>
>>>>> Yes the rumtime_pm is disabled on failure here and the count would have
>>>>> no consequence...
>>>>
>>>> You should still balance the PM usage counter as it isn't reset for
>>>> example when reloading the driver.
>>>
>>> Should I driver trust that on load PM usage counter is balanced and not
>>> to be reset..?
>>
>> Not sure what you're asking here. But a driver should never leave the PM
>> usage counter unbalanced.
> 
> Thinking about again, yes we should safely assume the counter is
> balanced when driver loads.. so unloading while balancing sounds better
> behaviour
> 
> Thanks
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
