Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFB174D92D
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jul 2023 16:42:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C38AC6B457;
	Mon, 10 Jul 2023 14:42:42 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49051C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 14:42:41 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-3457a3ada84so24237465ab.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 07:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689000160; x=1691592160;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9youPIImCCAcdEckdoxFQrNpLYrygdk7W9ZtiP8w15k=;
 b=iAtbP21henjC9U2dGYzNju/GBbMYkLTsIeD3vSMCZ4Mogce/wMtNU/AwPc71me0TNI
 l4D8mTuZGqj3aUshwlVTaxhq95eH4rutBKP492yDMR72HCMCXqlzntb9tgWSe5A83OaF
 Lzb2CnY5t9Q3aILVyQGeUADt+qLKE+0S+YG7JEZ6MymrZNeEiq/TrPGys1OrP5Ye+wgl
 swrxlU2tPLAsFuDXKddIE3dwPUd1iB823rq3VY4ZKqB5MoeMz+cKPTfmCvXxthtNh1hf
 3gBJ4ZK1FL+eNgvzBVbug93oH3DYYJIX9NPkUGmdipP3oc25r4KdybGl4yB3HwGeepdL
 7jrA==
X-Gm-Message-State: ABy/qLahf/F1Pnio1JsMROlw6YsZ6YkQ3mmdLDvHzssqECZN7twBMTB8
 xcD0BuW/Dc9hMkOJSv5wag==
X-Google-Smtp-Source: APBJJlG3K/ro2oZtTnsZ7Banw1CdZJLy4OFKR61udj8GbrxlXMYjo+jeaSBEKYBDTKO2X9W4TkNn0w==
X-Received: by 2002:a92:502:0:b0:345:c8ce:ff4e with SMTP id
 q2-20020a920502000000b00345c8ceff4emr11579387ile.3.1689000160019; 
 Mon, 10 Jul 2023 07:42:40 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a92d307000000b00342f537e3c3sm3560577ila.2.2023.07.10.07.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 07:42:39 -0700 (PDT)
Received: (nullmailer pid 1938541 invoked by uid 1000);
 Mon, 10 Jul 2023 14:42:35 -0000
Date: Mon, 10 Jul 2023 08:42:35 -0600
From: Rob Herring <robh@kernel.org>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Message-ID: <20230710144235.GA1922048-robh@kernel.org>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-5-gatien.chevallier@foss.st.com>
 <20230706145108.GA3858320-robh@kernel.org>
 <0aaace47-1bb4-82c5-57a5-6f5d27eb4d45@foss.st.com>
 <20230707152056.GA317056-robh@kernel.org>
 <fb72b4e4-d5c6-d9be-269d-29aff996001c@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fb72b4e4-d5c6-d9be-269d-29aff996001c@foss.st.com>
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

