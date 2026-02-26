Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAhgC6QkoGkDfwQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Feb 2026 11:47:00 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C49651A4802
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Feb 2026 11:46:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3708EC8F273;
	Thu, 26 Feb 2026 10:46:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DED1BC87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Feb 2026 10:46:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B1C01516;
 Thu, 26 Feb 2026 02:46:50 -0800 (PST)
Received: from [10.1.36.70] (Suzukis-MBP.cambridge.arm.com [10.1.36.70])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16F093F73B;
 Thu, 26 Feb 2026 02:46:53 -0800 (PST)
Message-ID: <fb91b392-2a01-4f01-85a2-335bb39ec60e@arm.com>
Date: Thu, 26 Feb 2026 10:46:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 Linus Walleij <linusw@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, cristian.marussi@arm.com,
 jens.wiklander@linaro.org, etienne.carriere@foss.st.com,
 Sudeep Holla <sudeep.holla@kernel.org>
References: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
 <20260226-debug_bus-v6-1-5d794697798d@foss.st.com>
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260226-debug_bus-v6-1-5d794697798d@foss.st.com>
Cc: devicetree@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 01/12] dt-bindings: document
 access-controllers property for coresight peripherals
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gatien.chevallier@foss.st.com,m:mike.leach@linaro.org,m:james.clark@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:leo.yan@linux.dev,m:legoffic.clement@gmail.com,m:linusw@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:cristian.marussi@arm.com,m:jens.wiklander@linaro.org,m:etienne.carriere@foss.st.com,m:sudeep.holla@kernel.org,m:devicetree@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:legofficclement@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[suzuki.poulose@arm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[foss.st.com,linaro.org,kernel.org,linux.dev,gmail.com,arm.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[suzuki.poulose@arm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.961];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,arm.com:mid,arm.com:email]
X-Rspamd-Queue-Id: C49651A4802
X-Rspamd-Action: no action

Hi

On 26/02/2026 10:30, Gatien Chevallier wrote:
> Document the access-controllers for coresight peripherals in case some
> access checks need to be performed to use them.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml           | 3 +++
>   .../devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml          | 3 +++
>   Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml           | 3 +++
>   Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml           | 3 +++
>   Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml           | 3 +++
>   Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml          | 3 +++

Are you sure, you are not missing "replicator" in the list ?

Otherwise, looks good to me.

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>



>   6 files changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> index 2a91670ccb8c..949444aba1f8 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> @@ -128,6 +128,9 @@ properties:
>     "#address-cells":
>       const: 1
>   
> +  access-controllers:
> +    maxItems: 1
> +
>   patternProperties:
>     '^trig-conns@([0-9]+)$':
>       type: object
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
> index b74db15e5f8a..b0693cd46d27 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
> @@ -78,6 +78,9 @@ properties:
>           description: Output connection to CoreSight Trace bus
>           $ref: /schemas/graph.yaml#/properties/port
>   
> +  access-controllers:
> +    maxItems: 1
> +
>   required:
>     - compatible
>     - reg
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
> index 71f2e1ed27e5..10ebbbeadf93 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
> @@ -118,6 +118,9 @@ properties:
>           description: Output connection from the ETM to CoreSight Trace bus.
>           $ref: /schemas/graph.yaml#/properties/port
>   
> +  access-controllers:
> +    maxItems: 1
> +
>   required:
>     - compatible
>     - clocks
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
> index 378380c3f5aa..f243e76f597f 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
> @@ -73,6 +73,9 @@ properties:
>           description: Output connection to the CoreSight Trace bus.
>           $ref: /schemas/graph.yaml#/properties/port
>   
> +  access-controllers:
> +    maxItems: 1
> +
>   required:
>     - compatible
>     - reg
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
> index 96dd5b5f771a..9dc096698c65 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
> @@ -128,6 +128,9 @@ properties:
>         - const: tracedata
>         - const: metadata
>   
> +  access-controllers:
> +    maxItems: 1
> +
>   required:
>     - compatible
>     - reg
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
> index a207f6899e67..29bbc3961fdf 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
> @@ -70,6 +70,9 @@ properties:
>           description: Input connection from the CoreSight Trace bus.
>           $ref: /schemas/graph.yaml#/properties/port
>   
> +  access-controllers:
> +    maxItems: 1
> +
>   required:
>     - compatible
>     - reg
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
