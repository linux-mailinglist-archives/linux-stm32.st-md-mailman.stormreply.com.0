Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DC759E493
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Aug 2022 15:41:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F093C640F3;
	Tue, 23 Aug 2022 13:41:53 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6D65C04003
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Aug 2022 13:41:51 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id l1so19201083lfk.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Aug 2022 06:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=94ObA0sxNMfnUjuPe8k5nNJuRKk7+0BvBgJlyDjNB6U=;
 b=MDkEhUd3g66BHtv8ayb5PFnYCSFsUOgMs1J3OFRtFIDpx5xhG7xgYbSmjimRv6ufky
 0wfiKTXYXbklnpVEt8tDV6m2bVs5LPglAFfaoUDTPIGO+GoX/RuIhFzfuv6ktR2mq6Bm
 XslsG1lxC6yywPsVcLVlAjbeWcpCz2+qrLnSTa7/rLHuRufNM/MTRldUkatcSxYQuae7
 4G8OafImliELiwM/yF4BMHPZa6QWfkELACZZ74akC/cKMfVHwJ1t5R4ZXZDHXtC3EhHW
 DMI7bWkl64txNuxh2FKPvy0o+5mFvYDc7zCn7cjkMOtZFrBAJALhoUCrkv9loDPHUF1f
 8SkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=94ObA0sxNMfnUjuPe8k5nNJuRKk7+0BvBgJlyDjNB6U=;
 b=Dnt2w9NKsMR3mxvTXFX+r77+AAtFR9UxLVlA/ybeXxUIh6YKS5R/OyIfSGWg/1dPw1
 9LvaLMf6RnlmqZa6c5LBH87HuBUUGvXd2IWYPX+ur3eBNzpPRZ3v0BhVRM7zz9vvOuxQ
 vkFbxEzu7aJko4oHc5kG+MLimnif0t/DTnE3j3lqqQWVyRtyTxrXCL/k2jrJRUX+hnTt
 6NduUPMINGsAMjXK9LSH/4JlkmyS94zaImCnAxehqspuutSe8fUhtHT1pJOy8cC1WnnX
 FjxSywDIeo+QYAvM8OqL0hmLLsjRQzn54MyQuCsrAsS0IFpvpCaxdBOQsLCwfu3VYeqD
 wIBw==
X-Gm-Message-State: ACgBeo1pdw6+QkgSNOwNLzAtvS3Xwk50VPH76HW9iasNI/ziZhmPcTEg
 WaiMcmiAFTcOI7JH3X0i/6qw/g==
X-Google-Smtp-Source: AA6agR54aEjYHox84XnSc1aRIIM9Si6SlFqPQS60naXJqyyEDfTdI9sa1/BQZa7FkPZn6RojlDJEQQ==
X-Received: by 2002:a05:6512:39d3:b0:492:e172:e313 with SMTP id
 k19-20020a05651239d300b00492e172e313mr3623919lfu.628.1661262111019; 
 Tue, 23 Aug 2022 06:41:51 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
 by smtp.gmail.com with ESMTPSA id
 p16-20020ac24ed0000000b0048b1b2233ddsm1493031lfr.120.2022.08.23.06.41.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 06:41:49 -0700 (PDT)
Message-ID: <fe2041cc-dd8b-6695-1fc8-6c1c49dd7220@linaro.org>
Date: Tue, 23 Aug 2022 16:41:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
References: <20220820082936.686924-1-dario.binacchi@amarulasolutions.com>
 <20220820082936.686924-2-dario.binacchi@amarulasolutions.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220820082936.686924-2-dario.binacchi@amarulasolutions.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-can@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 "David S. Miller" <davem@davemloft.net>, Dario Binacchi <dariobin@libero.it>
Subject: Re: [Linux-stm32] [RFC PATCH v2 1/4] dt-bindings: net: can: add
 STM32 bxcan DT bindings
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

On 20/08/2022 11:29, Dario Binacchi wrote:
> Add documentation of device tree bindings for the STM32 basic extended
> CAN (bxcan) controller.
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> Changes in v2:
> - Change the file name into 'st,stm32-bxcan-core.yaml'.
> - Rename compatibles:
>   - st,stm32-bxcan-core -> st,stm32f4-bxcan-core
>   - st,stm32-bxcan -> st,stm32f4-bxcan
> - Rename master property to st,can-master.
> - Remove the status property from the example.
> - Put the node child properties as required.
> 
>  .../bindings/net/can/st,stm32-bxcan.yaml      | 136 ++++++++++++++++++
>  1 file changed, 136 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml b/Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
> new file mode 100644
> index 000000000000..288631b5556d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
> @@ -0,0 +1,136 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/can/st,stm32-bxcan.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics bxCAN controller
> +
> +description: STMicroelectronics BxCAN controller for CAN bus
> +
> +maintainers:
> +  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +
> +allOf:
> +  - $ref: can-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,stm32f4-bxcan-core
> +
> +  reg:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  clocks:
> +    description:
> +      Input clock for registers access
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - resets
> +  - clocks
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +patternProperties:

No improvements here, so my comment stay. Please fix it.


> +  "^can@[0-9]+$":
> +    type: object
> +    description:
> +      A CAN block node contains two subnodes, representing each one a CAN
> +      instance available on the machine.

I still do not understand why you need children. You did not CC me on
driver change, so difficult to say. You did not describe the parent
device - there is no description. Why do you need parent device at all?
This looks like some driver-driven-bindings instead of just real
hardware description.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
