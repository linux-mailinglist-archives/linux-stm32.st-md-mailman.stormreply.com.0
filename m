Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 145866BC849
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Mar 2023 09:09:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA203C6904F;
	Thu, 16 Mar 2023 08:09:40 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C6EEC6904A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 08:09:39 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id w9so4243638edc.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 01:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678954179;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qsSpi02AtRNWSprHN4Cl76ayMyVQlvN90GOQNuiLzbY=;
 b=iOdoB48DSlJTxzYGvDakUwMgdpYpWIUL4nfKitoVvMKmpNSyhwjFVq5uG8uzBnOUTW
 x/rivZ/fOZlHihUW0EUlamLr9+U3JqiPhma3II2aEWX2H2cN7KeBfxWXgOitFL3S3jca
 duHj69oaASj2MjNwQZd1rqfDb0suikr7FoD5Rc5SckWkmQMaf3gOUAH8b2ejtUmFp3Lb
 aWFIeNUEtYqYQzPS2/LdlPFDEjFTr34eqfTcbB6ICYL3fwBAQbhXVRairVx5zmKMFpss
 i7boP9CRkkaiO7mbTly7kJanoyzHwc5jtEGZbGklG1O0kvBZlUg+GVImBpiIFZgSS2tz
 fjwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678954179;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qsSpi02AtRNWSprHN4Cl76ayMyVQlvN90GOQNuiLzbY=;
 b=UvT+5B16uWNIVPIeK6DzdLVdWpAzQpGTGP6E7gvOHJE2hgvFOET1l4S5rvPiwUVe7P
 rHu5sjhqVJtG3R4lOY6LaEE6g/k3xohu8WnR1xi3hcDZgnNtX7WNfMkePyeqkSbor1l8
 ezGYQzmSltbAfqcAhNO9BhUJPA8odKoHkieXxz4kGP4D84Rf1EuC551CGj5QKyILr9Dl
 0zFyzueZZZ2EuP35DYJlqk7U4cVg7AIDfdDMmEdkLM8qo82CzDwsvtLF/P4aKFnNOkuF
 HcSc/ETUcadJ+aKJIg4Wx5LTMK5Ab1P+ds2MNaQTrRJ1YU71gFQVsq9WNwfwfZIJwhDA
 xwSw==
X-Gm-Message-State: AO0yUKXaIM11gbLcZD7R01y4eBgRHKDoVs/Fk7Ds6ASQQRcc5vLFezXE
 v8Q2KoDhuz7WMYrL1W7XmMDV3A==
X-Google-Smtp-Source: AK7set9qRwS9KK6hBBohaRF3L5B2ru2zJVrTS4WbmbGRiLcPQJ7BzlvfGx8yi9xnXwYWSRhxP+9xSg==
X-Received: by 2002:a17:907:c22:b0:930:1178:2220 with SMTP id
 ga34-20020a1709070c2200b0093011782220mr2685504ejc.40.1678954178709; 
 Thu, 16 Mar 2023 01:09:38 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f?
 ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
 by smtp.gmail.com with ESMTPSA id
 td10-20020a1709078c8a00b009256a5c3b2dsm3559556ejc.90.2023.03.16.01.09.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 01:09:38 -0700 (PDT)
Message-ID: <faf70823-f87b-ba50-ac72-3552de1cc7e3@linaro.org>
Date: Thu, 16 Mar 2023 09:09:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230313225103.30512-1-Sergey.Semin@baikalelectronics.ru>
 <20230313225103.30512-15-Sergey.Semin@baikalelectronics.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230313225103.30512-15-Sergey.Semin@baikalelectronics.ru>
X-Topics: 
Cc: devicetree@vger.kernel.org, Biao Huang <biao.huang@mediatek.com>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Christian Marangi <ansuelsmth@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 14/16] dt-bindings: net: dwmac:
 Use flag definition instead of booleans
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

On 13/03/2023 23:51, Serge Semin wrote:
> Currently some of the boolean properties defined in the DT-schema are
> marked to have the basic boolean type meanwhile the rest referencing the
> /schemas/types.yaml#/definitions/flag schema. For the sake of unification
> let's convert the first group to referencing the pre-defined flag schema.
> Thus bindings will look a bit more coherent and the DT-bindings
> maintainers will have a better control over the booleans defined in the
> schema (if ever needed).
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   | 45 ++++++++++++-------
>  1 file changed, 30 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 69be39d55403..a863b5860566 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -120,11 +120,13 @@ properties:
>          maximum: 12
>  
>        snps,rx-sched-sp:
> -        type: boolean
> +        $ref: /schemas/types.yaml#/definitions/flag
>          description: Strict priority

If ever touching this, it should be other way -> boolean.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
