Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A2167BC0B
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jan 2023 21:06:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55A9BC69057;
	Wed, 25 Jan 2023 20:06:09 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 674A2C69055
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 20:06:07 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 u13-20020a056830118d00b00686def09868so4455296otq.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 12:06:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8zQJwCHfiFi6VH+BLN1bNPbxexl2oTTiePtVA10gjBQ=;
 b=1iWUA1zRSlhtK6Opl79ASoN+wwSqF0RQlfqVKjEqXCwj5KsF9GEVZmfgoImSWlyDue
 FAVlMkPbKZOOo9chuNvvqxG5YDqWl2Sl+I/swtOhpT1iKTiLvdCHvXQmqyXFWZp/WKOM
 aGIIsX70rMdCL1d1bEhlwJbWZhQqNN0Qdqxa/C1IWAxEnwwINXQsdpldDzq8y8fRDXb7
 T3mbQyIoCUR/FkNABlf+T6XvYlzCGQBeWyA3hfZtMIOhbQsDIhUmZbHp/cLMUndDhZxR
 Xog+2TpaymCeDy0ZZ4OYXvoajQ8nrrpOZblK8o5fB3eym+O03TqcxnCx3gosN8jeKuDd
 +YOg==
X-Gm-Message-State: AFqh2kp/HBOCAjNq9s4XGZOOXLJqtpJ3zacMsXJ2++SddkqIvR0J/yrG
 chIQv+l7nOCTshUdiLHB6w==
X-Google-Smtp-Source: AMrXdXs6SM7I1OOUhLLfrwCPfKfHkcE6ouDZkfhmfkKp+JRlJHR3k7KwOPhsLyrO6hSP5EAouQVPpw==
X-Received: by 2002:a05:6830:1652:b0:686:4382:13aa with SMTP id
 h18-20020a056830165200b00686438213aamr17366869otr.32.1674677166280; 
 Wed, 25 Jan 2023 12:06:06 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 g16-20020a9d6490000000b00684e09b43bdsm2567325otl.13.2023.01.25.12.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 12:06:05 -0800 (PST)
Received: (nullmailer pid 2769611 invoked by uid 1000);
 Wed, 25 Jan 2023 20:06:04 -0000
Date: Wed, 25 Jan 2023 14:06:04 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <167467716404.2769558.11154438108014258073.robh@kernel.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
 <20230124091602.44027-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230124091602.44027-2-krzysztof.kozlowski@linaro.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
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
 Tomer Maimon <tmaimon77@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Fugang Duan <fugang.duan@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Pragnesh Patel <pragnesh.patel@sifive.com>
Subject: Re: [Linux-stm32] [PATCH v2 01/12] dt-bindings: serial: amlogic,
 meson-uart: allow other serial properties
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


On Tue, 24 Jan 2023 10:15:51 +0100, Krzysztof Kozlowski wrote:
> Reference common serial properties bindings to allow typical serial
> properties:
> 
>   meson-axg-jethome-jethub-j100.dtb: serial@23000: 'bluetooth', 'uart-has-rtscts' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ---
> 
> Changes since v1:
> 1. Add tag
> 2. Use local path (not absolute to /schemas/serial/serial.yaml)
> ---
>  .../devicetree/bindings/serial/amlogic,meson-uart.yaml       | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
