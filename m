Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8DCC38DA
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Oct 2019 17:24:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DBD2C36B0B;
	Tue,  1 Oct 2019 15:24:33 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9656C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Oct 2019 15:24:30 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id v17so3707216wml.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 01 Oct 2019 08:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qIz20MyIeJ4YRS3q69VVUyLU1/qqd5R6Zf74yV/b9ww=;
 b=fAIbM+fhVIvClGx5xoqY+YvoZEF0sm0bo5qsX2DX5Mg+iPqowCELcFIINkHDdgxJic
 6sYUrSEl3jGnCKbTPdvpRUveJwDVFeny8/cytUviFl/rxXUw+Kcn4t35z/oyLyd3NPrH
 whcsGnNtjtQpwZ0WB7frLDtgCyBJlDplQKaXbbGqun0wsmCg5nRlt/KzcipEti2kZP1g
 0rMyOj1/nVhlScbPtzwfy+Qp4VEIEgcBZ14EiNwCTzjguPnOPvSH+/z90NzB4tuwiW12
 5xH8UH8HIK+OlgXTwN/a2s64yzayc9OV/stCrkSFwSNNM/DycZvGgZTjDyq3e19S07o9
 JdUg==
X-Gm-Message-State: APjAAAUX84ESQ3wpeTMTLbU01NlWspvEBbpCRJzUFHtNZxhGWtDY1xEC
 vO0OclM97v8Do32rH3AQG4I=
X-Google-Smtp-Source: APXvYqzgA01GZd24cae9Ug02bMZVgbmEoHDdIAy+uHttgtTk16j30giNWmxHikB8fPnYof+FbNzouQ==
X-Received: by 2002:a1c:60c1:: with SMTP id u184mr4104201wmb.32.1569943469278; 
 Tue, 01 Oct 2019 08:24:29 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id i1sm4699293wmb.19.2019.10.01.08.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 08:24:28 -0700 (PDT)
Date: Tue, 1 Oct 2019 17:24:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <20191001152422.GA31358@pi3>
References: <20190918173141.4314-1-krzk@kernel.org>
 <20190918173141.4314-2-krzk@kernel.org>
 <20191001140003.GA31344@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191001140003.GA31344@bogus>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: Mark Rutland <mark.rutland@arm.com>, linux-pwm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, Matt Mackall <mpm@selenic.com>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 2/8] dt-bindings: sram: Convert SRAM
 bindings to json-schema
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

On Tue, Oct 01, 2019 at 09:00:03AM -0500, Rob Herring wrote:
> On Wed, Sep 18, 2019 at 07:31:35PM +0200, Krzysztof Kozlowski wrote:
> > Convert generic mmio-sram bindings to DT schema format using
> > json-schema.
> 
> I've been slow getting to this because I started on the same thing...
> 
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > 
> > ---
> > 
> > Changes since v1:
> > 1. Indent example with four spaces (more readable).
> > ---
> >  .../devicetree/bindings/sram/sram.txt         |  80 ----------
> >  .../devicetree/bindings/sram/sram.yaml        | 138 ++++++++++++++++++
> >  2 files changed, 138 insertions(+), 80 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/sram/sram.txt
> >  create mode 100644 Documentation/devicetree/bindings/sram/sram.yaml
> 
> > diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
> > new file mode 100644
> > index 000000000000..8d9d6ce494b2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sram/sram.yaml
> > @@ -0,0 +1,138 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sram/sram.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Generic on-chip SRAM
> > +
> > +maintainers:
> > +  - FIXME <who@should.it.be>
> 
> You can put me.

Sure.

> 
> > +
> > +description: |+
> > +  Simple IO memory regions to be managed by the genalloc API.
> > +
> > +  Each child of the sram node specifies a region of reserved memory. Each
> > +  child node should use a 'reg' property to specify a specific range of
> > +  reserved memory.
> > +
> > +  Following the generic-names recommended practice, node names should
> > +  reflect the purpose of the node. Unit address (@<address>) should be
> > +  appended to the name.
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^sram(@.*)?"
> > +
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - mmio-sram
> > +          - atmel,sama5d2-securam
> 
> I was trying to go down the path of putting all the compatibles for 
> various SRAM bindings here, but I ran into some issues. I need to 
> revisit as I've forgotten the exact issue.
> 
> This would need to be a 'contains' if this is going to work for others.

OK.

> 
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#address-cells":
> > +    description: Should use the same values as the root node.
> > +
> > +  "#size-cells":
> > +    description: Should use the same values as the root node.
> 
> I defined both of these to be 1 as 4GB of SRAM should be enough for a 
> while. We can debate 1 or 2 cells vs. 1, but there's no reason it has to 
> be the same as the root (unless we're failing to do address 
> translation).

That was copied from txt version. I can adjust them to 1 although this
is will more than simple conversion.

> 
> > +
> > +  ranges:
> > +    description:
> > +      Should translate from local addresses within the sram to bus addresses.
> > +
> > +  no-memory-wc:
> > +    description:
> > +      The flag indicating, that SRAM memory region has not to be remapped
> > +      as write combining. WC is used by default.
> > +    type: boolean
> > +
> > +  # TODO: additionalProperties: false
> > +
> > +patternProperties:
> > +  "^([a-z]*-)?sram@[a-f0-9]$":
> > +    type: object
> > +    description:
> > +      Each child of the sram node specifies a region of reserved memory.
> > +    properties:
> > +      reg:
> > +        description:
> > +          IO mem address range, relative to the SRAM range.
> 
> maxItems: 1

OK

> 
> > +
> > +      compatible:
> > +        $ref: /schemas/types.yaml#/definitions/string
> > +        description:
> > +          Should contain a vendor specific string in the form
> > +          <vendor>,[<device>-]<usage>
> > +
> > +      pool:
> > +        description:
> > +          Indicates that the particular reserved SRAM area is addressable
> > +          and in use by another device or devices.
> > +        type: boolean
> > +
> > +      export:
> > +        description:
> > +          Indicates that the reserved SRAM area may be accessed outside
> > +          of the kernel, e.g. by bootloader or userspace.
> > +        type: boolean
> > +
> > +      protect-exec:
> > +        description: |
> > +          Same as 'pool' above but with the additional constraint that code
> > +          will be run from the region and that the memory is maintained as
> > +          read-only, executable during code execution. NOTE: This region must
> > +          be page aligned on start and end in order to properly allow
> > +          manipulation of the page attributes.
> > +        type: boolean
> > +
> > +      label:
> > +        $ref: /schemas/types.yaml#/definitions/string
> 
> Already has a type definition.

OK

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
