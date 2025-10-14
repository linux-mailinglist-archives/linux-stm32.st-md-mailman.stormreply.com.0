Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C166BD84BF
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Oct 2025 10:54:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DA32C3FACE;
	Tue, 14 Oct 2025 08:54:44 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51E24C3FACB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Oct 2025 08:54:43 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-78af3fe5b17so4041271b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Oct 2025 01:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760432082; x=1761036882;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ISi9f6KzQSpnphkygLBuAPANu77cvnhCFWLhBPhHgsY=;
 b=Fq1PpGZLAGnIvkdYqLsFyqxCWNreKasfts0o+NjuB16aa3+g7/t6A2fucxyn2lqAUN
 NYEkuXd09oduEec95Ljzi6/YjsiuSIqVtlxzNKO2LiNTQdYWzGPelbbEWmE2A8K749bQ
 kjMMw7pVWWJzrM1e2XD1x67MZ4oTZ3Rqpd+Vc1I88TqJkEhf2JLXxlEZixMuF0JKiHEo
 UkmNdSAay/yiickQEpFTUfBji5y1ilpPy5RasCtWLGC0YBgT+efQ1qWk2KOMzNBSAKMb
 nSnzJkkbLSkHa4jY+IoOcTm34aEQ+3lHYHR8EQYg6BNpEOBo91AI+gV1+Ktw9LClzOik
 iyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760432082; x=1761036882;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ISi9f6KzQSpnphkygLBuAPANu77cvnhCFWLhBPhHgsY=;
 b=RaOkvgGcLAMsqgeW3jD1LDqOMMivucE4sZ+EI+hWpobW+SP3OkaW2JmPxPH8MCXQ40
 /Vl6x2LTXcaEyR6Sy9B3zPLNaMQA6grcfxappCJWWdBn3OpGcnjjSgJbJcQUg6hhVpYF
 FkFgQNtYKr2Qca7M9dkBwe7JrAWp4ZT/IYwpoBiA1KERIYDobPJ/2OxxNzJkBzRYPckw
 4a73i/7auyUCFYyoCYPYLWodvUx0+lR7doeAx8fc3Kz/qr8A3mZFTxfeZua1ULOOnvrp
 NaZirjgoEOCgB6xNg4X5oO146JJuuFCc/PYoBIKFjAb+I8vrQvWnSEDQw/W21rm/p9+4
 9GMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeOHwJMtSSPIBEH400qn38mU0oJu7hz5C2/DNNZXv2bbNu7FUlVqKnFSZtQ7E3xCE54Xz0eYatuJsc6g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz2OdWYsw2ohxhDHKC076puC0TgUpA7Iie+wv5vb88h4gedeQc0
 wSI/B056+7KWnDjLBXlaNcU4VaSBH/R7wp/Ixj5VRt4x7lnHm+fDvlyr
X-Gm-Gg: ASbGnctxFf1KzTIuDdP0tXXLvd7TsNBvhZYKgVGc3ow9VkHyJyH8X2aawMhiQxYX/Lb
 zhPTQeI6PXjsb5GKo5JNg9uAitrItgtQwiZnowpIpGzYEfGGLYfC0uSrU/Oeu+6W+ldVB2cmKgQ
 JKu68psA8kpdrWdb5Fj6odg8UR2H6aP0XgkAYEhr4bAzMQrGKzCUfGawX+Ct31xG7gaA/x4yJbC
 Ug2V5JIrjn/CLPbsJyl1Q9/A3n73nVQ/sTuz5UGgjLrm7rAov8z/16OabzZ+a3m+AQY0E+jw1yg
 3siNciTxlaM2ZnKmfgFCUDJNbrZVQYBoo9rfgjDpv2NbalVsff/fSliz0sGmus4jkoyvrmL3ois
 lXWghQmrJ/gWD53LOZ/B24giSEWLGFaxpcbfLWp1wGk5joe2M0y+ZBA==
X-Google-Smtp-Source: AGHT+IGqTpN25zTj2NoGAGnl9jeNvvTw7CBNIuJy1oxy3KZR2C7Ji/G8drrYLcEK31MzNn+ZS3y/Fg==
X-Received: by 2002:a05:6a00:4fd3:b0:776:12ea:c737 with SMTP id
 d2e1a72fcca58-79387e05323mr21822249b3a.23.1760432081535; 
 Tue, 14 Oct 2025 01:54:41 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.155])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992b060b66sm14499599b3a.8.2025.10.14.01.54.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 01:54:41 -0700 (PDT)
