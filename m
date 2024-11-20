Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B80D59D41A3
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 18:49:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 755ACC7BF88;
	Wed, 20 Nov 2024 17:49:47 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61D17C78015
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2024 08:40:00 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-720d01caa66so4799593b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2024 00:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732091999; x=1732696799;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=otVzPudNyMZ+ABjcE6wfYbv41dBTUXAQhybV35zixxE=;
 b=QNhk9u2AIEkjLS0Z804cvUW1Z60NxNdnbl2qGHP7LGg9Bqa0u5kIdMqDE0p/eIGOpO
 4I9PnMVNQlrOmv3pRaO1/TN0+a5/itHD4E8lBNNJo5Ey3wgFtgzZTbGSvrv2eSSJ23nS
 R0bspwVcb+qlQ9bWRngq464/7aRgvX0iFBxNkpfdhCk7pkXINfTW5jKn+EMBhDBm1RTH
 OQ5jMgMbPYwDRTYx2Quyad/2IXiv1FsybIZBPZiignGFvs42UHDr/nUURyDqNhvrsxTv
 MyjtbUuvyuNLZbrX2KAKl6zc1CVfKdhQ7ad4Mm/emtFWuz2GhLGgwIM6k5XfFuMsgMBA
 NvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732091999; x=1732696799;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=otVzPudNyMZ+ABjcE6wfYbv41dBTUXAQhybV35zixxE=;
 b=q2S1NiBzQGGJ2pc2i07HGNqi8i6YcWj41Z24Ixrct/LKuJ5GSxOfgAQHClAJmJErvk
 zhdP3KcdAEd2XEEfKDVXPsd1uh7zF+cKZRQrpreYjEyPucInzIewBqfg/yfOZ8a4KqE8
 i2h9KM5MujvqA6dVDmBMmv0nSkVKTXYf/Z/k0jD+NgNw3A3605Fhy5zzvq/ZDGyxg0YI
 XUtSX1gVPNOO9ccQlO2OPix2q22xU3c73MB5A1GP3NhRb4yjh4CU1QmoRbrgNedxM/Kt
 NcfWuKy2g/5yeU+YctF9oU0k/lRm5oysmPBjK56wKFasoe+gPSLsG73cWELm42anmeOW
 8FYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWvJM9pAJuIb95ny6lWTfpQctMHY3UD+bzzv/Z1WoNZ8ZeO1P89jNMw0WaW+tDwICFhh2/AzgkRDfGUg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx6Nl3Mg4ayQ1iXluT/oKeqhnYnbSK4kErWd9STSj6ubwTpb8nH
 +N2R+mtLpMOKr0l3/SMLKygGhDb/I3MtJjEALOr1tMsH40anxkZT
X-Google-Smtp-Source: AGHT+IGksaGBOOPKGbpcLkMU1tNiZu/dLi8FdP/Y5naOotLnNmH2PHc76VRSizNoDnhnbMRSe1b68w==
X-Received: by 2002:a05:6a00:995:b0:71e:594:f1ef with SMTP id
 d2e1a72fcca58-724bed27c09mr2525737b3a.16.1732091998688; 
 Wed, 20 Nov 2024 00:39:58 -0800 (PST)
Received: from [192.168.0.102] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724beefee95sm1070421b3a.72.2024.11.20.00.39.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Nov 2024 00:39:58 -0800 (PST)
Message-ID: <ee1c7f01-5e6f-4e0e-89dc-e45c5d1054ab@gmail.com>
Date: Wed, 20 Nov 2024 16:39:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20241118082707.8504-1-a0987203069@gmail.com>
 <20241118082707.8504-2-a0987203069@gmail.com>
 <20241119181237.GA1871579-robh@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20241119181237.GA1871579-robh@kernel.org>
