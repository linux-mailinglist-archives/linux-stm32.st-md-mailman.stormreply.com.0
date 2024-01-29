Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96347840BB9
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jan 2024 17:38:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BE16C6B463;
	Mon, 29 Jan 2024 16:38:31 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29EF5C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jan 2024 16:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706546309;
 bh=W9vkODe01nZU/vsOeFljqJlU/NDJWJCqj+YoON9Vw/o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ryz3Ho7xG3VZ/wYLhKXp90cwOJ07dcV0//QRevsVQw8Xk0DtIqZGGQdQcypWEi4XG
 z1El1hlesOFhFoSVgKKoHlv624qElDryQM6P5lya85UF6Rxx/KE6eqnJySdWy58WHc
 xFs6ZZwU35BmBX2WDySf9HfHmT2M3muyPPPqv1sBN8Y5UmFaB6FJRd/3dhJUldcOAZ
 HuexK+dRwRxiTuYcLf19UIojelxUE+Sh9CSU0hJvghURFGURV5hDC3gJpj8qxaVRpU
 GMLvuQtpHIU9Pka/aHWBNDN2gAsxE8yshklBkgotL+a8D++UbLwz2EGGRDGqx2r7Nj
 9rxbPS3qdnHJQ==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 30A6C37814A4;
 Mon, 29 Jan 2024 16:38:28 +0000 (UTC)
Message-ID: <8c4cfc54-bd23-4d56-a4ae-9f3dd5cedb59@collabora.com>
Date: Mon, 29 Jan 2024 18:38:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
References: <20240126191319.1209821-1-cristian.ciocaltea@collabora.com>
 <20240126191319.1209821-2-cristian.ciocaltea@collabora.com>
 <0a6f6dcb-18b0-48d5-8955-76bce0e1295d@linaro.org>
 <e29ae12b-5823-4fba-8029-e8e490462138@collabora.com>
 <56f3bd3c-c099-405b-837b-16d8aeb4cc4b@lunn.ch>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <56f3bd3c-c099-405b-837b-16d8aeb4cc4b@lunn.ch>
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 Emil Renner Berthing <kernel@esmil.dk>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Samin Guo <samin.guo@starfivetech.com>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v4 1/2] dt-bindings: net: starfive,
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

On 1/29/24 15:34, Andrew Lunn wrote:
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Thank you for the review!
>>
>> Could you please apply it to the RESEND version [1] instead, as this one 
>> had an issue collecting the latest tags, as indicated in [2].
>>
>> Regards,
>> Cristian
> 
> Hi Cristian
> 
> IT is your job as developers to collect together such reviewed-by:
> tags add apply them to the latest version. So long as there are no
> major changes, they are still consider applicable.

Hi Andrew,

Jakub requested a rebase, but I missed a tag and that's why I submitted
the RESEND.  Now we got this new tag which is not on the RESEND
submission, that's why I asked Krzysztof if he could add his R-b on that
one.  Unless the maintainers' tooling is able to fetch tags from both
submissions?!

Thanks,
Cristian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
