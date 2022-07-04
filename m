Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA3B564F24
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Jul 2022 09:55:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F36FC640EC;
	Mon,  4 Jul 2022 07:55:37 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B494BC5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Jul 2022 07:55:35 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id c15so10131190ljr.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Jul 2022 00:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=B2nX36DhNE+YPsgSpf2ql/EZ3h6K1ZO8bpe3+8TnPfM=;
 b=nXTYyZDPmlqhJVymYJBfa1NRZ+TXOznu+2u2I7s5wzLVRNeyF/LItXWtpSPcknsWaD
 x80uDexpFmuNjZLMW3uB3s9YTUx2c1AZ+aVvWhnJoWGZtHy9WkvVzHOdU8Dp/3BmkdeU
 ppmhxHLuQwXYwb3TpOARomA+VxzF4qRhB3V6K7XoXjRhcc2/C51NrsRUxPp89PXxdFw6
 gjVKS2EEymm6a98HIRb/hpGaxs1VB0G5ReVZZZgblbywC53Z6gQrXXNGfXJ/xujsR/Er
 GyE1u8ELyk4SMvohECidTKdnolWQzMwhKfDYpQfDTdxV45rWZHGdDcYGsHX1B1+yVrpy
 rO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B2nX36DhNE+YPsgSpf2ql/EZ3h6K1ZO8bpe3+8TnPfM=;
 b=SKGH8G+WD/HmLQGZ/LHzQswwzcgx+TmCqbrYc9rToQ5CdPXv8cZlLfUtA7icLUyZR1
 44d65nl8i8fLk2oQjlBKCsIIw/crbJ5lJt//Zra2vvwNLbdAMB+Ipq7aV1P1xemi0AyQ
 lMCbl8dN2a3OxSANZ8ewIWE5FaC4lDztna2/e389TbvzGgi5jGJliKSYjPTJ2ZxttGXQ
 kNwLJ8//Yj64dDqkJGNOjHWBv8ilB1jp5gjsyNgjzKfH5s06B+je2NNBMrReO/ARJceT
 jcZZwIaaWf1VE2H3242j3twZFNCzlq4Td1C1EaYkPtNMtzErLgynzq2F4lEV8GGqZxDc
 QJ7g==
X-Gm-Message-State: AJIora+Yzo2GnrQtHDA0RgqJ/HeJZWq4G0Uo48qiPpwsqNtRKvnwRjyF
 gTFXpsxXxwz7wEw7rsjm3jGQtg==
X-Google-Smtp-Source: AGRyM1sU96AoUiSmtK7GcqHBoEun+kgEcDD3k31uifc31fPwq4I7gS9lnhrtoen40aoC/4x5NeFCmg==
X-Received: by 2002:a2e:908d:0:b0:25b:cabc:31a1 with SMTP id
 l13-20020a2e908d000000b0025bcabc31a1mr15627633ljg.32.1656921335008; 
 Mon, 04 Jul 2022 00:55:35 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a19ca09000000b00477a6c86f17sm5017773lfg.8.2022.07.04.00.55.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 00:55:34 -0700 (PDT)
Message-ID: <0821acfe-bcfe-b1d8-c1a9-81023f4ab6a0@linaro.org>
Date: Mon, 4 Jul 2022 09:55:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, robh+dt@kernel.org
References: <20220624155413.399190-1-fabrice.gasnier@foss.st.com>
 <20220624155413.399190-2-fabrice.gasnier@foss.st.com>
 <ddb0e946-c955-1404-c1cd-c2548f34ec35@linaro.org>
 <845d6817-d2e4-7925-f7f5-da1102514636@foss.st.com>
 <286633b2-43d2-655e-b3f1-54bf5c7a4a21@linaro.org>
 <6ef58f1f-ee8a-b060-6fda-d1388b3ede6d@foss.st.com>
 <f86dd47c-0fc5-6c93-a49e-534610d10c49@linaro.org>
 <dfad8fb5-6205-d620-81eb-5d44b9175e05@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <dfad8fb5-6205-d620-81eb-5d44b9175e05@foss.st.com>
Cc: devicetree@vger.kernel.org, heikki.krogerus@linux.intel.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/4] dt-bindings: usb: typec: add bindings
 for stm32g0 controller
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

On 01/07/2022 12:04, Fabrice Gasnier wrote:
> 
> Then I no longer get this warning upon build. But the dtbs_check complains:
> ---
> connector: ports: 'port@0' is a required property
> 	From schema: ..
> Documentation/devicetree/bindings/connector/usb-connector.yaml
> 
> So It looks like to me there's something missing to handle the single
> port case in usb-connector.yaml, when using the "ports".
> 
> Maybe usb-connector could be updated to handle "port" (w/o unit-addr) ?

Not really, the dtc warning looks false-positive. Especially that you
need port@1 for USB 3.0 (super speed), unless you do not support it?

> I'm talking about:
>     required:
>       - port@0
> 
> So, I came up with:
> 
> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> @@ -176,6 +176,9 @@ properties:
>        port number as described below.
> 
>      properties:
> +      port:
> +        $ref: /schemas/graph.yaml#/properties/port
> +
>        port@0:
>          $ref: /schemas/graph.yaml#/properties/port
>          description: High Speed (HS), present in all connectors.
> @@ -189,8 +192,11 @@ properties:
>          description: Sideband Use (SBU), present in USB-C. This
> describes the
>            alternate mode connection of which SBU is a part.
> 
> -    required:
> -      - port@0
> +    oneOf:
> +      - required:
> +          - port
> +      - required:
> +          - port@0
> 
> 
> Do you agree on this approach ? (I can add a pre-cursor patch to this
> series, to handle the single port case)



Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
