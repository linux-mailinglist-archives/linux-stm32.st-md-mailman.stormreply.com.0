Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F82706C8C
	for <lists+linux-stm32@lfdr.de>; Wed, 17 May 2023 17:23:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7E97C6B442;
	Wed, 17 May 2023 15:23:16 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79862C6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 May 2023 15:23:15 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-50bc0117683so1682131a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 May 2023 08:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684336995; x=1686928995;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9+zkVtFJZH/s/sKmb4Z8mX0ZyNeCSr7JQnjUSM8vJbU=;
 b=XOJ7UidV7vBcKsNvYy0i6hI3SXR8MinSpo8BS2kNkNEr6R3kCJ6pLCTX7WGWZTxIUL
 EJ3Nce8MX7iCpyr1f5uKpeKDizDGNwsRfIDHEVeUZMMIbR7HuRIruxcXeVhwCPvVBq5q
 dYfjXwks/D4nWnLJexNp3QucAB4g9L/FdSTaT53bS+wfnJqJb5PVxw0yTMnDQdomE4vU
 Hc0ZlFT0wpU0Q8SYC9hBzhcFUMyc/Y9jhI2bgMC1KxSWwVETcbfOSXC2EyBA08Wq4oyL
 vCvFPFylERfz980CDSp7ul5mtAp3QCSMBUdc5OhUzN/afS+RTViUQLSp61lAQr+KCwzl
 8QmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684336995; x=1686928995;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9+zkVtFJZH/s/sKmb4Z8mX0ZyNeCSr7JQnjUSM8vJbU=;
 b=A8dAjP2/U4XVs2yxgqzOyQMQtjk4jQ/fUaohaV3+Y52tY1IsiMu8y0W4FDzSdApU8E
 5OGPr75vKDJP0qLMADv20zPkSOhKfXO/PW68ygwJ9F27bt+X7UY6+CKZliPmXUotKtqh
 KcQC5ly5nbmsFKyowcvcWdoj4ROb2IfedFFBReLPoGlKgr+CxoRThh/QyiyvJAvW7N62
 C1QcztYEdGOlKImVbTfsxj8qhE4F/oRWGsBAHbwAKitwTb7R4e3z7lvlgaPQBo2s6zXg
 bWYDWeSaK7ZkIxKo4cBY/XyO0hW7oPsJOqXLx1VlzSsEMGCuCNZz8rPiXTB4iiWd352p
 MM0g==
X-Gm-Message-State: AC+VfDwrUbLOLNlMoBgogK0u8izIZBaoAvcYm0fjVNr7cGtPgn7MRBAJ
 6MA8sxXt0uMtEe4KHhVtYEoL0A==
X-Google-Smtp-Source: ACHHUZ7DdgZpbkeB08gqVo1Il+baYyg2vTm+oBF8DTFemau8YO/NFvnHReGV+WIt97skRr1LrjBtRQ==
X-Received: by 2002:aa7:c2d7:0:b0:509:c6e6:c002 with SMTP id
 m23-20020aa7c2d7000000b00509c6e6c002mr2084928edp.39.1684336994785; 
 Wed, 17 May 2023 08:23:14 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c9ff:4c84:dd21:568d?
 ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
 by smtp.gmail.com with ESMTPSA id
 ay20-20020a056402203400b00502689a06b2sm9512864edb.91.2023.05.17.08.23.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 May 2023 08:23:14 -0700 (PDT)
Message-ID: <28889e6c-0040-5adb-25e1-f8284931947a@linaro.org>
Date: Wed, 17 May 2023 17:23:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Marc Kleine-Budde <mkl@pengutronix.de>, Lee Jones <lee@kernel.org>
References: <20230423172528.1398158-1-dario.binacchi@amarulasolutions.com>
 <20230423172528.1398158-2-dario.binacchi@amarulasolutions.com>
 <20230424090229.GB8035@google.com>
 <20230517-corset-pelvis-5b0c41f519c9-mkl@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230517-corset-pelvis-5b0c41f519c9-mkl@pengutronix.de>
Cc: devicetree@vger.kernel.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 linux-can@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 oe-kbuild-all@lists.linux.dev, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/4] dt-bindings: mfd: stm32f7: add
 binding definition for CAN3
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

On 17/05/2023 16:16, Marc Kleine-Budde wrote:
> Hey Lee Jones,
> 
> On 24.04.2023 10:02:29, Lee Jones wrote:
>> On Sun, 23 Apr 2023, Dario Binacchi wrote:
>>
>>> Add binding definition for CAN3 peripheral.
>>>
>>> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>>> ---
>>>
>>>  include/dt-bindings/mfd/stm32f7-rcc.h | 1 +
>>>  1 file changed, 1 insertion(+)
>>
>> Applied, thanks
> 
> I upstreamed the v2 of this series
> (https://lore.kernel.org/all/20230427204540.3126234-1-dario.binacchi@amarulasolutions.com/)
> that doesn't contain this change to net/main without noticing that the
> DT changes in that series depend on it.
> 
> This broke the DT compilation of the stm32f746.dtsi in the net/main
> tree. I don't see the stm32f7-rcc.h changes in linus/master so I'm
> afraid this will break mainline too :/
> 
> What are the possible solutions? I see:
> 1) revert the stm32f746.dtsi changes via net/main
> 2) upstream the stm32f7-rcc.h changes via net/main, too
> 3) upstream the stm32f7-rcc.h changes via you tree, so that it hits
>    mainline in the v6.4 release cycle.
> 
> I'm in favor of solution number 1. Thoughts?

DTS should never go with driver changes or with driver trees, not only
because it hides ABI breaks but also for above reasons. The best if you
just drop or revert DTS commits, so they can go via platform maintainer.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
