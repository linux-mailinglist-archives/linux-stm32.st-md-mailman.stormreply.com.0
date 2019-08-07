Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD19384848
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Aug 2019 10:55:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77D36C35E02;
	Wed,  7 Aug 2019 08:55:27 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00ECFC36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Aug 2019 08:55:25 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 0F55E792C2D0D19DC382;
 Wed,  7 Aug 2019 16:55:23 +0800 (CST)
Received: from [127.0.0.1] (10.74.221.148) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Wed, 7 Aug 2019
 16:55:13 +0800
To: Jose Abreu <Jose.Abreu@synopsys.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
References: <1565165849-16246-1-git-send-email-zhangshaokun@hisilicon.com>
 <BN8PR12MB3266D248C58DB7ABE6238A49D3D40@BN8PR12MB3266.namprd12.prod.outlook.com>
From: Shaokun Zhang <zhangshaokun@hisilicon.com>
Message-ID: <5baf1da1-31b6-3707-684a-8983b6ac2252@hisilicon.com>
Date: Wed, 7 Aug 2019 16:55:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <BN8PR12MB3266D248C58DB7ABE6238A49D3D40@BN8PR12MB3266.namprd12.prod.outlook.com>
X-Originating-IP: [10.74.221.148]
X-CFilter-Loop: Reflected
Cc: yuqi jin <jinyuqi@huawei.com>, "David
 S. Miller" <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Fix the miscalculation of
 mapping from rxq to dma channel
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

Hi Jose,

Thanks your quick reply.

On 2019/8/7 16:24, Jose Abreu wrote:
> From: Shaokun Zhang <zhangshaokun@hisilicon.com>
> Date: Aug/07/2019, 09:17:29 (UTC+00:00)
> 
>> From: yuqi jin <jinyuqi@huawei.com>
>>
>> XGMAC_MTL_RXQ_DMA_MAP1 will be configured if the number of queues is
>> greater than 3, but local variable chan will shift left more than 32-bits.
>> Let's fix this issue.
> 
> This was already fixed in -net. Please see [1]
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git/co
> mmit/drivers/net/ethernet/stmicro/stmmac?id=e8df7e8c233a18d2704e37ecff475
> 83b494789d3
> 
> ---
> Thanks,
> Jose Miguel Abreu
> 
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
