Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 897BE697CE1
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Feb 2023 14:11:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CDBCC6A5F8;
	Wed, 15 Feb 2023 13:11:43 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F029AC69049
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Feb 2023 13:11:41 +0000 (UTC)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 192853F4BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Feb 2023 13:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1676466701;
 bh=1XdYb1DRbOmlAI6DRkBJIyrIK+/5tdCGTTdbxhb+wmw=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=mBoW16fVkEwXTxRnSNlMI4i0CwJNHPgXgs9XoZ3Gz52zAbyHNX7xo7E9/g3ZSCshY
 JCVik0cxPmdu+1CpkzlBRYX1OVC/nToz3fwt7OVKVjnA8ZoEk1KDEpAy9ts+0R0kaR
 N4HlRKOR/1xp5oCHzmnb3Hor+3nHAGPQK4tP5RRFqNBk+1htCtgdxOod4IvvjYl6F+
 0AUeBBlYK6ICVh6V/VhYfXUk+YwAWUD7jhcknezEZI+p1VmzAi3xNpT1H/Sjp3ybtl
 UEQ6aBxNVrUBny8sni+5C8hQXi17rCyRXqI2quJLe539sTK8mdAUnFzQhmiT9iPo/x
 BqPTO+GEk3jDg==
Received: by mail-qt1-f200.google.com with SMTP id
 fp20-20020a05622a509400b003bcf4239f33so2245699qtb.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Feb 2023 05:11:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1XdYb1DRbOmlAI6DRkBJIyrIK+/5tdCGTTdbxhb+wmw=;
 b=rE4jHsAXFFFhHVkZqPM0BrtHSt50JmIbPxgIOesdfKKz2Gcbmy9pI59O04ULRMHvN/
 0MPKr6VpbK0GaM5eo1Z5xUrt1WT67yaDeNjDUnBPehftiaa+D03Uzp0XoSP981Od/Y2Q
 vWRVVvHw8NpPeR3Ydp79x/pSc5n5/Y/1SPDb/s2CBG2K3bubFr784g6fQAkIQKfykBzW
 CjKvRo0g+WWGq2awagu4ZVZGtrdkjzaCP0iw46L7i5kfps9AGquJaCLO+1rge1OvT+1g
 JUo/Dy8vvZL2KU/W2aKHq8MMF8X010cXtmHwdn8fuas1CdZjLPlGBFgFE40RDtAKzNmR
 JT7g==
X-Gm-Message-State: AO0yUKXHj21izZgCtj4k19FgEYe+NncdhlXx9xz6vMOllbVxhRUgWdsS
 OzWtk7olRrCRAp3lJIfuWyZ6JBMX70icBYuSNgoLFiKl1rw5SxsN75N3MF6vKfApKKkEkItlUfY
 bxaFYdcYXArNeOZyqI+9uaBbO5AznSlr3h9v6JaP+67YxUUSVd4c4MOP5Hk1WTqZdEmJardF4rg
 ==
X-Received: by 2002:a05:622a:164f:b0:3bc:e3a8:d1d6 with SMTP id
 y15-20020a05622a164f00b003bce3a8d1d6mr228750qtj.229.1676466699838; 
 Wed, 15 Feb 2023 05:11:39 -0800 (PST)
X-Google-Smtp-Source: AK7set+4/1NxoBcvUdWQnW9B5yPBwHcyWHA8dOVvJArdaItgCToDNjAmHnj0L1BgI9mhCHcGqlTdul+lrgFnVADu40o=
X-Received: by 2002:a05:622a:164f:b0:3bc:e3a8:d1d6 with SMTP id
 y15-20020a05622a164f00b003bce3a8d1d6mr228728qtj.229.1676466699567; Wed, 15
 Feb 2023 05:11:39 -0800 (PST)
MIME-Version: 1.0
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-2-cristian.ciocaltea@collabora.com>
 <Y+vxw28NWPfaW7ql@spud>
