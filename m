Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B05AABACF2
	for <lists+linux-stm32@lfdr.de>; Sun, 18 May 2025 03:08:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10360C7128F;
	Sun, 18 May 2025 01:08:33 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B04DCFAC4A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 May 2025 01:08:32 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-6f8aa9e6ffdso32215756d6.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 May 2025 18:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747530511; x=1748135311;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uBoiEuNQUK+MG2DD2nIykSgb4W6tOdrktJLNBGrAb/Y=;
 b=COdCiEHHS/1gIXFmSIs4GgzLt9V8pULaZ8q5OcYZso1M90m+7KlAzmhZyovtIgSVQ1
 i3hJjaqTZAMzNE8PaUpBbQiWSO0N8bpFU+tJ9OwPxBUc83e65kY1iqTt8IbXdYxBPDnp
 jvZefTI8egDFuwFwGCLZrNeGU6g+N9whTg+ALaDOeUviqdHqBOSvC5/EaAaVCGYFb4Vf
 nXsNGx6Kck4SHQ6EtWYcvDeaK8lq89jT4eWsggZjBkqy3YZS+nKHRiy5SpDQL9OosSy1
 ooCGMdbGNOmMkC7GkX5UqO3IFtI9E25xoZIbbsKSmowHXgnoBopaNnbrpyKOav3DhOU2
 09kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747530511; x=1748135311;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uBoiEuNQUK+MG2DD2nIykSgb4W6tOdrktJLNBGrAb/Y=;
 b=tM/QNl2KAPR0fLMuOw6Vf5LoZQegarbMGyqWTd/fzKK16wA7TZG17HcX+5hwU3OsIh
 bxX1x7YgCZLDRwu9M0zf+yiZbIKh85ENNWKFMndN1/Ut49vAhdOgroH/kZS61dXhf3k+
 UbVcPjWiHLaHdGUn6NmLns6CFJuRRGs09PnKMQkz8ZkD2aj51KGa0xlt1T+AqqSTFw5K
 qHDctwzm+gIpPQuqpzHE1R6ajaRt4w5MrHKb8fa2mwkvQhHbS06nTKVCBwfNJcWCp9Kf
 a74FB71FOc+6ir3CBqOyVCrVHTiNY6FWwK5rAUrW3LgrkTMCGVeiiIypHIPmxfk6Bc/+
 itEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjtx7bLHUXN0DLE+e20EeaiVKlT/TT+7PaQwivSvX55ELl9bGUlS4o63SpLW6O76ogVqGgDgzzrQ/zPQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwLhvb2PiiO/XJoz+Ulqpt01hwo/49Up7xju/r5oC+8DCJusDn+
 QFl0U+n/dznu6k3K/58fjNPMuZJahJDgwD9PfI3Ex9OHwsvNN7mzYyRB
X-Gm-Gg: ASbGncu+g32XryVEeudUlyP9ViN25snusfUhDrG9mGIdtvXQnuf9JlBAVdrgfX+NM2Z
 xn1GCLdgpgpTDhWl9WX+qa8xxDmw8RVCH7DDd1LyV3e7w6y21WY9uQWHJK1TY0msuVkbBEam8We
 Q3/C3yP0ACzUPoc6iorpBKELHbe9t+2eYuCVa+VzVh31S7KM1xUCRkUA09vZdKKe2qnKmzFPVmQ
 uKuJvhuBKuqtI1IZxXQFlgbgccPTUv2oe6+Gd77QvSjkh4iG1ENw4KOFywp7u8Z+pMfe3cFVKVN
 WQh5Umhy+REj8bK1tycDXsprPHU=
X-Google-Smtp-Source: AGHT+IGWyPrDcYHqjCN3qtoNsW5iOSUZa13NaKXNbx7t9skbjcJsYPif4vqMZCd2++JUXSgynnt8yg==
X-Received: by 2002:a0c:f113:0:b0:6f8:b4aa:2a4c with SMTP id
 6a1803df08f44-6f8b4aa47f5mr74616576d6.14.1747530511141; 
 Sat, 17 May 2025 18:08:31 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 af79cd13be357-7cd468b6a53sm335710785a.67.2025.05.17.18.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 May 2025 18:08:30 -0700 (PDT)
Date: Sun, 18 May 2025 09:07:55 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: weishangjuan@eswincomputing.com, andrew+netdev@lunn.ch, 
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 richardcochran@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, 
 p.zabel@pengutronix.de, yong.liang.choong@linux.intel.com,
 rmk+kernel@armlinux.org.uk, 
 jszhang@kernel.org, inochiama@gmail.com, jan.petrous@oss.nxp.com, 
 dfustini@tenstorrent.com, 0x1207@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
