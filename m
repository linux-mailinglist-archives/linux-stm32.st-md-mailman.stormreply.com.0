Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B42F85A16B8
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Aug 2022 18:32:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75EDCC6410A;
	Thu, 25 Aug 2022 16:32:19 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9280DC640FB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Aug 2022 16:32:17 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id c2so18987596plo.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Aug 2022 09:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=sPnypK+omnN4NaKyZT/jJYzqdJLQrrS9NmH3ZYgM+1c=;
 b=Sd1KVFPrdCZf7Afab7qAt7rAKxXkdSaydhBN2TY7lxwcH7lh11Bb5qE6LQFvcq6y/w
 u37tdcyA/7+vo5Vjrn/eHyXPULWhbKrRd+PctBVJC7ZnTGGhvBeJE6bOvpFFoNY2Cvdn
 LXIpnQ69V4lR4u69xO9vty38GUHaJOXxIqp4p7l+E6W8qnlZofexhXDG1AgZQ3mr4C/m
 MURrPCnnyE7iGf/gb9XMT3RelVphZ32/cB07R/S4Z65Vggk/4KrQ7b+HzDvAMS9SO/kH
 samVKKG/Mlm6NPLdH8jiIBp/5f9JVx6Dpj5i2EJg3if/IfiRo0ymVvipR1LHbXK8p49m
 mI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=sPnypK+omnN4NaKyZT/jJYzqdJLQrrS9NmH3ZYgM+1c=;
 b=3fxMengHt+UdFEkZ5wPd8IhfC0VDQmU/KjbPHuohAWeY3POPoOx+BNJlaZ6e/PyFbB
 LdH3ilyETrBwcy6CQxHs+Eiluua+Rv0DC7gMlYXbgr7D19WVScgdponmImIHzq1kT5yO
 OhUNOnnrcU5bBeq1zzMuKp1rdHP/zzXQS7KN7ycUL1YdL3A/qB/alrsC6z3ipiudBlNi
 W2qiMMO4/kL9Uud+ymJild2AsYJM07qVwFpgUMrg8gabFdDv3/kn+G7Ecg3CIl8wgFOA
 l3rlu7i1/ZrCXtd4vDmCvtLzv+pH6kW385/Ve01IdVTrrRjV2oknGQj4ecTrjBgi6yhG
 EntA==
X-Gm-Message-State: ACgBeo0iW5mHpoToK1mwM5cXcQf/LZpVirSuaYzbMe6sm/BOnGYj2sKs
 o9SIJMmEJo8+Jj86q0CJmZtmfg==
X-Google-Smtp-Source: AA6agR7mz8cQUwkxL9Bv/hIpB+gTpvIF8B7Hkh4amGYsubylHmdqLgf+o9KxCVhz7JzWeXfZ52Z5nw==
X-Received: by 2002:a17:90b:4b47:b0:1f7:2e06:5752 with SMTP id
 mi7-20020a17090b4b4700b001f72e065752mr5520149pjb.187.1661445136082; 
 Thu, 25 Aug 2022 09:32:16 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm14983625plh.286.2022.08.25.09.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 09:32:15 -0700 (PDT)
Date: Thu, 25 Aug 2022 10:32:12 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <20220825163212.GA1909152@p14s>
References: <20220721212718.1980905-1-robh@kernel.org>
 <CAL_JsqJCGPSxYb5CqiEM9YAmJjQE4wp_0HCWgBSqPDBBAJRMBA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqJCGPSxYb5CqiEM9YAmJjQE4wp_0HCWgBSqPDBBAJRMBA@mail.gmail.com>
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Coresight ML <coresight@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Leo Yan <leo.yan@linaro.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: arm: coresight: Add
 'power-domains' property
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

On Wed, Aug 24, 2022 at 02:04:31PM -0500, Rob Herring wrote:
> On Thu, Jul 21, 2022 at 4:27 PM Rob Herring <robh@kernel.org> wrote:
> >
> > Coresight components may be in a power domain which is the case for the Arm
> > Juno board. Allow a single 'power-domains' entry for Coresight components.
> 
> Ping.

Somehow this fell through the cracks.  I've applied both patches.

Thanks,
Mathieu

