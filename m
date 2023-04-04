Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E166D69E5
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Apr 2023 19:09:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53DB0C6A603;
	Tue,  4 Apr 2023 17:09:58 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C3E1C0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 17:09:56 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id bi31so24705273oib.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Apr 2023 10:09:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680628195;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DQfDPbeHzXvhNMP21e47HMs1Ss6VjJ3ppCcbbXGV5fo=;
 b=CWqL76EfaalPdGFcqZkCN9TQcPfiL6jBXwpo8tgeIuN0ZAikhGVGCdi3uR9PZ36ZXF
 tTTwBYjLx90lFzdQ5DLIBB0Nk5Xs3U6DmS80irkrk9l2RHx9xVmJVR+gXwIWwHvj3q29
 /zDRbWww+ocr3kfvcr5I+m41m0eMtrxoZYff6QJ39y8IAlU+r5KixYhhSFyFOn4RlDHV
 i7KpK2BvY9ULJbqrbPzlwysOp4YJMIRwHUJNHvsVslOtxfN6yHbeGjlodQkGp4ouHEDq
 HdE+ewCHMUyJ9RslK3UMlnWAGvd61BrUQ0VINeEiU7OfaG5aGrLn8CI0WPFC4wt7Vgmk
 w6ig==
X-Gm-Message-State: AAQBX9fd+o+83DB+vYcSro0tFFX+6QP7xzHtYsgMbdf2VbJVbr+gh829
 CXnVULw4b4yYEQHSAqq2jQ==
X-Google-Smtp-Source: AKy350ZZ7BG/vNzA7V0xxF/wFLGRBOLHnE+ociOtzhxPFF1JrYNXX4h2mrA1aYYKqBLL6ePOmatUBA==
X-Received: by 2002:a05:6808:3a99:b0:378:9c1:514e with SMTP id
 fb25-20020a0568083a9900b0037809c1514emr1312221oib.42.1680628194745; 
 Tue, 04 Apr 2023 10:09:54 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 o184-20020acabec1000000b003646062e83bsm5388522oif.29.2023.04.04.10.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 10:09:54 -0700 (PDT)
Received: (nullmailer pid 133735 invoked by uid 1000);
 Tue, 04 Apr 2023 17:09:52 -0000
Date: Tue, 4 Apr 2023 12:09:52 -0500
From: Rob Herring <robh@kernel.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Julius Werner <jwerner@chromium.org>,
 Evan Benn <evanbenn@chromium.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <20230404170952.GF49361-robh@kernel.org>
References: <20230317233643.3969019-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Fri, Mar 17, 2023 at 06:36:42PM -0500, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 +-
>  Documentation/devicetree/bindings/watchdog/apple,wdt.yaml       | 2 +-
>  Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml     | 2 +-
>  .../devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml         | 2 +-
>  .../devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml          | 2 +-
>  .../devicetree/bindings/watchdog/faraday,ftwdt010.yaml          | 2 +-
>  Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml | 2 +-
>  Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml   | 2 +-
>  Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml     | 2 +-
>  Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml     | 2 +-
>  .../devicetree/bindings/watchdog/socionext,uniphier-wdt.yaml    | 2 +-
>  Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml   | 2 +-
>  Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml      | 2 +-
>  13 files changed, 13 insertions(+), 13 deletions(-)

Applied, thanks.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
