Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3276C1F0F
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 19:08:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29BAAC6A606;
	Mon, 20 Mar 2023 18:08:21 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D109C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 18:08:19 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id c19so14133830qtn.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 11:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679335698;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uTfm42DRLF/pqyQQSDFQRYTghzUDIMmwNt3uFt+5ZVo=;
 b=BDEvdS3CLR83im0McPFo89WtIVScQY2XOoudmTKAtD+7y6l2VP8PolUya8K44BjpOC
 UNhptTv7tYmCF7587hlCu8wMCjxh3UlzW5YI7dIYr2IqaThnuB5vjuElL/8yFG/TbL1u
 g+bxDQ3cpl37yZ4mJXvqzSkaXlAJmhxktqwjnGEv5/8GcgybHyB88Xjcdb6LcJid2CMG
 Tgr/6vkH+C3QbX1Vx02hmuMBA2JuYYZbfQ3PwVMq/VHZ7xqc1ObultPvPHLmrgbQ7utT
 1YhGEzJpkmML5NEYRh0oX96np+sJT36GRFFdEr3HeaujoCmlj4II5jXEKyIK/wCmGChO
 FKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679335698;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uTfm42DRLF/pqyQQSDFQRYTghzUDIMmwNt3uFt+5ZVo=;
 b=Sxxel/7FfXW4+NeAZbSirJI42jAy6w7VHBkfy+7rzfyCsvr5tzQlqD7y92VTyBM9C3
 jvfGc8bI4NzP3CRiHwfiMp5/gx0QGyB3sSX5LnYiAwkCoc1C+YfyL1+/lVDSp615Sv0s
 ZrCd1XyZsS0isjDtS5M5vbdHjb/yCEIahSp2vt0nTSOMaMtXM0YjvCyDJHNnU4sbZfLH
 Jcz3zm8rDfZt8bsHPwqlwTbzOnxtH/Zf1S2/mRMPxUzAxLSQEAU9rWpvCYfAk8Qnx2iJ
 XUE3G+fOsxraI8kncaCywFe8+jWyjHwaHpGzRFXkZU2EyNhi1kDXiw4KHBzuGbPk6A4C
 ECLQ==
X-Gm-Message-State: AO0yUKWID9PRE8NlYn8y2XofZIISZe5S6LP2p8Epf7wJSyJfTNiLA5zQ
 7KlT7A7eXAnPAHC1FtKaodg=
X-Google-Smtp-Source: AK7set+ZUF3yUcqPxvT5JrSdC2gQaXGTs/LVLEDznrAr6g4pl8nC/T/ix9WBdEtY73cm15/2Ejntww==
X-Received: by 2002:a05:622a:144b:b0:3b6:3a12:2bf9 with SMTP id
 v11-20020a05622a144b00b003b63a122bf9mr278501qtx.2.1679335698248; 
 Mon, 20 Mar 2023 11:08:18 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 v26-20020ac8729a000000b003e2e919bcf7sm1297578qto.78.2023.03.20.11.08.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 11:08:17 -0700 (PDT)
Message-ID: <bbea4d6e-4435-7337-adf8-325c2f534bba@gmail.com>
Date: Mon, 20 Mar 2023 11:08:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Julius Werner <jwerner@chromium.org>, Evan Benn <evanbenn@chromium.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230317233643.3969019-1-robh@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
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

On 3/17/23 16:36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 +-
>   Documentation/devicetree/bindings/watchdog/apple,wdt.yaml       | 2 +-
>   Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml     | 2 +-
>   .../devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml         | 2 +-
>   .../devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml          | 2 +-

Acked-by: Florian Fainelli <f.fainelli@gmail.com> #brcm,bcm7038-wdt.yaml
-- 
Florian

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
