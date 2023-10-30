Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 800417DC05B
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Oct 2023 20:25:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33C5DC6B44B;
	Mon, 30 Oct 2023 19:25:41 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 612CDC6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Oct 2023 19:25:39 +0000 (UTC)
Received: from [192.168.1.90] (unknown [188.24.143.101])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4741D6607391;
 Mon, 30 Oct 2023 19:25:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698693938;
 bh=6na0ZR9aRO2R+DcqR2Kg6XuMNOs2U7/usUJoSt63Jgo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LmtduLEBohoIBG17lrvwaFniYQs/4Q5D32PuptdSL5aD2RAX16HbMTi+8EipJ+IQC
 Pzftnslukemi/OoXAbwqDIgklKwAqidK7OXx/Ro1P8Vv1sUl7Te6vHnz+CObirBhrS
 4m29csR86buGnD8lU5+3qgV/0Eg4XBkgpfuspHu21ocwhtpmftwBrpyQNA6xFJD89G
 OIa1Bxluoq/aIC6QzFqKx/u5U0xGhMpUC+iKjDGGUvXlhCcTbhE7qrldVA0j2pumUZ
 Lj5hczfNdPAYj+lW3amRKLQ6ce8584wbGU7BUWxHvzmzhAkzNiUaId7bsEd/rdtICZ
 1fOk7dLUtWHiQ==
Message-ID: <e70fda8c-a924-44ab-be76-292f315b852a@collabora.com>
Date: Mon, 30 Oct 2023 21:25:34 +0200
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
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-3-cristian.ciocaltea@collabora.com>
 <9c9120d6-dd28-4b6d-be8d-46c0cab8f26a@linaro.org>
 <77ea127f-1040-489c-8ee3-d27df16fb995@collabora.com>
 <6b91a6df-4549-4ca8-9659-c6107f4f8c75@linaro.org>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <6b91a6df-4549-4ca8-9659-c6107f4f8c75@linaro.org>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 02/12] dt-bindings: net: starfive,
 jh7110-dwmac: Drop superfluous select
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

On 10/30/23 09:27, Krzysztof Kozlowski wrote:
> On 29/10/2023 22:08, Cristian Ciocaltea wrote:
>> On 10/29/23 13:18, Krzysztof Kozlowski wrote:
>>> On 29/10/2023 05:27, Cristian Ciocaltea wrote:
>>>> The usage of 'select' doesn't seem to have any influence on how this
>>>> binding schema is applied to the nodes, hence remove it.
>>>>
>>>
>>> It has. Why do you think it doesn't? You should see new errors from
>>> dwmac schema.
>>
>> This patch came as a result of testing both variants (w/ and w/o
>> 'select') with several different compatible strings and seeing
>> consistent output:
>>
>> - "starfive,jh7110-dwmac", "invalid";
>> - "starfive,jh7110-dwmac";
>> - "invalid", "snps,dwmac-5.20";
>> - "invalid"
>>
>> Did I miss something?
> 
> Testing all bindings? The select is there to prevent matching unrelated
> bindings.

Indeed, my bad, as I've been using DT_SCHEMA_FILES to restrict the scope
during initial testing and missed to include later other schemas for an
extended validation (note that since [1] it's possible to specify a list
of file paths separated by ':').

Will drop this in v3.

[1] 25eba1598c8e ("dt-bindings: Fix multi pattern support in
DT_SCHEMA_FILES")

Thanks,
Cristian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