Message-ID: <mqf33f6bd6w7ozklh7igpa7ybgzuicqfxrbokvdcvcofwayffx@i6g5mqebahif>
References: <20250516010849.784-1-weishangjuan@eswincomputing.com>
 <20250516011040.801-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250516011040.801-1-weishangjuan@eswincomputing.com>
Cc: ningyu@eswincomputing.com, lizhi2@eswincomputing.com,
 linmin@eswincomputing.com
Subject: Re: [Linux-stm32] [PATCH v1 1/2] ethernet: eswin: Document for
	eic7700 SoC
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

On Fri, May 16, 2025 at 09:10:38AM +0800, weishangjuan@eswincomputing.com wrote:
> From: Shangjuan Wei <weishangjuan@eswincomputing.com>
> 
> Add ESWIN EIC7700 Ethernet controller, supporting
> multi-rate (10M/100M/1G) auto-negotiation, PHY LED configuration,
> clock/reset control, and AXI bus parameter optimization.
> 
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
> Signed-off-by: Shangjuan Wei <weishangjuan@eswincomputing.com>
> ---
>  .../bindings/net/eswin,eic7700-eth.yaml       | 142 ++++++++++++++++++
>  1 file changed, 142 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> new file mode 100644
> index 000000000000..6cb9c109c036
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> @@ -0,0 +1,142 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/eswin,eic7700-eth.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Eswin EIC7700 SOC Eth Controller
> +
> +maintainers:
> +  - Shuang Liang <liangshuang@eswincomputing.com>
> +  - Zhi Li <lizhi2@eswincomputing.com>
> +  - Shangjuan Wei <weishangjuan@eswincomputing.com>
> +
> +description: |
> +  The eth controller registers are part of the syscrg block on
> +  the EIC7700 SoC.
> +
> +properties:
> +  compatible:
> +    const: eswin,eic7700-qos-eth

Please set the related dwmac version as basic compatible,
it should be something like snps,dwmac-xxx.

> +
> +  reg:
> +    minItems: 1
> +    items:
> +      - description: Base address and size
> +      - description: Extension region (optional)
> +
> +  interrupt-names:
> +    const: macirq
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  phy-mode:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [mii, gmii, rgmii, rmii, sgmii]
> +
> +  id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Controller instance ID
> +

> +  clocks:
> +    minItems: 3
> +    maxItems: 7
> +
> +  clock-names:
> +    minItems: 3
> +    items:
> +      - const: app
> +      - const: stmmaceth
> +      - const: tx
> +      - const: slave_bus
> +      - const: master_bus
> +      - const: ptp_ref
> +      - const: phy_ref_clk
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: ethrst

Please refer to snps,dwmac.yaml and set a matching name.
This applies to all properties with snp prefix.

> +
> +  dma-noncoherent: true
> +
> +  # Custom properties
> +  eswin,hsp_sp_csr:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: HSP SP control registers
> +
> +  eswin,syscrg_csr:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: System clock registers
> +
> +  eswin,dly_hsp_reg:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: HSP delay control registers
> +
> +  snps,axi-config:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: AXI bus configuration
> +
> +  stmmac-axi-config:
> +    type: object
> +    unevaluatedProperties: false
> +    properties:
> +      snps,lpi_en:
> +        type: boolean
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: Low Power Interface enable flag (true/false)
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-names
> +  - interrupts
> +  - phy-mode
> +  - id
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - eswin,hsp_sp_csr
> +  - eswin,syscrg_csr
> +  - eswin,dly_hsp_reg
> +  - snps,axi-config
> +  - snps,blen
> +  - snps,rd_osr_lmt
> +  - snps,wr_osr_lmt
> +  - snps,lpi_en
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gmac0: ethernet@50400000 {
> +        compatible = "eswin,eic7700-qos-eth";
> +        reg = <0x0 0x50400000 0x0 0x10000>;
> +        interrupt-parent = <&plic>;
> +        interrupt-names = "macirq";
> +        interrupts = <61>;
> +        phy-mode = "rgmii";
> +        id = <0>;
> +        status = "disabled";
> +        clocks = <&clock 550>,
> +                 <&clock 551>,
> +                 <&clock 552>;
> +        clock-names = "app", "stmmaceth", "tx";
> +        resets = <&reset 0x07 (1 << 26)>;
> +        reset-names = "ethrst";
> +        dma-noncoherent;
> +        eswin,hsp_sp_csr = <&hsp_sp_csr 0x1030 0x100 0x108>;
> +        eswin,syscrg_csr = <&sys_crg 0x148 0x14c>;
> +        eswin,dly_hsp_reg = <0x114 0x118 0x11c>;
> +        snps,axi-config = <&stmmac_axi_setup>;
> +        stmmac_axi_setup: stmmac-axi-config {
> +            snps,blen = <0 0 0 0 16 8 4>;
> +            snps,rd_osr_lmt = <2>;
> +            snps,wr_osr_lmt = <2>;
> +            snps,lpi_en;
> +        };
> +    };
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
