Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePZKDyLsp2mWlwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Mar 2026 09:24:02 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C21A91FC894
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Mar 2026 09:24:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34FF2C87ED1;
	Wed,  4 Mar 2026 08:24:01 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DE82C87ED0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Mar 2026 08:23:59 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-89a0b376fedso11014786d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Mar 2026 00:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772612638; x=1773217438;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1VF2q2iw+ZiKGJt45rPpIgu/gs74haGCfE/ZxGBpnps=;
 b=FkH5/Ba0M5//kdBOps48KmfWbQanCzpOz2hRjRfGhEFqcxNqdw1HrumTNtOl66pGlr
 AJLYhG4MAQcc9/war+9xMJ7l+BTOh1h1PgmrTbpuUfrcsjpbsEQJovxYFE4FB69UXDCN
 mKRfv8H4WCSJEdzmZrZPms2EZ6tQdu97rCAogwuhF+NKqNnUUL5pq0zFUTBK4j5M2+ls
 ggYFy/BhFe/RTBMpwbJUguwwNVivTupH7F/UsO5GX44RUAKQcFuI7L9gKsEY9GuKxUnw
 5K63DlbUf8sS5oPKslN9uWEs0hGhongfRaIYHGnjyzA+Y9qDhxBQE55DNzFdN2YTx+wP
 hRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772612638; x=1773217438;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1VF2q2iw+ZiKGJt45rPpIgu/gs74haGCfE/ZxGBpnps=;
 b=bNTePDVaYZLLcsSBtRO4BoHBHi/Z9O4kFcXpKZohQNhiOyfDLJRJZjGY3YHaC0S3C8
 VKc0h1vWbrW+CUMu7xC4xe7ECBLvLa3EVyFuuyO3mB+Bq0S0pmjIJd6BcK5JjVdNOLhh
 uVfVeojO0QoPh5t+fjA8YtHC5h8JrMTVXtNVnpdGCOn3/2zHLjQIZP6ILYKzDEXXvodT
 L/X+UnCzP9DvGM5eBnhUKE6cHDYTVsMKhlcOpadqwhyH31ta1AHV1a8AO25okwInP27g
 ggTFU7jl0eINMG3sNbxcY2qjpWwEya98mzPeul/3lvctZo4++phB1atYSBUbG8df1YNa
 3GTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXplOP2y33OgBQgBegdGlmr6IsrLafC4Mv59ZjxbSIkDVGpIspOFmQWBIYv0Cc5dMvu8g5T1YqlFOWUrg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzDXa1GNnfHIWP8Ju9KV7SCLLJZP7RB54O1OsoiE4YguxRUAWzc
 dcSvdY3Ki+kbLjKqhYZ1QWXyYa+VYGdjbPuMCEOlstJICGDOsZz1Yi/8
X-Gm-Gg: ATEYQzyvXPMVJUz6WGU58S13+QjmQ8+xyoYYQEJbIsudr+Ihc57ykymXoAKbm7BpJ4o
 VGq1wib5TYZJnryuupmrn6xPDyY6zEQ3ppDXpVHVhtU4jjEk9ddme6zLcI7pra1g6Fp2X285yKA
 gq4tYof7lZIS6Fowq8XnbEeUHvK5dmpIcAZU8w8gztrj8x+E/Jaztg7iWpYpK7WNBmFAYzhfxCa
 5Rzif1UCrF5Ue+HIteeUPwIJSpvzMSNDsW04PWVxei9yA8J3hqbhmB7zV9NPX9RmNVwpophxc2D
 SKHbsJ+HKyZwntIIew91AxxGx3DGgA1OdeLLoZP6FhsG2w6uEO0Mn9thZzmvkAJ1m0tUN1buQoi
 83GumAmYz3lfc4fPIdE3qXNz5FiyEgjQZRmODsBxEj3i1kjsb7rsG3vdD3zUsS4nZ54wZH7tWye
 xlrBKq/g9+kyr2JkASvAUVRCj3
