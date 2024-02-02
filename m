Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 943D98479C2
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Feb 2024 20:38:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49749C6DD9F;
	Fri,  2 Feb 2024 19:38:16 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 708EEC6DD9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Feb 2024 19:38:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 54A10CE2D99;
 Fri,  2 Feb 2024 19:38:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B896C433C7;
 Fri,  2 Feb 2024 19:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706902690;
 bh=cXSewaIhyGydS5Gw01kUhO+TK9P0kL9oR3wsJgkpSXw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ovi+0ekJPZurgLg8k360G3rdBWysmMIochoK+bC4Dcn43HvlSf4ueyyed1iL/BIKp
 pxEKuGpZMJgyE5VB2iyakVKzVkI2z27TLziSvsZ4MBVpP8XEWYFAY5S0rSaNa7I0UG
 SKlElFrz4Z9VulT1xnl556sxrDbnc+j8TwwhaKH4uSReLWdLMGT2fi1fd8C7dP5jrO
 rM+V/ev1Bil/ScnFXez9obyL29t300jIRIfkQUgX4ZB9faRUULT7KshaFJKNwYCoHV
 JObzf2YabL/I7Jf8mWG8M//XHvb2ipLKSxgKCp88Y6Q7G7+p85bTJwyv93zIvOThvZ
 bwDBvEtB+tMRg==
Date: Fri, 2 Feb 2024 13:38:08 -0600
From: Rob Herring <robh@kernel.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Message-ID: <20240202193808.GA581322-robh@kernel.org>
References: <20240131082628.6288-1-quic_jinlmao@quicinc.com>
 <20240131082628.6288-3-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240131082628.6288-3-quic_jinlmao@quicinc.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Tao Zhang <quic_taozha@quicinc.com>,
 James Clark <james.clark@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Leo Yan <leo.yan@linaro.org>, Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v3 2/2] dt-bindings: arm: Add device-name
 in the coresight components
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

On Wed, Jan 31, 2024 at 12:26:26AM -0800, Mao Jinlong wrote:
> Current name of coresight component's folder consists of prefix of
> the device and the id in the device list. When run 'ls' command,
> we can get the register address of the device. Take CTI for example,
> if we want to set the config for modem CTI, but we can't know which
> CTI is modem CTI from all current information.
> 
> cti_sys0 -> ../../../devices/platform/soc@0/138f0000.cti/cti_sys0
> cti_sys1 -> ../../../devices/platform/soc@0/13900000.cti/cti_sys1
> 
> Add device-name in device tree which can provide a better description
> of the coresight device. It can provide the info like the system or
> HW it belongs to.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>  .../devicetree/bindings/arm/arm,coresight-catu.yaml         | 6 ++++++
>  .../devicetree/bindings/arm/arm,coresight-cpu-debug.yaml    | 6 ++++++
>  .../devicetree/bindings/arm/arm,coresight-cti.yaml          | 6 ++++++
>  .../devicetree/bindings/arm/arm,coresight-dummy-sink.yaml   | 6 ++++++
>  .../devicetree/bindings/arm/arm,coresight-dummy-source.yaml | 6 ++++++
>  .../bindings/arm/arm,coresight-dynamic-funnel.yaml          | 6 ++++++
>  .../bindings/arm/arm,coresight-dynamic-replicator.yaml      | 6 ++++++
>  .../devicetree/bindings/arm/arm,coresight-etb10.yaml        | 6 ++++++
>  .../devicetree/bindings/arm/arm,coresight-etm.yaml          | 6 ++++++
>  .../bindings/arm/arm,coresight-static-funnel.yaml           | 6 ++++++
>  .../bindings/arm/arm,coresight-static-replicator.yaml       | 6 ++++++
>  .../devicetree/bindings/arm/arm,coresight-stm.yaml          | 6 ++++++
>  .../devicetree/bindings/arm/arm,coresight-tmc.yaml          | 6 ++++++
>  .../devicetree/bindings/arm/arm,coresight-tpiu.yaml         | 6 ++++++
>  .../devicetree/bindings/arm/qcom,coresight-tpda.yaml        | 6 ++++++
>  .../devicetree/bindings/arm/qcom,coresight-tpdm.yaml        | 6 ++++++

Why do you need a name on everything? Funnels and replicators, for 
example, aren't a source of data, but just connected to things that are. 
ETM is tightly coupled to a CPU and you have a link to it. You have 
graph links to show connections. Limit this to where you actually need 
it. 

>  16 files changed, 96 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-catu.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-catu.yaml
> index 2bae06eed693..a4d20aad0c70 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-catu.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-catu.yaml
> @@ -44,6 +44,12 @@ properties:
>        - const: arm,coresight-catu
>        - const: arm,primecell
>  
> +  device-name:

This is too generic of a name. Make is something closer to how it is 
used or what it is for. Naming sysfs devices is not how it is used. 
That's just an intermediate step.

> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      Define the name which can describe what kind of HW or system the
> +      device is for.
> +
>    reg:
>      maxItems: 1
>  
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.yaml
> index 0a6bc03ebe00..6094cc9cb834 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.yaml
> @@ -39,6 +39,12 @@ properties:
>        - const: arm,coresight-cpu-debug
>        - const: arm,primecell
>  
> +  device-name:
> +    $ref: /schemas/types.yaml#/definitions/string

If you are redefining the type multiple times, there's a problem in the 
structure of the schemas. Really, that's true for anything duplicated in 
the kernel.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
