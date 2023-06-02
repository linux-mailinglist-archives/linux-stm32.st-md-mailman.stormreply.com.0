Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6227202D9
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Jun 2023 15:14:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5BBFC6B443;
	Fri,  2 Jun 2023 13:14:11 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9FB2C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Jun 2023 13:14:10 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-9745c5fed21so142703866b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Jun 2023 06:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685711650; x=1688303650;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NM7E2bhPISEHbBlp1H32wp1Q4VWvkt2UL0EOlnHQmhw=;
 b=EMRhYGqE0xvmt/e3UTWvucXGuihMx3qxy93kVgcdl0JaBC6zfPxxlaYtyG7CwUnPK2
 IsW2bmeGb79p0HFI+crVf0iOrCWPNAhG9UOuCkjRL6BvZMYjr/Hb6lCCCG4v61L2/ewA
 xb1is/o+4n4jOMiVzInw5czw6lMNOK3tQkbgv9IpldCx0bcp5AtRNXpC2l00j5Fu/1/e
 EGbvr+JPC2XX+1gjobhAKXk1sIQW8c9CWk7dFN5jEWVCLQrDTF5BZOw5TUmxEYP9FbFv
 7FN1w7pWbEwKqAebcSuJPJMmRFC5mN6YtIm0uKG95FNaYi5DuTPFC57WclQSrrJ2bh8H
 fgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685711650; x=1688303650;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NM7E2bhPISEHbBlp1H32wp1Q4VWvkt2UL0EOlnHQmhw=;
 b=ew7T1kGsK7Sl7SjnniroFKrRAAHCMlDQvBpWcT4415r71L+mZd1xbe7uiheHsrGowt
 77xol0qVJUN+sqNzlfQU0HTQ0k7LVXV54vQASlk9mBzibM8fzxkoWzSlemz4sbWk6rEe
 wZNR5n1J0YVx9UoO7E794GGr5XXzQJdjiFN6XZ/Ls2TlOCXCEJq7+TJpMqSsiHbq0Zol
 wGq+owK8y9KSdFsC3mRYp4LdrwI2blxintkhT5V490uv7cIs3yXxyBLG53QaHgR5D5zc
 d6/pT1B1M3YIYC2WJO/t+rasqSSOkrzn39uJvi31sBdc3MnroxWTnW6nU4+NwPuiFKsM
 BptQ==
X-Gm-Message-State: AC+VfDw6A7FdzdAZ0v3m+rOmHqnyHaXd9T+tgGvzXMgg8AQYMfXhNsYm
 CYgAZBzCV6umIvSun3wQ/tkftw==
X-Google-Smtp-Source: ACHHUZ4uIIsfu5hfYvBBUXo02QYm4Gt9O+H37x3tBrXc8NtwSrPZ6PnJax9nm8arEBESNAAtPajQbQ==
X-Received: by 2002:a17:906:fe43:b0:973:e69d:c720 with SMTP id
 wz3-20020a170906fe4300b00973e69dc720mr10021680ejb.51.1685711650410; 
 Fri, 02 Jun 2023 06:14:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
 by smtp.gmail.com with ESMTPSA id
 bi1-20020a170906a24100b009664cdb3fc5sm737006ejb.138.2023.06.02.06.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jun 2023 06:14:09 -0700 (PDT)
Message-ID: <de4aa846-c609-b0c3-a04a-2ad5ffaec815@linaro.org>
Date: Fri, 2 Jun 2023 15:14:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Conor Dooley <conor+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org
References: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
 <20230529162034.20481-4-alexandre.torgue@foss.st.com>
Content-Language: en-US
In-Reply-To: <20230529162034.20481-4-alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 03/11] dt-bindings: stm32: add st,
 stm32mp25-syscfg compatible for syscon
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

Resending as my previous email probably got lost. If you got it twice,
apologies.

On 29/05/2023 18:20, Alexandre Torgue wrote:
> From: Patrick Delaunay <patrick.delaunay@foss.st.com>
> 
> Add the new syscon compatible for STM32MP25 syscfg = "st,stm32mp25-syscfg".
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> index ad8e51aa01b0..9ed5b121cea9 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> @@ -16,6 +16,7 @@ properties:
>        - items:
>            - enum:
>                - st,stm32mp157-syscfg
> +              - st,stm32mp25-syscfg

You should rather keep some (alphabetical?) order.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
