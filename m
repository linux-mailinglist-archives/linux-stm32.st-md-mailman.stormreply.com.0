Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5020D9661CF
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Aug 2024 14:32:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0114FC6DD9A;
	Fri, 30 Aug 2024 12:32:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A4A7C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2024 12:32:16 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47U9OAGH013991;
 Fri, 30 Aug 2024 14:32:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=selector1; bh=rF+PJVCKiIcf9VXvCqXQEmtD
 hYo/qKzl2j8yT99jfF0=; b=om93XnrG4SwGMxr2vTQiTBb8mF4or06tomZHFWF9
 Ibz5qma42DADLn4/k5Ona2BNoiwEyKwcSljlfHVetPN7kFxVhXlFY+6hjF45G/id
 dLV2XzPR8Zictr/fSeEKdbmHcCteFjJCHCQfisyxW86vBcayxLNhzKRfEhj3w6BI
 jZdXMH313kxqfklu729oLQVDy9IAw0CMiEcNyXhIOs5Bx0zlZ8e1XrcfZ7bL1PxS
 1wu4jjEatwdCoxwl9OMkrkvM4F2thFWSas6kNLdiGASvDPQlxMQ5lVGXa7LHTq33
 avhyI2itArbWm9A4ixyPlo22KGG2wXd0ze2oY4FC7JKYSA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41a4y697f2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Aug 2024 14:32:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0137240044;
 Fri, 30 Aug 2024 14:31:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C4538263550;
 Fri, 30 Aug 2024 14:31:04 +0200 (CEST)
Received: from [10.129.178.212] (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 30 Aug
 2024 14:31:04 +0200
Message-ID: <eb0b34a2-5697-4e8d-bca3-0e11ea91576d@foss.st.com>
Date: Fri, 30 Aug 2024 14:31:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Conor Dooley <conor@kernel.org>
References: <20240828143452.1407532-1-christian.bruel@foss.st.com>
 <20240828143452.1407532-2-christian.bruel@foss.st.com>
 <20240828-handsfree-overarch-cd1af26cb0c5@spud>
 <005a2f7d-ab46-46c8-a0cc-b343685caf7c@foss.st.com>
 <20240829-manifesto-tray-65443d6e7e6e@spud>
Content-Language: en-US
From: Christian Bruel <christian.bruel@foss.st.com>
In-Reply-To: <20240829-manifesto-tray-65443d6e7e6e@spud>
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_07,2024-08-30_01,2024-05-17_01
Cc: kishon@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, mcoquelin.stm32@gmail.com,
 linux-phy@lists.infradead.org, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/5] dt-bindings: phy: Add STM32MP25
	COMBOPHY bindings
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
Content-Type: multipart/mixed; boundary="===============8479226148203597859=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============8479226148203597859==
Content-Type: multipart/alternative;
	boundary="------------Zqz00WRAhswIAUAEj110lTrK"
Content-Language: en-US

--------------Zqz00WRAhswIAUAEj110lTrK
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 8/29/24 18:44, Conor Dooley wrote:
> On Thu, Aug 29, 2024 at 01:06:53PM +0200, Christian Bruel wrote:
>> On 8/28/24 18:11, Conor Dooley wrote:
>>> On Wed, Aug 28, 2024 at 04:34:48PM +0200, Christian Bruel wrote:
>>>> Document the bindings for STM32 COMBOPHY interface, used to support
>>>> the PCIe and USB3 stm32mp25 drivers.
>>>> Following entries can be used to tune caracterisation parameters
>>>>    - st,output-micro-ohms and st,output-vswing-microvolt bindings entries
>>>> to tune the impedance and voltage swing using discrete simulation results
>>>>    - st,rx-equalizer register to set the internal rx equalizer filter value.
>>>>
>>>> Signed-off-by: Christian Bruel<christian.bruel@foss.st.com>
>>>> ---
>>>>    .../bindings/phy/st,stm32mp25-combophy.yaml   | 128 ++++++++++++++++++
>>>>    1 file changed, 128 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/phy/st,stm32mp25-combophy.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/phy/st,stm32mp25-combophy.yaml b/Documentation/devicetree/bindings/phy/st,stm32mp25-combophy.yaml
>>>> new file mode 100644
>>>> index 000000000000..8d4a40b94507
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/phy/st,stm32mp25-combophy.yaml
>>>> @@ -0,0 +1,128 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id:http://devicetree.org/schemas/phy/st,stm32mp25-combophy.yaml#
>>>> +$schema:http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: STMicroelectronics STM32MP25 USB3/PCIe COMBOPHY
>>>> +
>>>> +maintainers:
>>>> +  - Christian Bruel<christian.bruel@foss.st.com>
>>>> +
>>>> +description:
>>>> +  Single lane PHY shared (exclusive) between the USB3 and PCIe controllers.
>>>> +  Supports 5Gbit/s for USB3 and PCIe gen2 or 2.5Gbit/s for PCIe gen1.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: st,stm32mp25-combophy
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  "#phy-cells":
>>>> +    const: 1
>>>> +
>>>> +  clocks:
>>>> +    minItems: 2
>>>> +    items:
>>>> +      - description: apb Bus clock mandatory to access registers.
>>>> +      - description: ker Internal RCC reference clock for USB3 or PCIe
>>>> +      - description: pad Optional on board clock input for PCIe only. Typically an
>>>> +                     external 100Mhz oscillator wired on dedicated CLKIN pad. Used as reference
>>>> +                     clock input instead of the ker
>>>> +
>>>> +  clock-names:
>>>> +    minItems: 2
>>>> +    items:
>>>> +      - const: apb
>>>> +      - const: ker
>>>> +      - const: pad
>>>> +
>>>> +  resets:
>>>> +    maxItems: 1
>>>> +
>>>> +  reset-names:
>>>> +    const: phy
>>>> +
>>>> +  power-domains:
>>>> +    maxItems: 1
>>>> +
>>>> +  wakeup-source: true
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +    description: interrupt used for wakeup
>>>> +
>>>> +  access-controllers:
>>>> +    minItems: 1
>>>> +    maxItems: 2
>>> Can you please describe the items here?
>> I can specialize the description: "Phandle to the rifsc firewall device to check access right."
> Right, but there are potentially two access controllers here. You need
> to describe which is which, so that people can hook them up in the
> correct order. In what case are there two? Your dts patch only has one.