X-Received: by 2002:a05:6214:252f:b0:899:bc85:7b68 with SMTP id
 6a1803df08f44-89a199a8921mr12167536d6.16.1772612637696; 
 Wed, 04 Mar 2026 00:23:57 -0800 (PST)
Received: from [192.168.0.13] ([172.92.174.155])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89a0fbdbcb0sm31329776d6.45.2026.03.04.00.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 00:23:57 -0800 (PST)
Message-ID: <3aba626d-7b5b-4d5b-9c91-07f6a2d7c244@gmail.com>
Date: Wed, 4 Mar 2026 00:22:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, lizhi2@eswincomputing.com
References: <20260303061525.846-1-lizhi2@eswincomputing.com>
 <20260303061637.872-1-lizhi2@eswincomputing.com>
 <20260304-hot-sponge-of-emphasis-6864db@quoll>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260304-hot-sponge-of-emphasis-6864db@quoll>
Cc: edumazet@google.com, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 weishangjuan@eswincomputing.com, alex@ghiti.fr, ningyu@eswincomputing.com,
 pritesh.patel@einfochips.com, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com,
 linmin@eswincomputing.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, palmer@dabbelt.com,
 mcoquelin.stm32@gmail.com, pjw@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/3] dt-bindings: ethernet:
 eswin: add clock sampling control
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
X-Rspamd-Queue-Id: C21A91FC894
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[ganboing@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:lizhi2@eswincomputing.com,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:ningyu@eswincomputing.com,m:pritesh.patel@einfochips.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:linmin@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:mcoquelin.stm32@gmail.com,m:pjw@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.906];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ganboing@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[google.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,eswincomputing.com,ghiti.fr,einfochips.com,redhat.com,vger.kernel.org,eecs.berkeley.edu,armlinux.org.uk,lunn.ch,dabbelt.com,gmail.com,davemloft.net];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,eswincomputing.com:email,stormreply.com:url,stormreply.com:email]
X-Rspamd-Action: no action

Hi Krzysztof,

On 3/3/26 23:44, Krzysztof Kozlowski wrote:
> On Tue, Mar 03, 2026 at 02:16:37PM +0800, lizhi2@eswincomputing.com wrote:
>> From: Zhi Li <lizhi2@eswincomputing.com>
>>
>> The second Ethernet controller (eth1) on the EIC7700 SoC may experience
>> RX data sampling issues at high speed due to EIC7700-specific receive
>> clock to data skew at the MAC input.
>>
>> On the EIC7700 SoC, the second Ethernet controller (eth1) requires
>> inversion of the internal RGMII receive clock in order to meet RX data
>> sampling timing at high speed.
>>
>> Describe this SoC-specific difference by introducing a distinct compatible
>> string for MAC instances that require internal clock inversion, allowing the
>> driver to select the appropriate configuration without relying on per-board
>> vendor-specific properties.
> 
> Pointless description/paragrapgh. Your explanation why adding a
> compatible is "because I need compatible". That's completely redundant.
> 
> Explain what is special about this MAC instance, what's different in its
> programming model or other characteristics that you claim it is a
> different device.
> 

I think ESWIN should improve the description/paragraph and properly doc
the timing issues discussed here:
https://lore.kernel.org/lkml/32a1f814.2c79.19bfe173225.Coremail.linmin@eswincomputing.com/

I do feel the need of using a different compatible, though. I think we
discussed in depth in that thread (link above), and advice from Andrew

https://lore.kernel.org/lkml/59cec617-0189-4dc3-bc3f-6346155a62ae@lunn.ch/

https://lore.kernel.org/lkml/bd202cfa-d6eb-4d0e-982d-b49795dd25f7@lunn.ch/

is to basically apply different parameters to MAC based on eth0/eth1. The
compatible string approach is a clean solution to achieve that. The reason
being that for eth1, there's no way to meet the standard without clock
inversion, given the vast internal clock skew. I don't think claiming it
as a different device than eth0 is that far-fetched. Hence, no need for an
additional property and the driver code to check for that.

