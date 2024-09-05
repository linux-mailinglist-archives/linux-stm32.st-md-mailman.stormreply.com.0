Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE0596DA8B
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Sep 2024 15:41:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A89CC78013;
	Thu,  5 Sep 2024 13:41:37 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7C1AC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Sep 2024 13:41:30 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2290D88BBC;
 Thu,  5 Sep 2024 15:41:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1725543690;
 bh=xK6a48OIHXRWC6vnsA0HEz2fohBA/zvNxkzg+jmPZ8U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=o6yhS0gfaz8fgAMohhFULwaAdU4NkugjM0uFQ7O0C0jHG2HUfznb7vgSLg4VEOB3e
 Gn0UQpAL3kC4u3bd/8rHg5QuA+5uGQTJlTsYlbBtpw8ZoZ0CdrlxUjxsR5vCYs1npu
 dzX5oVgL6glA36rWolkK7AEzJkdCsHIwYjttBcWyUagkDmLSp1IEorVkDjCi0Ytn7w
 aF37WNrGNCXMDWRCVl3eYg/fSdftCY3rYUQpTm0BO9cl1xlgFsOlvqbgvU6BdQzWgk
 FOjf/lOgXmOIDWDqrsUMnnVXkUWNbB3CAgxo8c7gZL+yjPJfCovkL6yp27ABh4ifIE
 s6I36O6x0PhHQ==
Message-ID: <686c36e4-bb3c-4a5f-bdb9-1bf1accf1632@denx.de>
Date: Thu, 5 Sep 2024 15:09:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org
References: <20240705115052.116705-1-marex@denx.de>
 <975dca14-de9c-4bbb-bf4f-e52f7f52c83a@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <975dca14-de9c-4bbb-bf4f-e52f7f52c83a@kernel.org>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Yannick Fertre <yannick.fertre@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-stm32@st-md-mailman.stormreply.com, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: watchdog: stm32-iwdg:
 Document interrupt and wakeup properties
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

On 7/8/24 12:48 PM, Krzysztof Kozlowski wrote:
> On 05/07/2024 13:50, Marek Vasut wrote:
>> The watchdog IP can generate pre-timeout interrupt and can be used as
>> a wake up source. Document both properties.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Can someone please pick this up ?

It is now blocking addition of the property to STM32 DTs.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
