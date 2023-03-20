Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0406C0CF8
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 10:19:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BCE1C6A5EF;
	Mon, 20 Mar 2023 09:19:10 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E8E3C6A5E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 09:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1679303949; x=1710839949;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KcTqCESxcN73NYJ/dcxfK/tm8NaiYnSt/OcyW2m0CDY=;
 b=wMifzH0HmH6XWedvciRSx6m61amdFLu1zgOYiexXlxhzOBt7FI7Ze8ho
 rLA7CKpI6MQoQrXRnKfvGtfhjWmSYb17sy3Do6G7V88HYQnRLVSqz9zyG
 +YUfGYn7bbeE3QRIEdADMLT9BE+DRqpvsqjKvZxc0vSOsKGPaTdII0W24
 JMAx4tVp95Q3bbvkIorj+QLtXrilYglm17Qb3e53Ls+kBWXDX/dspFVtn
 +9sTnMzCLE5Si9GOfno2xjhGnn7PrTb8DrD7/7FKEid9oDl3SEdn5gOGV
 hSTnNSdkHDcG52T46SzelemX7vS63ML5JZPXSZCRAYjBIrugL8+Z/WkU+ A==;
X-IronPort-AV: E=Sophos;i="5.98,274,1673938800"; d="scan'208";a="202463786"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Mar 2023 02:19:05 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 02:19:02 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 20 Mar 2023 02:18:56 -0700
Message-ID: <b6609e59-0f68-689b-81db-4324ed5deb26@microchip.com>
Date: Mon, 20 Mar 2023 10:18:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, "Alyssa
 Rosenzweig" <alyssa@rosenzweig.io>, Julius Werner <jwerner@chromium.org>,
 "Evan Benn" <evanbenn@chromium.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
References: <20230317233643.3969019-1-robh@kernel.org>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20230317233643.3969019-1-robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 asahi@lists.linux.dev, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: watchdog: Drop unneeded
	quotes
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

>   .../devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml         | 2 +-

For Microchip platforms:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks, best regards,
   Nicolas
-- 
Nicolas Ferre

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
