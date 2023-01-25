Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A7A67BC17
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jan 2023 21:07:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93A59C69057;
	Wed, 25 Jan 2023 20:07:02 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8703FC69055
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 20:07:00 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id r9so17263224oie.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 12:07:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HjxpPCXLfIbQ+6VlgSG0tsTyVkfQNnId/4DSkULnpV4=;
 b=WZxNzCkX0H1WC12Vp/2s1y7WUP6g4R2gLSYe8iD4YRwyRLMG6rzl91m6P4u0rolH+R
 v6x0px9xCGb6Z/wwhgOU6kA5brlaj31H/kKwAeJ1PZ9qS2/XObX2x3fgYjFYbIM6WMtY
 n6QazuweQEuQ4OzfOqxK5jK7CDnNpZldwyR1gtjomfS3snxOQvD8TEnJaIDE6JzRADuQ
 +L25PO9AxRP0dGjTrwWeUQ+qIns/wm289OT6PSuiZ6kZkxPXl5fcYf+rvogDNZLrCGrx
 08sasTV83GSTNZihuhsUL7wwROvHInqYaoD24k+OLDivPvkNn23ooLObyETfH0LyMqfi
 RZyg==
X-Gm-Message-State: AFqh2kosT2M+NZCTvd36A+y4YHw7wjPaCT7WgLS85RIlyeV0RRN6ei2p
 MLEgjT4K2XppnYmuSxcgmA==
X-Google-Smtp-Source: AMrXdXvZSXdLIAvantzWPKLx8w8nHQA+dbuiWBV7hE/X1AIpaFtwf5qnOANWheWQAHC+czb3K7K1XQ==
X-Received: by 2002:a54:4708:0:b0:364:eb0f:6de1 with SMTP id
 k8-20020a544708000000b00364eb0f6de1mr15696584oik.23.1674677219277; 
 Wed, 25 Jan 2023 12:06:59 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 eu25-20020a056808289900b00369ec58932csm2620202oib.45.2023.01.25.12.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 12:06:58 -0800 (PST)
Received: (nullmailer pid 2771034 invoked by uid 1000);
 Wed, 25 Jan 2023 20:06:57 -0000
Date: Wed, 25 Jan 2023 14:06:57 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <167467721713.2770933.9672853616239186241.robh@kernel.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
 <20230124091916.45054-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230124091916.45054-2-krzysztof.kozlowski@linaro.org>
Cc: Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Peter Korsgaard <jacmet@sunsite.dk>, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Vignesh Raghavendra <vigneshr@ti.com>, Kevin Hilman <khilman@baylibre.com>,
 Magnus Damm <magnus.damm@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Chester Lin <clin@suse.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-amlogic@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Fugang Duan <fugang.duan@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Pragnesh Patel <pragnesh.patel@sifive.com>
Subject: Re: [Linux-stm32] [PATCH v2 04/12] dt-bindings: serial: correct ref
	to serial.yaml
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


On Tue, 24 Jan 2023 10:19:08 +0100, Krzysztof Kozlowski wrote:
> The serial bindings should reference the local (in kernel) serial.yaml,
> not the /schemas/serial.yaml.  The latter comes from dtschema package
> and is a small subset of serial bindings.
> 
> Usage of the local serial.yaml allows typical properties and children:
> 
>   xilinx/avnet-ultra96-rev1.dtb: serial@ff000000: Unevaluated properties are not allowed ('bluetooth' were unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Michal Simek <michal.simek@amd.com>
> ---
>  Documentation/devicetree/bindings/serial/cdns,uart.yaml         | 2 +-
>  Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.yaml | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