> 
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/arm/arm,coresight-catu.yaml  | 3 +++
> >  Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml   | 3 +++
> >  .../devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml  | 3 +++
> >  .../bindings/arm/arm,coresight-dynamic-replicator.yaml         | 3 +++
> >  Documentation/devicetree/bindings/arm/arm,coresight-etb10.yaml | 3 +++
> >  Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml   | 3 +++
> >  .../devicetree/bindings/arm/arm,coresight-static-funnel.yaml   | 3 +++
> >  .../bindings/arm/arm,coresight-static-replicator.yaml          | 3 +++
> >  Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml   | 3 +++
> >  Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml   | 3 +++
> >  Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml  | 3 +++
> >  .../devicetree/bindings/arm/arm,embedded-trace-extension.yaml  | 3 +++
> >  12 files changed, 36 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-catu.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-catu.yaml
> > index d783d9276124..2bae06eed693 100644
> > --- a/Documentation/devicetree/bindings/arm/arm,coresight-catu.yaml
> > +++ b/Documentation/devicetree/bindings/arm/arm,coresight-catu.yaml
> > @@ -61,6 +61,9 @@ properties:
> >      maxItems: 1
> >      description: Address translation error interrupt
> >
> > +  power-domains:
> > +    maxItems: 1
> > +
> >    in-ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> >      additionalProperties: false
> > diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> > index 72ffe4d1e948..0c5b875cb654 100644
> > --- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> > +++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> > @@ -98,6 +98,9 @@ properties:
> >        base cti node if compatible string arm,coresight-cti-v8-arch is used,
> >        or may appear in a trig-conns child node when appropriate.
> >
> > +  power-domains:
> > +    maxItems: 1
> > +
> >    arm,cti-ctm-id:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> >      description:
> > diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
> > index 1eeedc22857c..44a1041cb0fc 100644
> > --- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
> > +++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
> > @@ -54,6 +54,9 @@ properties:
> >        - const: apb_pclk
> >        - const: atclk
> >
> > +  power-domains:
> > +    maxItems: 1
> > +
> >    in-ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> >
> > diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml
> > index a26ed9214e00..03792e9bd97a 100644
> > --- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml
> > +++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml
> > @@ -54,6 +54,9 @@ properties:
> >        - const: apb_pclk
> >        - const: atclk
> >
> > +  power-domains:
> > +    maxItems: 1
> > +
> >    qcom,replicator-loses-context:
> >      type: boolean
> >      description:
> > diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-etb10.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-etb10.yaml
> > index fd06ede26ceb..90679788e0bf 100644
> > --- a/Documentation/devicetree/bindings/arm/arm,coresight-etb10.yaml
> > +++ b/Documentation/devicetree/bindings/arm/arm,coresight-etb10.yaml
> > @@ -54,6 +54,9 @@ properties:
> >        - const: apb_pclk
> >        - const: atclk
> >
> > +  power-domains:
> > +    maxItems: 1
> > +
> >    in-ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> >      additionalProperties: false
> > diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
> > index e0377ce48537..01200f67504a 100644
> > --- a/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
> > +++ b/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
> > @@ -73,6 +73,9 @@ properties:
> >        - const: apb_pclk
> >        - const: atclk
> >
> > +  power-domains:
> > +    maxItems: 1
> > +
> >    arm,coresight-loses-context-with-cpu:
> >      type: boolean
> >      description:
> > diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
> > index b9da30ab9ccd..06a1d346982c 100644
> > --- a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
> > +++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
> > @@ -27,6 +27,9 @@ properties:
> >    compatible:
> >      const: arm,coresight-static-funnel
> >
> > +  power-domains:
> > +    maxItems: 1
> > +
> >    in-ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> >
> > diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> > index 66ee97370fb2..5178e7fdff0b 100644
> > --- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> > +++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> > @@ -27,6 +27,9 @@ properties:
> >    compatible:
> >      const: arm,coresight-static-replicator
> >
> > +  power-domains:
> > +    maxItems: 1
> > +
> >    in-ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> >      additionalProperties: false
> > diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
> > index 905008faa012..378380c3f5aa 100644
> > --- a/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
> > +++ b/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
> > @@ -61,6 +61,9 @@ properties:
> >        - const: apb_pclk
> >        - const: atclk
> >
> > +  power-domains:
> > +    maxItems: 1
> > +
> >    out-ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> >      additionalProperties: false
> > diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
> > index 3463b6e53aef..e0b88a71356a 100644
> > --- a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
> > +++ b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
> > @@ -55,6 +55,9 @@ properties:
> >        - const: apb_pclk
> >        - const: atclk
> >
> > +  power-domains:
> > +    maxItems: 1
> > +
> >    arm,buffer-size:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> >      deprecated: true
> > diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
> > index e80d48200c37..61a0cdc27745 100644
> > --- a/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
> > +++ b/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
> > @@ -54,6 +54,9 @@ properties:
> >        - const: apb_pclk
> >        - const: atclk
> >
> > +  power-domains:
> > +    maxItems: 1
> > +
> >    in-ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> >      additionalProperties: false
> > diff --git a/Documentation/devicetree/bindings/arm/arm,embedded-trace-extension.yaml b/Documentation/devicetree/bindings/arm/arm,embedded-trace-extension.yaml
> > index 5f07fb166c56..108460627d9a 100644
> > --- a/Documentation/devicetree/bindings/arm/arm,embedded-trace-extension.yaml
> > +++ b/Documentation/devicetree/bindings/arm/arm,embedded-trace-extension.yaml
> > @@ -33,6 +33,9 @@ properties:
> >        Handle to the cpu this ETE is bound to.
> >      $ref: /schemas/types.yaml#/definitions/phandle
> >
> > +  power-domains:
> > +    maxItems: 1
> > +
> >    out-ports:
> >      description: |
> >        Output connections from the ETE to legacy CoreSight trace bus.
> > --
> > 2.34.1
> >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
