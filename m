Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5032F763BD5
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 17:59:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0042C6B45C;
	Wed, 26 Jul 2023 15:59:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B117CC6B459
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 15:59:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8EB6B61BA3;
 Wed, 26 Jul 2023 15:59:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63276C433C7;
 Wed, 26 Jul 2023 15:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690387163;
 bh=ZVYSAijYjAzVdSVVoPt4UJzIEJFPCTCkTsJbuNdi1QE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lojai7na1ElHe5GdMww572j/Z9Ep34SG463mNTa1IkFqPtSz5ExoO6xEoER5RjMAa
 3Zqb6dekCRzIXOs6XQfoKaxQ3jKIDASssTP6msy122pbDrXSc2nvSMd3abg4FWxDsD
 WCO6MEqrFlCw5rmYOelxKWALqmZWMahQDAXrJ9MbeM4Mt8ohY6aorxSYwhzvag6z1s
 SiGJYjkm3jVgcFpyEDIFrBDFY2funfYuXJ9xDtWQAJ5xG2oBLsnl6taXxObIi0oV90
 pkx/TjCZPKZeY1QXADLRLpUEsZxbUi8LWdX5jrL0loCKuG/n90RXTDdKJ7ZSFzrwee
 qoVKc1pIP5zqw==
Date: Wed, 26 Jul 2023 23:47:44 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <ZMFAIF+nFL0vhX7Q@xhacker>
References: <20230723161029.1345-1-jszhang@kernel.org>
 <20230723161029.1345-10-jszhang@kernel.org>
 <20230726152439.GA1471409-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230726152439.GA1471409-robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 09/10] dt-bindings: net: snps,
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

On Wed, Jul 26, 2023 at 09:24:39AM -0600, Rob Herring wrote:
> On Mon, Jul 24, 2023 at 12:10:28AM +0800, Jisheng Zhang wrote:
> > The IP supports per channel interrupt, add support for this usage case.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  .../devicetree/bindings/net/snps,dwmac.yaml   | 23 +++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > index bb80ca205d26..525210c2c06c 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -101,6 +101,11 @@ properties:
> >      minItems: 1
> >      maxItems: 2
> >  
> > +  snps,per-channel-interrupt:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description:
> > +      Indicates that Rx and Tx complete will generate a unique interrupt for each channel
> 
> Can't you determine this based on the number of interrupts or interrupt 
> names?

Good idea! this flag can be dynamically detected based on the interrupt names.
The driver code will be patched a bit ugly, I will try and send out for review.

> 
> > +
> >    interrupts:
> >      minItems: 1
> >      items:
> > @@ -109,6 +114,8 @@ properties:
> >        - description: The interrupt that occurs when Rx exits the LPI state
> >        - description: The interrupt that occurs when Safety Feature Correctible Errors happen
> >        - description: The interrupt that occurs when Safety Feature Uncorrectible Errors happen
> > +      - description: All of the rx per-channel interrupts
> > +      - description: All of the tx per-channel interrupts
> 
> You added 2 interrupts here and...

I'm not sure how to write the description here, could it be one line
 "- description: All of the tx/rx per-channel interrupts"?

> 
> >  
> >    interrupt-names:
> >      minItems: 1
> > @@ -118,6 +125,22 @@ properties:
> >        - const: eth_lpi
> >        - const: sfty_ce_irq
> >        - const: sfty_ue_irq
> > +      - const: rx0
> > +      - const: rx1
> > +      - const: rx2
> > +      - const: rx3
> > +      - const: rx4
> > +      - const: rx5
> > +      - const: rx6
> > +      - const: rx7
> > +      - const: tx0
> > +      - const: tx1
> > +      - const: tx2
> > +      - const: tx3
> > +      - const: tx4
> > +      - const: tx5
> > +      - const: tx6
> > +      - const: tx7
> 
> And 16 here?
> 

oops, indeed HW supports up to 16 channels for tx and rx, thus
up to 16 interrupts.

> >  
> >    clocks:
> >      minItems: 1
> > -- 
> > 2.40.1
> > 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
