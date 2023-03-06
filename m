Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C65A6AD2F7
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Mar 2023 00:46:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12CB2C65E73;
	Mon,  6 Mar 2023 23:46:19 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C493C57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Mar 2023 23:46:17 +0000 (UTC)
Received: from [192.168.1.90] (unknown [188.24.156.231])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3BA6B6602F5E;
 Mon,  6 Mar 2023 23:46:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678146376;
 bh=NEoWyHe0xORmwmkapLJCDAiOtq7Nhqyrhrxnf11E9X0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=b7wEyD48eZrqKBBwbQBZGMDDqMv7sy8/YQfCNfrJlB94wRymvBrK30IppzEUOccJg
 EMi7WAao0h0YenfHKwuoTwA8eKHToT6ZoBkyjppspncS+qBobyyuBUoZUeZOoRRVGd
 nleQJwIJCrxzdyMzcLGeVhykAaNIffgea13u3HiWF4LH0iBCQxDMvEGRDwLi8dKk2z
 w+OXPZ3X29oxw7AM+9ZNaJCEWrQIHsq1/2F2mQYo6Q6+OyK3MBXR8iR9SplMEntAP9
 yl4y5mQIqv0cNpHkh5jEFW/QGk+m7o/9PSs6iyFhQN9eaLlYyuIyaguPanA4/nNbR5
 5FXdYSDVr4gKg==
Message-ID: <243aebb3-70d8-3d83-cb8f-bd1e67e6707e@collabora.com>
Date: Tue, 7 Mar 2023 01:46:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-4-cristian.ciocaltea@collabora.com>
 <b969cf86-d5df-462a-982b-c5b67f97c3d6@spud>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <b969cf86-d5df-462a-982b-c5b67f97c3d6@spud>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Yanhong Wang <yanhong.wang@starfivetech.com>, Lee Jones <lee@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 03/12] soc: sifive: ccache: Add StarFive
	JH7100 support
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

On 3/7/23 01:32, Conor Dooley wrote:
> On Sat, Feb 11, 2023 at 05:18:12AM +0200, Cristian Ciocaltea wrote:
>> From: Emil Renner Berthing <kernel@esmil.dk>
>>
>> This adds support for the StarFive JH7100 SoC which also feature this
>> SiFive cache controller.
>>
>> Unfortunately the interrupt for uncorrected data is broken on the JH7100
>> and fires continuously, so add a quirk to not register a handler for it.
>>
>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> [drop JH7110, rework Kconfig]
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> This driver doesn't really do very much of anything as things stand, so
> I don't see really see all that much value in picking it up right now,
> since the non-coherent bits aren't usable yet.
> 
>> ---
>>   drivers/soc/sifive/Kconfig         |  1 +
>>   drivers/soc/sifive/sifive_ccache.c | 11 ++++++++++-
>>   2 files changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/sifive/Kconfig b/drivers/soc/sifive/Kconfig
>> index e86870be34c9..867cf16273a4 100644
>> --- a/drivers/soc/sifive/Kconfig
>> +++ b/drivers/soc/sifive/Kconfig
>> @@ -4,6 +4,7 @@ if SOC_SIFIVE || SOC_STARFIVE
>>   
>>   config SIFIVE_CCACHE
>>   	bool "Sifive Composable Cache controller"
>> +	default SOC_STARFIVE
> 
> I don't think this should have a default set w/ the support that this
> patch brings in. Perhaps later we should be doing defaulting, but not at
> this point in the series.

I will handle this is v2 as soon as the non-coherency stuff is ready.

> Other than that, this is fine by me:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for reviewing,
Cristian

> Thanks,
> Conor.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