In-Reply-To: <Y+vxw28NWPfaW7ql@spud>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 15 Feb 2023 14:11:22 +0100
Message-ID: <CAJM55Z_x3omY9DQtxPUgLX0NKEm3PCXDkFFDVAzG7opFLsZX+A@mail.gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Yanhong Wang <yanhong.wang@starfivetech.com>, Lee Jones <lee@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 01/12] dt-bindings: riscv: sifive-ccache:
 Add compatible for StarFive JH7100 SoC
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

On Tue, 14 Feb 2023 at 21:42, Conor Dooley <conor@kernel.org> wrote:
>
> Hey all,
>
> On Sat, Feb 11, 2023 at 05:18:10AM +0200, Cristian Ciocaltea wrote:
> > Document the compatible for the SiFive Composable Cache Controller found
> > on the StarFive JH7100 SoC.
> >
> > This also requires extending the 'reg' property to handle distinct
> > ranges, as specified via 'reg-names'.
> >
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > ---
> >  .../bindings/riscv/sifive,ccache0.yaml        | 28 ++++++++++++++++++-
> >  1 file changed, 27 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
> > index 31d20efaa6d3..2b864b2f12c9 100644
> > --- a/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
> > @@ -25,6 +25,7 @@ select:
> >            - sifive,ccache0
> >            - sifive,fu540-c000-ccache
> >            - sifive,fu740-c000-ccache
> > +          - starfive,jh7100-ccache
> >
> >    required:
> >      - compatible
> > @@ -37,6 +38,7 @@ properties:
> >                - sifive,ccache0
> >                - sifive,fu540-c000-ccache
> >                - sifive,fu740-c000-ccache
> > +              - starfive,jh7100-ccache
> >            - const: cache
> >        - items:
> >            - const: starfive,jh7110-ccache
> > @@ -70,7 +72,13 @@ properties:
> >        - description: DirFail interrupt
> >
> >    reg:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  reg-names:
> > +    items:
> > +      - const: control
> > +      - const: sideband
>
> So why is this called "sideband"?
> In the docs for the JH7100 it is called LIM & it's called LIM in our
> docs for the PolarFire SoC (at the same address btw) and we run the HSS
> out of it! LIM being "loosely integrated memory", which by the limit
> hits on Google may be a SiFive-ism?
>
> I'm not really sure if adding it as a "reg" section is the right thing
> to do as it's not "just" a register bank.
> Perhaps Rob/Krzysztof have a take on that one?

Yes, this seems to be a leftover I didn't manage to clean up yet. The
"sideband" range is called L2 LIM in the datasheet and seems to be a
way to use the cache directly. The Sifive docs read "When cache ways
are disabled, they are addressable in the L2 Loosely-Integrated Memory
(L2 LIM) address space [..]". This feature is not used by Linux on the
JH7100, so can just be removed here.

/Emil

> >
> >    next-level-cache: true
> >
> > @@ -89,6 +97,7 @@ allOf:
> >            contains:
> >              enum:
> >                - sifive,fu740-c000-ccache
> > +              - starfive,jh7100-ccache
> >                - starfive,jh7110-ccache
> >                - microchip,mpfs-ccache
> >
> > @@ -106,12 +115,29 @@ allOf:
> >              Must contain entries for DirError, DataError and DataFail signals.
> >            maxItems: 3
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: starfive,jh7100-ccache
> > +
> > +    then:
> > +      properties:
> > +        reg:
> > +          maxItems: 2
> > +
> > +    else:
> > +      properties:
> > +        reg:
> > +          maxItems: 1
> > +
> >    - if:
> >        properties:
> >          compatible:
> >            contains:
> >              enum:
> >                - sifive,fu740-c000-ccache
> > +              - starfive,jh7100-ccache
> >                - starfive,jh7110-ccache
> >
> >      then:
> > --
> > 2.39.1
> >
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
