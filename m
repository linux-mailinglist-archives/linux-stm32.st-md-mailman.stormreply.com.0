Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E52D842AC0
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jan 2024 18:22:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD531C6C820;
	Tue, 30 Jan 2024 17:22:04 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66437C6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jan 2024 17:22:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B152FCE1B0E;
 Tue, 30 Jan 2024 17:22:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB412C433F1;
 Tue, 30 Jan 2024 17:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706635318;
 bh=4wWtwu39k0xPKfG1c0t6Pd+ipT50TOdvHg/dYeAN4AY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kmWXiDzFUZWMZzmBpA4YYhgxS/sibS2eQcWpJvG1LA1+FZUYuc4kD2PbTzNoe036L
 wYJKCwdrnHW7bBjNmXHyy8rgOVYVsejkz3nh71I0n3LOa/8TvyUVadKn8sCQ0gSJ/C
 aAvDPnVAQKBuUw0wGxr97lIUE4fyGPbIWebRkfIiqV6jtg3Wsbn9wcJH4POQzdOiEq
 woKbFV9NOfEOOFaAzQfCzXP/UzV33va2G+x2r0t1Q4XFJu1SYiUPYxLMZM7Qnh9ZyM
 QRZw0o3pTGGHBr/CrZGen3PvVQRFXtsel6if2VsexK0EHc9ypSF3Qvz44AgM3qYOhc
 9FELK1rhUbM1Q==
Date: Tue, 30 Jan 2024 11:21:56 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20240130172156.GA2008728-robh@kernel.org>
References: <20240118100433.3984196-1-arnaud.pouliquen@foss.st.com>
 <20240118100433.3984196-3-arnaud.pouliquen@foss.st.com>
 <75429209-8f30-4880-8f92-ecb3cf90ae33@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <75429209-8f30-4880-8f92-ecb3cf90ae33@linaro.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 op-tee@lists.trustedfirmware.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/4] dt-bindings: remoteproc: Add
 compatibility for TEE support
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

On Fri, Jan 26, 2024 at 12:03:25PM +0100, Krzysztof Kozlowski wrote:
> On 18/01/2024 11:04, Arnaud Pouliquen wrote:
> > The "st,stm32mp1-m4-tee" compatible is utilized in a system configuration
> > where the Cortex-M4 firmware is loaded by the Trusted execution Environment
> > (TEE).
> > For instance, this compatible is used in both the Linux and OP-TEE
> > device-tree:
> > - In OP-TEE, a node is defined in the device tree with the
> >   st,stm32mp1-m4-tee to support signed remoteproc firmware.
> >   Based on DT properties, OP-TEE authenticates, loads, starts, and stops
> >   the firmware.
> > - On Linux, when the compatibility is set, the Cortex-M resets should not
> >   be declared in the device tree.
> > 
> > Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> > ---
> > V1 to V2 updates
> > - update "st,stm32mp1-m4" compatible description to generalize
> > - remove the 'reset-names' requirement in one conditional branch, as the
> >   property is already part of the condition test.
> > ---
> >  .../bindings/remoteproc/st,stm32-rproc.yaml   | 52 +++++++++++++++----
> >  1 file changed, 43 insertions(+), 9 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> > index 370af61d8f28..6af821b15736 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> > @@ -16,7 +16,12 @@ maintainers:
> >  
> >  properties:
> >    compatible:
> > -    const: st,stm32mp1-m4
> > +    enum:
> > +      - st,stm32mp1-m4
> > +      - st,stm32mp1-m4-tee
> 
> The patch looks good to me, but I wonder about this choice of two
> compatibles.
> 
> Basically this is the same hardware with the same interface, but two
> compatibles to differentiate a bit different firmware setup. We have
> already such cases for Qualcomm [1] [2] and new ones will be coming. [3]
> 
> I wonder whether this should be rather the same compatible with
> additional property, e.g. "st,tee-control" or "remote-control".
> 
> [1]
> https://elixir.bootlin.com/linux/v6.7.1/source/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml#L54
> 
> [2]
> https://elixir.bootlin.com/linux/v6.7.1/source/Documentation/devicetree/bindings/net/qcom,ipa.yaml#L129
> (that's a bit different)
> 
> [3] https://lore.kernel.org/linux-devicetree/20240124103623.GJ4906@thinkpad/
> 
> @Rob,
> Any general guidance for this and Qualcomm?

I think we have cases using compatible already as well. Either way is 
fine with me.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
