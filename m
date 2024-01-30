Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C5A842B3A
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jan 2024 18:51:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E3B6C6C820;
	Tue, 30 Jan 2024 17:51:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B08BC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jan 2024 17:51:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E7B3C60F70;
 Tue, 30 Jan 2024 17:51:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF42C433C7;
 Tue, 30 Jan 2024 17:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706637074;
 bh=DLSPvWePq7u4CdVnhLxHSUsOcaWXfundUGhrwH3b74Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eVOgJDlwGSKU7+ba2A8EpRFzEE1f8EsGEGAgimwIWcT9R5UrOsy7CyPyy1iTz3ewT
 mKigbDH0EaiSqf1o/tbc2QKXn0QMEQietBjB2qEWHpS5oxiqgjjFN+HqTcC7yl6uYK
 agH0WhQpgj4N7IQy/g8lgUbSHzsBRR7RvpX8qeevKSwmjNoS00M6K4jJrbOpaJdUI0
 u9Dsy/KEwcgO3nyc93FPTAaON5mpXJDwDv3eEkx0VOQpH0gEuFKyrwgiYIkXK0LVqB
 jv9XoSvh5IJR5jzUnvMnwq2Ux3+r3NR0Rr3GkcAVE2UlGJOsN87TimQmXFGRpMcrtw
 Vv3MgSTZdP8LA==
Date: Tue, 30 Jan 2024 11:51:12 -0600
From: Rob Herring <robh@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20240130175112.GA2040002-robh@kernel.org>
References: <20240118100433.3984196-1-arnaud.pouliquen@foss.st.com>
 <20240118100433.3984196-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240118100433.3984196-3-arnaud.pouliquen@foss.st.com>
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

On Thu, Jan 18, 2024 at 11:04:31AM +0100, Arnaud Pouliquen wrote:
> The "st,stm32mp1-m4-tee" compatible is utilized in a system configuration
> where the Cortex-M4 firmware is loaded by the Trusted execution Environment
> (TEE).
> For instance, this compatible is used in both the Linux and OP-TEE
> device-tree:
> - In OP-TEE, a node is defined in the device tree with the
>   st,stm32mp1-m4-tee to support signed remoteproc firmware.
>   Based on DT properties, OP-TEE authenticates, loads, starts, and stops
>   the firmware.
> - On Linux, when the compatibility is set, the Cortex-M resets should not
>   be declared in the device tree.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> V1 to V2 updates
> - update "st,stm32mp1-m4" compatible description to generalize
> - remove the 'reset-names' requirement in one conditional branch, as the
>   property is already part of the condition test.
> ---
>  .../bindings/remoteproc/st,stm32-rproc.yaml   | 52 +++++++++++++++----
>  1 file changed, 43 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> index 370af61d8f28..6af821b15736 100644
> --- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> @@ -16,7 +16,12 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: st,stm32mp1-m4
> +    enum:
> +      - st,stm32mp1-m4
> +      - st,stm32mp1-m4-tee
> +    description:
> +      Use "st,stm32mp1-m4" for the Cortex-M4 coprocessor management by non-secure context
> +      Use "st,stm32mp1-m4-tee" for the Cortex-M4 coprocessor management by secure context
>  
>    reg:
>      description:
> @@ -142,21 +147,40 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - resets
>  
>  allOf:
>    - if:
>        properties:
> -        reset-names:
> -          not:
> -            contains:
> -              const: hold_boot
> +        compatible:
> +          contains:
> +            const: st,stm32mp1-m4
> +    then:
> +      if:
> +        properties:
> +          reset-names:
> +            not:
> +              contains:
> +                const: hold_boot

Note that this is true when 'reset-names' is not present. If that is not 
desired, then you need 'required: [reset-names]'. Not really a new issue 
though.

> +      then:
> +        required:
> +          - st,syscfg-holdboot
> +          - resets
> +      else:
> +        properties:
> +          st,syscfg-holdboot: false
> +        required:
> +          - resets

'resets' is always required within the outer 'then' schema, so you can 
move this up a level.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32mp1-m4-tee
>      then:
> -      required:
> -        - st,syscfg-holdboot
> -    else:
>        properties:
>          st,syscfg-holdboot: false
> +        reset-names: false
> +        resets: false
>  
>  additionalProperties: false
>  
> @@ -188,5 +212,15 @@ examples:
>        st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
>        st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
>      };
> +  - |
> +    #include <dt-bindings/reset/stm32mp1-resets.h>
> +    m4@10000000 {
> +      compatible = "st,stm32mp1-m4-tee";
> +      reg = <0x10000000 0x40000>,
> +            <0x30000000 0x40000>,
> +            <0x38000000 0x10000>;
> +      st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
> +      st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
> +    };
>  
>  ...
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
