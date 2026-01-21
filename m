Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BMaF/nucGk+awAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 16:21:29 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E36325919C
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 16:21:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D7C9C349C4;
	Wed, 21 Jan 2026 15:21:28 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E0C8C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 15:21:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0D3AC43D50;
 Wed, 21 Jan 2026 15:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C50F2C4CEF1;
 Wed, 21 Jan 2026 15:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769008885;
 bh=L9QnTSalVdaocEzIxFlwNpJxuLWUieZvADC7B/XVsmI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dlPOVgmAQL1Y8YIv7RMBVbBMLYq3hBniGba1bc2IbnBR/Hk7L/Jcn0hDwLB2RDcFK
 7jU/KKFJvhfMSEFh+qPuG2hTytqVt8IN4OMovEGVS7wD6Om/EiK09GFW3xvuZfFXAs
 ruLkpeMhVP8wCNQM1Wx4f/7ylOYluz8sqDWNKLLLdBln7gvJqY3WkNC5L3wisN2SPh
 rf6g/yrraiPiKEgtDOsWgajeENFKWg/B4BcP9bjHzqf2JWmEL9oim61rUFtfGMYX3V
 ILiqiQ2KqoWkm7XyRq+hXm8wu6NpjDN6RB5AuUw+vx0eOTi2a17VaditwevoGqSoqv
 pThQymOXNrnFg==
Date: Wed, 21 Jan 2026 09:21:24 -0600
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <20260121152124.GA3179930-robh@kernel.org>
References: <20260121-debug_bus-v3-0-4d32451180d0@foss.st.com>
 <20260121-debug_bus-v3-3-4d32451180d0@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260121-debug_bus-v3-3-4d32451180d0@foss.st.com>
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
Subject: Re: [Linux-stm32] [PATCH v3 03/12] dt-bindings: bus: document the
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
X-Spamd-Result: default: False [5.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
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
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linaro.org,arm.com,st-md-mailman.stormreply.com,gmail.com,linux.dev,lists.linaro.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,devicetree.org:url,stormreply.com:email,stormreply.com:url,st.com:email,2.252.41.0:email,stm-ict-prod-mailman-01.stormreply.prv:helo,2.252.95.176:email]
X-Rspamd-Queue-Id: E36325919C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 01:34:37PM +0100, Gatien Chevallier wrote:
> Document the stm32 debug bus. The debug bus is responsible for
> checking the debug sub-system accessibility before probing any related
> drivers.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  .../bindings/bus/st,stm32mp131-dbg-bus.yaml        | 79 ++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
> new file mode 100644
> index 000000000000..2db35e41e76c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/st,stm32mp131-dbg-bus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32 Coresight bus
> +
> +maintainers:
> +  - Gatien Chevallier <gatien.chevallier@foss.st.com>
> +
> +description:
> +  The STM32 debug bus is in charge of checking the debug configuration
> +  of the platform before probing the peripheral drivers that rely on the debug
> +  domain.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - st,stm32mp131-dbg-bus
> +          - st,stm32mp151-dbg-bus
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#access-controller-cells":
> +    const: 1
> +    description:
> +      Contains the debug profile necessary to access the peripheral.
> +
> +patternProperties:
> +  "^.*@[0-9a-f]+$":
> +    description: Debug related peripherals
> +    type: object
> +
> +    additionalProperties: true
> +
> +    required:
> +      - access-controllers
> +
> +required:
> +  - "#access-controller-cells"
> +  - "#address-cells"
> +  - "#size-cells"
> +  - compatible
> +  - ranges
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +
> +    dbg_bus: bus@50080000 {
> +      compatible = "st,stm32mp131-dbg-bus";
> +      reg = <0x50080000 0x3f80000>;

That's a lot of registers... Yet the bus driver doesn't access any. 
Looks to me like this belongs in ranges instead if there aren't any bus 
registers. Or its size should be just the registers and then the whole 
region size goes in ranges.

> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      #access-controller-cells = <1>;
> +      ranges;
> +
> +      cs_cti_trace: cti@50094000 {
> +        compatible = "arm,coresight-cti", "arm,primecell";
> +        reg = <0x50094000 0x1000>;
> +        clocks = <&rcc CK_DBG>;
> +        clock-names = "apb_pclk";
> +        access-controllers = <&dbg_bus 0>;
> +      };
> +    };
> 
> -- 
> 2.43.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
