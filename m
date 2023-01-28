Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E364167F927
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Jan 2023 16:34:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E60FC6907A;
	Sat, 28 Jan 2023 15:34:41 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DA09C69053
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Jan 2023 15:34:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 004CC60C1E;
 Sat, 28 Jan 2023 15:34:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3AFC433D2;
 Sat, 28 Jan 2023 15:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674920078;
 bh=9p78P6cXR1b4UU7LmDHxucqXQwLRZGC/wmG/lLypzGo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Sy0kkDvx7E1gVGfY9fcdg6jg5BXRuQjvDhZ65C8k3WA9gemy6YC6wX3Gx8hJ6J27H
 8x4NyS2i9dc7yo7IjeKLfkJbdrwJvnmDYjTa4VHC3ZyoFewAW5vk21MiodWH4XZwsX
 hne0KUqKUSiitaWQeznzMa5EsGNKQWvl+kY3QxWw+anNiuYxGsLpiX903y2CKtuGcp
 1fpsi44mIXd51SeVfoW/J74LAmTLYdVHs6Gm3e4i8FSUlAL+oM3JvIYVMzXpMO2fFv
 E1feNPP7OEIcUHmrswPBcbUTonWBEPjeef08rq4yiie66P9WWGcsokUtwiNIK3F1g9
 /JHmxQiRyr/aQ==
Date: Sat, 28 Jan 2023 15:48:27 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <20230128154827.4f23534e@jic23-huawei>
In-Reply-To: <20230127164040.1047583-4-gatien.chevallier@foss.st.com>
References: <20230127164040.1047583-1-gatien.chevallier@foss.st.com>
 <20230127164040.1047583-4-gatien.chevallier@foss.st.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, edumazet@google.com,
 Oleksii_Moisieiev@epam.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 herbert@gondor.apana.org.au, kuba@kernel.org, arnaud.pouliquen@foss.st.com,
 pabeni@redhat.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net,
 linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 3/6] dt-bindings: bus: add STM32 System
	Bus
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

On Fri, 27 Jan 2023 17:40:37 +0100
Gatien Chevallier <gatien.chevallier@foss.st.com> wrote:

> Document STM32 System Bus. This bus is intended to control firewall
> access for the peripherals connected to it.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Signed-off-by: Loic PALLARDY <loic.pallardy@st.com>
Trivial comment on formatting.

> +
> +examples:
> +  - |
> +    // In this example, the rng1 device refers to etzpc as its domain controller.
> +    // Same goes for fmc.
> +    // Access rights are verified before creating devices.
> +
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    #include <dt-bindings/reset/stm32mp1-resets.h>
> +
> +    etzpc: bus@5c007000 {
> +        compatible = "st,stm32mp15-sys-bus";
> +        reg = <0x5c007000 0x400>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +        feature-domain-controller;
> +        #feature-domain-cells = <1>;
> +
> +        rng1: rng@54003000 {

Odd mixture of 4 spacing and 2 spacing in this example.
I'd suggest one or the other (slight preference for 4 space indents).


> +          compatible = "st,stm32-rng";
> +          reg = <0x54003000 0x400>;
> +          clocks = <&rcc RNG1_K>;
> +          resets = <&rcc RNG1_R>;
> +          feature-domains = <&etzpc 7>;
> +          status = "disabled";
> +        };
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
