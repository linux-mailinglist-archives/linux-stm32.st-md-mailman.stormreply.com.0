Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F14A6E0812
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Apr 2023 09:46:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA61BC69063;
	Thu, 13 Apr 2023 07:46:41 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 605E5C57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Apr 2023 07:46:40 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id ga37so35522190ejc.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Apr 2023 00:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681372000; x=1683964000;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uijb1uXkwk/VeMyOn96gYfBtO6LlBQttzcvm4ZtKChY=;
 b=S2/3sC9+Ui2RNwCSNyZw8v7BFEan+m1/PyXi1WMCvxaxhnzOtR8QJtJBvqreeatKaO
 tIocIb4k+Kzkp26C6sM/sI2E67qYGiCdpAnj1ywxBptBA/fFOUTQ4tSomjgMoDcxFQFb
 1lB7EAp/YMnR4PaXw+GQMDhC04q5uUXEWDxb70UXcAbznPSG6qgHCPXEF99GPObOH79n
 K2xybv+Bqaw9SnoxEXjcAin3A3c6IR5GbnvZv7Dla3CZXgKTJSrjLxfblOlLSsc+lKeP
 oITxvhzyuNC4+pm96LgsKmroNCXXbsA6stK0EB9FT+273gWDugY6TT7mi5Wa+g0PZy/r
 h1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681372000; x=1683964000;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uijb1uXkwk/VeMyOn96gYfBtO6LlBQttzcvm4ZtKChY=;
 b=FTI45S6iCZ1YcGvqv2zDrI6OTkiigv1KvC29iV5Eo7fu3j8O4a2y4mvhOBw8GQ19Yu
 d6u+YrLmFVneHGNfGb2k7Xu8wEufZCvRjfWb3WDuG9yBrvo5hExFj1lu+D8Pg9b3oL2X
 nO+OD0x9rBEitNl+9TpKYneU32QwOs9Wrw5wzH+JUgGRRE5RHKsnjbS17TVwhULT254u
 B9dD+93iOhwmIyR0ndWgMU68Qsz7KvwDmG0kDFK1OCOipiX7NoRAJ+LwdmhxcFmByaT2
 WeAJkrDyFXWD3uGGrC1pP7kQLlShgCyZmiFmYlZ3QdSOI7lyJjawoUFz/ixdiaQPQB6J
 3IEw==
X-Gm-Message-State: AAQBX9cId30RXcjnUS17m+Q5bQ6XGSXe6cy8owayGGnuQFuryNefSxeJ
 DKCKH24GY4JiSpS09r4d0rLgvQ==
X-Google-Smtp-Source: AKy350YsRSZg5DBCeRNa2+QATFH6DFDUvoHjRWEdO6DKRqsBrBBzA3yXWW9bLLaKuzCdQcbcXG3/sA==
X-Received: by 2002:a17:907:7054:b0:94e:23b:75e9 with SMTP id
 ws20-20020a170907705400b0094e023b75e9mr1868945ejb.43.1681371999907; 
 Thu, 13 Apr 2023 00:46:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ec6f:1b33:ab3f:bfd7?
 ([2a02:810d:15c0:828:ec6f:1b33:ab3f:bfd7])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a1709060c0d00b0094e729d333fsm547697ejf.222.2023.04.13.00.46.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 00:46:39 -0700 (PDT)
Message-ID: <f698eaf5-963e-a40e-34b6-92693138b374@linaro.org>
Date: Thu, 13 Apr 2023 09:46:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, hminas@synopsys.com,
 gregkh@linuxfoundation.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alexandre.torgue@foss.st.com
References: <20230412151831.3069211-1-fabrice.gasnier@foss.st.com>
 <20230412151831.3069211-3-fabrice.gasnier@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412151831.3069211-3-fabrice.gasnier@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/4] dt-bindings: usb: dwc2: add utmi
	optional clock
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

On 12/04/2023 17:18, Fabrice Gasnier wrote:
> utmi clock is typically provided by PHY output. Add this optional clock,
> as the core could use other clocks depending on the SoC where it's used.
> This is needed on stm32mp15, when using the integrated full-speed PHY.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
> index 371ba93f3ce5..6f3c2d319b9b 100644
> --- a/Documentation/devicetree/bindings/usb/dwc2.yaml
> +++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
> @@ -75,11 +75,14 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
>  
>    clock-names:
>      items:
>        - const: otg
> +      - const: utmi_clk

Just: utmi

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
