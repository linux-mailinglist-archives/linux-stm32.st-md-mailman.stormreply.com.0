Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0738412BA
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jan 2024 19:51:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44C4CC6B463;
	Mon, 29 Jan 2024 18:51:47 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28656C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jan 2024 18:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706554305;
 bh=KNDPO1AK9Y+B5htTE+wIMRsWzJnfFIi+OJEvFCF6Slc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Y+JaK629Tyi3MjmzCnMFi0XgqXhkHCjFWan9e/FQM1J9xZdU6PwMPzgNWkgR7MZF2
 dfYDFrle67cmZvgBzyO4sfQBCl7m6VFsQ0MnWv4uz+jOB5Ja6sPVuRejO+A2ddQ9Lx
 p12wFEqLUAp4lHzFU5mV7jlX319uFXr4sh3ftrmyamQkgtrc9/lVnnFdBgZe4iffd7
 fjZywJHWznoAFdqu9yA+CTwY/VdnGdU+FSTAA681QRX6Mo3vGDj+/fed/CVTpj0kIG
 i6hGXCOK+ktnoSkv2S8KP3FtRszB7CQ/5XsnXqHeTzUcvPmk4F2w7Mf3EyTjsc+1pv
 9LfV2WqdRvtbw==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 182853780EC6;
 Mon, 29 Jan 2024 18:51:44 +0000 (UTC)
Message-ID: <f113c4b6-a074-4566-b69b-f25c9590d23f@collabora.com>
Date: Mon, 29 Jan 2024 20:51:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>
References: <20240126191319.1209821-1-cristian.ciocaltea@collabora.com>
 <20240126191319.1209821-2-cristian.ciocaltea@collabora.com>
 <0a6f6dcb-18b0-48d5-8955-76bce0e1295d@linaro.org>
 <e29ae12b-5823-4fba-8029-e8e490462138@collabora.com>
 <56f3bd3c-c099-405b-837b-16d8aeb4cc4b@lunn.ch>
 <8c4cfc54-bd23-4d56-a4ae-9f3dd5cedb59@collabora.com>
 <e99e72b3-e0f6-4a80-82c8-bd60c36d180a@lunn.ch>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <e99e72b3-e0f6-4a80-82c8-bd60c36d180a@lunn.ch>
Cc: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 Emil Renner Berthing <kernel@esmil.dk>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Samin Guo <samin.guo@starfivetech.com>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
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

On 1/29/24 18:54, Andrew Lunn wrote:
> On Mon, Jan 29, 2024 at 06:38:27PM +0200, Cristian Ciocaltea wrote:
>> On 1/29/24 15:34, Andrew Lunn wrote:
>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>
>>>> Thank you for the review!
>>>>
>>>> Could you please apply it to the RESEND version [1] instead, as this one 
>>>> had an issue collecting the latest tags, as indicated in [2].
>>>>
>>>> Regards,
>>>> Cristian
>>>
>>> Hi Cristian
>>>
>>> IT is your job as developers to collect together such reviewed-by:
>>> tags add apply them to the latest version. So long as there are no
>>> major changes, they are still consider applicable.
>>
>> Hi Andrew,
>>
>> Jakub requested a rebase, but I missed a tag and that's why I submitted
>> the RESEND.  Now we got this new tag which is not on the RESEND
>> submission, that's why I asked Krzysztof if he could add his R-b on that
>> one.  Unless the maintainers' tooling is able to fetch tags from both
>> submissions?!
> 
> Well, b4 can do that:
> 
> https://b4.docs.kernel.org/en/latest/contributor/trailers.html
> 
> But i've no idea if the netdev tooling actual does.

Jakub, please let me know how should we proceed further!

The problem is that we ended up with a RESEND to include a missing R-b
tag from Rob, but afterwards we also got this new R-b from Krzysztof
here.  If it's not possible for you to collect both tags, I could
prepare a v5 to avoid having another RESEND.

Thanks,
Cristian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
