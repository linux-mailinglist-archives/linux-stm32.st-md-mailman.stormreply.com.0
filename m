Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3AF9D4184
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 18:49:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F10FC7A84A;
	Wed, 20 Nov 2024 17:49:45 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 145EDC78F9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2024 09:43:20 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-72410cc7be9so327302b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2024 01:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731577398; x=1732182198;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7E3oRv+rq/XKtcZoaXZsJTQg3amz2zyCTxOxkN0m2BA=;
 b=U2aXuV6FIsk9Kh2FlvHz26bBShWuihzj5KBiFrghI6depAPwCEuxiH6pdsnPfYiX0E
 uCKEdeX7req1ikqRgRf+57NDXGl5L8ypFN7f1UvjzX6z8ONKVh+oCSYroFtmH6Q7M1Uw
 uLdSWiIHbCo1HB8YtFubZCMgpTxexBTOWXO3ca2Dt18pzxJfusj+Taa5vqLd9OSImHno
 GcE2eX+OxcACcOnEhMw+p9PIxSvx6d9VYsO3A3WsTBLfzp7ZJ+mTJjbjKwH6Vwnww6Jp
 xOtDize4R6r6eJmwVpxy+0vuhy90xW3aAqvBBOxxboIIkRJS24iZnOj1y4I4x6GqvTAm
 TTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731577398; x=1732182198;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7E3oRv+rq/XKtcZoaXZsJTQg3amz2zyCTxOxkN0m2BA=;
 b=K66r5aKNQVSLtN2m68BN/fvpNE9UCoc9E6KyG3fXwGkvzXgUusT0+4VfBRa5Iv5FTK
 +lk94dRVjmWPPdS5JaHqZClIQ41bCZp6PVDlVGVEi0mpsABB9O2yftz7sGag4kR+4AgG
 QFPYvlFDTmFHr2ZbH3ZBzBvRrHCoGXx2pcMiTd9T4tBnWEcLdElZxX+enXp7NrnsTVhs
 ZaoGAc2HhJMsCdEODak8fA+pVPsk7rZPAIYtPsVsaLsenj+2eZl0NRC/vszs5iD7GCO2
 APjQ0wVqbclrIJYhX+KRjO1SxxLFNqnGo1YFl8lueKNnQlmQjD5GZ6vHzwUpDtxmu+hZ
 tAbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV81c9q+k1cU1vEzPDroxTgUrRSaRUqabDkmYWoCA1NyFV/Z/9i0movIe5KCZ9PBwmBf6vy+rEO6BHjTw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxmtSwj/OiJtTMtuAf5JqKBujISCcJtoKZJPYli9I3cS6XBSVov
 cYtf8Icuk+ic3Aol2xPKQOxQ4PF8/cvYE3iKWl88I2tzAS4znHoU
X-Google-Smtp-Source: AGHT+IE7N5I7GpMECo0it1xEKMgqYnL8RbOemjcjR8CajkVg4l/czbLMGpNGruEWzRMOSH4KompvSQ==
X-Received: by 2002:a17:90b:3ec5:b0:2e9:5f95:54c1 with SMTP id
 98e67ed59e1d1-2e9b173c441mr33338891a91.17.1731577398096; 
 Thu, 14 Nov 2024 01:43:18 -0800 (PST)
Received: from [192.168.0.101] (60-250-192-107.hinet-ip.hinet.net.
 [60.250.192.107]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ea06f9c51esm783484a91.39.2024.11.14.01.43.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 01:43:17 -0800 (PST)
Message-ID: <bbc212a7-ae42-461a-b0a9-509838053ab2@gmail.com>
Date: Thu, 14 Nov 2024 17:43:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Rob Herring (Arm)" <robh@kernel.org>
References: <20241113051857.12732-1-a0987203069@gmail.com>
 <20241113051857.12732-2-a0987203069@gmail.com>
 <173147854152.3007386.10475661912425454611.robh@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <173147854152.3007386.10475661912425454611.robh@kernel.org>
X-Mailman-Approved-At: Wed, 20 Nov 2024 17:49:43 +0000
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, openbmc@lists.ozlabs.org,
 richardcochran@gmail.com, ychuang3@nuvoton.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, joabreu@synopsys.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, schung@nuvoton.com, kuba@kernel.org,
 krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net, yclu4@nuvoton.com
Subject: Re: [Linux-stm32] [PATCH v2 1/3] dt-bindings: net: nuvoton: Add
 schema for MA35 family GMAC
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

Dear Rob,

Thank you for your reply.

On 11/13/24 14:15, Rob Herring (Arm) wrote:
> On Wed, 13 Nov 2024 13:18:55 +0800, Joey Lu wrote:
>> Create initial schema for Nuvoton MA35 family Gigabit MAC.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 170 ++++++++++++++++++
>>   1 file changed, 170 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: ignoring, error in schema: properties: compatible
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: properties:compatible: [{'items': [{'enum': ['nuvoton,ma35d1-dwmac']}, {'const': 'snps,dwmac-3.70a'}]}] is not of type 'object', 'boolean'
> 	from schema $id: http://json-schema.org/draft-07/schema#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: properties:compatible: [{'items': [{'enum': ['nuvoton,ma35d1-dwmac']}, {'const': 'snps,dwmac-3.70a'}]}] is not of type 'object', 'boolean'
> 	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: properties:clock-names: 'oneOf' conditional failed, one must be fixed:
> 	[{'const': 'stmmaceth'}, {'const': 'ptp_ref'}] is too long
> 	[{'const': 'stmmaceth'}, {'const': 'ptp_ref'}] is too short
> 	False schema does not allow 2
> 	1 was expected
> 	hint: "minItems" is only needed if less than the "items" list length
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: properties:clocks: 'oneOf' conditional failed, one must be fixed:
> 	[{'description': 'MAC clock'}, {'description': 'PTP clock'}] is too long
> 	[{'description': 'MAC clock'}, {'description': 'PTP clock'}] is too short
> 	False schema does not allow 2
> 	1 was expected
> 	hint: "minItems" is only needed if less than the "items" list length
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: 'oneOf' conditional failed, one must be fixed:
> 	'unevaluatedProperties' is a required property
> 	'additionalProperties' is a required property
> 	hint: Either unevaluatedProperties or additionalProperties must be present
> 	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
> Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.example.dtb: /example-0/ethernet@40120000: failed to match any schema with compatible: ['nuvoton,ma35d1-dwmac']
> Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.example.dtb: /example-1/ethernet@40130000: failed to match any schema with compatible: ['nuvoton,ma35d1-dwmac']
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241113051857.12732-2-a0987203069@gmail.com
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
>
These warnings/errors will be fixed in next patch.

Thanks!

BR,

Joey

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
