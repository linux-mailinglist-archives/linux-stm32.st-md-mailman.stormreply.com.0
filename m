Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9355D74B402
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jul 2023 17:21:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46F64C6B45C;
	Fri,  7 Jul 2023 15:21:05 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E17BAC6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jul 2023 15:21:03 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-3458a08310aso7694245ab.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Jul 2023 08:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688743263; x=1691335263;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rL/IqSliQWE/k5qHxsNvvh1YZrhQdGRZyr99h97/eUY=;
 b=EWJeNcgtnMJEegBtvdjg/+qiC4uGw5fvNcv6Mz8Ul37z3XgCIn/D8eoqmE4Zj73Niq
 UcrsbLXu5vsPbKdQo4EpjUZRIcCXz4C6YYZMOxTWrdA94mFY9XLt5eIP0N916/cDUqkf
 pthfRiDh01S8plQJNx6YBKzM9V/uzsQtMug1bv5AznMBuyBn/XpG7oYqZGD/+SH7/Pkd
 hSoyS8iUXevO0gzyooAuIPkmiNlffTEQQ4riF8i357ZOBxBXLHWfCVVM6/UCOoXvvNKd
 S7BACNNIKbOEporvxSDTnhbhmilDr//PiiEVn4j+5R5fcIRvnLHaRC0/9RN1m5Lk4/5t
 e7eA==
X-Gm-Message-State: ABy/qLY89Mxw69sfs52kOkNbBgNGpZSyw9SJI1jFJUcbKVQ+XctIf7kG
 ZpJI8cA+2Unq4BDta+eRlQ==
X-Google-Smtp-Source: APBJJlFyYg4jsqLMtrZwdHhLv4pwfC6duMAPrAIt71GIj1jKSnKNUViqYaVUZmofZqUjjxCTBsm9Mg==
X-Received: by 2002:a92:de12:0:b0:346:b85:5f2 with SMTP id
 x18-20020a92de12000000b003460b8505f2mr5198421ilm.23.1688743262706; 
 Fri, 07 Jul 2023 08:21:02 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a92dccb000000b00325e56c1cdcsm1386377ilr.49.2023.07.07.08.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 08:21:01 -0700 (PDT)
Received: (nullmailer pid 327561 invoked by uid 1000);
 Fri, 07 Jul 2023 15:20:56 -0000
Date: Fri, 7 Jul 2023 09:20:56 -0600
From: Rob Herring <robh@kernel.org>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Message-ID: <20230707152056.GA317056-robh@kernel.org>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-5-gatien.chevallier@foss.st.com>
 <20230706145108.GA3858320-robh@kernel.org>
 <0aaace47-1bb4-82c5-57a5-6f5d27eb4d45@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0aaace47-1bb4-82c5-57a5-6f5d27eb4d45@foss.st.com>
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

On Fri, Jul 07, 2023 at 02:28:28PM +0200, Gatien CHEVALLIER wrote:
> Hello Rob,
> 
> On 7/6/23 16:51, Rob Herring wrote:
> > On Wed, Jul 05, 2023 at 07:27:53PM +0200, Gatien Chevallier wrote:
> > > feature-domains is an optional property that allows a peripheral to
> > > refer to one or more feature domain controller(s).
> > > 
> > > Description of this property is added to all peripheral binding files of
> > > the peripheral under the STM32 firewall controllers. It allows an accurate
> > > representation of the hardware, where various peripherals are connected
> > > to this firewall bus. The firewall can then check the peripheral accesses
> > > before allowing it to probe.
> > > 
> > > Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> > > ---
> > > 
> > > Disclaimer: Some error with dtbs_check will be observed as I've
> > > considered the property to be generic, as Rob asked
> > > 
> > >   Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml  | 4 ++++
> > >   Documentation/devicetree/bindings/dma/st,stm32-dma.yaml      | 4 ++++
> > >   Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml   | 4 ++++
> > >   Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml      | 4 ++++
> > >   Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml  | 4 ++++
> > >   .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml      | 4 ++++
> > >   Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml  | 4 ++++
> > >   .../devicetree/bindings/media/cec/st,stm32-cec.yaml          | 4 ++++
> > >   Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml   | 4 ++++
> > >   .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml       | 4 ++++
> > >   Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml  | 4 ++++
> > >   Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml   | 5 +++++
> > >   Documentation/devicetree/bindings/mmc/arm,pl18x.yaml         | 4 ++++
> > >   Documentation/devicetree/bindings/net/stm32-dwmac.yaml       | 4 ++++
> > >   Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml | 4 ++++
> > >   .../devicetree/bindings/regulator/st,stm32-vrefbuf.yaml      | 4 ++++
> > >   Documentation/devicetree/bindings/rng/st,stm32-rng.yaml      | 4 ++++
> > >   Documentation/devicetree/bindings/serial/st,stm32-uart.yaml  | 4 ++++
> > >   Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml    | 4 ++++
> > >   Documentation/devicetree/bindings/sound/st,stm32-sai.yaml    | 4 ++++
> > >   .../devicetree/bindings/sound/st,stm32-spdifrx.yaml          | 4 ++++
> > >   Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml     | 4 ++++
> > >   Documentation/devicetree/bindings/spi/st,stm32-spi.yaml      | 4 ++++
> > >   Documentation/devicetree/bindings/usb/dwc2.yaml              | 4 ++++
> > >   24 files changed, 97 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> > > index b767ec72a999..daf8dcaef627 100644
> > > --- a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> > > +++ b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> > > @@ -50,6 +50,10 @@ properties:
> > >     power-domains:
> > >       maxItems: 1
> > > +  feature-domains:
> > > +    minItems: 1
> > > +    maxItems: 3
> > 
> > What are the 3 entries?
> > 
> > Rob
> 
> I thought I was benefiting from the description of the pattern-property in
> the RIFSC YAML file. But yes anyway, it seems like it needs some description
> here as the dependency does not appear in this file.

Humm, that should limit the maximum entries to 2, so 3 would never work 
(if RIFSC is the parent). 

> I picked 3 as a maxItems for our ST needs, I'll give it some more thought
> when coming back with something clearer.

I'd expect you have 1 entry for register bus and 1 entry for DMA bus if 
there is one. It's block specific for how many entries, so the RIFSC 
schema should not be setting that. You could possibly say that 
'feature-domains' is required for all the child nodes though.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