On Mon, Jul 10, 2023 at 10:22:10AM +0200, Gatien CHEVALLIER wrote:
> 
> 
> On 7/7/23 17:20, Rob Herring wrote:
> > On Fri, Jul 07, 2023 at 02:28:28PM +0200, Gatien CHEVALLIER wrote:
> > > Hello Rob,
> > > 
> > > On 7/6/23 16:51, Rob Herring wrote:
> > > > On Wed, Jul 05, 2023 at 07:27:53PM +0200, Gatien Chevallier wrote:
> > > > > feature-domains is an optional property that allows a peripheral to
> > > > > refer to one or more feature domain controller(s).
> > > > > 
> > > > > Description of this property is added to all peripheral binding files of
> > > > > the peripheral under the STM32 firewall controllers. It allows an accurate
> > > > > representation of the hardware, where various peripherals are connected
> > > > > to this firewall bus. The firewall can then check the peripheral accesses
> > > > > before allowing it to probe.
> > > > > 
> > > > > Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> > > > > ---
> > > > > 
> > > > > Disclaimer: Some error with dtbs_check will be observed as I've
> > > > > considered the property to be generic, as Rob asked
> > > > > 
> > > > >    Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml  | 4 ++++
> > > > >    Documentation/devicetree/bindings/dma/st,stm32-dma.yaml      | 4 ++++
> > > > >    Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml   | 4 ++++
> > > > >    Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml      | 4 ++++
> > > > >    Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml  | 4 ++++
> > > > >    .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml      | 4 ++++
> > > > >    Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml  | 4 ++++
> > > > >    .../devicetree/bindings/media/cec/st,stm32-cec.yaml          | 4 ++++
> > > > >    Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml   | 4 ++++
> > > > >    .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml       | 4 ++++
> > > > >    Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml  | 4 ++++
> > > > >    Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml   | 5 +++++
> > > > >    Documentation/devicetree/bindings/mmc/arm,pl18x.yaml         | 4 ++++
> > > > >    Documentation/devicetree/bindings/net/stm32-dwmac.yaml       | 4 ++++
> > > > >    Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml | 4 ++++
> > > > >    .../devicetree/bindings/regulator/st,stm32-vrefbuf.yaml      | 4 ++++
> > > > >    Documentation/devicetree/bindings/rng/st,stm32-rng.yaml      | 4 ++++
> > > > >    Documentation/devicetree/bindings/serial/st,stm32-uart.yaml  | 4 ++++
> > > > >    Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml    | 4 ++++
> > > > >    Documentation/devicetree/bindings/sound/st,stm32-sai.yaml    | 4 ++++
> > > > >    .../devicetree/bindings/sound/st,stm32-spdifrx.yaml          | 4 ++++
> > > > >    Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml     | 4 ++++
> > > > >    Documentation/devicetree/bindings/spi/st,stm32-spi.yaml      | 4 ++++
> > > > >    Documentation/devicetree/bindings/usb/dwc2.yaml              | 4 ++++
> > > > >    24 files changed, 97 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> > > > > index b767ec72a999..daf8dcaef627 100644
> > > > > --- a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> > > > > +++ b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> > > > > @@ -50,6 +50,10 @@ properties:
> > > > >      power-domains:
> > > > >        maxItems: 1
> > > > > +  feature-domains:
> > > > > +    minItems: 1
> > > > > +    maxItems: 3
> > > > 
> > > > What are the 3 entries?
> > > > 
> > > > Rob
> > > 
> > > I thought I was benefiting from the description of the pattern-property in
> > > the RIFSC YAML file. But yes anyway, it seems like it needs some description
> > > here as the dependency does not appear in this file.
> > 
> > Humm, that should limit the maximum entries to 2, so 3 would never work
> > (if RIFSC is the parent).
> > 
> > > I picked 3 as a maxItems for our ST needs, I'll give it some more thought
> > > when coming back with something clearer.
> > 
> > I'd expect you have 1 entry for register bus and 1 entry for DMA bus if
> > there is one. It's block specific for how many entries, so the RIFSC
> > schema should not be setting that. You could possibly say that
> > 'feature-domains' is required for all the child nodes though.
> 
> Ok, I will change to not specifying the number of entries in the
> RIFSC YAML file for V2.
> 
> > 
> > Rob
> Some hardware blocks may have a firewall ID for their device part and
> another ID for their master part as well. In the end, the number of
> entries could very well vary between different platforms. And the YAML
> files are common to these platforms.

A given device has a fixed number of buses. Usually 1 or 2. That does 
*not* vary by platform (unless the device is modified). You could have 
the same firewall controller and id for multiple buses, but that 
should not change the number of entries for the device. Now maybe a bus 
has no firewall on some platforms. In that case, you should make the 
optional firewall entry the last one, have a null phandle (0 or -1), or 
use -names to distinguish the entries.

> This property could be used for "extra" arguments as well, that are not
> firewall IDs.

The arg cells are dictated by the provider and opaque to the client.

> What do you suggest between picking a high maxItems value that would
> (hopefully) cover all cases and not specifying maxItems at all? Or maybe
> another property dedicated to such arguments?

You should not specify maxItems in the firewall controller binding.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
