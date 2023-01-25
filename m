Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE6C67BC43
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jan 2023 21:10:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FF62C69057;
	Wed, 25 Jan 2023 20:10:05 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF311C69055
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 20:10:03 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 f5-20020a9d5f05000000b00684c0c2eb3fso11778196oti.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 12:10:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nvGxKBe2tXNnIAXd7DhRCMLLrdEFz1rEy7hosIzra4k=;
 b=Kf/xHFNcKf1fT2yTq1Sfyo2uVGGxqySXkjbPNlcc6yyX7Aw1iQcFISM1e5yupSOLqs
 QylSes5DX0zMBSbhARz4QjGrkXG4hSHkFcmkwqp4rrlAgoF5wLu7tR1Plaih7PZE1IA1
 MeoMfi17oj5kFWdzYGmZ4neEabktH7WRmB+J4MVTXFkfOfePuRZSzCa7/SS9RdT6Junc
 n+qCGand6AOLznrcmjj33hK8d4QLMBrKXybdha1oxt1mNuP/4O2nk46pr5VsEx6HdBR2
 J7QYUg/hMzMvPGGzidWYd+KeOD1SYLOLJuqZvD3P4HIUXr6eOotB3UFjJ4ICf99L1GL1
 yyeA==
X-Gm-Message-State: AFqh2kptYLqpcfQ70S3sdDssb4I6AAH/rCAXPouhUHCnUmlx+K1ys4kv
 sWnIsvrU+dyYZB9yw1Qw/g==
X-Google-Smtp-Source: AMrXdXuxRG4RDF7RI7gCrOg1RarCpE71i170Oc3Cr+xu3/OuWc975n087q9cZ/K9XzPPfyTQp3Iy4Q==
X-Received: by 2002:a9d:7508:0:b0:670:686c:7dc with SMTP id
 r8-20020a9d7508000000b00670686c07dcmr17455962otk.26.1674677402557; 
 Wed, 25 Jan 2023 12:10:02 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 b6-20020a9d6b86000000b00684e79759d7sm2505546otq.65.2023.01.25.12.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 12:10:02 -0800 (PST)
Received: (nullmailer pid 2808877 invoked by uid 1000);
 Wed, 25 Jan 2023 20:10:00 -0000
Date: Wed, 25 Jan 2023 14:10:00 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <167467740050.2808709.16126387956370383942.robh@kernel.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
 <20230124091916.45054-10-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230124091916.45054-10-krzysztof.kozlowski@linaro.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Peter Korsgaard <jacmet@sunsite.dk>, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Tomer Maimon <tmaimon77@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Magnus Damm <magnus.damm@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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
Subject: Re: [Linux-stm32] [PATCH v2 12/12] dt-bindings: serial: example
	cleanup
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


On Tue, 24 Jan 2023 10:19:16 +0100, Krzysztof Kozlowski wrote:
> Adjust example DTS indentation to match recommended style of 4-spaces
> and use lower-case hex for address in reg.  No functional change.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/serial/8250_omap.yaml | 18 ++++++-------
>  .../bindings/serial/amlogic,meson-uart.yaml   | 10 +++----
>  .../devicetree/bindings/serial/cdns,uart.yaml | 10 +++----
>  .../bindings/serial/renesas,em-uart.yaml      | 10 +++----
>  .../bindings/serial/renesas,hscif.yaml        | 26 +++++++++----------
>  .../bindings/serial/renesas,sci.yaml          | 24 ++++++++---------
>  .../bindings/serial/renesas,scif.yaml         | 24 ++++++++---------
>  .../bindings/serial/renesas,scifa.yaml        | 22 ++++++++--------
>  .../bindings/serial/renesas,scifb.yaml        | 12 ++++-----
>  .../devicetree/bindings/serial/serial.yaml    | 18 ++++++-------
>  .../bindings/serial/sifive-serial.yaml        |  6 ++---
>  .../bindings/serial/xlnx,opb-uartlite.yaml    |  4 +--
>  12 files changed, 92 insertions(+), 92 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
