Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOThBPWHe2mlFQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Jan 2026 17:16:53 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A1CB2032
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Jan 2026 17:16:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23D9BC1A97C;
	Thu, 29 Jan 2026 16:16:52 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24DC4C0693F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jan 2026 16:16:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C34A54063B;
 Thu, 29 Jan 2026 16:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85063C4CEF7;
 Thu, 29 Jan 2026 16:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769703408;
 bh=ZKh+gwOXIrHUXWgIsde1vq5TQv6RVWGnWv4kiXsAKJM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qPBuSKsG8T4BCOrEBRaDWr8MG+IzuvfSTZjfiuYNld26Igdxvp+JkV67AHJHQMOjE
 tcfnvilda9aCiR4vVSui0M8WxMjSRcVJSKjyE8pH8VdR9RiyEof8qoQftVKMWKuLUA
 VMwEpMoBhxgTZj/epqG8Ds9XLp5IWMW/039AmDx898PWnf05qKj4EPNVo0d7ReszNV
 L1COCTOGuT7VB/RLypoukJb/HjQz84NoC1+0+WWDUMeF5/hxM2fwD9EFxXzyxt/UA/
 Sg0aStCqlUvW3E3MtZmzIn3zwXbAsDxfjr2KqjGQTZ1yNyAJnkx25yX750PtdkcBef
 8DyFa8g0/YEEA==
Date: Thu, 29 Jan 2026 10:16:47 -0600
From: Rob Herring <robh@kernel.org>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Message-ID: <20260129161647.GA1176398-robh@kernel.org>
References: <20260123-debug_bus-v5-0-90b670844241@foss.st.com>
 <20260123-debug_bus-v5-3-90b670844241@foss.st.com>
 <089559fd-3c9a-4ff4-8732-bb23fa907be8@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <089559fd-3c9a-4ff4-8732-bb23fa907be8@foss.st.com>
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
Subject: Re: [Linux-stm32] [PATCH v5 03/12] dt-bindings: bus: document the
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
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:gatien.chevallier@foss.st.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:suzuki.poulose@arm.com,m:linux-kernel@vger.kernel.org,m:james.clark@linaro.org,m:linux-stm32@st-md-mailman.stormreply.com,m:legoffic.clement@gmail.com,m:linux-gpio@vger.kernel.org,m:leo.yan@linux.dev,m:jens.wiklander@linaro.org,m:mcoquelin.stm32@gmail.com,m:coresight@lists.linaro.org,m:krzk+dt@kernel.org,m:linusw@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:mike.leach@linaro.org,m:conor@kernel.org,m:legofficclement@gmail.com,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linaro.org,arm.com,st-md-mailman.stormreply.com,gmail.com,linux.dev,lists.linaro.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DBL_PROHIBIT(0.00)[2.252.41.0:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,2.252.95.176:email]
X-Rspamd-Queue-Id: 92A1CB2032
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 03:23:45PM +0100, Gatien CHEVALLIER wrote:
> Hello,
> 
> Does this binding file satisfy the feedback received?

Please check patchwork if you want to know the status of your patch.

> 
> Thanks,
> Gatien
> 
> On 1/23/26 11:39, Gatien Chevallier wrote:
> > Document the stm32 debug bus. The debug bus is responsible for
> > checking the debug sub-system accessibility before probing any related
> > drivers.
> > 
> > Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> > ---
> >   .../bindings/bus/st,stm32mp131-dbg-bus.yaml        | 76 ++++++++++++++++++++++
> >   1 file changed, 76 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
> > new file mode 100644
> > index 000000000000..6c74433efbe3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
> > @@ -0,0 +1,76 @@
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
> > +  ranges:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  "#access-controller-cells":
> > +    const: 1
> > +    description:
> > +      Contains the debug profile necessary to access the peripheral.
> > +
> > +patternProperties:
> > +  "@[0-9a-f]+$":
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
> > +      compatible = "st,stm32mp131-dbg-bus";
> > +      #address-cells = <1>;
> > +      #size-cells = <1>;
> > +      #access-controller-cells = <1>;
> > +      ranges = <0x50080000 0x50080000 0x3f80000>;
> > +
> > +      cti@50094000 {
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
