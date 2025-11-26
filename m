Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA26C88F9E
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Nov 2025 10:35:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12101C58D7A;
	Wed, 26 Nov 2025 09:35:41 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AFF7C56611
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Nov 2025 09:35:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3670A43FE9;
 Wed, 26 Nov 2025 09:35:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85170C113D0;
 Wed, 26 Nov 2025 09:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764149738;
 bh=pAkJlp5goDwDdu02OIOe7+6vJcgsUEP5Zd6BF3BYipA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j8s8QaHxemNFYILPPeLU6SMRyEeHZhUyLFUoq3qhcvUAMtM6tJMcR7dvVyNaSQVcS
 ICCvX368nxhkVX7ehukSnzbyxZ328NMmyeKAvUYvdlecUveRY1k3g/QKkA9B05+YCP
 kYNsjAISn2e4UWoFYKAqwaMA12P+whbx3VPNRwWIBNPrFuLo0j04aYHY79AjgeW0KC
 8yMEobYPEEGTH6qutCTXXEYAH+bSKurj69vyKxhrf7OUVzE6EAruLXH9ePKLmxLmZ6
 7wq0sIc1stVV9C4BN9ZrvV6u68HoE7QkybuL9Mk6sGlfTpoxobIZO237Vv2mVogjmG
 zkUWlBVdmx6tw==
Date: Wed, 26 Nov 2025 10:35:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Message-ID: <20251126-elated-stoic-scorpion-25b630@kuoka>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-7-fb44e78f300b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251125-kaanapali-mmcc-v2-v2-7-fb44e78f300b@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Stephen Boyd <sboyd@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 07/11] dt-bindings: clock: qcom:
 document the Kaanapali GPU Clock Controller
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

On Tue, Nov 25, 2025 at 11:15:16PM +0530, Taniya Das wrote:
> Add bindings documentation for the Kaanapali Graphics Clock and Graphics
> power domain Controller.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    | 63 ++++++++++++++++++++++
>  .../bindings/clock/qcom,sm8450-gpucc.yaml          |  2 +
>  include/dt-bindings/clock/qcom,kaanapali-gpucc.h   | 47 ++++++++++++++++
>  .../dt-bindings/clock/qcom,kaanapali-gxclkctl.h    | 12 +++++
>  4 files changed, 124 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..31398aec839d88007c9f1de7e1a248beae826640
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,kaanapali-gxclkctl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Graphics power domain Controller on Kaanapali

"Power Domain"

> +
> +maintainers:
> +  - Taniya Das <taniya.das@oss.qualcomm.com>
> +
> +description: |
> +  Qualcomm graphics power domain control module provides the power
> +  domains on Qualcomm SoCs. This module exposes the GDSC power domain
> +  which helps the recovery of Graphics subsystem.
> +
> +  See also::

Just one ':'

> +    include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,kaanapali-gxclkctl
> +
> +  power-domains:
> +    description:
> +      Power domains required for the clock controller to operate
> +    items:
> +      - description: GFX power domain
> +      - description: GMXC power domain
> +      - description: GPUCC(CX) power domain
> +
> +  '#power-domain-cells':

Power domain controllers do not belong to clocks, so this is:
1. Misplaced - wrong folder
2. Probably wrongly named. gxclkctl sounds like clock controller, but
this is domain controller?

> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-domains
> +  - '#power-domain-cells'
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        clock-controller@3d68024 {
> +            compatible = "qcom,kaanapali-gxclkctl";
> +            reg = <0 0x3d68024 0x0 0x8>;

Keep consistent hex, so first 0 -> 0x0.

But the problem is that you defined a device for two registers,
basically one domain. I have doubts now whether this is complete and
real device.

> +            power-domains = <&rpmhpd RPMHPD_GFX>,
> +                            <&rpmhpd RPMHPD_GMXC>,
> +                            <&gpucc 0>;
> +            #power-domain-cells = <1>;

And cells 1 makes no sense in such case.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
