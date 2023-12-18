Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A048178FD
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Dec 2023 18:43:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B46DCC6DD70;
	Mon, 18 Dec 2023 17:43:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36A10C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Dec 2023 17:43:50 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3BIHMUwq016916; Mon, 18 Dec 2023 18:43:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 content-type:message-id:date:mime-version:subject:to:cc
 :references:from:in-reply-to; s=selector1; bh=m/3+DiqRCwYcJZ2WXM
 pQfr0vAnyo+ztvH/a/0BAoVss=; b=aSyPP0gnJTL7lCjZAseA0LPX11VN7WGLv8
 TGIbvrIY+HDf9twauD21wNmSh7+GNWNhLqiQLd4+mZlou0NAKWWZietlgCO6Phtn
 RhsIP9pjdVLgvGUr1/x+iLAb6XdQWYU64SjzT4ItAMLVm0Wo9Yf4i139ZXqNbrFZ
 DWigbHefOkyy/d6JoMBi2YDC2xqMZ/pZRPEKs3QrEkPjzunIdufSjxuC8PYwRC7o
 RAXB+6MkYJSx4YfVl/jpqaSKb4mOJbAEbtYWuBcsLSvm8fjZrwXjSVQUiz95frQU
 M3c55rZzMLXYmjBaevtYAKiw1zkdevJ5jldFI0L0/MCPROGaAISw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3v11w8s72f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Dec 2023 18:43:30 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2C9C910005E;
 Mon, 18 Dec 2023 18:43:29 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 178D226CA1F;
 Mon, 18 Dec 2023 18:43:29 +0100 (CET)
Received: from [10.252.4.187] (10.252.4.187) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 18 Dec
 2023 18:43:28 +0100
Message-ID: <176a0978-fc92-4cc2-a652-e2e898871dc5@foss.st.com>
Date: Mon, 18 Dec 2023 18:43:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Stephen Boyd <sboyd@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
References: <20231208143700.354785-1-gabriel.fernandez@foss.st.com>
 <20231208143700.354785-5-gabriel.fernandez@foss.st.com>
 <e8124f2cad7afbb4e9fbd777dda992f4.sboyd@kernel.org>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <e8124f2cad7afbb4e9fbd777dda992f4.sboyd@kernel.org>
X-Originating-IP: [10.252.4.187]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-18_11,2023-12-14_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v6 4/5] clk: stm32: introduce clocks for
 STM32MP257 platform
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
Content-Type: multipart/mixed; boundary="===============3763604929926635450=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============3763604929926635450==
Content-Type: multipart/alternative;
	boundary="------------6qM65cOph3H0i8NZzhj50cGF"
Content-Language: en-US

--------------6qM65cOph3H0i8NZzhj50cGF
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stephen,

Thank's for the review.

