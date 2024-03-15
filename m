Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 808A387D6BF
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Mar 2024 23:41:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AB6DC6DD69;
	Fri, 15 Mar 2024 22:41:22 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8516DC64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Mar 2024 22:41:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 88F84CE20F6;
 Fri, 15 Mar 2024 22:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A938EC433F1;
 Fri, 15 Mar 2024 22:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710542476;
 bh=+d8f7ozp1fczAC9vBPCNIiDBAqrIkkfS0UnjmlXtzwU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=e8l9mfb65Jxs98ZTM68IIz8f57uo0DoJOlcSADkTgiKJGrRoguFcFGgrdtO94MZLL
 yUQ1Y8ExfoREnO7PParl5J7v1hNubPSVQjZeV3sk3Trk9waECS/1a0m/gYwjo+93PY
 1eOUeZVB8OBde9pSImLddiZaQX3oxyAt9rcHTCH3ekRglFIP9nNJZRz9Z0Uy9iHqB7
 nrfbj4PZVHBZWMLmECgMabXWu9KY4TymyOBUGuMrIV8WrUjlwAPvWC29iOm45MZt+5
 MPQrGyacW+5U+BAYTYlX4MBPCejDQzpxEfl2HXJJezJW1rh+4W0tldYBFcC1GxLi+0
 hIod0XdaiSTkg==
Message-ID: <3cd275cb1f53a5fdfbf7028f233f4fd7.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240315222754.22366-2-wafgo01@gmail.com>
References: <20240315222754.22366-1-wafgo01@gmail.com>
 <20240315222754.22366-2-wafgo01@gmail.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Wadim Mueller <wafgo01@gmail.com>
Date: Fri, 15 Mar 2024 15:41:14 -0700
User-Agent: alot/0.10
Cc: , o.org@stm-ict-prod-mailman-01.stormreply.prv,
	NXP S32 Linux Team <s32@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Wadim Mueller <wafgo01@gmail.com>,
	Swee Leong Ching <leong.ching.swee@intel.com>,
	Eric Dumazet <edumazet@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Johannes Zink <j.zink@pengutronix.de>,
	Bartosz Golaszewski <bartosz.golaszewski@linar.st-md-mailman.stormreply.com>,
	linux-clk@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
	NXP Linux Team <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Andrew Halaney <ahalaney@redhat.com>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Rob Herring <robh+dt@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	linux-arm-kernel@lists.infradead.org,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Andreas =?utf-8?q?F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] [PATCH 1/3] arm64: dts: S32G3: Introduce device
	tree for S32G-VNP-RDB3
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

Quoting Wadim Mueller (2024-03-15 15:27:47)
> diff --git a/include/dt-bindings/clock/nxp,s32-scmi-clock.h b/include/dt-bindings/clock/nxp,s32-scmi-clock.h
> new file mode 100644
> index 000000000000..240022c1f109
> --- /dev/null
> +++ b/include/dt-bindings/clock/nxp,s32-scmi-clock.h
> @@ -0,0 +1,158 @@
> +/* SPDX-License-Identifier: BSD-3-Clause */
> +
> +#ifndef __DT_BINDINGS_NXP_SCMI_CLOCK_S32_H
> +#define __DT_BINDINGS_NXP_SCMI_CLOCK_S32_H
> +
> +#define S32_SCMI_COMPLEX_CLK           0xFFFFFFFFU
> +#define S32_SCMI_NOT_IMPLEMENTED_CLK   0xFFFFFFFEU
> +
> +#define S32_SCMI_CLK_BASE_ID           0U
> +#define S32_SCMI_CLK(N)                        ((N) + S32_SCMI_CLK_BASE_ID)
> +#define S32_PLAT_SCMI_CLK(N)           ((N) + S32_SCMI_PLAT_CLK_BASE_ID)

I think we've been recommending that scmi clk consumers simply list the
number instead of making up defines for them.

> +
> +#define S32_SCMI_CLK_VERSION_MAJOR     (1)
> +#define S32_SCMI_CLK_VERSION_MINOR     (0)

Why is this part of the dt binding?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
