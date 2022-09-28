Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 668DC5EE431
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Sep 2022 20:18:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C45CC63327;
	Wed, 28 Sep 2022 18:18:40 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DF44C03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Sep 2022 18:18:39 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id p5so15229812ljc.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Sep 2022 11:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=qaYk3nco+/ppRoNQEcgJqsT/fQPu+A0ZFbK93FdpdIM=;
 b=X025S/sUiH/3GrEN6vc6HdshVToix1fmekkzAkkLSSHix81xpfXDAXmtyleQ5E4i8f
 wQJgyVr5JdNwYJk20v6IZi6bzCN7UPsVuxWDC3ocy4SWGQPKHZ7C8ci+VIfbUtqOf+EI
 h7w4DPwr7l4oHJ4BW4sx9FR5C9ZaqvdP+k5PEtte/1BbpDO+ofXVXofWjNSflJrhoU/d
 XcI25vSmf/qbIzMVLZ8MPg422u0hpSZ8IZE0OH49z47gCWUt4imA1qiOuGXRnyQIMGEz
 BjufohmrdxetIKka1Whip3HARJcyF2oakf2iVA2husa7i4f7h/U6qCNngNxLFbvN+efp
 Y9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=qaYk3nco+/ppRoNQEcgJqsT/fQPu+A0ZFbK93FdpdIM=;
 b=aRGweJL4mkCQ73Vt3SziO565vHTBpzNHf0yW3YT6zYca2HkRb2+a/PX+548rwFEPng
 8ZWH2nnzu1pJJx83zKcBfV8+mTEXZyMuz2zq4tm+C+IQTCn2fmAXNVoYRvDgkvqZ9Y7U
 y+y3VmF2jLFK5Xi6i63t0XInytgkEpVRjAT3ZkUs/8nRkvH0OYb8+PhA4/h7Kz3XJull
 4Dx+NlL9LPw5UM57pyChqtzIV3rbCuajIL2tOp4etg0CCVa5TxzUV4QfAymSj+17+UaU
 u5y1FPfwE2IMyGsbTHzTvZxLyik8jxD88m+6jm3xEfnogHS7IB+GdOYWsC50v9B3jJZH
 2KoA==
X-Gm-Message-State: ACrzQf2eCeCvNw0EidK3lBf0QlrxC+scaIGXDBIaT99xpxxtEQpoVO0q
 VQIF6ZWfP8TABaIehh9lr/HgQg==
X-Google-Smtp-Source: AMsMyM6RB3ATSHcyqOonrWWNzfkPDbAqYTCuI0L3+9Gwy3NXnydiUk55FsM++WXSvQ8qD0Dx6HU7nw==
X-Received: by 2002:a2e:a44d:0:b0:261:cb9c:6891 with SMTP id
 v13-20020a2ea44d000000b00261cb9c6891mr12635209ljn.136.1664389118600; 
 Wed, 28 Sep 2022 11:18:38 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 s16-20020a05651c201000b0026c453c51b7sm486302ljo.68.2022.09.28.11.18.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 11:18:37 -0700 (PDT)
Message-ID: <19a2e93f-8733-ac41-88b7-449ffce7ee0c@linaro.org>
Date: Wed, 28 Sep 2022 20:18:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
References: <20220926225536.548139-1-marex@denx.de>
 <846bc515-bdda-6022-0611-daaa9a632e64@linaro.org>
 <e787f5b1-88e6-375c-b9e7-22db346c27be@denx.de>
 <393eb833-0dcd-bf6c-49f3-ab8d60e3a8e5@linaro.org>
 <7adc3299-5dd6-fd43-fd5e-c22d150a328a@denx.de>
 <9cdb0eb8-db72-a77b-e377-1103e12c2c85@linaro.org>
In-Reply-To: <9cdb0eb8-db72-a77b-e377-1103e12c2c85@linaro.org>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: memory-controller: st,
 stm32: Split off MC properties
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

On 28/09/2022 20:08, Krzysztof Kozlowski wrote:
>>
>> So the fix for V3 should be the following ?
> 
> patternProperties:
>   "^.*@[0-4],[a-f0-9]+$":
>     type: object
>     $ref: st,stm32-fmc2-ebi-props.yaml
>     unevaluatedProperties: false

As Marek pointed out on IRC, unevaluatedProperties:false won't work here. :)

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
