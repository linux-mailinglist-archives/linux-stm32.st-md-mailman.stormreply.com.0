Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BDA76B27
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jul 2019 16:11:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64911C1635F;
	Fri, 26 Jul 2019 14:11:08 +0000 (UTC)
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F309C1635C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jul 2019 14:11:06 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d3b09f60000>; Fri, 26 Jul 2019 07:11:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 26 Jul 2019 07:11:04 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 26 Jul 2019 07:11:04 -0700
Received: from [10.26.11.58] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 26 Jul
 2019 14:11:01 +0000
To: Jose Abreu <Jose.Abreu@synopsys.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <cover.1562149883.git.joabreu@synopsys.com>
 <1b254bb7fc6044c5e6e2fdd9e00088d1d13a808b.1562149883.git.joabreu@synopsys.com>
 <7a79be5d-7ba2-c457-36d3-1ccef6572181@nvidia.com>
 <BYAPR12MB3269927AB1F67D46E150ED6BD3C10@BYAPR12MB3269.namprd12.prod.outlook.com>
 <9e695f33-fd9f-a910-0891-2b63bd75e082@nvidia.com>
 <BYAPR12MB3269B4A401E4DA10A07515C7D3C10@BYAPR12MB3269.namprd12.prod.outlook.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <1e2ea942-28fe-15b9-f675-8d6585f9a33f@nvidia.com>
Date: Fri, 26 Jul 2019 15:11:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <BYAPR12MB3269B4A401E4DA10A07515C7D3C10@BYAPR12MB3269.namprd12.prod.outlook.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1564150262; bh=7V/0vUwcrIsIcIy2xWgyyeEieWEZr2FRYFdBVkYbeyQ=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=mJDWo1CPsTJea2C7XpERAf9KXg8RisOceJD+uSLFeI1yyUzkGurA7BChg+6xKS9wa
 yLkxSzCVyt6hC2yWO1w5HZUPPkPCFd/KbaZtV1vWd5NCVt+3LH+09luniQCev/R06V
 ClVqhzPr+ebBRMamcTph3XbpD1oJSLEHC+tQQq8zN5FTrYrLk2FbwMVCPLYelEhzGv
 1Ba0uS43gyhxp68YWyqG7GN1bJasAEjqijE1paEjN/rJe5I8or0GrIRwvZNrPQboZy
 vb6yMlFe8nldtK2ANvrJp/Zj9fVC6e7JkvK3TBe7+O8Hu1OXs7SP6j8/nZfoB5pQN2
 04nm16vaN1x0g==
Cc: Joao Pinto <Joao.Pinto@synopsys.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Robin Murphy <robin.murphy@arm.com>, "David S .
 Miller" <davem@davemloft.net>
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


On 25/07/2019 16:12, Jose Abreu wrote:
> From: Jon Hunter <jonathanh@nvidia.com>
> Date: Jul/25/2019, 15:25:59 (UTC+00:00)
> 
>>
>> On 25/07/2019 14:26, Jose Abreu wrote:
>>
>> ...
>>
>>> Well, I wasn't expecting that :/
>>>
>>> Per documentation of barriers I think we should set descriptor fields 
>>> and then barrier and finally ownership to HW so that remaining fields 
>>> are coherent before owner is set.
>>>
>>> Anyway, can you also add a dma_rmb() after the call to 
>>> stmmac_rx_status() ?
>>
>> Yes. I removed the debug print added the barrier, but that did not help.
> 
> So, I was finally able to setup NFS using your replicated setup and I 
> can't see the issue :(
> 
> The only difference I have from yours is that I'm using TCP in NFS 
> whilst you (I believe from the logs), use UDP.

So I tried TCP by setting the kernel boot params to 'nfsvers=3' and
'proto=tcp' and this does appear to be more stable, but not 100% stable.
It still appears to fail in the same place about 50% of the time.

> You do have flow control active right ? And your HW FIFO size is >= 4k ?

How can I verify if flow control is active?

The documentation for this device indicates a max transfer size of 16kB
for TX and RX.

Cheers
Jon

-- 
nvpublic
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