>>
>> The rx-internal-delay-ps and tx-internal-delay-ps properties now use
>> minimum and maximum constraints to reflect the actual hardware delay
>> range (0-2540 ps) applied in 20 ps steps. This relaxes the binding
>> validation compared to the previous enum-based definition and avoids
>> regressions for existing DTBs while keeping the same hardware limits.
>>
>> Treat the RX/TX internal delay properties as optional, board-specific
>> tuning knobs and remove them from the example to avoid encouraging
>> their use.
>>
>> In addition, the binding now includes additional background information
>> about the HSP CSR registers accessed by the MAC. The TXD and RXD delay
>> control registers are included so the driver can explicitly clear any
>> residual configuration left by the bootloader. Background reference for
>> the High-Speed Subsystem and HSP CSR block is available in Chapter 10
>> ("High-Speed Interface") of the EIC7700X SoC Technical Reference Manual,
>> Part 4 (EIC7700X_SoC_Technical_Reference_Manual_Part4.pdf):
>> https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference-Manual/releases
>>
>> There are currently no in-tree users of the EIC7700 Ethernet driver, so
>> these changes are safe.
>>
>> Fixes: 888bd0eca93c ("dt-bindings: ethernet: eswin: Document for EIC7700 SoC")
>> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
>> ---
>>   .../bindings/net/eswin,eic7700-eth.yaml       | 75 +++++++++++++++----
>>   1 file changed, 59 insertions(+), 16 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
>> index 91e8cd1db67b..22d1cecea07e 100644
>> --- a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
>> +++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
>> @@ -20,6 +20,7 @@ select:
>>         contains:
>>           enum:
>>             - eswin,eic7700-qos-eth
>> +          - eswin,eic7700-qos-eth-clk-inversion
>>     required:
>>       - compatible
>>   
>> @@ -28,9 +29,13 @@ allOf:
>>   
>>   properties:
>>     compatible:
>> -    items:
>> -      - const: eswin,eic7700-qos-eth
>> -      - const: snps,dwmac-5.20
>> +    oneOf:
>> +      - items:
>> +          - const: eswin,eic7700-qos-eth
>> +          - const: snps,dwmac-5.20
>> +      - items:
>> +          - const: eswin,eic7700-qos-eth-clk-inversion
> 
> So just enum for both entries?
> 
> Anyway, that's the same device, so you do not get two compatibles. This
> should be a property. Which property not sure, maybe all this was
> discussed already.
> 
> 
>> +          - const: snps,dwmac-5.20
>>   
>>     reg:
>>       maxItems: 1
>> @@ -63,16 +68,29 @@ properties:
>>         - const: stmmaceth
>>   
>>     rx-internal-delay-ps:
>> -    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
>> +    minimum: 0
>> +    maximum: 2540
>> +    multipleOf: 20
>>   
>>     tx-internal-delay-ps:
>> -    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
>> +    minimum: 0
>> +    maximum: 2540
>> +    multipleOf: 20
>>   
>>     eswin,hsp-sp-csr:
>>       description:
>>         HSP CSR is to control and get status of different high-speed peripherals
>>         (such as Ethernet, USB, SATA, etc.) via register, which can tune
>>         board-level's parameters of PHY, etc.
>> +
>> +      Additional background information about the High-Speed Subsystem
>> +      and the HSP CSR block is available in Chapter 10 ("High-Speed Interface")
>> +      of the EIC7700X SoC Technical Reference Manual, Part 4
>> +      (EIC7700X_SoC_Technical_Reference_Manual_Part4.pdf). The manual is
>> +      publicly available at
>> +      https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference-Manual/releases
>> +
>> +      This reference is provided for background information only.
>>       $ref: /schemas/types.yaml#/definitions/phandle-array
>>       items:
>>         - items:
>> @@ -81,7 +99,9 @@ properties:
>>                            or external clock selection
>>             - description: Offset of AXI clock controller Low-Power request
>>                            register
>> +          - description: Offset of register controlling TXD delay
>>             - description: Offset of register controlling TX/RX clock delay
>> +          - description: Offset of register controlling RXD delay
> 
> As pointed out, you cannot change the order and there is no reason for
> doing this explained in commit msg.
> 
> Best regards,
> Krzysztof
> 

Bo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