X-Mailman-Approved-At: Wed, 20 Nov 2024 17:49:43 +0000
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, openbmc@lists.ozlabs.org,
 netdev@vger.kernel.org, richardcochran@gmail.com, ychuang3@nuvoton.com,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, edumazet@google.com,
 joabreu@synopsys.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, schung@nuvoton.com,
 kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 yclu4@nuvoton.com
Subject: Re: [Linux-stm32] [PATCH v3 1/3] dt-bindings: net: nuvoton: Add
 schema for Nuvoton MA35 family GMAC
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
Content-Type: multipart/mixed; boundary="===============4011024512991973418=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

This is a multi-part message in MIME format.
--===============4011024512991973418==
Content-Type: multipart/alternative;
 boundary="------------mOQs0W70zxFjiHeaOz2MW1HZ"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------mOQs0W70zxFjiHeaOz2MW1HZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Rob,

Thank you for your reply.

Rob Herring 於 11/20/2024 2:12 AM 寫道:
> On Mon, Nov 18, 2024 at 04:27:05PM +0800, Joey Lu wrote:
>> Create initial schema for Nuvoton MA35 family Gigabit MAC.
>>
>> Signed-off-by: Joey Lu<a0987203069@gmail.com>
>> ---
>>   .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 173 ++++++++++++++++++
>>   .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>>   2 files changed, 174 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
>> new file mode 100644
>> index 000000000000..92cbbcc72f2b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
>> @@ -0,0 +1,173 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id:http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml#
>> +$schema:http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton DWMAC glue layer controller
>> +
>> +maintainers:
>> +  - Joey Lu<yclu4@nuvoton.com>
>> +
>> +description:
>> +  Nuvoton 10/100/1000Mbps Gigabit Ethernet MAC Controller is based on
>> +  Synopsys DesignWare MAC (version 3.73a).
>> +
>> +# We need a select here so we don't match all nodes with 'snps,dwmac'
> You mean snps,dwmac-3.70a?
I found that the yaml can pass |dt_binding_check| without |select|. I 
will drop these lines.
>> +select:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        enum:
>> +          - nuvoton,ma35d1-dwmac
>> +  required:
>> +    - compatible
>> +
>> +allOf:
>> +  - $ref: snps,dwmac.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
> oneOf is not correct. I think you wanted 'items'.
I will fix it.
>> +      - enum:
>> +          - nuvoton,ma35d1-dwmac
>> +      - const: snps,dwmac-3.70a
> But you said above the h/w is 3.73a.
>
> Really, I'd prefer to just drop this because it's not useful on its own.
> But the driver does check for snps,dwmac-3.70a. All those
> of_device_is_compatible() calls in the driver should really be replaced
> with static match data structs.
Yes, I will drop it.
>> +
>> +  reg:
>> +    description:
>> +      Register range should be one of the GMAC interface.
> Need to define how many entries and what they are if more than 1.
This will be fixed.
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: MAC clock
>> +      - description: PTP clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: stmmaceth
>> +      - const: ptp_ref
>> +
>> +  nuvoton,sys:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    items:
>> +      - items:
>> +          - description: phandle to access syscon registers.
>> +          - description: GMAC interface ID.
>> +            enum:
>> +              - 0
>> +              - 1
>> +    description:
>> +      A phandle to the syscon with one argument that configures system registers
>> +      for MA35D1's two GMACs. The argument specifies the GMAC interface ID.
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  reset-names:
>> +    items:
>> +      - const: stmmaceth
>> +
>> +  phy-mode:
>> +    enum:
>> +      - rmii
>> +      - rgmii
>> +      - rgmii-id
>> +      - rgmii-txid
>> +      - rgmii-rxid
>> +
>> +  phy-handle:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
> The type is already defined. Drop.
I will drop it.
>> +    description:
>> +      Specifies a reference to a node representing a PHY device.
>> +
>> +  tx-internal-delay-ps:
>> +    enum: [0, 2000]
>> +    default: 0
>> +    description:
>> +      RGMII TX path delay used only when PHY operates in RGMII mode with
>> +      internal delay (phy-mode is 'rgmii-id' or 'rgmii-txid') in pico-seconds.
>> +
>> +  rx-internal-delay-ps:
>> +    enum: [0, 2000]
>> +    default: 0
>> +    description:
>> +      RGMII RX path delay used only when PHY operates in RGMII mode with
>> +      internal delay (phy-mode is 'rgmii-id' or 'rgmii-rxid') in pico-seconds.
>> +
>> +  mdio:
>> +    $ref: /schemas/net/mdio.yaml#
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - interrupt-names
>> +  - clocks
>> +  - clock-names
>> +  - nuvoton,sys
>> +  - resets
>> +  - reset-names
>> +  - phy-mode
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>> +    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
>> +    //Example 1
> Not a useful comment.
I will drop it.
>> +    gmac0: ethernet@40120000 {
> Drop unused labels.
All unused labels will be dropped.
>> +        compatible = "nuvoton,ma35d1-dwmac";
>> +        reg = <0x0 0x40120000 0x0 0x10000>;
>> +        interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
>> +        interrupt-names = "macirq";
>> +        clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
>> +        clock-names = "stmmaceth", "ptp_ref";
>> +
>> +        nuvoton,sys = <&sys 0>;
>> +        resets = <&sys MA35D1_RESET_GMAC0>;
>> +        reset-names = "stmmaceth";
>> +
>> +        phy-mode = "rgmii-id";
>> +        phy-handle = <&eth_phy0>;
>> +        mdio0: mdio {
>> +            compatible = "snps,dwmac-mdio";
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            eth_phy0: ethernet-phy@0 {
>> +                reg = <0>;
>> +            };
>> +        };
>> +    };
>> +
>> +  - |
>> +    //Example 2
>> +    gmac1: ethernet@40130000 {
> Drop the example. It's almost the same as the first one.
I will drop it.
>> +        compatible = "nuvoton,ma35d1-dwmac";
>> +        reg = <0x0 0x40130000 0x0 0x10000>;
>> +        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
>> +        interrupt-names = "macirq";
>> +        clocks = <&clk EMAC1_GATE>, <&clk EPLL_DIV8>;
>> +        clock-names = "stmmaceth", "ptp_ref";
>> +
>> +        nuvoton,sys = <&sys 1>;
>> +        resets = <&sys MA35D1_RESET_GMAC1>;
>> +        reset-names = "stmmaceth";
>> +
>> +        phy-mode = "rmii";
>> +        phy-handle = <&eth_phy1>;
>> +        mdio1: mdio {
>> +            compatible = "snps,dwmac-mdio";
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            eth_phy1: ethernet-phy@1 {
>> +                reg = <1>;
>> +            };
>> +        };
>> +    };
>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> index 4e2ba1bf788c..aecdb3d37b53 100644
>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> @@ -66,6 +66,7 @@ properties:
>>           - ingenic,x2000-mac
>>           - loongson,ls2k-dwmac
>>           - loongson,ls7a-dwmac
>> +        - nuvoton,ma35d1-dwmac
>>           - qcom,qcs404-ethqos
>>           - qcom,sa8775p-ethqos
>>           - qcom,sc8280xp-ethqos
>> -- 
>> 2.34.1

