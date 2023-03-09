Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D7C6B28F7
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 16:41:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC629C6A60D;
	Thu,  9 Mar 2023 15:41:10 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 321F2C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 15:41:10 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so1528939wmq.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 07:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678376469;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=thHKQQTXmNqo7+agzCDK9DfO3aLKYlwKu3AriL3BjPg=;
 b=gJ2r1RFLFeBfkIT/MugmSb5mkRuueMrpeZW9ljS6WJwcDSNGf609jDWEGhUDaHEezx
 cZ2rzK8O84Ns9L3RtlsXsMJRPxISQd1EIm/PK9KtKi5sy/DnsXChGUZ+rDKG6diE8pR1
 bvqxe64DPNRU+Y3LVE795yrOjPTh/8LMBVj/AFkzsYU6KDhfcV18n1doWjxTyXqEyBrA
 xdb5EG61TWJtW1P5i7IQkl6EAZy5htVaEvuJJZhD92utvd6odYUZwwcIcRg7H2ZYWCkt
 sN8F8s+f/2dKAKUwUrpJ19SobSCbYCghvKAu424U1Jj7fh2YzZxH3g7DP6XiW1U2c1T/
 LT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678376469;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=thHKQQTXmNqo7+agzCDK9DfO3aLKYlwKu3AriL3BjPg=;
 b=XIcaJZPF8wPC6oyNCNf+9egzYPJWxrY+CRoWtYgwXK9H4zO7uB+EgO7v9xOvQDn2XA
 hfgpgFtQQiFRbPjPw8CHpZHgNoFsFxtiNO8HE39I0vmYWo/cvLTG6QKvEwwlJDqE2zhb
 c1KepjtQ0EiQgw0EVjYE2HxpPCAbzwFh7oZ91pVKmollIMsyGk6+nRGCccAJ3BDukXXb
 GMwUz2hBg7jRxoa0VRlfygvpiz3vyN7N7b4hcGhhfq5lc/MyIoI0w3ZWc9h/AZrN2M+P
 hqMfPRepKZXQ703MTMFrC/JVvnwCUXzOncmmKcBlrWGge0+gHciloC3QMcsSHccUYCxI
 ArYA==
X-Gm-Message-State: AO0yUKUx/ixYuLBBXMQ/+TEbSIZ5rKMZte9L3wEkZAXBd6pWNHaIvRmh
 zVlwlAL9Pos/4M32h5f6HpOqVA==
X-Google-Smtp-Source: AK7set85qnSSVIK+/VfxFa63URER6rmyYNQB/XVwahWExbs8/RUsgm9XOIYiq9V5NrA4EQ+yUhQcHA==
X-Received: by 2002:a05:600c:4ecf:b0:3eb:399d:ab1a with SMTP id
 g15-20020a05600c4ecf00b003eb399dab1amr19180672wmq.21.1678376469612; 
 Thu, 09 Mar 2023 07:41:09 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.78])
 by smtp.gmail.com with ESMTPSA id
 18-20020a05600c229200b003dc4a47605fsm257344wmf.8.2023.03.09.07.41.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 07:41:09 -0800 (PST)
Message-ID: <99ff644b-7734-44a4-6b3e-493dab843334@linaro.org>
Date: Thu, 9 Mar 2023 17:41:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
 <20220925220304.buk3yuqoh6vszfci@mobilestation>
 <18e6e8a8-6412-7e31-21e0-6becd4400ac1@microchip.com>
 <20220926172454.kbpzck7med5bopre@mobilestation>
 <1766f6ef-d9d8-04f7-a6bf-0ea6bc0b3d23@linaro.org>
 <f647e713a65f5d3f0f2e3af95c4d0a89@walle.cc>
 <1849e2c8-54f5-9e56-4ed8-8b0e4a826d04@linaro.org>
 <302ecf0421fe4c99fca3eb0ca2f66127@walle.cc>
 <5183a184-c72d-3acd-70cd-6aa1e31533f5@linaro.org>
 <03a9f117316ab81f1b5a18100f771e65@walle.cc>
 <6c2090bf-d102-a333-3a83-03abe81ff70e@linaro.org>
 <460ef5ff3846b409b322ca53559e2476@walle.cc>
 <b8b61fc0-1e4f-146b-2036-03fda5359585@linaro.org>
 <bf57f3aafc3e0a02c81dab905ce9497e@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <bf57f3aafc3e0a02c81dab905ce9497e@walle.cc>
