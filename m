Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 40FWDQixcmnaogAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 00:21:44 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A88166E71B
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 00:21:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37ADFC87EDE;
	Thu, 22 Jan 2026 23:21:43 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07D33C5663A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jan 2026 23:21:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id ED6176001A;
 Thu, 22 Jan 2026 23:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D927C116C6;
 Thu, 22 Jan 2026 23:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769124100;
 bh=vUOqLJV03qwaBfmuHwqXoOQ/IdKsiWbk/K4GdntR+BM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lekxa4NhA2b+jIufWjek4xt/AQ3UGxjRXVopuVx1/yJ3TyznR95IhK28K94qlOC/r
 tpV6+BC7k9LYA8mY2TdXOpSrt2T0yF+mJTw6i8m2OHig9F1tS3l/Sk1L/d0cVM0CVt
 oK74KFnQgA5DDSTwKyG74sZTZ+wce0e/PocViI6eAvbGwbtrSlqbsIqD71V5IjQOLA
 dv9AKO58oxXnJ+aiqVLuWEyt0KUrdvfIL4tKzqm/6uw++PY4MUC4yHtMwZmW0A5z9+
 ui5GBZeoi2YRPwQBZUkLHTD6I2D/AjciWG+/gVNRAsDgxex/iI5ywdTjUUuv4Fka8/
 TfVxHvjFAtCKw==
Date: Thu, 22 Jan 2026 17:21:39 -0600
From: Rob Herring <robh@kernel.org>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Message-ID: <20260122232139.GA3717629-robh@kernel.org>
References: <20260122-debug_bus-v4-0-28f0f2a25f2c@foss.st.com>
 <20260122-debug_bus-v4-3-28f0f2a25f2c@foss.st.com>
 <b8175f5e-f6fc-43ff-a36a-dfb8e15230da@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b8175f5e-f6fc-43ff-a36a-dfb8e15230da@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, linux-kernel@vger.kernel.org,
 James Clark <james.clark@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <legoffic.clement@gmail.com>,
 linux-gpio@vger.kernel.org, Leo Yan <leo.yan@linux.dev>,
 jens.wiklander@linaro.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 coresight@lists.linaro.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v4 03/12] dt-bindings: bus: document the
	stm32 debug bus
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gatien.chevallier@foss.st.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:suzuki.poulose@arm.com,m:linux-kernel@vger.kernel.org,m:james.clark@linaro.org,m:linux-stm32@st-md-mailman.stormreply.com,m:legoffic.clement@gmail.com,m:linux-gpio@vger.kernel.org,m:leo.yan@linux.dev,m:jens.wiklander@linaro.org,m:mcoquelin.stm32@gmail.com,m:coresight@lists.linaro.org,m:krzk+dt@kernel.org,m:linusw@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:mike.leach@linaro.org,m:conor@kernel.org,m:legofficclement@gmail.com,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linaro.org,arm.com,st-md-mailman.stormreply.com,gmail.com,linux.dev,lists.linaro.org,lists.infradead.org];
	NEURAL_SPAM(0.00)[0.419];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DBL_PROHIBIT(0.00)[2.252.41.0:email,2.252.95.176:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: A88166E71B
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 05:22:21PM +0100, Gatien CHEVALLIER wrote:
> 
> 
> On 1/22/26 17:19, Gatien Chevallier wrote:
> > Document the stm32 debug bus. The debug bus is responsible for
> > checking the debug sub-system accessibility before probing any related
> > drivers.
> > 
> > Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> > ---
> >   .../bindings/bus/st,stm32mp131-dbg-bus.yaml        | 77 ++++++++++++++++++++++
> >   1 file changed, 77 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
> > new file mode 100644
> > index 000000000000..57f01d301e75
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
> > @@ -0,0 +1,77 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/bus/st,stm32mp131-dbg-bus.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: STM32 Coresight bus
> > +
> > +maintainers:
> > +  - Gatien Chevallier <gatien.chevallier@foss.st.com>
> > +
> > +description:
> > +  The STM32 debug bus is in charge of checking the debug configuration
> > +  of the platform before probing the peripheral drivers that rely on the debug
> > +  domain.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - st,stm32mp131-dbg-bus
> > +          - st,stm32mp151-dbg-bus
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 1
> > +
> > +  ranges: true
> 
> Maybe maxItems:2 is preferred here, no?

Wouldn't it be 1 as there is only 1 range? Up to you whether you want to 
limit it or not.

> 
> > +
> > +  reg:
> > +    maxItems: 1

Should be dropped?

> > +
> > +  "#access-controller-cells":
> > +    const: 1
> > +    description:
> > +      Contains the debug profile necessary to access the peripheral.
> > +
> > +patternProperties:
> > +  "^.*@[0-9a-f]+$":

This can be: "@[0-9a-f]+$"

> > +    description: Debug related peripherals
> > +    type: object
> > +
> > +    additionalProperties: true
> > +
> > +    required:
> > +      - access-controllers
> > +
> > +required:
> > +  - "#access-controller-cells"
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +  - compatible
> > +  - ranges
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/stm32mp1-clks.h>
> > +
> > +    dbg_bus: bus@50080000 {

Drop unused labels.

> > +      compatible = "st,stm32mp131-dbg-bus";
> > +      #address-cells = <1>;
> > +      #size-cells = <1>;
> > +      #access-controller-cells = <1>;
> > +      ranges = <0x50080000 0x50080000 0x3f80000>;
> > +
> > +      cs_cti_trace: cti@50094000 {
> > +        compatible = "arm,coresight-cti", "arm,primecell";
> > +        reg = <0x50094000 0x1000>;
> > +        clocks = <&rcc CK_DBG>;
> > +        clock-names = "apb_pclk";
> > +        access-controllers = <&dbg_bus 0>;
> > +      };
> > +    };
> > 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
