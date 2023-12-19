Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C188188BB
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Dec 2023 14:37:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 106C9C6B461;
	Tue, 19 Dec 2023 13:37:03 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27C64C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Dec 2023 13:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1702993021;
 bh=FnY6knylJ3x5vm9CnT/Sy6SqYuEWSlZ8nKY07PB5N7Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rr/fsctIrfTYaB6wwgAqsttKJXuqFEYeaGHdO+RJUJx6mCnkUHNcbAmTsAv6hHtz6
 HWU/k63GGZPmCPkoC9UHuhiYM/WE4xnxpAp9lY7KOp/yy/aHG59CzEK6ae141k4iy2
 ylfrB0Sl7xcYDxL0qJ/RiVjxDqBMokBKDX9oRNhd7F/jrw+TEr6sObE7JXzSWliHDG
 O8B1yPGN20H3Pr4IuFPnN0jlNyfrnNfBFI0AtX2LFY6lPtKGxF1oOlnKYl60VAjjJL
 BfCwuad1t7Mz4l63tcJxsvYvM7a+iquoBaxInwxx8kFCelNCoxO0SfT/b0kM9q/E7x
 agTbnn5KDVMWQ==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id A413B378145A;
 Tue, 19 Dec 2023 13:36:59 +0000 (UTC)
Message-ID: <50f0a002-f602-4cdb-ab18-e085adbf09bc@collabora.com>
Date: Tue, 19 Dec 2023 15:36:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Samin Guo <samin.guo@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
References: <20231218214451.2345691-1-cristian.ciocaltea@collabora.com>
 <20231218214451.2345691-3-cristian.ciocaltea@collabora.com>
 <c9225053-78f8-40b7-9453-dc3dabe44500@linaro.org>
 <d030f5b7-8d32-4a80-a3c0-98cfa1c0fe4f@collabora.com>
 <15077e1f-c13b-4424-9918-df441b56b695@linaro.org>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <15077e1f-c13b-4424-9918-df441b56b695@linaro.org>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 2/9] dt-bindings: net: starfive,
 jh7110-dwmac: Add JH7100 SoC compatible
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

On 12/19/23 15:19, Krzysztof Kozlowski wrote:
> On 19/12/2023 13:49, Cristian Ciocaltea wrote:
>>>>    reg:
>>>>      maxItems: 1
>>>> @@ -46,23 +50,6 @@ properties:
>>>>        - const: tx
>>>>        - const: gtx
>>>>  
>>>> -  interrupts:
>>>> -    minItems: 3
>>>> -    maxItems: 3
>>>> -
>>>> -  interrupt-names:
>>>> -    minItems: 3
>>>> -    maxItems: 3
>>>> -
>>>> -  resets:
>>>> -    minItems: 2
>>>> -    maxItems: 2
>>>
>>> What is the point of your previous patch if you immediately remove it?
>>> It is a no-op. Just mention in this commit msg, that both resets and
>>> reset-names are coming from snps,dwmac so they can be removed from
>>> top-level entirely.
>>
>> This has been discussed during v2 review [1], where I also provided the
>> rational behind not updating reset-names. So the code was not deleted,
>> but moved under an if clause.
>>
>> Thanks for reviewing,
>> Cristian
>>
>> [1]: https://lore.kernel.org/lkml/f4d0b216-5bdc-4559-aabb-8af638d33721@collabora.com/
> 
> I don't see it being addressed:
> 
> https://lore.kernel.org/lkml/35556392-3b9a-4997-b482-082dc2f9121f@linaro.org/
> 
> Repeating the same and the same :/

I think this was just a misunderstanding, sorry for the confusion.  I
kept two sets of changes which were not directly related into separate
patches, so I'm going to squash them in v5.

Thanks,
Cristian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
