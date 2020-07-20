Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79606226F2E
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Jul 2020 21:47:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D395C36B2A;
	Mon, 20 Jul 2020 19:47:29 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6C85C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jul 2020 19:47:27 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id p205so18867758iod.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jul 2020 12:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wami5ld0z9FHvbWVsYveEHQ9/pc5tADPd3tpSIEvVUM=;
 b=VHTHevfKVBX6cK7BkUHldDgA3xOZxyS+tRrErTnCMNlVvyYu3qLEIofIcpY1h+aON1
 qGjl4RsWeOxnEvk3l2tKt095+A1h/q1gM1PMi43lZ8nl31jglYlMw0ROebmnnocnJb63
 1Rr/v89lxO7Y9yz6No6ymuJ/l32zX/4nkmnxho/OPCYu7p9cC873/0xytapH2UCYmGo3
 0dgHaxImju2ZuNAMilS5Cj8xMHJJSfLgOQ67IG4llKK4vZabz+3HzNIkhXtew0jzRAT+
 1ya8My0c+a36xnDMwf/B8Mdb8iRwYszxLDDn4VOMwG8SFJTw61u5GoFSF2sRh/014FOR
 eYOg==
X-Gm-Message-State: AOAM5338HPplBkxzeMA1B1MgBl3Ovohq4UiPDdiBQg723b4xm9it3ub2
 q5B1eL7eyh73DPaf2aQXzg==
X-Google-Smtp-Source: ABdhPJwYhcD+ech3tTx1xgCvhsZ+suOtxjFUk2x6J6Yy5dtevlrrdBMQER6Ts4r7Gt8P/VVQIziInA==
X-Received: by 2002:a05:6602:2ac8:: with SMTP id
 m8mr25005533iov.36.1595274446734; 
 Mon, 20 Jul 2020 12:47:26 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id b24sm9347565ioh.6.2020.07.20.12.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 12:47:25 -0700 (PDT)
Received: (nullmailer pid 2887462 invoked by uid 1000);
 Mon, 20 Jul 2020 19:47:24 -0000
Date: Mon, 20 Jul 2020 13:47:24 -0600
From: Rob Herring <robh@kernel.org>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Message-ID: <20200720194724.GA2887432@bogus>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
 <20200717132859.237120-8-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200717132859.237120-8-jacopo+renesas@jmondi.org>
Cc: Nishanth Menon <nm@ti.com>, Tony Lindgren <tony@atomide.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 laurent.pinchart@ideasonboard.com, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Tero Kristo <t-kristo@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, slongerbeam@gmail.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 robh+dt@kernel.org, =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 07/13] dt-bindings: media: ov5640: Remove
	clock-lanes
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

On Fri, 17 Jul 2020 15:28:53 +0200, Jacopo Mondi wrote:
> The ov5640 does not support routing the clock signal to a different
> lane, and the property has value fixed to 0.
> 
> Remove the property from the bindings and update its users
> accordingly.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  Documentation/devicetree/bindings/media/i2c/ov5640.yaml | 6 ------
>  arch/arm/boot/dts/dra72-evm-common.dtsi                 | 1 -
>  arch/arm/boot/dts/dra76-evm.dts                         | 1 -
>  arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi           | 1 -
>  arch/arm/boot/dts/imx6qdl-icore.dtsi                    | 1 -
>  arch/arm/boot/dts/imx6qdl-sabrelite.dtsi                | 1 -
>  arch/arm/boot/dts/imx6qdl-sabresd.dtsi                  | 1 -
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi               | 1 -
>  arch/arm64/boot/dts/ti/k3-am654-base-board.dts          | 1 -
>  9 files changed, 14 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
