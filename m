Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C280895EF24
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Aug 2024 12:56:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EEC7C7801B;
	Mon, 26 Aug 2024 10:56:50 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D19E7C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 10:56:42 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.48])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Wsnf2232YzyP9Y;
 Mon, 26 Aug 2024 18:55:54 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 1869618006C;
 Mon, 26 Aug 2024 18:56:40 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 26 Aug 2024 18:56:38 +0800
Message-ID: <ade6d403-e54c-80fb-7d51-1e00602fcbfb@huawei.com>
Date: Mon, 26 Aug 2024 18:56:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>
References: <20240826094328.2991664-1-ruanjinjie@huawei.com>
 <20240826115213.389acaef@xps-13>
 <f7430f87-88d2-4c08-bc1e-6bb3da4e332c@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <f7430f87-88d2-4c08-bc1e-6bb3da4e332c@kernel.org>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemh500013.china.huawei.com (7.202.181.146)
Cc: val@packett.cool, vigneshr@ti.com, kees@kernel.org,
 linux-kernel@vger.kernel.org, erick.archer@gmx.com, liang.yang@amlogic.com,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 heiko@sntech.de, robh@kernel.org, samuel@sholland.org, richard@nod.at,
 jernej.skrabec@gmail.com, linux-rockchip@lists.infradead.org, wens@csie.org,
 u.kleine-koenig@pengutronix.de, jbrunet@baylibre.com, linux@treblig.org,
 martin.blumenstingl@googlemail.com, christophe.jaillet@wanadoo.fr,
 matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org,
 gustavoars@kernel.org, linux-renesas-soc@vger.kernel.org,
 mcoquelin.stm32@gmail.com, khilman@baylibre.com,
 linux-mediatek@lists.infradead.org, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH -next RESEND 00/10] mtd: Use
 for_each_child_of_node_scoped()
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



On 2024/8/26 18:19, Krzysztof Kozlowski wrote:
> On 26/08/2024 11:52, Miquel Raynal wrote:
>> Hi Jinjie,
>>
>> ruanjinjie@huawei.com wrote on Mon, 26 Aug 2024 17:43:18 +0800:
>>
>>> Use scoped for_each_available_child_of_node_scoped() when iterating over
>>> device nodes to make code a bit simpler.
>>
>> Why is this a resend ? Did I miss a previous iteration?
> 
> You were not cc-ed on previous iteration. I asked for proper split
> between subsystems and sending to maintainers, thus this resend.
> 
> Although for such big patchset, I would expect some waiting time, not
> sending immediately.

Sorry, I will pay attention to it later.

> 
> Best regards,
> Krzysztof
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