Cc: alexandre.belloni@bootlin.com, vigneshr@ti.com,
 linux-aspeed@lists.ozlabs.org, tali.perry1@gmail.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 linux-spi@vger.kernel.org, michal.simek@xilinx.com, tmaimon77@gmail.com,
 benjaminfair@google.com, kdasu.kdev@gmail.com, richard@nod.at,
 chin-ting_kuo@aspeedtech.com, Sergiu.Moga@microchip.com, haibo.chen@nxp.com,
 openbmc@lists.ozlabs.org, yuenn@google.com,
 bcm-kernel-feedback-list@broadcom.com, joel@jms.id.au, yogeshgaur.83@gmail.com,
 linux-rockchip@lists.infradead.org,
 Tudor Ambarus <tudor.ambarus@microchip.com>, john.garry@huawei.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 clg@kaod.org, matthias.bgg@gmail.com, han.xu@nxp.com,
 linux-arm-kernel@lists.infradead.org, andrew@aj.id.au, venture@google.com,
 linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de,
 Nicolas.Ferre@microchip.com, Serge Semin <fancer.lancer@gmail.com>,
 linux-kernel@vger.kernel.org, avifishman70@gmail.com,
 mcoquelin.stm32@gmail.com, Claudiu.Beznea@microchip.com,
 Pratyush Yadav <pratyush@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] spi: Replace `dummy.nbytes` with
	`dummy.ncycles`
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



On 09.03.2023 16:01, Michael Walle wrote:
> Am 2023-03-09 14:54, schrieb Tudor Ambarus:
>> On 09.03.2023 15:33, Michael Walle wrote:
>>>>>> The controllers that can talk in dummy ncycles don't need the
>>>>>> dummy.{buswidth, dtr} fields.
>>>>>>
>>>>>> The controllers that can't talk in dummy cycles, but only on a "byte"
>>>>>> boundary need both buswidth and dtr fields. Assume a flash needs 32
>>>>>> dummy cycles for an op on 8D-8D-8D mode. If the controller does 
>>>>>> not have
>>>>>> the buswidth and dtr info, it can't convert the dummy ncycles to 
>>>>>> nbytes.
>>>>>> If he knows only that buswidth is 8, it will convert ncycles to 4 
>>>>>> bytes.
>>>>>> If dtr is also specified it converts ncycles to 2 bytes.
>>>>>
>>>>> No they don't need it. Lets take your semper flash and assume it needs
>>>>> 12 latency cycles. SPI-NOR will set ncycles to 12 *regardless of 
>>>>> the mode
>>>>> or dtr setting*. The controller then knows we need 12 clock cycles. 
>>>>> It has
>>>>> then to figure out how that can be achieved. E.g. if it can only do 
>>>>> the
>>>>> "old" byte programming and is in quad mode, good for it. It will 
>>>>> send 6
>>>>> dummy bytes, which will result in 12 dummy clock cycles, because 1 
>>>>> byte
>>>>> takes two clock cycles in quad SDR mode. If its in octal mode, send 12
>>>>> bytes. If its in dual mode, send 3 bytes. Obiously, it cannot be in
>>>>> single bit mode, because it cannot send 1.5 bytes..
>>>>>
>>>>
>>>> You miss the fact that you can have 1-1-4. What buswidth do you use
>>>> for dummy, the address buswidth or the data buswidth?
>>>
>>> Doesn't matter, does it? The driver is free to chose, 1, 4, or anything
>>> else. You don't sample any data during the dummy phase.
>>> To answer your question: single for instruction, single for address,
>>> whatever you choose for dummy as long as there are ncycles space between
>>> address and data, and quad for data.
>>
>> Huh? How does the controller chose, based on what?
> 
> Based on its own capabilities. It can choose either way. In the end

Okay, I'll go again through all the spi controllers and check if we can
determine the dummy nbytes based on controller caps. Thanks!

> what matters is how many clock cycles there are between the address
> and data phase. And you only need to convey that information to the
> SPI controller - your new ncycles.
> 
> -michael
> 
>>> Depending on the capabilites of the hardware it will likely be 1 or 4.
>>>
>>>> What happens if crazy protocols like 1S-1S-8D appear? What buswidth
>>>> and transfer mode are you going to use for dummy?
>>>
>>> Also doesn't matter. What matters is how many dummy clock cycles you
>>> do. Again, they don't depent on the mode. You just have to count
>>> the clock cycles between the address and the data phase (and that is
>>> what your ncycle parameter will tell the controller).
>>>
>>>> And please don't tell me that "we're going to assume that
>>>> dummy.buswidth = address.buswidth because that's what we currently do
>>>> in SPI NOR", because I'm not convinced that the assumption is correct.
>>>
>>> No, it doesn't matter :)
>>>
>>> -michael
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
