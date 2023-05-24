Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC5A70EBE1
	for <lists+linux-stm32@lfdr.de>; Wed, 24 May 2023 05:31:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47B16C6B442;
	Wed, 24 May 2023 03:31:06 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1083C6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 May 2023 03:31:03 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E1E4B847C8;
 Wed, 24 May 2023 05:31:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1684899062;
 bh=qHDlFpFw1Neypm9hLIq1aL+ySQd6ptmW4GUYYp0gNAQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bXpnx5Z9MmDwH67xZQE5zNjGoIutbqo9rq/4Vgj5JSE+xaeWO/+dB0eCDZMG516DZ
 oRi01H4exod/zAPQnyeP0qkaCRMUG+BLmRdvSywu3pxAVnKCBRIVR0ThZYDrrEIp0j
 xIqSA3nXPpos4f2bGRZ5Gfq6piZjYSqx/ChIOxDAihvQOPaKm7Teyewi+sLmP/0blA
 hLGXfKuzrOq17dPZul8AjMeKHdZQpRlnQ1mw8qjrKBXfWHSXJ08ex2rwpPjQ/BgJ8N
 gyGih5rqoJGQa0spX2oTu9kvpyopNRDJe/HCOSU5fQKBbzvsr1sYeK3xpEjIuqogP4
 pWrQpOSXaoQoQ==
Message-ID: <2aee9fc7-e0a8-b5ad-7362-8461bac618da@denx.de>
Date: Wed, 24 May 2023 05:30:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org
References: <20230517152513.27922-1-marex@denx.de>
 <3951bf42-bf77-20a5-a343-46127b875dd5@linaro.org>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <3951bf42-bf77-20a5-a343-46127b875dd5@linaro.org>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com
Subject: Re: [Linux-stm32] [PATCH v2 1/3] dt-bindings: nvmem: syscon: Add
 syscon backed nvmem bindings
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

On 5/18/23 16:26, Krzysztof Kozlowski wrote:
> On 17/05/2023 17:25, Marek Vasut wrote:
>> Add trivial bindings for driver which permits exposing syscon backed
>> register to userspace. This is useful e.g. to expose U-Boot boot
>> counter on various platforms where the boot counter is stored in
>> random volatile register, like STM32MP15xx TAMP_BKPxR register.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>> Cc: Marek Vasut <marex@denx.de>
>> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: kernel@dh-electronics.com
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-stm32@st-md-mailman.stormreply.com
>> ---
>> V2: Use generic syscon supernode
>> ---
>>   .../bindings/nvmem/nvmem-syscon.yaml          | 39 +++++++++++++++++++
>>   1 file changed, 39 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/nvmem/nvmem-syscon.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/nvmem/nvmem-syscon.yaml b/Documentation/devicetree/bindings/nvmem/nvmem-syscon.yaml
>> new file mode 100644
>> index 0000000000000..7c1173a1a6218
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/nvmem/nvmem-syscon.yaml
>> @@ -0,0 +1,39 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/nvmem/nvmem-syscon.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Generic syscon backed nvmem
>> +
>> +maintainers:
>> +  - Marek Vasut <marex@denx.de>
>> +
>> +allOf:
>> +  - $ref: "nvmem.yaml#"
> 
> Usual comment: drop quotes. We removed them everywhere, so you based
> your work on some old tree.
> 
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - nvmem-syscon
>> +
>> +  reg:
>> +    maxItems: 1
> 
> Rob's questions are not solved.

Can you reiterate this one ? I likely missed it.

> The nvmem.yaml schema expects here to
> allow children. This should not be created per-register, but per entire
> block of registers.

This thing works the other way around, I have a syscon register block 
already, and I want to expose subset of it to userspace as read/write 
accessible file to expose bootcounter available in that register (so I 
can read it and reset it from user application).

> OTOH, using nvmem for syscon (which are MMIO and writeable registers
> usually) seems odd.
> 
>> +
> 
> missing nvmem cells

See above, I don't think nvmem-cells applies here.

[...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
