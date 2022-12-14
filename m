Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EA164C2EC
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Dec 2022 04:55:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49B1CC6507A;
	Wed, 14 Dec 2022 03:55:49 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00A66C63327
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Dec 2022 03:55:46 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NX1cp2NpyzqT5R;
 Wed, 14 Dec 2022 11:51:22 +0800 (CST)
Received: from [10.67.110.176] (10.67.110.176) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 14 Dec 2022 11:55:27 +0800
To: Jakub Kicinski <kuba@kernel.org>
References: <20221212021350.3066631-1-cuigaosheng1@huawei.com>
 <20221213191528.75cd2ff0@kernel.org>
From: cuigaosheng <cuigaosheng1@huawei.com>
Message-ID: <ae0f5e46-afb2-e103-0c24-2310ad326e55@huawei.com>
Date: Wed, 14 Dec 2022 11:55:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20221213191528.75cd2ff0@kernel.org>
X-Originating-IP: [10.67.110.176]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
Cc: hawk@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, john.fastabend@gmail.com,
 ast@kernel.org, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, boon.leong.ong@intel.com, peppe.cavallaro@st.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: fix possible memory leak
 in stmmac_dvr_probe()
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

Thanks for taking time to review this patch.

I am sorry I missed the errno, and I have submit a new patch to fix it.

Link: https://patchwork.kernel.org/project/netdevbpf/patch/20221214034205.3449908-1-cuigaosheng1@huawei.com/

On 2022/12/14 11:15, Jakub Kicinski wrote:
> On Mon, 12 Dec 2022 10:13:50 +0800 Gaosheng Cui wrote:
>> The bitmap_free() should be called to free priv->af_xdp_zc_qps
>> when create_singlethread_workqueue() fails, otherwise there will
>> be a memory leak, so we add the err path error_wq_init to fix it.
>>
>> Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
>> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> The previous version has already been applied and we can't remove it.
> Could you send an incremental change to just add the errno?
> .
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