Message-ID: <8226884b-96f9-483e-bcee-466ff3e04b23@gmail.com>
Date: Tue, 14 Oct 2025 01:53:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Bo Gan <ganboing@gmail.com>
To: weishangjuan@eswincomputing.com, devicetree@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, vladimir.oltean@nxp.com,
 rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
 anthony.l.nguyen@intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 jan.petrous@oss.nxp.com, jszhang@kernel.org, inochiama@gmail.com,
 0x1207@gmail.com, boon.khai.ng@altera.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250918085612.3176-1-weishangjuan@eswincomputing.com>
 <20250918085903.3228-1-weishangjuan@eswincomputing.com>
Content-Language: en-US
In-Reply-To: <20250918085903.3228-1-weishangjuan@eswincomputing.com>
Cc: ningyu@eswincomputing.com, pinkesh.vaghela@einfochips.com,
 lizhi2@eswincomputing.com, linmin@eswincomputing.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v7 1/2] dt-bindings: ethernet: eswin:
 Document for EIC7700 SoC
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

On 9/18/25 01:59, weishangjuan@eswincomputing.com wrote:
> From: Shangjuan Wei <weishangjuan@eswincomputing.com>
> 
> Add ESWIN EIC7700 Ethernet controller, supporting clock
> configuration, delay adjustment and speed adaptive functions.
> 
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
> Signed-off-by: Shangjuan Wei <weishangjuan@eswincomputing.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/net/eswin,eic7700-eth.yaml       | 127 ++++++++++++++++++
>   1 file changed, 127 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> new file mode 100644
> index 000000000000..57d6d0efc126
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> @@ -0,0 +1,127 @@
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
> +description:
> +  Platform glue layer implementation for STMMAC Ethernet driver.
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - eswin,eic7700-qos-eth
> +  required:
> +    - compatible
> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: eswin,eic7700-qos-eth
> +      - const: snps,dwmac-5.20
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-names:
> +    const: macirq
> +
> +  clocks:
> +    items:
> +      - description: AXI clock
> +      - description: Configuration clock
> +      - description: GMAC main clock
> +      - description: Tx clock
> +
> +  clock-names:
> +    items:
> +      - const: axi
> +      - const: cfg
> +      - const: stmmaceth
> +      - const: tx
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: stmmaceth
> +
> +  rx-internal-delay-ps:
> +    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
> +
> +  tx-internal-delay-ps:
> +    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
> +
> +  eswin,hsp-sp-csr:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - description: Phandle to HSP(High-Speed Peripheral) device
> +      - description: Offset of phy control register for internal
> +                     or external clock selection
> +      - description: Offset of AXI clock controller Low-Power request
> +                     register
> +      - description: Offset of register controlling TX/RX clock delay
> +    description: |
> +      High-Speed Peripheral device needed to configure clock selection,
> +      clock low-power mode and clock delay.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - phy-mode
> +  - resets
> +  - reset-names
> +  - rx-internal-delay-ps
> +  - tx-internal-delay-ps
> +  - eswin,hsp-sp-csr
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    ethernet@50400000 {
> +        compatible = "eswin,eic7700-qos-eth", "snps,dwmac-5.20";
> +        reg = <0x50400000 0x10000>;
> +        clocks = <&d0_clock 186>, <&d0_clock 171>, <&d0_clock 40>,
> +                <&d0_clock 193>;
> +        clock-names = "axi", "cfg", "stmmaceth", "tx";
> +        interrupt-parent = <&plic>;
> +        interrupts = <61>;
> +        interrupt-names = "macirq";
> +        phy-mode = "rgmii-id";
> +        phy-handle = <&phy0>;
> +        resets = <&reset 95>;
> +        reset-names = "stmmaceth";
> +        rx-internal-delay-ps = <200>;
> +        tx-internal-delay-ps = <200>;
> +        eswin,hsp-sp-csr = <&hsp_sp_csr 0x100 0x108 0x118>;
> +        snps,axi-config = <&stmmac_axi_setup>;
> +        snps,aal;
> +        snps,fixed-burst;
> +        snps,tso;
> +        stmmac_axi_setup: stmmac-axi-config {
> +            snps,blen = <0 0 0 0 16 8 4>;
> +            snps,rd_osr_lmt = <2>;
> +            snps,wr_osr_lmt = <2>;
> +        };
> +    };
> \ No newline at end of file
> --
> 2.17.1
> 

Hi ShangJuan,

I'm active user of HiFive p550. I'd like to test out this driver. Do you have
the device tree section of phy0 for Hifive p550 board? Or it's optional for
p550 board and I can just provide an empty &phy0 node? Regarding hsp_sp_csr
node, I should be able to use
https://github.com/sifiveinc/riscv-linux/blob/b4a753400e624a0eba3ec475fba2866dd7efb767/arch/riscv/boot/dts/eswin/eic7700.dtsi#L167
correct?

Bo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