Thanks!

BR,

Joey

--------------mOQs0W70zxFjiHeaOz2MW1HZ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Dear Rob,</p>
    <p>Thank you for your reply.<br>
    </p>
    <div class="moz-cite-prefix">Rob Herring 於 11/20/2024 2:12 AM 寫道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20241119181237.GA1871579-robh@kernel.org">
      <pre wrap="" class="moz-quote-pre">On Mon, Nov 18, 2024 at 04:27:05PM +0800, Joey Lu wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Create initial schema for Nuvoton MA35 family Gigabit MAC.

Signed-off-by: Joey Lu <a class="moz-txt-link-rfc2396E" href="mailto:a0987203069@gmail.com">&lt;a0987203069@gmail.com&gt;</a>
---
 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 173 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 2 files changed, 174 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
new file mode 100644
index 000000000000..92cbbcc72f2b
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
@@ -0,0 +1,173 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: <a class="moz-txt-link-freetext" href="http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml#">http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml#</a>
+$schema: <a class="moz-txt-link-freetext" href="http://devicetree.org/meta-schemas/core.yaml#">http://devicetree.org/meta-schemas/core.yaml#</a>
+
+title: Nuvoton DWMAC glue layer controller
+
+maintainers:
+  - Joey Lu <a class="moz-txt-link-rfc2396E" href="mailto:yclu4@nuvoton.com">&lt;yclu4@nuvoton.com&gt;</a>
+
+description:
+  Nuvoton 10/100/1000Mbps Gigabit Ethernet MAC Controller is based on
+  Synopsys DesignWare MAC (version 3.73a).
+
+# We need a select here so we don't match all nodes with 'snps,dwmac'
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
You mean snps,dwmac-3.70a?
</pre>
    </blockquote>
    I found that the yaml can pass <code>dt_binding_check</code>
    without <code>select</code>. I will drop these lines.
    <blockquote type="cite"
      cite="mid:20241119181237.GA1871579-robh@kernel.org">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - nuvoton,ma35d1-dwmac
