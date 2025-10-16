Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A1CBE1586
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Oct 2025 05:19:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4AD8C57181;
	Thu, 16 Oct 2025 03:19:09 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2AE23C36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Oct 2025 03:19:08 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-b60971c17acso165315a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 20:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760584746; x=1761189546;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q3V6/3lwtdjURh/3v4+zxQ+JkOqta8pLIKsB7qZtosM=;
 b=f/2n4kT1EYUntzJrysKjleo5srJONBlHkhatgjSDBdDI1arTl9sCredoKjcoVON05/
 PUB+R/ugs7/IYeV3ETrMYL6iuJ/jfCEHfYBIL9UzqMTaZz28kgOJcxmck8z4SJl2oaht
 ekXrPwIyIlfhuTNtquywonsWsPEM5/ZIpRWIlnzS+8Hwuf63xoXGOowZB8H0izyl+mx8
 8YEqJdtEE2CKa63lnoX9V+L9VUErEfSZ0E1r56VLGzNa06ceAur0fbEEnMjLEGzWfN5X
 ATajc0UzEW4yiMn+bFi/d9EuepSRHmOScaeYZOK74ATIVMSYPi0ExY1XrV8bpJO+GnxN
 d3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760584746; x=1761189546;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q3V6/3lwtdjURh/3v4+zxQ+JkOqta8pLIKsB7qZtosM=;
 b=ROU6HFWZnYvFTFikJMqSdvm9B5i7ZrcF/m6Eflu8M7mj79UDuR06FWWLCkMPtkYtwz
 cKEyouKjC9MCGGjSOFQL4yXStnf9jeNw8Digbjwvl/sUY2wLGB15yC1agid3G7UbMaRw
 VKoFTXUaISag6TZeS6hiaKEpWk/bhL0LypQJPsED5jbPIFO+vOmSHSRfAn/DZ+WhyQdN
 Ib6Bxiu8NWaOt5fwl8aCPY0eBmw8RBtJON8998qllz5LebGbKzoZfLkJL1TTrKz/LgxG
 rpuQZXWjXigXzrqS2q7KxcmWJraReRfjvN8WxY7dTYPEskRXlCqzMeOWVYIXj18oFt0/
 Xo4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCxi4O51ebzVmDhmxxkALFmRM5e7KyIIHSuZEcXe/SzswbEoiHNNpflPdTTniLLoC7ly4sb8KYZgYr8w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyMLzBnEyke9Vo4hCsSTDAQ9RTPJjDkE61i8NyEzVuSaXdGpnW/
 w6KEWwLPH+3WNl2X9bARzgZZH46TJHsLkxx0nyhRhoCTF6Cdv0/zVf18
X-Gm-Gg: ASbGncvXvCx3FeTvoii+KJKwzKbuEkKiV325410BnD9IE/getBsVzusJccVunIArhzY
 NXNZwFO3NE8Aq83I09SnyXU6RK1+R0HWvSe8mqYRtjJBQDr+4P4OJdHtPr0kmKHCaAVrvZCMNwj
 JvCEydEJqGO3C/fyv3jFaDrctvTEvH95CjeAn36b4ndaJaoI0ItXTwg52LAWqLfudYAynbG8e1u
 L7CueEyT40fsI6y9Dio2Xx5g7nztA4cXyVXeIBYgSSDEbNLbIl4UjjMYjWYBWL5CT9UvBjXo21i
 /0RxppDmEzMe4EJ0zsJQSjliCmeoT+fHID7hb2UEDFvte6+xeCRao3QK+K92gBSEg1sOj7bwptc
 93L6LUpl2RCuMLlqm33/HbIySfkEYC0ZobHUBfI2WsvbMfywuhxXoUXEgnEczGNlKyMOMk7KnOf
 nzxSSHmpi/zWPq
X-Google-Smtp-Source: AGHT+IF4v2d27Dj/e7jq1kEU9oe1rwtYs2LQ1lRSZOTT/iIRfUfi40YveMA9WdkCLpBc1j1xOkHApQ==
X-Received: by 2002:a17:903:b4f:b0:288:e2ec:edfd with SMTP id
 d9443c01a7336-290272154a4mr369206485ad.10.1760584746390; 
 Wed, 15 Oct 2025 20:19:06 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.155])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29099ab9c0fsm11872355ad.82.2025.10.15.20.19.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 20:19:05 -0700 (PDT)
Message-ID: <227c0045-1e6c-4b2e-93d5-263213a7ff39@gmail.com>
Date: Wed, 15 Oct 2025 20:17:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: weishangjuan@eswincomputing.com, devicetree@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 yong.liang.choong@linux.intel.com, vladimir.oltean@nxp.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, jan.petrous@oss.nxp.com,
 inochiama@gmail.com, jszhang@kernel.org, 0x1207@gmail.com,
 boon.khai.ng@altera.com, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20251015113751.1114-1-weishangjuan@eswincomputing.com>
 <20251015114041.1166-1-weishangjuan@eswincomputing.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20251015114041.1166-1-weishangjuan@eswincomputing.com>
Cc: Xuyang Dong <dongxuyang@eswincomputing.com>, pinkesh.vaghela@einfochips.com,
 linmin@eswincomputing.com, ningyu@eswincomputing.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 lizhi2@eswincomputing.com
Subject: Re: [Linux-stm32] [PATCH v8 1/2] dt-bindings: ethernet: eswin:
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

Hi Zhi, ShangJuan,


On 10/15/25 04:40, weishangjuan@eswincomputing.com wrote:
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
> index 000000000000..9ddbfe219ae2
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

Can you let me know which clock I should use for EIC7700 (HiFive P550), if
I apply this patchset on top of XuYang's v6 clock patchset? ref:
https://lore.kernel.org/all/20251009092029.140-1-dongxuyang@eswincomputing.com/
In your vendor kernel, you have EIC7700_CLK_HSP_ETH_[APP|CSR]_CLK, but in
the v6 clock patchset, I couldn't find them. Please help translate
<186> <171> <40> <193> to the macro of v6 clock patchset, so I can help
test it.

> +        clock-names = "axi", "cfg", "stmmaceth", "tx";> +        interrupt-parent = <&plic>;
> +        interrupts = <61>;
> +        interrupt-names = "macirq";
> +        phy-mode = "rgmii-id";
> +        phy-handle = <&phy0>;> +        resets = <&reset 95>;

For reset, I assume this <95> corresponds to EIC7700_RESET_HSP_ETH0_ARST,
if applying on top of the v7 reset patchset, correct? ref:
https://lore.kernel.org/all/20250930093132.2003-1-dongxuyang@eswincomputing.com/

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
> --
> 2.17.1
> 

Bo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
