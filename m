Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD44D67BC0E
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jan 2023 21:06:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6FCE2C69057;
	Wed, 25 Jan 2023 20:06:28 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32B1AC69055
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 20:06:26 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-142b72a728fso22715838fac.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 12:06:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XmbysuHPjfK+X9Z9VAj7ZA13Rw20BD2qll2fpcLoSIU=;
 b=MlsbJOngIzTS5xmvFb0rm1XFHfFMI8q+5JlZVfQOoSVS9mtTjuVrFZP0lxVqNcRNfi
 BmWSHmXKxxGyz+YldZ0NO2Rya5kY/Ta20Dyh5rLMVvE2bJYf0Atpy7HhWmL6Pm22oVKx
 DMm6f2NxJWqZ/jfP0s6ceCCQE4GYr43SREK1jpMJ53F/3aCSiL8lBKA7qsnIAX5kgoxp
 sRgUrUWG3N21t9pjcuSCeA242WEp0OUsXzB93iAzAuSG/UnNJ2bq6XfN+LjQSpZJtTgQ
 A6MknSZD4ADw4CmIk5j9f2zUGcwkj8c7Y/EAwbIilXWPrKjJWRUnaJ9SOhpJq9/hjUCd
 lIVg==
X-Gm-Message-State: AFqh2kolfc0p5H6n2yxVW5wNPUBGaUBdHotxRxi9ektFn2Cs6kC7wHtG
 Jetqz4rts0ptWC8TNIv8fg==
X-Google-Smtp-Source: AK7set+GaEu8klX8ZrT+kPUSQ/UdfQGCuvFO5aVmA0fCZzJ/i5NkLzmYTh9rERQZJyp7IvXTuaR09A==
X-Received: by 2002:a05:6870:d356:b0:160:3369:1624 with SMTP id
 h22-20020a056870d35600b0016033691624mr5072686oag.13.1674677184988; 
 Wed, 25 Jan 2023 12:06:24 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 lu24-20020a056871431800b0013297705e5dsm2285614oab.28.2023.01.25.12.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 12:06:24 -0800 (PST)
Received: (nullmailer pid 2770011 invoked by uid 1000);
 Wed, 25 Jan 2023 20:06:23 -0000
Date: Wed, 25 Jan 2023 14:06:23 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <167467718287.2769960.1087362383778612276.robh@kernel.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
 <20230124091602.44027-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230124091602.44027-3-krzysztof.kozlowski@linaro.org>
Cc: Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Peter Korsgaard <jacmet@sunsite.dk>, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Magnus Damm <magnus.damm@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 - <devicetree@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Chester Lin <clin@suse.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Fugang Duan <fugang.duan@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Pragnesh Patel <pragnesh.patel@sifive.com>
Subject: Re: [Linux-stm32] [PATCH v2 02/12] dt-bindings: serial: 8250:
 correct Nuvoton NPCM850 compatible
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


On Tue, 24 Jan 2023 10:15:52 +0100, Krzysztof Kozlowski wrote:
> Nuvoton NPCM850 UART is compatible with NPCM750, so add proper fallback
> to match existing DTS and Linux driver.
> 
> Fixes: c8177f90b7c6 ("dt-bindings: serial: 8250: Add npcm845 compatible string")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/serial/8250.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