yes, we don't have more than 1 controller in the current setup,
I'll use maxItems: 1

>
>> otherwise described in access-controllers/access-controllers.yaml, see also bindings/bus/st,stm32mp25-rifsc.yaml
>>
>>>> +  st,syscfg:
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>> +    description: Phandle to the SYSCON entry required for configuring PCIe
>>>> +      or USB3.
>>> Why is a phandle required for this lookup, rather than doing it by
>>> compatible?
>> the phandle is used to select the sysconf SoC configuration register
>> depending on the PCIe/USB3 mode (selected by xlate function), so it's not
>> like a lookup here.
> If "syscon_regmap_lookup_by_phandle()" is not a lookup, then I do not
> know what is. An example justification for it would be that there are
> multiple combophys on the same soc, each using a different sysconf
> region. Your dts suggests that is not the case though, since you have
> st,syscfg = <&syscfg>; in it, rather than st,syscfg = <&syscfg0>;.

I didn't get your suggestion earlier to use "syscon_regmap_lookup_by_compatible()".

We have several other syscon in the other. That's why we choose a direct syscfg phandle

>
>> This sysconf register is also used for other settings
>> such as the PLL, Reference clock selection, ...
>>
>>>> +
>>>> +  st,ssc-on:
>>>> +    type: boolean
>>> flag, not boolean, for presence based stuff. And in the driver,
>>> s/of_property_read_bool/of_property_present/.
>> ok
>>
>>>> +    description:
>>>> +      A boolean property whose presence indicates that the SSC for common clock
>>>> +      needs to be set.
>>> And what, may I ask, does "SSC" mean? "Common clock" is also a bit of a
>>> "linuxism", what does this actually do in the hardware block?
>> SSC for Spread Spectrum Clocking. It is an hardware setting for the 100Mhz PCIe reference common clock,
> Ah, so not really a "common clock" linuxism at all.
>
>> I will rephrase the description
> How is someone supposed to decide between on and off? Is it always on
> for PCIe, or only on in some configurations? Or maybe only (or always?) on
> if the pad clock is provided?

SSC is off by default and available for the PCIe pad clock. it must be defined for USB3

thanks

Christian

>
> Cheers,
> Conor.
--------------Zqz00WRAhswIAUAEj110lTrK
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/29/24 18:44, Conor Dooley wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20240829-manifesto-tray-65443d6e7e6e@spud">
      <pre class="moz-quote-pre" wrap="">On Thu, Aug 29, 2024 at 01:06:53PM +0200, Christian Bruel wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 8/28/24 18:11, Conor Dooley wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Wed, Aug 28, 2024 at 04:34:48PM +0200, Christian Bruel wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Document the bindings for STM32 COMBOPHY interface, used to support
the PCIe and USB3 stm32mp25 drivers.
Following entries can be used to tune caracterisation parameters
  - st,output-micro-ohms and st,output-vswing-microvolt bindings entries
to tune the impedance and voltage swing using discrete simulation results
  - st,rx-equalizer register to set the internal rx equalizer filter value.

Signed-off-by: Christian Bruel <a class="moz-txt-link-rfc2396E" href="mailto:christian.bruel@foss.st.com">&lt;christian.bruel@foss.st.com&gt;</a>
---
  .../bindings/phy/st,stm32mp25-combophy.yaml   | 128 ++++++++++++++++++
  1 file changed, 128 insertions(+)
  create mode 100644 Documentation/devicetree/bindings/phy/st,stm32mp25-combophy.yaml

