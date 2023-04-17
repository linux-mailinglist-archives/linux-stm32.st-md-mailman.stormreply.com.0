Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BEF6E4342
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Apr 2023 11:08:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E8D7C6B454;
	Mon, 17 Apr 2023 09:08:51 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A2E2C6904B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Apr 2023 09:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1681722529; x=1713258529;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=m8aASMkvQM9MGebrTwvix2EO5nQR6qeGOss5wQyHKgw=;
 b=w7hrefYR4ngDR4JUrCjxlq/rhGySCdK8ZTXnMp8pQfluUZcWwBF6KDeN
 /XPbAnrTi89Sr7a6MWPH8J7GUXZ9UiJW+nYeiagrkhmQQJ/4BHKpDJUU1
 /zDCY+FgLB56onTl3o5y705U0p5G2uK448blu/JFD/oXaEMydwK5i3fkm
 6UxAgx04onOVOvtP3eoiPzhK8OFPkmosOLqTK8oPKi3AMaGViUH4S47JG
 vOHRWOv0zyrAmGc5EIednOL3W9eyBg8AqYyi/67z+pwZhb4PCzXFP9AHs
 RWSUFDbFpckOnUFysNtZ4t5PJyMwyGpiejK4947FyvHwlUArlBfFHiw06 w==;
X-IronPort-AV: E=Sophos;i="5.99,203,1677567600"; d="scan'208";a="147374424"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Apr 2023 02:08:40 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 17 Apr 2023 02:08:37 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 17 Apr 2023 02:08:28 -0700
Message-ID: <8a76d193-7a01-9ec5-40e8-65fcb039f708@microchip.com>
Date: Mon, 17 Apr 2023 11:08:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Julius Werner <jwerner@chromium.org>,
 Evan Benn <evanbenn@chromium.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Sander Vanheule <sander@svanheule.net>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Nobuhiro Iwamatsu
 <nobuhiro1.iwamatsu@toshiba.co.jp>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Fu Wei
 <fu.wei@linaro.org>, Viresh Kumar <vireshk@kernel.org>, Eugen Hristev
 <eugen.hristev@collabora.com>, Justin Chen <justinpopo6@gmail.com>,
 =?UTF-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>, Linus Walleij
 <linus.walleij@linaro.org>, Corentin Labbe <clabbe@baylibre.com>, Anson Huang
 <Anson.Huang@nxp.com>, Robert Marko <robert.marko@sartura.hr>, "Sergio
 Paracuellos" <sergio.paracuellos@gmail.com>, Sai Prakash Ranjan
 <quic_saipraka@quicinc.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Jamie Iles <jamie@jamieiles.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Christophe Roullier
 <christophe.roullier@foss.st.com>, Shubhrajyoti Datta
 <shubhrajyoti.datta@xilinx.com>, Srinivas Neeli <srinivas.neeli@xilinx.com>,
 <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-renesas-soc@vger.kernel.org>
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
 <20230415095112.51257-2-krzysztof.kozlowski@linaro.org>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20230415095112.51257-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 2/6] dt-bindings: watchdog: indentation,
 quotes and white-space cleanup
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

On 15/04/2023 at 11:51, Krzysztof Kozlowski wrote:
> Minor cleanup without functional impact:
> 1. Indent DTS examples to preferred four-spaces (more readable for DTS),
> 2. Drop unneeded quotes,
> 3. Add/drop blank lines to make the code readable.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

[..]

>   .../bindings/watchdog/atmel,sama5d4-wdt.yaml  | 14 ++++----

[..]

For Microchip:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks Krzysztof, best regards,
   Nicolas

-- 
Nicolas Ferre

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
