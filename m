Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11124840210
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jan 2024 10:49:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDAAEC6A613;
	Mon, 29 Jan 2024 09:49:24 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BFBEC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jan 2024 09:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706521762;
 bh=BcsHhEXWi5xMJWTtz5/c5ki18Idpl9aWenNr9qUQymg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jVYbEqyDuZW+HE+sdCpLKAAKTpOEi8F0b29iUJ0QWx1IxYqdkztJpU1N1zHnOqtUQ
 xmcF2ZVfLMveGB5RbvT+pDLrpIjqKuiBuXyEWbI8NZKNN8qrendUhDEum03NJ1QAPW
 jSd79i5YCAy4XBVBNNcGbYQPUSJE/6l2YZ74nImp7ljO2RSpRdc+xoHViHElBzo5l4
 xx7L0RssUdwqXf55PCqO6cHGyIrceKkwCl9Qy8iDuSN2adxhfufQed1930I9dc87mE
 aGWiAgewzYzk3kvftAPR0BwGLrd+3DlBGfxc6cxOXMz2D1GTAQJYisqlGIka15by4n
 AXSbspLqZMO6g==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 23AF13781F92;
 Mon, 29 Jan 2024 09:49:21 +0000 (UTC)
Message-ID: <e29ae12b-5823-4fba-8029-e8e490462138@collabora.com>
Date: Mon, 29 Jan 2024 11:49:20 +0200
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
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Andrew Lunn <andrew@lunn.ch>,
 Jacob Keller <jacob.e.keller@intel.com>
References: <20240126191319.1209821-1-cristian.ciocaltea@collabora.com>
 <20240126191319.1209821-2-cristian.ciocaltea@collabora.com>
 <0a6f6dcb-18b0-48d5-8955-76bce0e1295d@linaro.org>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <0a6f6dcb-18b0-48d5-8955-76bce0e1295d@linaro.org>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

Hi Krzysztof,

On 1/29/24 10:26, Krzysztof Kozlowski wrote:
> On 26/01/2024 20:13, Cristian Ciocaltea wrote:
>> The Synopsys DesignWare MAC found on StarFive JH7100 SoC is mostly
>> similar to the newer JH7110, but it requires only two interrupts and a
>> single reset line, which is 'ahb' instead of the commonly used
>> 'stmmaceth'.
>>
>> Since the common binding 'snps,dwmac' allows selecting 'ahb' only in
>> conjunction with 'stmmaceth', extend the logic to also permit exclusive
>> usage of the 'ahb' reset name.  This ensures the following use cases are
>> supported:
>>
>>   JH7110: reset-names = "stmmaceth", "ahb";
>>   JH7100: reset-names = "ahb";
>>   other:  reset-names = "stmmaceth";
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thank you for the review!

Could you please apply it to the RESEND version [1] instead, as this one 
had an issue collecting the latest tags, as indicated in [2].

Regards,
Cristian

[1] https://lore.kernel.org/lkml/20240126192128.1210579-2-cristian.ciocaltea@collabora.com/
[2] https://lore.kernel.org/lkml/920e764c-4fa3-4298-bb49-d31416fc3dd6@collabora.com/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
