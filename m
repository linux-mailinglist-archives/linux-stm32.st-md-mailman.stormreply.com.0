Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E06978ACA
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2019 13:45:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB3EBC35E01;
	Mon, 29 Jul 2019 11:45:46 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43472C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jul 2019 09:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nAOqsxTyQ4gYltZdfhxaj3SXIvjncVO2sE1nkzwLk4E=; b=tFKJc9Yt/mc9zFIxobPi3ypDnT
 FuFFk4dfGUY/bNKduZtIu8/UzABRB1Mha/OY/Ka8bOZirm+sTiODILWjX4eI+TPKltxOPPiQlbBWf
 lcHn1Z0FzpIT4jJpnngoKPRCpZkJSiAYOKF0inIIvZbjXYs/JEN1xIMWhsW+oqqxsCRG8jjpVYtwH
 xIu5UVDbY4tj1Vq8rYyxrZzG8FuW5l7NvTl6UJXLmzrim4oCDDlYgIVT73gKTNknPKxmV2BKUwywp
 /lusWQQUCCBhcY3HRSvCHguQ35UYGPRHyFfrjCxbM/1CiWrqTaSa0O7WpHNTzhkMPxg/krGIShmVI
 9u4ITH2A==;
Received: from [193.209.96.43] (helo=[10.21.26.179])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1hs2Dn-0007rJ-W0; Mon, 29 Jul 2019 12:45:36 +0300
To: Jon Hunter <jonathanh@nvidia.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Lars Persson <lists@bofh.nu>, Ilias Apalodimas <ilias.apalodimas@linaro.org>
References: <cover.1562149883.git.joabreu@synopsys.com>
 <BN8PR12MB32661E919A8DEBC7095BAA12D3C80@BN8PR12MB3266.namprd12.prod.outlook.com>
 <20190722101830.GA24948@apalos>
 <CADnJP=thexf2sWcVVOLWw14rpteEj0RrfDdY8ER90MpbNN4-oA@mail.gmail.com>
 <BN8PR12MB326661846D53AAEE315A7434D3C40@BN8PR12MB3266.namprd12.prod.outlook.com>
 <11557fe0-0cba-cb49-0fb6-ad24792d4a53@nvidia.com>
 <BN8PR12MB3266664ECA192E02C06061EED3C40@BN8PR12MB3266.namprd12.prod.outlook.com>
 <BYAPR12MB3269A725AFDDA21E92946558D3C70@BYAPR12MB3269.namprd12.prod.outlook.com>
 <ab14f31f-2045-b1be-d31f-2a81b8527dac@nvidia.com>
 <BYAPR12MB32692AF2BA127C5DA5B74804D3C70@BYAPR12MB3269.namprd12.prod.outlook.com>
 <2ad7bf21-1f1f-db0f-2358-4901b7988b7d@nvidia.com>
 <BYAPR12MB3269D050556BD51030DCDDFCD3C70@BYAPR12MB3269.namprd12.prod.outlook.com>
 <8093e352-d992-e17f-7168-5afbd9d3fb3f@nvidia.com>
 <BYAPR12MB3269EC45ABAF8F279288B003D3C70@BYAPR12MB3269.namprd12.prod.outlook.com>
 <f3525260-c43f-c983-0b5b-34a83bd53283@nvidia.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <299d1803-fc5c-9298-3d10-582e76b47a9e@kapsi.fi>
Date: Mon, 29 Jul 2019 12:45:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f3525260-c43f-c983-0b5b-34a83bd53283@nvidia.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 193.209.96.43
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
X-Mailman-Approved-At: Mon, 29 Jul 2019 11:45:46 +0000
Cc: Joao Pinto <Joao.Pinto@synopsys.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: Introducing
 support for Page Pool
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

My understanding is that Tegra186 does not have DMA coherency, but 
Tegra194 does.

Mikko

On 23.7.2019 16.34, Jon Hunter wrote:
> 
> On 23/07/2019 13:51, Jose Abreu wrote:
>> From: Jon Hunter <jonathanh@nvidia.com>
>> Date: Jul/23/2019, 12:58:55 (UTC+00:00)
>>
>>>
>>> On 23/07/2019 11:49, Jose Abreu wrote:
>>>> From: Jon Hunter <jonathanh@nvidia.com>
>>>> Date: Jul/23/2019, 11:38:33 (UTC+00:00)
>>>>
>>>>>
>>>>> On 23/07/2019 11:07, Jose Abreu wrote:
>>>>>> From: Jon Hunter <jonathanh@nvidia.com>
>>>>>> Date: Jul/23/2019, 11:01:24 (UTC+00:00)
>>>>>>
>>>>>>> This appears to be a winner and by disabling the SMMU for the ethernet
>>>>>>> controller and reverting commit 954a03be033c7cef80ddc232e7cbdb17df735663
>>>>>>> this worked! So yes appears to be related to the SMMU being enabled. We
>>>>>>> had to enable the SMMU for ethernet recently due to commit
>>>>>>> 954a03be033c7cef80ddc232e7cbdb17df735663.
>>>>>>
>>>>>> Finally :)
>>>>>>
>>>>>> However, from "git show 954a03be033c7cef80ddc232e7cbdb17df735663":
>>>>>>
>>>>>> +         There are few reasons to allow unmatched stream bypass, and
>>>>>> +         even fewer good ones.  If saying YES here breaks your board
>>>>>> +         you should work on fixing your board.
>>>>>>
>>>>>> So, how can we fix this ? Is your ethernet DT node marked as
>>>>>> "dma-coherent;" ?
>>>>>
>>>>> TBH I have no idea. I can't say I fully understand your change or how it
>>>>> is breaking things for us.
>>>>>
>>>>> Currently, the Tegra DT binding does not have 'dma-coherent' set. I see
>>>>> this is optional, but I am not sure how you determine whether or not
>>>>> this should be set.
>>>>
>>>>  From my understanding it means that your device / IP DMA accesses are coherent regarding the CPU point of view. I think it will be the case if GMAC is not behind any kind of IOMMU in the HW arch.
>>>
>>> I understand what coherency is, I just don't know how you tell if this
>>> implementation of the ethernet controller is coherent or not.
>>
>> Do you have any detailed diagram of your HW ? Such as blocks / IPs
>> connection, address space wiring , ...
> 
> Yes, this can be found in the Tegra X2 Technical Reference Manual [0].
> Unfortunately, you need to create an account to download it.
> 
> Jon
> 
> [0] https://developer.nvidia.com/embedded/dlc/parker-series-trm
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
