Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1905D67BC20
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jan 2023 21:08:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC8B7C69057;
	Wed, 25 Jan 2023 20:08:06 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2BFBC69055
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 20:08:05 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id d188so17305394oia.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 12:08:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n1p3FdYLlGUAChSL+8xP1SW3yYfJGghI7cagrX3Bi/I=;
 b=1552Oja3g7VRvuqx0zPrejMayxEApAPK7ur75d1N3FQTM23/QJC3Jf9VmRXywOqc9B
 qGl+I4+bFb9bGmLmJaS5JkWA0clQp/16B8LJP26619O3FtOI3dL4CTljuEoT+2mmj6Q7
 GVT58Yku7D+ggPpo+fQvt7pRHDaRfjrJ8itGiRj+uF+zHKNawlbz+e39CYhTODR3v+0f
 mK5+hhGGTYL5GF856Mj1G3h15OmtMuSsD4sEZibZwJx5V10zNZp92acTBO4kO+uvlYfe
 R/+EfGoUqCDMC45LWXui6JpsvVQwkuJ1oRQGxr/IVLQoQAjOEOCxvhFadIRt5O+NooQu
 8qdw==
X-Gm-Message-State: AFqh2krdZhqFg/8+J8EAoDglf0RLukMzFAxTHVv+sNG4XgtMS3I0vRnt
 jGbgeNLw5M2y3y4cA2tbnQ==
X-Google-Smtp-Source: AMrXdXseqabcyHulKdSW9gY6uTAUwCSIlEbwqpw1soFhskncwZCdeRj5URGKhSfWNKhae8zY1f8dDg==
X-Received: by 2002:a05:6808:189d:b0:364:d523:e138 with SMTP id
 bi29-20020a056808189d00b00364d523e138mr18874315oib.32.1674677284798; 
 Wed, 25 Jan 2023 12:08:04 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 b18-20020a056830105200b0068646a8223bsm2528460otp.57.2023.01.25.12.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 12:08:04 -0800 (PST)
Received: (nullmailer pid 2785052 invoked by uid 1000);
 Wed, 25 Jan 2023 20:08:03 -0000
Date: Wed, 25 Jan 2023 14:08:03 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <167467728253.2784879.8231136375928061202.robh@kernel.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
 <20230124091916.45054-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230124091916.45054-4-krzysztof.kozlowski@linaro.org>
Cc: Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Peter Korsgaard <jacmet@sunsite.dk>, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Magnus Damm <magnus.damm@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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
Subject: Re: [Linux-stm32] [PATCH v2 06/12] dt-bindings: serial: 8250_omap:
 drop rs485 properties
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


On Tue, 24 Jan 2023 10:19:10 +0100, Krzysztof Kozlowski wrote:
> The binding references rs485 schema, so there is no need to list its
> properties.  Simplify a bit by removing unneeded entries.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/serial/8250_omap.yaml | 5 -----
>  1 file changed, 5 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
