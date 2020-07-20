Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6231F226F2C
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Jul 2020 21:45:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17FE0C36B2A;
	Mon, 20 Jul 2020 19:45:45 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08661C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jul 2020 19:45:43 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id y2so18907580ioy.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jul 2020 12:45:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xQsmS1nuNNMhwcv8QeFvMXKBGicLJoHnG01faUUSAw8=;
 b=c+tR03KdY5iUQydoGCzbM89Q88ogkbOugW3pnCKV/KWJdLt2TiWBjAU7pZr9eFbNjM
 +LdO05La7kMyMENrCKjrgkWvnRtevyA0kPFSjFCh6xEA+f3cGiEp7lyYR9U2uNJT2MML
 2HlQX3z1oHzMIXqqmGO0jg/sD9Vy4yDV3OePHfntFr/JJ3cTbNTbtHdN44zfpZ+zBzs7
 AichjxRHA6CQ13kCW7yTkvqKBnRPOvW3L008ok8lhxcukDgtbJZv3iGxeSfG4X0NcGNH
 8jz6acnibxme9yO1Qs4C9AnfJ1e/q9Z8AOtlNJQ5P66xJ/g2a+X6OsR/nJLh8qM60E6p
 nLsQ==
X-Gm-Message-State: AOAM5321FVFeuTdHIqQnOFctbdvzQMlp4go8nxU38uYA+q9G0dGJ4soY
 hOvC3HNb9BkNcI8t715yWg==
X-Google-Smtp-Source: ABdhPJxWNBElu2kmELWUndpSOychi1LRff+1CaxEYTUH0DiLdWblGSE7U8N4YbRRh91aTfZ8c8X4Iw==
X-Received: by 2002:a05:6602:2207:: with SMTP id
 n7mr23979335ion.162.1595274341749; 
 Mon, 20 Jul 2020 12:45:41 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id n1sm9277565ilo.68.2020.07.20.12.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 12:45:41 -0700 (PDT)
Received: (nullmailer pid 2884955 invoked by uid 1000);
 Mon, 20 Jul 2020 19:45:38 -0000
Date: Mon, 20 Jul 2020 13:45:38 -0600
From: Rob Herring <robh@kernel.org>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Message-ID: <20200720194538.GA2872607@bogus>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
 <20200717132859.237120-6-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200717132859.237120-6-jacopo+renesas@jmondi.org>
Cc: Nishanth Menon <nm@ti.com>, Tony Lindgren <tony@atomide.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 laurent.pinchart@ideasonboard.com, Fabio Estevam <festevam@gmail.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Tero Kristo <t-kristo@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, slongerbeam@gmail.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-renesas-soc@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
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

On Fri, Jul 17, 2020 at 03:28:51PM +0200, Jacopo Mondi wrote:
> The ov5640 driver supports both a parallel data interface and a
> CSI-2 serial data interface.
> 
> Depending on which interface is in use, the required endpoint
> properties are different. In order to be able to validate if a
> device node is compliant with the dt-schema bindings, start by
> making the bus-type a mandatory property, and add it to all the
> existing users of ov5640 in mainline DTS.

You can't really make a property required on an existing binding. That 
breaks compatibility. Are all the users of the below boards okay with 
that?

There should be a default defined if 'bus-type' is not present.

> 
> On top of this, endpoint properties validation will be implemented,
> conditionally to the reported bus type.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  Documentation/devicetree/bindings/media/i2c/ov5640.yaml    | 6 ++++++
>  arch/arm/boot/dts/dra72-evm-common.dtsi                    | 1 +
>  arch/arm/boot/dts/dra76-evm.dts                            | 1 +
>  arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi              | 1 +
>  arch/arm/boot/dts/imx6qdl-icore.dtsi                       | 1 +
>  arch/arm/boot/dts/imx6qdl-sabrelite.dtsi                   | 1 +
>  arch/arm/boot/dts/imx6qdl-sabresd.dtsi                     | 1 +
>  arch/arm/boot/dts/stm32mp157c-ev1.dts                      | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts       | 1 +
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi                  | 1 +
>  arch/arm64/boot/dts/ti/k3-am654-base-board.dts             | 1 +
>  12 files changed, 17 insertions(+)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
