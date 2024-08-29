Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9ED963831
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Aug 2024 04:29:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE46DC6C855;
	Thu, 29 Aug 2024 02:29:44 +0000 (UTC)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83CDCC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Aug 2024 02:29:37 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WvQ8r6wKtz20n3V;
 Thu, 29 Aug 2024 10:24:44 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 0BD531400FD;
 Thu, 29 Aug 2024 10:29:35 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 29 Aug 2024 10:29:33 +0800
Message-ID: <5fbe123d-99d1-1b48-4c84-fe8e1b0cf109@huawei.com>
Date: Thu, 29 Aug 2024 10:29:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
References: <20240828032343.1218749-1-ruanjinjie@huawei.com>
 <20240828032343.1218749-2-ruanjinjie@huawei.com>
 <52435305-d134-4cee-8660-f7bf60206ddf@lunn.ch>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <52435305-d134-4cee-8660-f7bf60206ddf@lunn.ch>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemh500013.china.huawei.com (7.202.181.146)
Cc: linus.walleij@linaro.org, justin.chen@broadcom.com, edumazet@google.com,
 krzk@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 f.fainelli@gmail.com, samuel@sholland.org, linux@armlinux.org.uk,
 jernej.skrabec@gmail.com, wens@csie.org, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org, pabeni@redhat.com,
 ansuelsmth@gmail.com, sebastian.hesselbarth@gmail.com,
 woojung.huh@microchip.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, mcoquelin.stm32@gmail.com, alsi@bang-olufsen.dk,
 olteanv@gmail.com, linux-sunxi@lists.linux.dev, davem@davemloft.net,
 jic23@kernel.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v2 01/13] net: stmmac:
 dwmac-sun8i: Use for_each_child_of_node_scoped()
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



On 2024/8/28 22:17, Andrew Lunn wrote:
> On Wed, Aug 28, 2024 at 11:23:31AM +0800, Jinjie Ruan wrote:
>> Avoid need to manually handle of_node_put() by using
>> for_each_child_of_node_scoped(), which can simplfy code.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
>> index cc93f73a380e..8c5b4e0c0976 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
>> @@ -774,7 +774,7 @@ static int sun8i_dwmac_reset(struct stmmac_priv *priv)
>>  static int get_ephy_nodes(struct stmmac_priv *priv)
>>  {
>>  	struct sunxi_priv_data *gmac = priv->plat->bsp_priv;
>> -	struct device_node *mdio_mux, *iphynode;
>> +	struct device_node *mdio_mux;
>>  	struct device_node *mdio_internal;
>>  	int ret;
> 
> Networking uses reverse Christmas tree. Variables are sorted, longest
> first, shortest last. So you need to move mdio_mux after
> mdio_internal.

Right, it will look more clear.

> 
> The rest looks O.K.
> 
> 
>     Andrew
> 
> ---
> pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
