Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5E8CFBA82
	for <lists+linux-stm32@lfdr.de>; Wed, 07 Jan 2026 03:09:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7143FC8F27B;
	Wed,  7 Jan 2026 02:09:06 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F954C8F26C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jan 2026 02:09:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D00A342AA5;
 Wed,  7 Jan 2026 02:09:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 580F7C116C6;
 Wed,  7 Jan 2026 02:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767751742;
 bh=zc/jxjcF6joL67iBKRqLw1dlXUV+eOqt9LCpxQHLzMc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=A1b36/RosaUrz9qbTDLKQ62OAD4gm9IcmjQIlcNRiShtU9MzbZXy1XefApwe2k0+z
 onpGCQtMZ09mvbgAbucuBe1aAwisrNQfj7lSX1KWo2HLMEySiAhU2+FTxxtoN3OpkD
 HZnQ0pGCspxYd1QrKr0D45hVjSWP2kVv7yAMkeNG0eokPZhchrFrwvjR58uMj6q8YU
 8S2VkCjZQWIbWBTmvrpLF4SQ/9AmFXWjP20Q+6qLM77E26gxx/kjwd3dkf6YELhEsU
 kBzxvC6oeR92xzw/5iOo19C+jFG5paCR2QeOyYriiH9B/3gFsg31rXE/B808+b4RNh
 zi8Ez0t4BSuNg==
Message-ID: <8435a4f3-9afc-46fd-a6d5-9b86a417e01c@kernel.org>
Date: Tue, 6 Jan 2026 20:09:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20260105-remove_ocp-v2-0-4fa2bda09521@kernel.org>
 <20260105-remove_ocp-v2-3-4fa2bda09521@kernel.org>
 <20260106190126.GA2537154-robh@kernel.org>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260106190126.GA2537154-robh@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 bsp-development.geo@leica-geosystems.com, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Mamta Shukla <mamta.shukla@leica-geosystems.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/3] dt-bindings: net: altr,
 socfpga-stmmac: deprecate 'stmmaceth-ocp'
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



On 1/6/26 13:01, Rob Herring wrote:
> On Mon, Jan 05, 2026 at 06:08:22AM -0600, Dinh Nguyen wrote:
>> Make the reset name 'stmmaceth-ocp' as deprecated and to use 'ahb' going
>> forward.
>>
>> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
>> ---
>>   .../devicetree/bindings/net/altr,socfpga-stmmac.yaml          | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
>> index fc445ad5a1f1..4ba06a955fe2 100644
>> --- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
>> +++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
>> @@ -13,8 +13,6 @@ description:
>>     This binding describes the Altera SOCFPGA SoC implementation of the
>>     Synopsys DWMAC for the Cyclone5, Arria5, Stratix10, Agilex5 and Agilex7
>>     families of chips.
>> -  # TODO: Determine how to handle the Arria10 reset-name, stmmaceth-ocp, that
>> -  # does not validate against net/snps,dwmac.yaml.
>>   
>>   select:
>>     properties:
>> @@ -84,6 +82,15 @@ properties:
>>         - sgmii
>>         - 1000base-x
>>   
>> +  resets:
>> +    minItems: 1
> 
> That's already the min in the referenced schema.
>

Yeah, I had to add this, else it would fail the 'make dt_binding_check 
DT_SCHEMA_FILES'.

>> +
>> +  reset-names:
>> +    deprecated: true
>> +    items:
>> +      - const: stmmaceth-ocp
> 
> This says stmmaceth-ocp is the 1st entry, but it is the 2nd.
> 
> You can't really fix this to validate a DT using stmmaceth-ocp. I would
> just drop this. So that leaves this with just dropping the TODO.

Got it.

Thanks,
Dinh

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