On 12/18/23 00:52, Stephen Boyd wrote:
> Quotinggabriel.fernandez@foss.st.com  (2023-12-08 06:36:59)
>> diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
>> new file mode 100644
>> index 000000000000..36321fd6142e
>> --- /dev/null
>> +++ b/drivers/clk/stm32/clk-stm32mp25.c
>> @@ -0,0 +1,1125 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
>> + * Author: Gabriel Fernandez<gabriel.fernandez@foss.st.com>  for STMicroelectronics.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/delay.h>
> Is this include used?
no, I 'll remove it
>
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/io.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_address.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/slab.h>
>> +#include <linux/spinlock.h>
> Is this include used?
dito
>
>> +
>> +#include "clk-stm32-core.h"
>> +#include "reset-stm32.h"
>> +
>> +#include <dt-bindings/clock/st,stm32mp25-rcc.h>
>> +#include <dt-bindings/reset/st,stm32mp25-rcc.h>
>> +
>> +#include "stm32mp25_rcc.h"
>> +
>> +static const char * const adc12_src[] = {
>> +       "ck_flexgen_46", "ck_icn_ls_mcu"
> Can we please migrate to struct clk_parent_data?

ok

>> +};
>> +
>> +static const char * const adc3_src[] = {
>> +       "ck_flexgen_47", "ck_icn_ls_mcu", "ck_flexgen_46"
>> +};
>> +
>> +static const char * const usb2phy1_src[] = {
>> +       "ck_flexgen_57", "hse_div2_ck"
>> +};
> [...]
>> +       GATE_TIM4,
>> +       GATE_TIM5,
>> +       GATE_TIM6,
>> +       GATE_TIM7,
>> +       GATE_TIM8,
>> +       GATE_UART4,
>> +       GATE_UART5,
>> +       GATE_UART7,
>> +       GATE_UART8,
>> +       GATE_UART9,
>> +       GATE_USART1,
>> +       GATE_USART2,
>> +       GATE_USART3,
>> +       GATE_USART6,
>> +       GATE_USB2,
>> +       GATE_USB2PHY1,
>> +       GATE_USB2PHY2,
>> +       GATE_USB3DR,
>> +       GATE_USB3PCIEPHY,
>> +       GATE_USBTC,
>> +       GATE_VDEC,
>> +       GATE_VENC,
>> +       GATE_VREF,
>> +       GATE_WWDG1,
>> +       GATE_WWDG2,
>> +       GATE_NB
>> +};
>> +
>> +#define GATE_CFG(id, _offset, _bit_idx, _offset_clr)\
>> +       [id] = {\
> Please move these slashes out and align them.
ok
>> +               .offset         = (_offset),\
>> +               .bit_idx        = (_bit_idx),\
>> +               .set_clr        = (_offset_clr),\
>> +       }
>> +
>> +static const struct stm32_gate_cfg stm32mp25_gates[GATE_NB] = {
>> +       GATE_CFG(GATE_ADC12,            RCC_ADC12CFGR,          1,      0),
>> +       GATE_CFG(GATE_ADC3,             RCC_ADC3CFGR,           1,      0),
>> +       GATE_CFG(GATE_ADF1,             RCC_ADF1CFGR,           1,      0),
>> +       GATE_CFG(GATE_CCI,              RCC_CCICFGR,            1,      0),
>> +       GATE_CFG(GATE_CRC,              RCC_CRCCFGR,            1,      0),
>> +       GATE_CFG(GATE_CRYP1,            RCC_CRYP1CFGR,          1,      0),
> [....]
>> +
>> +static struct clk_stm32_clock_data stm32mp25_clock_data = {
>> +       .gate_cpt       = stm32mp25_cpt_gate,
>> +       .gates          = stm32mp25_gates,
>> +       .muxes          = stm32mp25_muxes,
>> +};
>> +
>> +static struct clk_stm32_reset_data stm32mp25_reset_data = {
>> +       .reset_lines    = stm32mp25_reset_cfg,
>> +       .nr_lines       = ARRAY_SIZE(stm32mp25_reset_cfg),
>> +};
>> +
>> +static struct stm32_rcc_match_data stm32mp25_data = {
> const

ok

>> +       .tab_clocks     = stm32mp25_clock_cfg,
>> +       .num_clocks     = ARRAY_SIZE(stm32mp25_clock_cfg),
>> +       .maxbinding     = STM32MP25_LAST_CLK,
>> +       .clock_data     = &stm32mp25_clock_data,
>> +       .reset_data     = &stm32mp25_reset_data,
>> +};
>> +
>> +static const struct of_device_id stm32mp25_match_data[] = {
>> +       {
>> +               .compatible = "st,stm32mp25-rcc",
>> +               .data = &stm32mp25_data,
>> +       },
>> +       { }
>> +};
>> +MODULE_DEVICE_TABLE(of, stm32mp25_match_data);
>> +
>> +static int stm32mp25_rcc_init(struct device *dev)
> Please inline this function in the one call site.

i 'll move stm32mp25_rcc_init() content in stm32mp25_rcc_clocks_probe()

>
>> +{
>> +       void __iomem *base;
>> +       int ret;
>> +
>> +       base = of_iomap(dev_of_node(dev), 0);
> Use platform device APIs instead of OF specific ones.

ok

>
>> +       if (!base) {
>> +               dev_err(dev, "%pOFn: unable to map resource", dev_of_node(dev));
> Missing newline.
>
>> +               ret = -ENOMEM;
>> +               goto out;
>> +       }
>> +
>> +       ret = stm32_rcc_init(dev, stm32mp25_match_data, base);
>> +
>> +out:
>> +       if (ret) {
>> +               if (base)
>> +                       iounmap(base);
>> +
>> +               of_node_put(dev_of_node(dev));
> When did we get the node?

i will remove it

>> +       }
>> +
>> +       return ret;
>> +}
>> +
>> +static int get_clock_deps(struct device *dev)
>> +{
>> +       static const char * const clock_deps_name[] = {
>> +               "hsi", "hse", "msi", "lsi", "lse",
>> +       };
>> +       size_t deps_size = sizeof(struct clk *) * ARRAY_SIZE(clock_deps_name);
>> +       struct clk **clk_deps;
>> +       int i;
>> +
>> +       clk_deps = devm_kzalloc(dev, deps_size, GFP_KERNEL);
>> +       if (!clk_deps)
>> +               return -ENOMEM;
>> +
>> +       for (i = 0; i < ARRAY_SIZE(clock_deps_name); i++) {
>> +               struct clk *clk;
>> +
>> +               clk = of_clk_get_by_name(dev_of_node(dev), clock_deps_name[i]);
>> +
>> +               if (IS_ERR(clk)) {
>> +                       if (PTR_ERR(clk) != -EINVAL && PTR_ERR(clk) != -ENOENT)
>> +                               return PTR_ERR(clk);
>> +               } else {
>> +                       /* Device gets a reference count on the clock */
>> +                       clk_deps[i] = devm_clk_get(dev, __clk_get_name(clk));
> Is something using this clk_deps array?
no i will remove it
>
>> +                       clk_put(clk);
>> +               }
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int stm32mp25_rcc_clocks_probe(struct platform_device *pdev)
>> +{
>> +       struct device *dev = &pdev->dev;
>> +       int ret = get_clock_deps(dev);
>> +
>> +       if (!ret)
>> +               ret = stm32mp25_rcc_init(dev);
>> +
>> +       return ret;
>> +}
>> +


Best Regards

Gabriel

--------------6qM65cOph3H0i8NZzhj50cGF
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Stephen,</p>
    <p>Thank's for the review.<br>
    </p>
    <div class="moz-cite-prefix">On 12/18/23 00:52, Stephen Boyd wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:e8124f2cad7afbb4e9fbd777dda992f4.sboyd@kernel.org">
      <pre class="moz-quote-pre" wrap="">Quoting <a class="moz-txt-link-abbreviated" href="mailto:gabriel.fernandez@foss.st.com">gabriel.fernandez@foss.st.com</a> (2023-12-08 06:36:59)
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
new file mode 100644
index 000000000000..36321fd6142e
--- /dev/null
+++ b/drivers/clk/stm32/clk-stm32mp25.c
@@ -0,0 +1,1125 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
+ * Author: Gabriel Fernandez <a class="moz-txt-link-rfc2396E" href="mailto:gabriel.fernandez@foss.st.com">&lt;gabriel.fernandez@foss.st.com&gt;</a> for STMicroelectronics.
+ */
+
+#include &lt;linux/clk.h&gt;
+#include &lt;linux/clk-provider.h&gt;
+#include &lt;linux/delay.h&gt;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Is this include used?</pre>
    </blockquote>
    no, I 'll remove it<br>
    <blockquote type="cite"
      cite="mid:e8124f2cad7afbb4e9fbd777dda992f4.sboyd@kernel.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+#include &lt;linux/device.h&gt;
+#include &lt;linux/err.h&gt;
+#include &lt;linux/io.h&gt;
+#include &lt;linux/module.h&gt;
+#include &lt;linux/of.h&gt;
+#include &lt;linux/of_address.h&gt;
+#include &lt;linux/platform_device.h&gt;
+#include &lt;linux/slab.h&gt;
+#include &lt;linux/spinlock.h&gt;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Is this include used?</pre>
    </blockquote>
    dito<br>
    <blockquote type="cite"
      cite="mid:e8124f2cad7afbb4e9fbd777dda992f4.sboyd@kernel.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+#include "clk-stm32-core.h"
+#include "reset-stm32.h"
+
+#include &lt;dt-bindings/clock/st,stm32mp25-rcc.h&gt;
+#include &lt;dt-bindings/reset/st,stm32mp25-rcc.h&gt;
+
+#include "stm32mp25_rcc.h"
+
+static const char * const adc12_src[] = {
+       "ck_flexgen_46", "ck_icn_ls_mcu"
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Can we please migrate to struct clk_parent_data?
</pre>
    </blockquote>
    <p>ok<br>
    </p>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite"
      cite="mid:e8124f2cad7afbb4e9fbd777dda992f4.sboyd@kernel.org">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+};
+
+static const char * const adc3_src[] = {
+       "ck_flexgen_47", "ck_icn_ls_mcu", "ck_flexgen_46"
+};
+
+static const char * const usb2phy1_src[] = {
+       "ck_flexgen_57", "hse_div2_ck"
+};
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">[...]
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+       GATE_TIM4,
+       GATE_TIM5,
+       GATE_TIM6,
+       GATE_TIM7,
+       GATE_TIM8,
+       GATE_UART4,
+       GATE_UART5,
+       GATE_UART7,
+       GATE_UART8,
+       GATE_UART9,
+       GATE_USART1,
+       GATE_USART2,
+       GATE_USART3,
+       GATE_USART6,
+       GATE_USB2,
+       GATE_USB2PHY1,
+       GATE_USB2PHY2,
+       GATE_USB3DR,
+       GATE_USB3PCIEPHY,
+       GATE_USBTC,
+       GATE_VDEC,
+       GATE_VENC,
+       GATE_VREF,
+       GATE_WWDG1,
+       GATE_WWDG2,
+       GATE_NB
+};
+
+#define GATE_CFG(id, _offset, _bit_idx, _offset_clr)\
+       [id] = {\
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Please move these slashes out and align them.
</pre>
    </blockquote>
    ok<br>
    <blockquote type="cite"
      cite="mid:e8124f2cad7afbb4e9fbd777dda992f4.sboyd@kernel.org">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+               .offset         = (_offset),\
+               .bit_idx        = (_bit_idx),\
+               .set_clr        = (_offset_clr),\
+       }
+
+static const struct stm32_gate_cfg stm32mp25_gates[GATE_NB] = {
+       GATE_CFG(GATE_ADC12,            RCC_ADC12CFGR,          1,      0),
+       GATE_CFG(GATE_ADC3,             RCC_ADC3CFGR,           1,      0),
+       GATE_CFG(GATE_ADF1,             RCC_ADF1CFGR,           1,      0),
+       GATE_CFG(GATE_CCI,              RCC_CCICFGR,            1,      0),
+       GATE_CFG(GATE_CRC,              RCC_CRCCFGR,            1,      0),
+       GATE_CFG(GATE_CRYP1,            RCC_CRYP1CFGR,          1,      0),
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">[....]
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+static struct clk_stm32_clock_data stm32mp25_clock_data = {
+       .gate_cpt       = stm32mp25_cpt_gate,
+       .gates          = stm32mp25_gates,
+       .muxes          = stm32mp25_muxes,
+};
+
+static struct clk_stm32_reset_data stm32mp25_reset_data = {
+       .reset_lines    = stm32mp25_reset_cfg,
+       .nr_lines       = ARRAY_SIZE(stm32mp25_reset_cfg),
+};
+
+static struct stm32_rcc_match_data stm32mp25_data = {
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
const
</pre>
    </blockquote>
    <p>ok</p>
    <blockquote type="cite"
      cite="mid:e8124f2cad7afbb4e9fbd777dda992f4.sboyd@kernel.org">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+       .tab_clocks     = stm32mp25_clock_cfg,
+       .num_clocks     = ARRAY_SIZE(stm32mp25_clock_cfg),
+       .maxbinding     = STM32MP25_LAST_CLK,
+       .clock_data     = &amp;stm32mp25_clock_data,
+       .reset_data     = &amp;stm32mp25_reset_data,
+};
+
+static const struct of_device_id stm32mp25_match_data[] = {
+       {
+               .compatible = "st,stm32mp25-rcc",
+               .data = &amp;stm32mp25_data,
+       },
+       { }
+};
+MODULE_DEVICE_TABLE(of, stm32mp25_match_data);
+
+static int stm32mp25_rcc_init(struct device *dev)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Please inline this function in the one call site.</pre>
    </blockquote>
    <p>i 'll move stm32mp25_rcc_init() content in
      stm32mp25_rcc_clocks_probe()</p>
    <blockquote type="cite"
      cite="mid:e8124f2cad7afbb4e9fbd777dda992f4.sboyd@kernel.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+{
+       void __iomem *base;
+       int ret;
+
+       base = of_iomap(dev_of_node(dev), 0);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Use platform device APIs instead of OF specific ones.</pre>
    </blockquote>
    <p>ok</p>
    <blockquote type="cite"
      cite="mid:e8124f2cad7afbb4e9fbd777dda992f4.sboyd@kernel.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+       if (!base) {
+               dev_err(dev, "%pOFn: unable to map resource", dev_of_node(dev));
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Missing newline.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+               ret = -ENOMEM;
+               goto out;
+       }
+
+       ret = stm32_rcc_init(dev, stm32mp25_match_data, base);
+
+out:
+       if (ret) {
+               if (base)
+                       iounmap(base);
+
+               of_node_put(dev_of_node(dev));
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
When did we get the node?
</pre>
    </blockquote>
    <p>i will remove it</p>
    <blockquote type="cite"
      cite="mid:e8124f2cad7afbb4e9fbd777dda992f4.sboyd@kernel.org">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+       }
+
+       return ret;
+}
+
+static int get_clock_deps(struct device *dev)
+{
+       static const char * const clock_deps_name[] = {
+               "hsi", "hse", "msi", "lsi", "lse",
+       };
+       size_t deps_size = sizeof(struct clk *) * ARRAY_SIZE(clock_deps_name);
+       struct clk **clk_deps;
+       int i;
+
+       clk_deps = devm_kzalloc(dev, deps_size, GFP_KERNEL);
+       if (!clk_deps)
+               return -ENOMEM;
+
+       for (i = 0; i &lt; ARRAY_SIZE(clock_deps_name); i++) {
+               struct clk *clk;
+
+               clk = of_clk_get_by_name(dev_of_node(dev), clock_deps_name[i]);
+
+               if (IS_ERR(clk)) {
+                       if (PTR_ERR(clk) != -EINVAL &amp;&amp; PTR_ERR(clk) != -ENOENT)
+                               return PTR_ERR(clk);
+               } else {
+                       /* Device gets a reference count on the clock */
+                       clk_deps[i] = devm_clk_get(dev, __clk_get_name(clk));
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Is something using this clk_deps array?</pre>
    </blockquote>
    no i will remove it<br>
    <blockquote type="cite"
      cite="mid:e8124f2cad7afbb4e9fbd777dda992f4.sboyd@kernel.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+                       clk_put(clk);
+               }
+       }
+
+       return 0;
+}
+
+static int stm32mp25_rcc_clocks_probe(struct platform_device *pdev)
+{
+       struct device *dev = &amp;pdev-&gt;dev;
+       int ret = get_clock_deps(dev);
+
+       if (!ret)
+               ret = stm32mp25_rcc_init(dev);
+
+       return ret;
+}
+
</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <p>Best Regards <br>
    </p>
    <p>Gabriel<br>
    </p>
  </body>
</html>

--------------6qM65cOph3H0i8NZzhj50cGF--

--===============3763604929926635450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3763604929926635450==--
