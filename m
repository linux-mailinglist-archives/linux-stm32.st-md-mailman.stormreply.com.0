Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E58C67BC30
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jan 2023 21:09:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24C09C69057;
	Wed, 25 Jan 2023 20:09:04 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2CB0C69055
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 20:09:02 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 m18-20020a05683026d200b0068661404380so11802089otu.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 12:09:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6t3+eN2lHtIu49LblIFaPzhFGYt/AfmaSuGsn+YEdS0=;
 b=YN/wyOJ49AkrXlqeWr06+4PbToGYDZfAWABMaockTTirOa+8cBVyqb98TOvTCXDSb8
 p7Zj5AbbiRYZyPk2sjNDORslBVUPygSh6MhAS5A7sxZPxvAOjT2jLf+zKeVKmgJWE+rz
 /U2POb4Or3Fd+EMZlOB+oHky21lV1wEWFEsRg5yJ33Jkszo3zZtRaJu1wZtFNDeluNJp
 uIYZ4Lj0D0SxDZLPQuajE464b+Fv4BtuIdYG15fZcm7tUeU8tOZ3FgPQw5OJyhcV2osq
 cdcVc5X03VJJHpa32hxaoMrf2DDGSBHAaS2CtNICxV9gCeVfGVqz0QnqmpQZrchyJk6c
 aqIA==
X-Gm-Message-State: AFqh2kpyIWxaqJrsJm1GY8d/LxCeVcqSx0LHtijzTGFynkyE4QWJlDoR
 tsTFByBmcsJiNNYX5UOIlg==
X-Google-Smtp-Source: AMrXdXvmG+MMXgZe3y8Iabdwj1T7QPV9D3ixNYqPrRVv52b4IuvZX87jEuE4ezPKTjyH7bgohvzYWA==
X-Received: by 2002:a9d:6b03:0:b0:670:7a2b:f52f with SMTP id
 g3-20020a9d6b03000000b006707a2bf52fmr15887767otp.8.1674677341751; 
 Wed, 25 Jan 2023 12:09:01 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 f18-20020a9d5f12000000b00670641eb272sm2571030oti.20.2023.01.25.12.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 12:09:01 -0800 (PST)
Received: (nullmailer pid 2795996 invoked by uid 1000);
 Wed, 25 Jan 2023 20:09:00 -0000
Date: Wed, 25 Jan 2023 14:09:00 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <167467733943.2795781.3621050331030383112.robh@kernel.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
 <20230124091916.45054-8-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230124091916.45054-8-krzysztof.kozlowski@linaro.org>
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
Subject: Re: [Linux-stm32] [PATCH v2 10/12] dt-bindings: serial: st,
 stm32-uart: drop common properties
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


On Tue, 24 Jan 2023 10:19:14 +0100, Krzysztof Kozlowski wrote:
> The binding references serial and rs485 schemas, so there is no need to
> list their properties.  Simplify a bit by removing unneeded entries.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/serial/st,stm32-uart.yaml          | 7 -------
>  1 file changed, 7 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
