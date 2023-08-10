Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 242D7777DC6
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Aug 2023 18:10:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDA3FC6B469;
	Thu, 10 Aug 2023 16:10:51 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3A2AC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 16:10:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8003466197;
 Thu, 10 Aug 2023 16:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B37CFC433C7;
 Thu, 10 Aug 2023 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691683848;
 bh=hU3zEJqh3v/qDDuwBKbxUUN5LenjFbRiKXk6hZBPbkY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ov/ISR/VUh/E/BVRWOz0QgqVAECA8Syehms+PpjS07xKA5ZI4OqwY/vYO29RAgZ7h
 dMAU7YmZWhRsa/3euTGYup3zU1fvMTUcrjz77+Ur1N8y6GtGlntBPqLM5TChgU7ThY
 OxDPsQYgxk/tvNAaCHRqt4tczeafnCEjkZXnDC/PNP7NBEiBKf1FiN+Tsq96u/2FR6
 K1wTqHVUhhngmhhalIBcvQF2+Sd1ALTB11SbYC44LuKc2ZVtZGQh0X1RBSPsOw5Ego
 ZfzW4Kt95N/6WpNykRZNlwS/G3BUBmnlJBM5bpSa9nrSIKhPWqmhf7RT3vwva3nWfZ
 Oshf8AHsJxJ9A==
Date: Thu, 10 Aug 2023 23:59:06 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Message-ID: <ZNUJSvJi+9QsWhAf@xhacker>
References: <20230807164151.1130-1-jszhang@kernel.org>
 <20230807164151.1130-10-jszhang@kernel.org>
 <20230808-clapper-corncob-0af7afa65752@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230808-clapper-corncob-0af7afa65752@spud>
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 09/10] dt-bindings: net: snps,
 dwmac: add per channel irq support
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

On Tue, Aug 08, 2023 at 08:39:58AM +0100, Conor Dooley wrote:
> On Tue, Aug 08, 2023 at 12:41:50AM +0800, Jisheng Zhang wrote:
> > The IP supports per channel interrupt, add support for this usage case.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  .../devicetree/bindings/net/snps,dwmac.yaml   | 33 +++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > index 5d81042f5634..5a63302ad200 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -109,6 +109,7 @@ properties:
> >        - description: The interrupt that occurs when Rx exits the LPI state
> >        - description: The interrupt that occurs when Safety Feature Correctible Errors happen
> >        - description: The interrupt that occurs when Safety Feature Uncorrectible Errors happen
> > +      - description: All of the rx/tx per-channel interrupts
> >  
> >    interrupt-names:
> >      minItems: 1
> > @@ -118,6 +119,38 @@ properties:
> >        - const: eth_lpi
> >        - const: sfty_ce
> >        - const: sfty_ue
> > +      - const: rx0
> > +      - const: rx1
> > +      - const: rx2
> > +      - const: rx3
> > +      - const: rx4
> > +      - const: rx5
> > +      - const: rx6
> > +      - const: rx7
> > +      - const: rx8
> > +      - const: rx9
> > +      - const: rx10
> > +      - const: rx11
> > +      - const: rx12
> > +      - const: rx13
> > +      - const: rx14
> > +      - const: rx15
> > +      - const: tx0
> > +      - const: tx1
> > +      - const: tx2
> > +      - const: tx3
> > +      - const: tx4
> > +      - const: tx5
> > +      - const: tx6
> > +      - const: tx7
> > +      - const: tx8
> > +      - const: tx9
> > +      - const: tx10
> > +      - const: tx11
> > +      - const: tx12
> > +      - const: tx13
> > +      - const: tx14
> > +      - const: tx15
> 
> I don't think Rob's comment about having added 2 interrupts but 32
> interrupt names has been resolved.

I misunderstood Rob's comment. Now I'm not sure whether dt-binding
can support regex or something or not, or let ask for advice in the
following way: how could I write the dt-binding in this case? I didn't
find similar examples so far. I'm not sure listing possible
description and const properties for all channel interrupts is suitable.

> Did you actually test putting this many interrupts into a node?
> AFAICT, any more than 6 will cause complaints.

I tried 12rx and 12tx interrupts in a node, didn't see dtc warning.
so I guess the complaints are from dtb check? I will try to reproduce
them.

> 
> Thanks,
> Conor.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