diff --git a/Documentation/devicetree/bindings/phy/st,stm32mp25-combophy.yaml b/Documentation/devicetree/bindings/phy/st,stm32mp25-combophy.yaml
new file mode 100644
index 000000000000..8d4a40b94507
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/st,stm32mp25-combophy.yaml
@@ -0,0 +1,128 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: <a class="moz-txt-link-freetext" href="http://devicetree.org/schemas/phy/st,stm32mp25-combophy.yaml#">http://devicetree.org/schemas/phy/st,stm32mp25-combophy.yaml#</a>
+$schema: <a class="moz-txt-link-freetext" href="http://devicetree.org/meta-schemas/core.yaml#">http://devicetree.org/meta-schemas/core.yaml#</a>
+
+title: STMicroelectronics STM32MP25 USB3/PCIe COMBOPHY
+
+maintainers:
+  - Christian Bruel <a class="moz-txt-link-rfc2396E" href="mailto:christian.bruel@foss.st.com">&lt;christian.bruel@foss.st.com&gt;</a>
+
+description:
+  Single lane PHY shared (exclusive) between the USB3 and PCIe controllers.
+  Supports 5Gbit/s for USB3 and PCIe gen2 or 2.5Gbit/s for PCIe gen1.
+
+properties:
+  compatible:
+    const: st,stm32mp25-combophy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 1
+
+  clocks:
+    minItems: 2
+    items:
+      - description: apb Bus clock mandatory to access registers.
+      - description: ker Internal RCC reference clock for USB3 or PCIe
+      - description: pad Optional on board clock input for PCIe only. Typically an
+                     external 100Mhz oscillator wired on dedicated CLKIN pad. Used as reference
+                     clock input instead of the ker
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: apb
+      - const: ker
+      - const: pad
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: phy
+
+  power-domains:
+    maxItems: 1
+
+  wakeup-source: true
+
+  interrupts:
+    maxItems: 1
+    description: interrupt used for wakeup
+
+  access-controllers:
+    minItems: 1
+    maxItems: 2
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Can you please describe the items here?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I can specialize the description: "Phandle to the rifsc firewall device to check access right."
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Right, but there are potentially two access controllers here. You need
to describe which is which, so that people can hook them up in the
correct order. In what case are there two? Your dts patch only has one.</pre>
    </blockquote>
    <pre>
yes, we don't have more than 1 controller in the current setup, 
I'll use maxItems: 1
</pre>
    <blockquote type="cite"
      cite="mid:20240829-manifesto-tray-65443d6e7e6e@spud">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">otherwise described in access-controllers/access-controllers.yaml, see also bindings/bus/st,stm32mp25-rifsc.yaml

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">+  st,syscfg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the SYSCON entry required for configuring PCIe
+      or USB3.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Why is a phandle required for this lookup, rather than doing it by
compatible?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
the phandle is used to select the sysconf SoC configuration register
depending on the PCIe/USB3 mode (selected by xlate function), so it's not
like a lookup here.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
If "syscon_regmap_lookup_by_phandle()" is not a lookup, then I do not
know what is. An example justification for it would be that there are
multiple combophys on the same soc, each using a different sysconf
region. Your dts suggests that is not the case though, since you have
st,syscfg = &lt;&amp;syscfg&gt;; in it, rather than st,syscfg = &lt;&amp;syscfg0&gt;;.</pre>
    </blockquote>
    <pre>I didn't get your suggestion earlier to use "syscon_regmap_lookup_by_compatible()". 

We have several other syscon in the other. That's why we choose a direct syscfg phandle
</pre>
    <blockquote type="cite"
      cite="mid:20240829-manifesto-tray-65443d6e7e6e@spud">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This sysconf register is also used for other settings
such as the PLL, Reference clock selection, ...

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">+
+  st,ssc-on:
+    type: boolean
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">flag, not boolean, for presence based stuff. And in the driver,
s/of_property_read_bool/of_property_present/.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
ok

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">+    description:
+      A boolean property whose presence indicates that the SSC for common clock
+      needs to be set.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">And what, may I ask, does "SSC" mean? "Common clock" is also a bit of a
"linuxism", what does this actually do in the hardware block?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
SSC for Spread Spectrum Clocking. It is an hardware setting for the 100Mhz PCIe reference common clock,
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Ah, so not really a "common clock" linuxism at all.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I will rephrase the description
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
How is someone supposed to decide between on and off? Is it always on
for PCIe, or only on in some configurations? Or maybe only (or always?) on
if the pad clock is provided?</pre>
    </blockquote>
    <pre>SSC is off by default and available for the PCIe pad clock. it must be defined for USB3

thanks

Christian
</pre>
    <blockquote type="cite"
      cite="mid:20240829-manifesto-tray-65443d6e7e6e@spud">
      <pre class="moz-quote-pre" wrap="">

Cheers,
Conor.
</pre>
    </blockquote>
  </body>
</html>

--------------Zqz00WRAhswIAUAEj110lTrK--

--===============8479226148203597859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8479226148203597859==--
