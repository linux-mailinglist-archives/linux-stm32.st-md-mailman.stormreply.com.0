Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC869638C6
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Aug 2024 05:27:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22250C6DD6E;
	Thu, 29 Aug 2024 03:27:12 +0000 (UTC)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC1B6C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Aug 2024 03:27:03 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.105])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4WvRWm3J4Bz18MpC;
 Thu, 29 Aug 2024 11:26:12 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 85A8C1401F2;
 Thu, 29 Aug 2024 11:27:01 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 29 Aug 2024 11:27:00 +0800
Message-ID: <b5b7346d-83ea-846a-1187-3d39ee5177f3@huawei.com>
Date: Thu, 29 Aug 2024 11:26:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
References: <20240828032343.1218749-1-ruanjinjie@huawei.com>
 <6092e318-ae0c-44f6-89fa-989a384921b7@lunn.ch>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <6092e318-ae0c-44f6-89fa-989a384921b7@lunn.ch>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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
Subject: Re: [Linux-stm32] [PATCH net-next v2 00/13] net: Simplified with
	scoped function
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



On 2024/8/28 22:32, Andrew Lunn wrote:
> On Wed, Aug 28, 2024 at 11:23:30AM +0800, Jinjie Ruan wrote:
>> Simplify with scoped for each OF child loop and __free(), as well as
>> dev_err_probe().
>>
>> Changes in v2:
>> - Subject prefix: next -> net-next.
>> - Split __free() from scoped for each OF child loop clean.
>> - Fix use of_node_put() instead of __free() for the 5th patch.
> 
> I personally think all these __free() are ugly and magical. Can it
> somehow be made part of of_get_child_by_name()? Add an
> of_get_child_by_name_func_ref() which holds a reference to the node
> for the scope of the function?

Yes, that is a good idea, and the __free() doesn't look as readable as
or_each_*child_of_node_scoped().

> 
> for_each_available_child_of_node_scoped() is fine. Once you have fixed
> all the reverse christmas tree, please submit them. But i would like
> to see alternatives to __free(), once which are less ugly.

Thank you!

> 
> 	Andrew
> 
> ---
> pw-bot: cr
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