+  required:
+    - compatible
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    oneOf:
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
oneOf is not correct. I think you wanted 'items'.
</pre>
    </blockquote>
    I will fix it.<br>
    <blockquote type="cite"
      cite="mid:20241119181237.GA1871579-robh@kernel.org">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+      - enum:
+          - nuvoton,ma35d1-dwmac
+      - const: snps,dwmac-3.70a
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
But you said above the h/w is 3.73a.

Really, I'd prefer to just drop this because it's not useful on its own. 
But the driver does check for snps,dwmac-3.70a. All those 
of_device_is_compatible() calls in the driver should really be replaced 
with static match data structs.
</pre>
    </blockquote>
    Yes, I will drop it.<br>
    <blockquote type="cite"
      cite="mid:20241119181237.GA1871579-robh@kernel.org">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+  reg:
+    description:
+      Register range should be one of the GMAC interface.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Need to define how many entries and what they are if more than 1.
</pre>
    </blockquote>
    This will be fixed.<br>
    <blockquote type="cite"
      cite="mid:20241119181237.GA1871579-robh@kernel.org">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: MAC clock
+      - description: PTP clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: ptp_ref
+
+  nuvoton,sys:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to access syscon registers.
+          - description: GMAC interface ID.
+            enum:
+              - 0
+              - 1
+    description:
+      A phandle to the syscon with one argument that configures system registers
+      for MA35D1's two GMACs. The argument specifies the GMAC interface ID.
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: stmmaceth
+
+  phy-mode:
+    enum:
+      - rmii
+      - rgmii
+      - rgmii-id
+      - rgmii-txid
+      - rgmii-rxid
+
+  phy-handle:
+    $ref: /schemas/types.yaml#/definitions/phandle
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The type is already defined. Drop.
</pre>
    </blockquote>
    I will drop it.
    <blockquote type="cite"
      cite="mid:20241119181237.GA1871579-robh@kernel.org">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    description:
