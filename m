Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92990223FE6
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Jul 2020 17:48:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28F56C36B29;
	Fri, 17 Jul 2020 15:48:56 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FA75C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jul 2020 15:48:54 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id e4so13236418ljn.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jul 2020 08:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h11XOtehZDloRQK9LLWJgIGaRhspppMNqDAzBiX5ad0=;
 b=Vl3NEvpnwvvHcMUF3NitR+46Z8sGTxKpnmW2tSGbSZI5WEMW3t/cfVkfrQKwFVLfmn
 qeYWAms1UJZ0u2rgIpGXKPqzQRww21hWUFCIGkYU5iU2aI2DNB/ORCPOtTw84QooEoxU
 RYowe2rX5Fdj+dRoNdNiG6L6UUa+Alrbcl8abG9racjlDwSa72vWTml3oZe1LVxEno23
 8HqvAdO0M0ijRxSL52knF8JcEemEUtGDRuqD43LXb5rbnu/qG8BBreBmnwIir7x5vGFu
 M9aVkD5RibFZ132rkt+/LOK5QNQiB843eekX8O2TxJo2RHEHnZOn30hEob39Xp0gVhf+
 8DpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h11XOtehZDloRQK9LLWJgIGaRhspppMNqDAzBiX5ad0=;
 b=rhUUNXu48GsplBTfPl/1LQesl9yyawBV8Q/lCCwxNet6RDsZFG92T4YU3uaZNb+AhZ
 WGVcqR1FM/pVyhM7rFOsC/m5nFt/YlYg/obhzYJ4McawSFJ+aOr6l+ZWn8qT1QIuDX7I
 rimdHH4FFBaiLOREDonLlxEuQT2uclhuoSKqjzuCz/wQ4HM7+G7A+V2jPr1ZkhzBTedb
 mqzrqf3f4/bRmYpND8+g6h0iMdTG88h1serIvStt1oHUuFu7f2MsMR+Nlt593VV05ZnN
 etJveb5vFITpPFdy4j8xWyNSaY8EJtFeevXeHNWiqSHIx7fvgcNFDpWItxFhY1rE6DuZ
 9+2w==
X-Gm-Message-State: AOAM532/r1uVBTGKI2+vahEVHA+u68xaW+JX8+EXmGxh0x3ZY+Vlx9kz
 YhHlNT+/iovKYsroYb3NZRssdKtxcrObkENoVk4=
X-Google-Smtp-Source: ABdhPJwIzsbxel7UyqOZp+lBviG9zAjrG/Jz3iqThbVW0psJDeH5ulOp2LIDuUFpVJDNfOVaozw3oLVmHULgDPnkduQ=
X-Received: by 2002:a2e:a375:: with SMTP id i21mr4928341ljn.403.1595000933299; 
 Fri, 17 Jul 2020 08:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
 <20200717132859.237120-6-jacopo+renesas@jmondi.org>
In-Reply-To: <20200717132859.237120-6-jacopo+renesas@jmondi.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 17 Jul 2020 12:48:42 -0300
Message-ID: <CAOMZO5Ap2_3hECqB5K3tbD-0URq0hJrMoNDwq6WmUMVojahfJg@mail.gmail.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Nishanth Menon <nm@ti.com>, Tony Lindgren <tony@atomide.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Steve Longerbeam <slongerbeam@gmail.com>,
 linux-media <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 05/13] dt-bindings: media: ov5640: Make
	bus-type mandatory
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

Hi Jacopo,

On Fri, Jul 17, 2020 at 10:25 AM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:

> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> index 503f8b78615c..16e6c2dc629a 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> @@ -73,6 +73,9 @@ properties:
>            remote-endpoint:
>              description: A phandle to the bus receiver's endpoint node.
>
> +          bus-type:
> +            enum: [4, 5]

Can we have an explanation for what the values 4 and 5 mean in the yaml doc?

Looking at the series I see that 4 means MIPI-CSI2 and 5 means
parallel interface, but this is not too obvious (at least for me).

Or maybe we could use a string definition instead of hard coding 4 and 5?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
