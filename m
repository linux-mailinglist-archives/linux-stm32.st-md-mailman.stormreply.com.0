Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3898955CFB
	for <lists+linux-stm32@lfdr.de>; Sun, 18 Aug 2024 16:28:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 637DDC6DD9D;
	Sun, 18 Aug 2024 14:28:46 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44C9DC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Aug 2024 14:28:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 837F6CE016A;
 Sun, 18 Aug 2024 14:28:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52CDCC32786;
 Sun, 18 Aug 2024 14:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723991315;
 bh=ERjFyGYRu9IS6cNV44ysAr6kZGddvGxSQYBB0E8yVr8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T08IAoyLfg/rmGSYA1kGz+EsoQRqG/nYkV++COKiYEPMrWbj7jWV8iGjmRtzet+wk
 OYvYRJt8E5xq1HA7+i4Cjqn7Ie5kxf3JMuxdFoxgfvukSfYjJaNKBw5dW6CZO91BIC
 /7PzxAITui5Wia1vxUhXpi1+tJ4Bx4XqKRy53u5cQdp9l7lFqCPmesoERQkIGTd8ex
 vfKVRLZBqdkSfZ806vc/B7P6+LZAI+pp1tB2bErCPaDmyU/+kfR2Iy57r75vv6Yx5R
 2fDv5ynVChp14PEyW70AA128ygQiP27287NINr+l461p1ZuBAvJkg3ACKSiWds+A77
 Q6ICmTjLWqHdA==
Date: Sun, 18 Aug 2024 08:28:34 -0600
From: Rob Herring <robh@kernel.org>
To: Jie Gan <quic_jiegan@quicinc.com>
Message-ID: <20240818142834.GA27754-robh@kernel.org>
References: <20240812024141.2867655-1-quic_jiegan@quicinc.com>
 <20240812024141.2867655-4-quic_jiegan@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240812024141.2867655-4-quic_jiegan@quicinc.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Jinlong Mao <quic_jinlmao@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, James Clark <james.clark@linaro.org>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Song Chai <quic_songchai@quicinc.com>, Tao Zhang <quic_taozha@quicinc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v3 3/5] dt-bindings: arm: Add Coresight
 TMC Control Unit hardware
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

On Mon, Aug 12, 2024 at 10:41:39AM +0800, Jie Gan wrote:
> Add binding file to specify how to define a Coresight TMC
> Control Unit device in device tree.
> 
> It is responsible for controlling the data filter function
> based on the source device's Trace ID for TMC ETR device.
> The trace data with that Trace id can get into ETR's buffer
> while other trace data gets ignored.
> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>  .../bindings/arm/qcom,coresight-ctcu.yaml     | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> new file mode 100644
> index 000000000000..7a9580007942
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/qcom,coresight-ctcu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CoreSight TMC Control Unit
> +
> +maintainers:
> +  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
> +  - Mao Jinlong <quic_jinlmao@quicinc.com>
> +  - Jie Gan <quic_jiegan@quicinc.com>
> +
> +description:
> +  The Coresight TMC Control unit controls various Coresight behaviors.
> +  It works as a helper device when connected to TMC ETR device.
> +  It is responsible for controlling the data filter function based on
> +  the source device's Trace ID for TMC ETR device. The trace data with
> +  that Trace id can get into ETR's buffer while other trace data gets
> +  ignored.

Nowhere is TMC defined.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sa8775p-ctcu
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: apb
> +
> +  in-ports:

Use 'ports' unless you have both in and out ports.

> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    patternProperties:
> +      '^port(@[0-7])?$':
> +        description: Input connections from CoreSight Trace bus
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +required:
> +  - compatible
> +  - reg
> +  - in-ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    ctcu@1001000 {
> +        compatible = "qcom,sa8775p-ctcu";
> +        reg = <0x1001000 0x1000>;
> +
> +        clocks = <&aoss_qmp>;
> +        clock-names = "apb";
> +
> +        in-ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                ctcu_in_port0: endpoint {
> +                    remote-endpoint = <&etr0_out_port>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                ctcu_in_port1: endpoint {
> +                    remote-endpoint = <&etr1_out_port>;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.34.1
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