+      Specifies a reference to a node representing a PHY device.
+
+  tx-internal-delay-ps:
+    enum: [0, 2000]
+    default: 0
+    description:
+      RGMII TX path delay used only when PHY operates in RGMII mode with
+      internal delay (phy-mode is 'rgmii-id' or 'rgmii-txid') in pico-seconds.
+
+  rx-internal-delay-ps:
+    enum: [0, 2000]
+    default: 0
+    description:
+      RGMII RX path delay used only when PHY operates in RGMII mode with
+      internal delay (phy-mode is 'rgmii-id' or 'rgmii-rxid') in pico-seconds.
+
+  mdio:
+    $ref: /schemas/net/mdio.yaml#
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - nuvoton,sys
+  - resets
+  - reset-names
+  - phy-mode
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include &lt;dt-bindings/interrupt-controller/arm-gic.h&gt;
+    #include &lt;dt-bindings/clock/nuvoton,ma35d1-clk.h&gt;
+    #include &lt;dt-bindings/reset/nuvoton,ma35d1-reset.h&gt;
+    //Example 1
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Not a useful comment.
</pre>
    </blockquote>
    I will drop it.
    <blockquote type="cite"
      cite="mid:20241119181237.GA1871579-robh@kernel.org">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    gmac0: ethernet@40120000 {
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Drop unused labels.
</pre>
    </blockquote>
    All unused labels will be dropped.<br>
    <blockquote type="cite"
      cite="mid:20241119181237.GA1871579-robh@kernel.org">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        compatible = "nuvoton,ma35d1-dwmac";
+        reg = &lt;0x0 0x40120000 0x0 0x10000&gt;;
+        interrupts = &lt;GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH&gt;;
+        interrupt-names = "macirq";
+        clocks = &lt;&amp;clk EMAC0_GATE&gt;, &lt;&amp;clk EPLL_DIV8&gt;;
+        clock-names = "stmmaceth", "ptp_ref";
+
+        nuvoton,sys = &lt;&amp;sys 0&gt;;
+        resets = &lt;&amp;sys MA35D1_RESET_GMAC0&gt;;
+        reset-names = "stmmaceth";
+
+        phy-mode = "rgmii-id";
+        phy-handle = &lt;&amp;eth_phy0&gt;;
+        mdio0: mdio {
+            compatible = "snps,dwmac-mdio";
+            #address-cells = &lt;1&gt;;
+            #size-cells = &lt;0&gt;;
+
+            eth_phy0: ethernet-phy@0 {
+                reg = &lt;0&gt;;
+            };
+        };
+    };
+
+  - |
+    //Example 2
+    gmac1: ethernet@40130000 {
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Drop the example. It's almost the same as the first one.
</pre>
    </blockquote>
    I will drop it.
    <blockquote type="cite"
      cite="mid:20241119181237.GA1871579-robh@kernel.org">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        compatible = "nuvoton,ma35d1-dwmac";
+        reg = &lt;0x0 0x40130000 0x0 0x10000&gt;;
+        interrupts = &lt;GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH&gt;;
+        interrupt-names = "macirq";
+        clocks = &lt;&amp;clk EMAC1_GATE&gt;, &lt;&amp;clk EPLL_DIV8&gt;;
+        clock-names = "stmmaceth", "ptp_ref";
+
+        nuvoton,sys = &lt;&amp;sys 1&gt;;
+        resets = &lt;&amp;sys MA35D1_RESET_GMAC1&gt;;
+        reset-names = "stmmaceth";
+
+        phy-mode = "rmii";
+        phy-handle = &lt;&amp;eth_phy1&gt;;
+        mdio1: mdio {
+            compatible = "snps,dwmac-mdio";
+            #address-cells = &lt;1&gt;;
+            #size-cells = &lt;0&gt;;
+
+            eth_phy1: ethernet-phy@1 {
+                reg = &lt;1&gt;;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 4e2ba1bf788c..aecdb3d37b53 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -66,6 +66,7 @@ properties:
         - ingenic,x2000-mac
         - loongson,ls2k-dwmac
         - loongson,ls7a-dwmac
+        - nuvoton,ma35d1-dwmac
         - qcom,qcs404-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
-- 
2.34.1
</pre>
      </blockquote>
    </blockquote>
    <p>Thanks!</p>
    <p>BR,</p>
    <p>Joey<br>
    </p>
    <blockquote type="cite"
      cite="mid:20241119181237.GA1871579-robh@kernel.org">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------mOQs0W70zxFjiHeaOz2MW1HZ--

--===============4011024512991973418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4011024512991973418==--
