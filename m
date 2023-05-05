Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5286F7D8B
	for <lists+linux-stm32@lfdr.de>; Fri,  5 May 2023 09:13:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 829DCC6A60E;
	Fri,  5 May 2023 07:13:23 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB1D1C6A60C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 May 2023 07:13:22 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-96598a7c5e0so219014266b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 May 2023 00:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683270802; x=1685862802;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LjPti0SVf6hmj4N0H313/55MiUrWdpZNvzPtpM8uR3Y=;
 b=KSRYsw+W1lrvQqIyAomaDqVEM8xAGeLseIR/4uBsLmebPEyJUBuQBwvCTXEzpOMq9u
 AFiPu0uEzbyPyzn/5fKp3RBeQMnx7feR/ep6QzWHp/2GN2vv3/We/tZUk1tgEgcKNSIp
 mXSsfR6GbTtiv2QRS62IWB/gi0a//k2zL+Cdpz66A6DgxenD1aLu3730CP0th8T9h9D+
 6oOFUvslt6PzDG8AIJ9JtBmzRGaXUmxuf0JRYaj7trhS36t9EBUtFLHhzruYWePdnZyv
 fEXX4eXaza5nVCYWycGrLxXoIt9a+fmY08OiLyJNT1E0gcmJfkZSunZD/TsWGrmAh2/I
 Sccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683270802; x=1685862802;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LjPti0SVf6hmj4N0H313/55MiUrWdpZNvzPtpM8uR3Y=;
 b=cIp8PeuneEKOqqs//k62w9CafscwwhzRnd3ghFkEHjnZeiSccnNdesIAeYwqJ8EfmE
 k1Y5A1/04X4jAOlAsLwC/gXJPvRwOXcjlTGV0iE/udsvZTwUget/JJ8z+Rf8qNOyiPkw
 yJj2F2SMrmwhekGVztlA2Q2pAzs8AFMFqbLRBQJPNklLgORIrZph6rJJ3UNW8S4ZJjg3
 qJTB7dza4b3s5o9JABNFQIuI8vYLDFXbysb//RVQhcurB836uCnHSXW9VX3ZUy6Q49G6
 TztQplbS6wJQaZSm9kqYb0/2AraLAh/SnnjZqqgUINZA/3rmPVVK1Cai2KhBcUT78AyL
 cFcA==
X-Gm-Message-State: AC+VfDxavIpTygPbKK1p0Jlv496jRmDkQAMQZOhi5dLXo/rCy4rw/Rhy
 3i9cJt/CL+qt+782Ue808rVpXg==
X-Google-Smtp-Source: ACHHUZ51C0pF2OmSh3ZV19RMD0Jz6GfDImw2bVfTjB/4HVx9UvCSzaKvElz8ivKA9nmTvCyMTvu8Tg==
X-Received: by 2002:a17:907:98e:b0:94a:5c6d:3207 with SMTP id
 bf14-20020a170907098e00b0094a5c6d3207mr320366ejc.44.1683270802121; 
 Fri, 05 May 2023 00:13:22 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:52e:24ce:bbc1:127d?
 ([2a02:810d:15c0:828:52e:24ce:bbc1:127d])
 by smtp.gmail.com with ESMTPSA id
 n22-20020a170906b31600b00965e9a23f2bsm205645ejz.134.2023.05.05.00.13.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 00:13:21 -0700 (PDT)
Message-ID: <66d344b2-899b-3d00-2d8f-5dd86f0af985@linaro.org>
Date: Fri, 5 May 2023 09:13:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230504094641.870378-1-arnaud.pouliquen@foss.st.com>
 <20230504094641.870378-2-arnaud.pouliquen@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230504094641.870378-2-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 1/4] dt-bindings: remoteproc: st,
 stm32-rproc: Rework reset declarations
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

On 04/05/2023 11:46, Arnaud Pouliquen wrote:
> With the introduction of the SCMI (System Control and Management
> Interface), it is now possible to use the SCMI to handle the
> hold boot instead of a dedicated SMC call.



>  additionalProperties: false
>  
>  examples:
>    - |
>      #include <dt-bindings/reset/stm32mp1-resets.h>
> -    m4_rproc: m4@10000000 {
> +    m4_rproc_example1: m4@10000000 {

Just drop the label. It's not used.


>        compatible = "st,stm32mp1-m4";
>        reg = <0x10000000 0x40000>,
>              <0x30000000 0x40000>,
>              <0x38000000 0x10000>;
>        resets = <&rcc MCU_R>;
> +      reset-names = "mcu_rst";
>        st,syscfg-holdboot = <&rcc 0x10C 0x1>;
> -      st,syscfg-tz = <&rcc 0x000 0x1>;
> +      st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
> +      st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
> +    };
> +  - |
> +    #include <dt-bindings/reset/stm32mp1-resets.h>
> +    m4_rproc_example2: m4@10000000 {

Also here.


Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
