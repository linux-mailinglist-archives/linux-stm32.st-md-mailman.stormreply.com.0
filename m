Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB10A57287E
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Jul 2022 23:23:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91408C640FB;
	Tue, 12 Jul 2022 21:23:17 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8CC5C640F9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Jul 2022 21:23:16 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id n18so14342344lfq.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Jul 2022 14:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZIixC2bV5bk0+HIicGoB7Neycw0Y+e5g1F3XyfSlUow=;
 b=lEd2am2qFIvJv6mvwUPXijftjd8L/Wyv9Yx+kKh+EvPQy2tACUdBFYr9SBMhe52bh4
 oypuIStUzdaV9hnFKV8CZx6YYvxyWyBt+hdEKrL0xT8OBGD7oRh55m4WKmqzfkbzj5Dp
 XMjQMxMW8vWxEpXgr3S5Y1Ti7r5bCIkZ4ftbbTBEg93nORt5WH5trqMQe35/+EvhDdak
 RVOBEB9WpNO4QJ8LX7couSF9n0zEMJpevFZOlFiQKveOzKA8dDVowBooFkhWIfiz5GRv
 kiov8wQwDs2OA8iiTDK4cv5moIrCKR7v3VOys92mWJTzS/unkodYL9b7uHt/oeRUfBuP
 lbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZIixC2bV5bk0+HIicGoB7Neycw0Y+e5g1F3XyfSlUow=;
 b=h8SS/qE1jSqd4E/bgjcyf7sVDIjxXzC1x/pyO952IqZg5q5E1z29sNYufH60z1o3T/
 UtW8fHfVNx0JuSA5ewlq/NviKVGm4otSlyhLureoOB1fPi27jP7TTiixjE9bn7zzxT6s
 O9ViuTTflMl6JnB/ii+AKOlvGlVXCKrBkozJIi81kn5Cia+1xW1gP4J92Cz4aldo3Blx
 A9kiwD19qglScuxQrG8r7Kv2507Q2Lb/ci2I5OmGGizDuEWzfBFE7Vu+sJgI8MhdW1U6
 tZVYwNx8+1SdBz5SSTromnfdX/FYInHm4GUNVvSG9some+EYW3gpgRnIGJX/zzRFjdht
 Ywmw==
X-Gm-Message-State: AJIora+4t45DT2vJSbeb9Y3lk6Z+PoMJgNV8gvIz2K3Op2qLwC4x0jxm
 5qhgBix9dNNcGLAgbka19MKCR4HfUpFYFQ==
X-Google-Smtp-Source: AGRyM1sLfpcYmbiEjWfaKm08jr8ScrE2GfPqP64cecPIr1DDlLCmyOl86WwUnjYrA+y/rjH/i6DnAQ==
X-Received: by 2002:a05:6512:3b8f:b0:489:c6c9:f522 with SMTP id
 g15-20020a0565123b8f00b00489c6c9f522mr11797lfv.244.1657660996339; 
 Tue, 12 Jul 2022 14:23:16 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
 by smtp.gmail.com with ESMTPSA id
 v11-20020ac2560b000000b0047f9dca3708sm2391737lfd.51.2022.07.12.14.23.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 14:23:15 -0700 (PDT)
Message-ID: <ca26630c-a09c-6f4d-51de-7a2ba615bd58@linaro.org>
Date: Tue, 12 Jul 2022 23:23:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Francesco Dolcini <francesco.dolcini@toradex.com>,
 Lee Jones <lee.jones@linaro.org>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220712163345.445811-1-francesco.dolcini@toradex.com>
 <20220712163345.445811-6-francesco.dolcini@toradex.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220712163345.445811-6-francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 5/5] dt-bindings: input: touchscreen:
 stmpe: Remove node name requirement
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

On 12/07/2022 18:33, Francesco Dolcini wrote:
> STMPE driver does not require a specific node name anymore, only the
> compatible is checked, update binding according to this.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  Documentation/devicetree/bindings/input/touchscreen/stmpe.txt | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
