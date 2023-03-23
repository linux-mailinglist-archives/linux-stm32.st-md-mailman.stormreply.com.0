Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4726C640B
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Mar 2023 10:51:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8847C6A5E7;
	Thu, 23 Mar 2023 09:51:56 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D52EFC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Mar 2023 09:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1679565116; x=1711101116;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=c5AVjfNTyn5jyoWxBV5nksKULO7WagsKTvP/gGAu+pY=;
 b=MYsSU0h4mS7yja9AEksSeVrNzlKDJ61b4cnOIiB7XFF0YJSE7y2jn51n
 ndWqGfpYF6o/ZC7wBQ1neEzBeLUhn5U0rj1vTvWj2kXDNSFNJWNRbE6nr
 oPp7dpdLA9o7rditTnaKWPm/ml9sAD5E9mZ0Lf5bBA1dLZZx2C1cep4c1
 Xr2rzRWAJtlD9AAI2C8Z9Ex97DynuQiY9M71Mc4xNePOMajW+jY0iOmrN
 yf51UIf9OhOvu1OGKnIH8GN/svuqSfW7uB0a8o4UnGC36fz0Ggu7D+IFx
 erWgSxrfdczltLKSGYKfKkP1LF7WYVODyh0VgPQTPtYA5twdZL8KOEkM5 g==;
X-IronPort-AV: E=Sophos;i="5.98,283,1673938800"; d="scan'208";a="203041791"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Mar 2023 02:51:40 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 02:51:37 -0700
Received: from [10.12.67.87] (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Thu, 23 Mar 2023 02:51:33 -0700
Message-ID: <429849c0-1be3-2fc9-185c-9b5630304b13@microchip.com>
Date: Thu, 23 Mar 2023 10:51:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Hector Martin <marcan@marcan.st>, "Sven
 Peter" <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Michal Simek <michal.simek@xilinx.com>,
 "Peter Rosin" <peda@axentia.se>, Andy Gross <agross@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
References: <20230322173530.3971676-1-robh@kernel.org>
Content-Language: en-US
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20230322173530.3971676-1-robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: i2c: Drop unneeded quotes
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

On 22/03/2023 at 18:35, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring<robh@kernel.org>
> ---

[..]

>   Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml  | 2 +-

for Microchip:
Reviewed-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks Rob, best regards,
   Nicolas

-- 
Nicolas Ferre

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
