Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 079A5749FC3
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jul 2023 16:51:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A726FC6B45B;
	Thu,  6 Jul 2023 14:51:15 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2750CC6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Jul 2023 14:51:14 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-3458a08310aso2656845ab.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Jul 2023 07:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688655073; x=1691247073;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cgnDkKPeeJQpJAr8Igz1bUHZ3qFXqLqwtv/vw0h6laQ=;
 b=IW2GHTeL/fmM6voKsWcOs8CpAXZATBnzF4BY9svYKHzOQgz7kjo3PdtEhUcfp3x5Gu
 2FH1us5qyCAS6LtNBYl66N3QwLJqfoEuK6OQ2iEvSfMcLJ9t/S9EvnvVVnupjXwmPeV0
 pIhvIjmxX3/4fw7bz2Ik91SJ4sk/kFx9EA74Ts3efUR9aHLevqaWbKsiz43nCq5rTC+M
 EILJh1WkUvFhXBXnFeraO5/zW1vabOKM6RL9P+4O7FVkwRleqIjb0JHtef8Sffg/RS/B
 W0aRmsfXaTCP4z0nr7W/xVFhJFt3W7xh99OscVd4yv0goVxYmlpRHnN5yeEMbcdC9966
 h+jw==
X-Gm-Message-State: ABy/qLaY7d95koS+Xt/cFvtQ5foO0hAaULigvhm9yRCZAYqZggVubeN3
 fOgZtJU54oYC+UeRgB0UYA==
X-Google-Smtp-Source: APBJJlF67lR6D5NqnrBz/z/xaj4p5WF0VZl589v9nUuz7XC/TU588WYs6w03reMlD4UBeRhzLPXgQw==
X-Received: by 2002:a92:c52c:0:b0:345:d458:d227 with SMTP id
 m12-20020a92c52c000000b00345d458d227mr2368778ili.7.1688655072884; 
 Thu, 06 Jul 2023 07:51:12 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a0566380bd100b0042b3e2e5ca1sm569170jad.122.2023.07.06.07.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 07:51:12 -0700 (PDT)
Received: (nullmailer pid 3861827 invoked by uid 1000);
 Thu, 06 Jul 2023 14:51:08 -0000
Date: Thu, 6 Jul 2023 08:51:08 -0600
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <20230706145108.GA3858320-robh@kernel.org>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-5-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230705172759.1610753-5-gatien.chevallier@foss.st.com>
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 edumazet@google.com, Oleksii_Moisieiev@epam.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 will@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 herbert@gondor.apana.org.au, hugues.fruchet@foss.st.com, lee@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org,
 alsa-devel@alsa-project.org, richardcochran@gmail.com,
 linux-serial@vger.kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, arnd@kernel.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net,
 jic23@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 04/10] dt-bindings: treewide: add
 feature-domains description in binding files
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

On Wed, Jul 05, 2023 at 07:27:53PM +0200, Gatien Chevallier wrote:
> feature-domains is an optional property that allows a peripheral to
> refer to one or more feature domain controller(s).
> 
> Description of this property is added to all peripheral binding files of
> the peripheral under the STM32 firewall controllers. It allows an accurate
> representation of the hardware, where various peripherals are connected
> to this firewall bus. The firewall can then check the peripheral accesses
> before allowing it to probe.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
> 
> Disclaimer: Some error with dtbs_check will be observed as I've
> considered the property to be generic, as Rob asked
> 
>  Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml  | 4 ++++
>  Documentation/devicetree/bindings/dma/st,stm32-dma.yaml      | 4 ++++
>  Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml   | 4 ++++
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml      | 4 ++++
>  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml  | 4 ++++
>  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml      | 4 ++++
>  Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml  | 4 ++++
>  .../devicetree/bindings/media/cec/st,stm32-cec.yaml          | 4 ++++
>  Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml   | 4 ++++
>  .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml       | 4 ++++
>  Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml  | 4 ++++
>  Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml   | 5 +++++
>  Documentation/devicetree/bindings/mmc/arm,pl18x.yaml         | 4 ++++
>  Documentation/devicetree/bindings/net/stm32-dwmac.yaml       | 4 ++++
>  Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml | 4 ++++
>  .../devicetree/bindings/regulator/st,stm32-vrefbuf.yaml      | 4 ++++
>  Documentation/devicetree/bindings/rng/st,stm32-rng.yaml      | 4 ++++
>  Documentation/devicetree/bindings/serial/st,stm32-uart.yaml  | 4 ++++
>  Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml    | 4 ++++
>  Documentation/devicetree/bindings/sound/st,stm32-sai.yaml    | 4 ++++
>  .../devicetree/bindings/sound/st,stm32-spdifrx.yaml          | 4 ++++
>  Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml     | 4 ++++
>  Documentation/devicetree/bindings/spi/st,stm32-spi.yaml      | 4 ++++
>  Documentation/devicetree/bindings/usb/dwc2.yaml              | 4 ++++
>  24 files changed, 97 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> index b767ec72a999..daf8dcaef627 100644
> --- a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> +++ b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> @@ -50,6 +50,10 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 3

What are the 3 entries?

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
