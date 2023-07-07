Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5718274B431
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jul 2023 17:27:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BFE3C6B45C;
	Fri,  7 Jul 2023 15:27:32 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFA9EC6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jul 2023 15:27:30 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-3458a08310aso7722475ab.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Jul 2023 08:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688743649; x=1691335649;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iSMX3fbwS3ZdQ14KbIA9PVvNgGYdtwwGwe8Mi8kgYeU=;
 b=RWjdv2tuVasgkG/KgZRHf0kzV5yETIJkLirhFH0wiyBe2LDuvb1Wj1PK3OgwJB5owH
 9Sb/jKNskO6CqVEgjWJ4AUF9jvFNFJ5HfHhTGE1+GeZr/Um/hXBbWgr9ol2NJHhtgOYM
 Xctf/EHFs5VnRQja0kPPeyOMcDW8u1E/RU7LNE05vGVJpftx58Zl8We51g97ryzXH0CC
 x43Sc6h6a+JXFYPdlP5MpHMz/oBb3ayPkpJabl9oRs2TfnX7WBWZeSpaAz1KSt7F+M2M
 3XvnyIW5GidWhRDjK+9VC0/qEKgUSIDcy0V+LLdp609Ldz6g87G/Ymn/kRkEEM5IOLyj
 wr7Q==
X-Gm-Message-State: ABy/qLad6NxPUm6UCOEd4/DJLUzKbuheYce4jKYcHpTNfYpTWIeoMIUj
 ODBlXc5zpXE2JZ+VgxOipQ==
X-Google-Smtp-Source: APBJJlGQb/+NSo1YY2XQiOfry0niDhsIK8kPOwBt3oTrgIhTVOV41ugAIwkpb1OfmPqwJ646BYkBgA==
X-Received: by 2002:a92:c70f:0:b0:345:c11e:d1ad with SMTP id
 a15-20020a92c70f000000b00345c11ed1admr5255201ilp.26.1688743649601; 
 Fri, 07 Jul 2023 08:27:29 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 ee17-20020a056638293100b0042b37080b23sm1279795jab.73.2023.07.07.08.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 08:27:28 -0700 (PDT)
Received: (nullmailer pid 334293 invoked by uid 1000);
 Fri, 07 Jul 2023 15:27:24 -0000
Date: Fri, 7 Jul 2023 09:27:24 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Message-ID: <20230707152724.GA329615-robh@kernel.org>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-5-gatien.chevallier@foss.st.com>
 <875y6vzuga.fsf@epam.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <875y6vzuga.fsf@epam.com>
Cc: "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "edumazet@google.com" <edumazet@google.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "will@kernel.org" <will@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
 "hugues.fruchet@foss.st.com" <hugues.fruchet@foss.st.com>,
 "lee@kernel.org" <lee@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>,
 "pabeni@redhat.com" <pabeni@redhat.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "richardcochran@gmail.com" <richardcochran@gmail.com>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "arnd@kernel.org" <arnd@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "jic23@kernel.org" <jic23@kernel.org>
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

On Fri, Jul 07, 2023 at 02:07:18PM +0000, Oleksii Moisieiev wrote:
> 
> Gatien Chevallier <gatien.chevallier@foss.st.com> writes:
> 
> > feature-domains is an optional property that allows a peripheral to
> > refer to one or more feature domain controller(s).
> >
> > Description of this property is added to all peripheral binding files of
> > the peripheral under the STM32 firewall controllers. It allows an accurate
> > representation of the hardware, where various peripherals are connected
> > to this firewall bus. The firewall can then check the peripheral accesses
> > before allowing it to probe.
> >
> > Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> > ---
> >
> > Disclaimer: Some error with dtbs_check will be observed as I've
> > considered the property to be generic, as Rob asked
> >
> >  Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml  | 4 ++++
> >  Documentation/devicetree/bindings/dma/st,stm32-dma.yaml      | 4 ++++
> >  Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml   | 4 ++++
> >  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml      | 4 ++++
> >  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml  | 4 ++++
> >  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml      | 4 ++++
> >  Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml  | 4 ++++
> >  .../devicetree/bindings/media/cec/st,stm32-cec.yaml          | 4 ++++
> >  Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml   | 4 ++++
> >  .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml       | 4 ++++
> >  Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml  | 4 ++++
> >  Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml   | 5 +++++
> >  Documentation/devicetree/bindings/mmc/arm,pl18x.yaml         | 4 ++++
> >  Documentation/devicetree/bindings/net/stm32-dwmac.yaml       | 4 ++++
> >  Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml | 4 ++++
> >  .../devicetree/bindings/regulator/st,stm32-vrefbuf.yaml      | 4 ++++
> >  Documentation/devicetree/bindings/rng/st,stm32-rng.yaml      | 4 ++++
> >  Documentation/devicetree/bindings/serial/st,stm32-uart.yaml  | 4 ++++
> >  Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml    | 4 ++++
> >  Documentation/devicetree/bindings/sound/st,stm32-sai.yaml    | 4 ++++
> >  .../devicetree/bindings/sound/st,stm32-spdifrx.yaml          | 4 ++++
> >  Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml     | 4 ++++
> >  Documentation/devicetree/bindings/spi/st,stm32-spi.yaml      | 4 ++++
> >  Documentation/devicetree/bindings/usb/dwc2.yaml              | 4 ++++
> >  24 files changed, 97 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> > index b767ec72a999..daf8dcaef627 100644
> > --- a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> > +++ b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> > @@ -50,6 +50,10 @@ properties:
> >    power-domains:
> >      maxItems: 1
> >  
> > +  feature-domains:
> > +    minItems: 1
> > +    maxItems: 3
> > +
> 
> I beliewe feature-domains is generic binding. This means that maxItems
> can be implementation dependend. I would rather drop maxItems so the
> following format will be possible:
> 
>           feature-domains = <&etzpc 1>, <&etzpc 2>, <&some_other_domain 1 2 3 4>
>           feature-domain-names = "firewall 1", "firewall 2", "other_domain"

The above already allows this (not -names, but the number of entries).
> 
> Also I beliewe driver will handle feature-domain-names property so it
> will parse feature-domains only related to the firewall.

Now I'm curious. What's an example that's not a firewall?

(Note I'm still not happy with the naming of 'feature' as anything is a 
feature, but that's the least of the issues really.)

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
