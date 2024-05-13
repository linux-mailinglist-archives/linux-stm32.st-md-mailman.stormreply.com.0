Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A768C43B9
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2024 17:06:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1EA9C6A61D;
	Mon, 13 May 2024 15:06:54 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 727DFC6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 15:06:47 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 587A987E50;
 Mon, 13 May 2024 17:06:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1715612807;
 bh=D+kDYWZibEUugDcn49CQ+F1gtNp7/FJaDN/c69YDh5U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nVAyY1V/Ba0HWbriExYe4dZLigqzqJP6GhBUECrwmBSYFXv4/UB//Cnsh7o9Eje1S
 FXLepTguU4p51QYDmAQGyLOSRczHQwmgbkJKoCJfcf32zQNlNs5hPrM6DMx0hQ5hgM
 dj0eHocM6PtpQmeLleEYPMQGoVxh3ysE3hzOlLZWC3kuPvUSgdXCL6uBAykn46wINk
 0xSxBLXt6izu1N5J27TjgAJokl5CRDudBrfymJtSJp0ACA9aClRnbMaIw94tHSheZ/
 SO3Wtb9gs0rTdBYVHTRKwaejQpU2bSbV8oAWj88qjoNLPHEIE+bnOTTdJwlJ6mVKfK
 mcjCcBwWUaCmg==
Message-ID: <4096ae14-bbb7-446b-bd96-2498c7ee4057@denx.de>
Date: Mon, 13 May 2024 16:16:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe ROULLIER <christophe.roullier@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Jose Abreu
 <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20240426125707.585269-1-christophe.roullier@foss.st.com>
 <20240426125707.585269-3-christophe.roullier@foss.st.com>
 <4e03e7a4-c52b-4c68-b7e5-a03721401cdf@denx.de>
 <0ef43ed5-24f5-4889-abb2-d01ee445a02d@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <0ef43ed5-24f5-4889-abb2-d01ee445a02d@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 02/11] dt-bindings: net: add phy-supply
 property for stm32
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

On 5/13/24 1:45 PM, Christophe ROULLIER wrote:
> Hi,

Hi,

> On 4/26/24 16:47, Marek Vasut wrote:
>> On 4/26/24 2:56 PM, Christophe Roullier wrote:
>>> Phandle to a regulator that provides power to the PHY. This
>>> regulator will be managed during the PHY power on/off sequence.
>>>
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
>>
>> Maybe this entire regulator business should be separate series from 
>> the MP13 DWMAC ethernet series ?
> I prefer push it with MP13 Ethernet series if possible.

This is separate functionality, independent of the MP13 support and not 
required for the MP13 support, correct ?

If yes, move it into separate patch(set) to make both series easier to 
review.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
