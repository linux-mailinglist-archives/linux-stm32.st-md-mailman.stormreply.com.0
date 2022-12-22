Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EB865441C
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Dec 2022 16:19:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 535B9C6904C;
	Thu, 22 Dec 2022 15:19:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FBB0C64109
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Dec 2022 15:19:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DD11B61BA6;
 Thu, 22 Dec 2022 15:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A20AC433D2;
 Thu, 22 Dec 2022 15:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671722354;
 bh=unTLqCW294ZnziRAsuuEh/oxlIS4oUlm60//dw9SIC0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JHFTakD/nnQ1PpVS5ppaccSrB0w8EB04rF49hOcG0adJQrwwjnTPAQiPs47Hzn4Cn
 M1ek1myDBjkdK7fj7b8Sic/2IwZAJw5jcUOuF9EDfSxhRfzDnkSFE0igaDOAcPfjOx
 LXoBI+lxKPf/8pzRXD6WV6LK/SGO0CR8WwO3Cc+OUUCEaxrK40jSLxMjXqMYRznS8J
 qL8niByvNzeIHN+I56sXcs0KWt2IIcX/JTYAvFQI/rOmd3LxH/YxrJ+0/hCttk3kpC
 VFLgfkkLal7LOk5LJPkYxJ6lomlgH8xwEFlnb2D6RHYmCql8Jj5I4qcjvPIc7bQejy
 8WdXNj3xn4jlQ==
Message-ID: <f3ace6f0-12fb-8e97-5115-5511b4ffb223@kernel.org>
Date: Thu, 22 Dec 2022 16:19:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 alexandre.torgue@foss.st.com, robh+dt@kernel.org,
 Oleksii_Moisieiev@epam.com, linus.walleij@linaro.org,
 gregkh@linuxfoundation.org
References: <20221221173055.11719-1-gatien.chevallier@foss.st.com>
 <20221221173055.11719-6-gatien.chevallier@foss.st.com>
 <ed8aa4d3-9570-eb72-a7d4-3b690adc3a6d@kernel.org>
 <e2086a52-4db8-e247-43de-c78ffa479634@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <e2086a52-4db8-e247-43de-c78ffa479634@foss.st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH 5/7] bus: stm32_sys_bus: add support
 for STM32MP15 and STM32MP13 system bus
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

On 22/12/2022 15:30, Gatien CHEVALLIER wrote:
>>
>>> +	if (IS_ERR(mmio))
>>> +		return PTR_ERR(mmio);
>>> +
>>> +	pdata->sys_bus_base = mmio;
>>> +
>>> +	mdata = (struct stm32_sys_bus_match_data *)of_device_get_match_data(&pdev->dev);
>>
>> Why do you need the cast?
> 
> I do not :) TBH, mdata is not useful at all. Changing to directly assign 
> to pdata->pconf, that is now const there is no reason to modify it.

mdata should be const and then no need for cast.

> 
>>
>>> +	if (!mdata)
>>
>> Can you explain the case when this can actually happen? If it can, you
>> have bug in ID table.
> 
> No I cannot as the driver is probed. It is only a sanity check, I can 
> remove it for V3. However the function can return NULL... Would you 
> prefer an explicit check on NULL or a simple removal?

I propose to drop it. This simply cannot happen.

> 
>>
>>> +		return -EINVAL;
>>> +

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
