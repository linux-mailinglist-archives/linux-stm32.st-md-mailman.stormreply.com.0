Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E54784744
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:25:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4879BC6DD8C;
	Tue, 22 Aug 2023 16:25:22 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB074C6B461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 09:50:16 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RRKvm1pyTzrRgx;
 Thu, 17 Aug 2023 17:48:52 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 17 Aug 2023 17:50:13 +0800
Message-ID: <5a885cda-4ee3-6c26-e6ea-5074427e974b@huawei.com>
Date: Thu, 17 Aug 2023 17:50:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US
To: Leon Romanovsky <leon@kernel.org>
References: <20230817071941.346590-1-ruanjinjie@huawei.com>
 <20230817080257.GD22185@unreal>
From: Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <20230817080257.GD22185@unreal>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 22 Aug 2023 16:24:59 +0000
Cc: daniel.machon@microchip.com, simon.horman@corigine.com,
 Steen.Hegelund@microchip.com, linux-stm32@st-md-mailman.stormreply.com,
 horatiu.vultur@microchip.com, edumazet@google.com, joabreu@synopsys.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, lars.povlsen@microchip.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/2] net: Use helper function
	IS_ERR_OR_NULL()
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



On 2023/8/17 16:02, Leon Romanovsky wrote:
> On Thu, Aug 17, 2023 at 03:19:39PM +0800, Ruan Jinjie wrote:
>> Use IS_ERR_OR_NULL() instead of open-coding it
>> to simplify the code.
>>
>> Ruan Jinjie (2):
>>   net: microchip: sparx5: Use helper function IS_ERR_OR_NULL()
>>   net: stmmac: Use helper function IS_ERR_OR_NULL()
>>
>>  drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.c | 2 +-
>>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c        | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
> 
> Thanks,
> Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
> 
> As a side note, grep of vcap_get_rule() shows that many callers don't
> properly check return value and expect it to be or valid or NULL.

Right! I will try to fix these problems together by the way. Thank you!

> 
> For example this code is not correct:
> drivers/net/ethernet/microchip/lan966x/lan966x_ptp.c
>     61         vrule = vcap_get_rule(lan966x->vcap_ctrl, rule_id);
>     62         if (vrule) {
>     63                 u32 value, mask;
>     64
>     65                 /* Just modify the ingress port mask and exit */
>     66                 vcap_rule_get_key_u32(vrule, VCAP_KF_IF_IGR_PORT_MASK,
>     67                                       &value, &mask);
>     68                 mask &= ~BIT(port->chip_port);
>     69                 vcap_rule_mod_key_u32(vrule, VCAP_KF_IF_IGR_PORT_MASK,
>     70                                       value, mask);
>     71
>     72                 err = vcap_mod_rule(vrule);
>     73                 goto free_rule;
>     74         }
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
