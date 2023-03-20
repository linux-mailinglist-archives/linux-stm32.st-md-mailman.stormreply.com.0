Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B311A6C0D1F
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 10:22:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7186AC6A5EF;
	Mon, 20 Mar 2023 09:22:48 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2EF4C6A5E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 09:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1679304167; x=1710840167;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=52HlZPeoz1Lq10GDbn1tdSpDfEepChN/u9evpNWzX/Y=;
 b=BiuOrmq+ofHiQp9cuF+EPts+zKMX9HGZCwSRfeoKuz4JpklgOb2ucMhU
 8MerwMwIIVwgQTblam5/SmCaOLgmTcWfjN78cI8eVYfJp/uSu0/nbHZYS
 p2WfRLrNn0j2jFNtzMbcjAAZm6KUqLS2aUTORcvrGfqP6u/MW/cL58rqp
 1PzEpEW6t8CIYa71Wa01R3xvX9MpIl17aI2ni5UH25L6+uSHE87QbEDpF
 EJqB9hGStOfHV2QBRlnUAbdXgtX/2UnBNmIuIeQ7fZBqXCls2JmtYhg//
 +zbXAHdkhy9Mh9htMK2qDq/CDrNcEWo6WRZV02iVaT2oWdORTHDmpyvm9 g==;
X-IronPort-AV: E=Sophos;i="5.98,274,1673938800"; d="scan'208";a="202464503"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Mar 2023 02:22:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 02:22:39 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 20 Mar 2023 02:22:34 -0700
Message-ID: <9840f009-d056-ea2d-fbcf-61e168157cc9@microchip.com>
Date: Mon, 20 Mar 2023 10:22:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Hans Ulli Kroll
 <ulli.kroll@googlemail.com>, Linus Walleij <linus.walleij@linaro.org>, "Avi
 Fishman" <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, "Tali
 Perry" <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, "Nancy
 Yuen" <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
References: <20230317233634.3968656-1-robh@kernel.org>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20230317233634.3968656-1-robh@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: rtc: Drop unneeded quotes
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

On 18/03/2023 at 00:36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring<robh@kernel.org>
> ---

[..]

>   .../devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml         | 2 +-
>   .../devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml        | 2 +-

For Microchip:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks! Best regards,
   Nicolas


-- 
Nicolas Ferre

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
