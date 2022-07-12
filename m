Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8D15727FA
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Jul 2022 22:56:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E625AC640F9;
	Tue, 12 Jul 2022 20:56:09 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 524CFC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Jul 2022 20:56:09 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id n18so14243820lfq.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Jul 2022 13:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YgBYNn+dLO9x1C2fv3ECp5e++kFJbCjS3x6FIeCOgbo=;
 b=AA18rI+xRZH8fFc9NwZ5Tkdma1ADKleRvPH6mq43IMurnX6DdAgoRZdOlVPOZZoI9F
 cEGlBGOVLV3xTKR3+9Qi9pTV3nuzqmWIgehIgadhju9U6iNnkEOLoFA9+YtrxcUQ7zcN
 seAk/p4WlrsWhQ4ZX2ojOhLlSUvkRHCpnt5uhtNly2tSy0zLcl4sHZyDxJTtz0wT4hsU
 jxdN6WSavnU3f8lVznU/CAQJnZaRBWsBHDYkGZY+Q+EJ1O1gOBtZryG/OQwWWmyacjwZ
 iI2Aej+OJAGC1Gb/ICWaABipCarj9oHEd2gFAzyPPO3EnFO3nYOGqubj3CQ/8Qjen+1V
 dRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YgBYNn+dLO9x1C2fv3ECp5e++kFJbCjS3x6FIeCOgbo=;
 b=te9dWCrERMs0KhZof+HSlU4w75SrQreQBF95ejJRCHufAgdPdg4twO+F0nAQuitpRv
 PJ/IMILvhOtTFXrxLt8DdKttPSXOLboAldUMMIHx5aV5gKJo8twx40kcQQYYbVElmgiq
 Ms9s9HkT6ukIHKwL2H6hfEo68Dp1HLlVJfBd56TFCQSAecS9xfyUPyQD9mfoymVK0bha
 QDwQKYrQXUqjq7KBuhGhq3SoY2CyZ7M0UVH5rSZGW6VusxwUno5lRA96D7WueN0Vr0iw
 Z/Uo0byJKHpm3wN/rqHIK0YkKaUgS0TxSD5qFef5b4N4pk2QRcdv70LL4GwTD3zAxJsI
 J8FA==
X-Gm-Message-State: AJIora/i1L7tkGqmZHyAfxO4TYsL73ck57TawOrOFzu34nx0jRndAgJm
 1dYysj8kFkTEGUj1wfvLZPp9Mw==
X-Google-Smtp-Source: AGRyM1sG/T2N93eSB4iInih+BsU7rJW1wVFX3NxCWlW3jWQQS3uYELLmnljugBRT0pgaQGzB28uBRQ==
X-Received: by 2002:a05:6512:a96:b0:485:6bfa:e346 with SMTP id
 m22-20020a0565120a9600b004856bfae346mr16436787lfu.52.1657659368575; 
 Tue, 12 Jul 2022 13:56:08 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
 by smtp.gmail.com with ESMTPSA id
 t21-20020a192d55000000b0047f65b60323sm2381317lft.3.2022.07.12.13.56.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 13:56:07 -0700 (PDT)
Message-ID: <74ccd18c-7b30-34c2-c295-0efd1a966f47@linaro.org>
Date: Tue, 12 Jul 2022 22:56:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Lee Jones <lee.jones@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20220706211934.567432-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220706211934.567432-1-robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: mfd: stm32-timers: Move
 fixed string node names under 'properties'
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

On 06/07/2022 23:19, Rob Herring wrote:
> Fixed string node names should be under 'properties' rather than
> 'patternProperties'. Additionally, without beginning and end of line
> anchors, any prefix or suffix is allowed on the specified node name.
> 
> Move the stm32 timers 'counter' and 'timer' nodes to the 'properties'
> section.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
