Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C41871798
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jul 2019 13:59:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 051C4CF9F62;
	Tue, 23 Jul 2019 11:59:04 +0000 (UTC)
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5703ACF9F60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jul 2019 11:59:02 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d36f6820000>; Tue, 23 Jul 2019 04:58:58 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 23 Jul 2019 04:59:00 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 23 Jul 2019 04:59:00 -0700
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 23 Jul
 2019 11:58:57 +0000
To: Jose Abreu <Jose.Abreu@synopsys.com>, Lars Persson <lists@bofh.nu>, Ilias
 Apalodimas <ilias.apalodimas@linaro.org>
References: <cover.1562149883.git.joabreu@synopsys.com>
 <1b254bb7fc6044c5e6e2fdd9e00088d1d13a808b.1562149883.git.joabreu@synopsys.com>
 <29dcc161-f7c8-026e-c3cc-5adb04df128c@nvidia.com>
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
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <8093e352-d992-e17f-7168-5afbd9d3fb3f@nvidia.com>
Date: Tue, 23 Jul 2019 12:58:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <BYAPR12MB3269D050556BD51030DCDDFCD3C70@BYAPR12MB3269.namprd12.prod.outlook.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1563883138; bh=ltRnVbLiQSFKSAtuQOn1kVqwZQIHGg8FQt3t/2JTTAw=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=nckF/xSSl5CUSLnADA06s9rLFKlf1j+NQ36AAs3l12mDBvEHxNcd+lr/agHZoR1Ee
 lQNd8A84gwBq8SKW3wdjQYDab3StXWudiz++tv6YjPEBU6zXOmukv459OfCRLy9NrP
 50ejy3S8R1Ft8sjzCnFbND4K0v8QoIX2Jwad7vUcWyUDB/tmLdSn3HbCCQ+YniEBMp
 cYuiDcuXqWNrj036u9Afm+kcDVTvvwY0iMc6im4QObVaB0ktRqCvCud0Y8zar3D5A0
 KABZkLi0Hu/rVl8gUZfyftPjPnLdtcDFLlxuogBrN8oDTbb7B8amgP8JsbCwqyb4YZ
 YPveTUx+xZrwA==
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


On 23/07/2019 11:49, Jose Abreu wrote:
> From: Jon Hunter <jonathanh@nvidia.com>
> Date: Jul/23/2019, 11:38:33 (UTC+00:00)
> 
>>
>> On 23/07/2019 11:07, Jose Abreu wrote:
>>> From: Jon Hunter <jonathanh@nvidia.com>
>>> Date: Jul/23/2019, 11:01:24 (UTC+00:00)
>>>
>>>> This appears to be a winner and by disabling the SMMU for the ethernet
>>>> controller and reverting commit 954a03be033c7cef80ddc232e7cbdb17df735663
>>>> this worked! So yes appears to be related to the SMMU being enabled. We
>>>> had to enable the SMMU for ethernet recently due to commit
>>>> 954a03be033c7cef80ddc232e7cbdb17df735663.
>>>
>>> Finally :)
>>>
>>> However, from "git show 954a03be033c7cef80ddc232e7cbdb17df735663":
>>>
>>> +         There are few reasons to allow unmatched stream bypass, and
>>> +         even fewer good ones.  If saying YES here breaks your board
>>> +         you should work on fixing your board.
>>>
>>> So, how can we fix this ? Is your ethernet DT node marked as 
>>> "dma-coherent;" ?
>>
>> TBH I have no idea. I can't say I fully understand your change or how it
>> is breaking things for us.
>>
>> Currently, the Tegra DT binding does not have 'dma-coherent' set. I see
>> this is optional, but I am not sure how you determine whether or not
>> this should be set.
> 
> From my understanding it means that your device / IP DMA accesses are coherent regarding the CPU point of view. I think it will be the case if GMAC is not behind any kind of IOMMU in the HW arch.

I understand what coherency is, I just don't know how you tell if this
implementation of the ethernet controller is coherent or not.

Jon

-- 
nvpublic
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
