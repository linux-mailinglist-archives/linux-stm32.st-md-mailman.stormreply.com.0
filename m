Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F07977BE2C6
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Oct 2023 16:28:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5B97C6A61D;
	Mon,  9 Oct 2023 14:28:45 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69CB3C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Oct 2023 14:28:44 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-40535597f01so43288255e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Oct 2023 07:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696861724; x=1697466524;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a+7M0AHYNZH1mPLf3H5qQErik5p5SGAC1rjxcpWZH8Q=;
 b=vFVuIjnz4v2ewdD5xjtiXm1OjXlc6815IloP6Y4Z2a6Dybt8xjPXs3ehG2PtrUB9Zh
 iXALABchYAfV7NHkvXEy+Ezr2PqaIhRMpP+zvzp7yrp8GAzN4T22wEbk7oHt8fbl89RI
 HrYXR0xnymCjpf+62Qxyyj7yA3z7J1WzNKwYkbswP56Fd5cEb+Ux5D4D8pJ9UpkDKrcm
 8yz6m9UMKu5RR6dKkXoy1pyTHsqMFQxLJyrVXV5ozwPZxQQ6fk91/mB030kx6RZ/00vb
 /2E2vqUE5l1Ci8iBPcZy0HjaUkQ1pnVktgOkyaMbWp9ZHI4v5LmghBu8aoAjbTNtM+hr
 TMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696861724; x=1697466524;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a+7M0AHYNZH1mPLf3H5qQErik5p5SGAC1rjxcpWZH8Q=;
 b=GxO5KkCtZtuiQrHatt79lkkSVEj/6LbtxuFvqSwChWdhXXegVtjhhTVrc6Xvl/vFSt
 TDXKwntVY41nkTafuJSTQFse2NMO6Tqy5uP6xkmwi2thZxzXXuh5QkSaf+E85kTPv1QB
 b7V/ulmeE1hETRZ7dExU0XbP7OljT7wd4iol0Wq8QpEueMSvu5eKYo9jmj81FMmpZvMl
 NoLa/kVeJ9QuFswaWn3xD0+GObpn1ldbb+2GfQc/Ux989KJ3xipKprKSXwUkJLy53P1+
 guUrh/gVp7cJlRyYPV3mV6kCW76+/gHEs75mhmq8qU9q2CoXZFCFr9x3ms7matQB1RYe
 CYbA==
X-Gm-Message-State: AOJu0YxtqpaGgdXvApPUi1NQTuNcr3aUJ5Jno2/54K9+gcTkz6v/7jSH
 B5Au3FIdMEbhjLWK2ImKoQ9SzA==
X-Google-Smtp-Source: AGHT+IEmfetZGwgxK9GU3rc4AnA+Rg69W/SViB1yBfRKxaAx6EJEj2/DvVg+BfUFW3sO0I3KT16Naw==
X-Received: by 2002:a05:600c:ad0:b0:406:7029:7cc3 with SMTP id
 c16-20020a05600c0ad000b0040670297cc3mr13247986wmr.28.1696861723411; 
 Mon, 09 Oct 2023 07:28:43 -0700 (PDT)
Received: from [192.168.1.197] (5-157-101-10.dyn.eolo.it. [5.157.101.10])
 by smtp.gmail.com with ESMTPSA id
 l34-20020a05600c1d2200b003fef5e76f2csm6791127wms.0.2023.10.09.07.28.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 07:28:42 -0700 (PDT)
Message-ID: <d3f56d51-beb0-4f7a-a1f6-3ae03bbc9826@linaro.org>
Date: Mon, 9 Oct 2023 16:28:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Hugues FRUCHET <hugues.fruchet@foss.st.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20231004091552.3531659-1-hugues.fruchet@foss.st.com>
 <20231004091552.3531659-4-hugues.fruchet@foss.st.com>
 <6bc60e4a-ddf1-4125-ba27-53ab55a553d2@linaro.org>
 <0de2ae74-2ba1-0e8d-aa7b-77806ac8b252@foss.st.com>
 <1e2a4d87-5478-4655-993d-7f404d507c82@linaro.org>
 <fa0e6187-ab7d-bc23-299c-a491c8ff1d8f@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <fa0e6187-ab7d-bc23-299c-a491c8ff1d8f@foss.st.com>
Cc: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [Linux-stm32] [PATCH 3/7] dt-bindings: media: Document
 STM32MP25 VENC video encoder
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

On 09/10/2023 16:24, Hugues FRUCHET wrote:
> Hi Krzysztof,
> 
> On 10/9/23 15:56, Krzysztof Kozlowski wrote:
>> On 09/10/2023 15:49, Hugues FRUCHET wrote:
>>> Hi Krzysztof,
>>>
>>> On 10/5/23 21:45, Krzysztof Kozlowski wrote:
>>>> On 04/10/2023 11:15, Hugues Fruchet wrote:
>>>>> Add STM32MP25 VENC video encoder bindings.
>>>>>
>>>>
>>>> I don't understand why this binding is separate from video decoder.
>>>> Merge them.
>>> VDEC and VENC are two independent IPs with their own clock, reset,
>>> interrupt & register set, they have their own access to APB/AXI bus.
>>> Moreover future chipsets may embed only VENC or VDEC.
>>>
>>> Hoping that this clarifies the reason of two different bindings.
>>
>> No, it does not. These are no reasons to have independent bindings,
>> except when having actual impact on the bindings. The bindings look
>> identical. What are the differences?
> I'm sorry but I really don't understand your point, these are two 
> different IPs with very different registers in it, so why should
> I share that in a single binding ?

Because the binding is identical. If not, maybe I missed something, so
please point me to differences in the binding.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
