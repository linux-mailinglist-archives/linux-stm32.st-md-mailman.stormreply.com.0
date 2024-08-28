Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE33962B84
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Aug 2024 17:12:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E53D4C6C855;
	Wed, 28 Aug 2024 15:12:15 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6BC0C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Aug 2024 15:12:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D74C0A415D3;
 Wed, 28 Aug 2024 15:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC85C4CEC1;
 Wed, 28 Aug 2024 15:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724857927;
 bh=9GuXAxjPKxPmRMioM0desVcabOX2V79hzACInoh3ahU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z5wR9DUaujBFT4XeskFDnq/unR1mK7T6eJVLJ6YdAP+4nJKvH1Bn+zE/tDmRvwe07
 q/ANLYGHJerruJiRG5M1e2eew8M4KozXaXfYkpzvJB9ffU04lJC7uDBHeA7OhT5ybC
 /dwjw3Ixv+2eEcBdWnkCfyxbmgyH6b5BixfZHYVkOEDpn3+drA5zECDmYH3rcGhoAw
 a7xOWsHEdyshtT5wRUFmtLz2zx2NqjL3wV7S11mJQbOG3xkIqm45rnAVDuUkpDBTxH
 +BteBBRDPODTWwLRe+4wEk7ibapa3HeaM69wia0TMC7HzTu30IDQtkcZ8zKeXk0utP
 nQ28Nxcj3TxiA==
Date: Wed, 28 Aug 2024 10:12:05 -0500
From: Rob Herring <robh@kernel.org>
To: Jie Gan <quic_jiegan@quicinc.com>
Message-ID: <20240828151205.GA3830921-robh@kernel.org>
References: <20240828012706.543605-1-quic_jiegan@quicinc.com>
 <20240828012706.543605-4-quic_jiegan@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240828012706.543605-4-quic_jiegan@quicinc.com>
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
Subject: Re: [Linux-stm32] [PATCH v4 3/5] dt-bindings: arm: Add Coresight
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

On Wed, Aug 28, 2024 at 09:27:04AM +0800, Jie Gan wrote:
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
>  .../bindings/arm/qcom,coresight-ctcu.yaml     | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> new file mode 100644
> index 000000000000..669aac646451
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> @@ -0,0 +1,84 @@
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

You need '>' or '|' if you want to preserve paragraphs.

> +  The Trace Memory Controller(TMC) is used for Embedded Trace Buffer(ETB),
> +  Embedded Trace FIFO(ETF) and Embedded Trace Router(ETR) configurations.
> +  The configuration mode (ETB, ETF, ETR) is discovered at boot time when
> +  the device is probed.
> +
> +  The Coresight TMC Control unit controls various Coresight behaviors.
> +  It works as a helper device when connected to TMC ETR device.
> +  It is responsible for controlling the data filter function based on
> +  the source device's Trace ID for TMC ETR device. The trace data with
> +  that Trace id can get into ETR's buffer while other trace data gets
> +  ignored.
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

Just "ports". "in-ports" is for the case when you have "out-ports".

> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    patternProperties:
> +      '^port(@[0-1])?$':
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
