Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9538CAD7B15
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 21:37:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47C60C32E8E;
	Thu, 12 Jun 2025 19:37:33 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5A3BC36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 19:37:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 955D75C5874;
 Thu, 12 Jun 2025 19:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E6DC4CEEA;
 Thu, 12 Jun 2025 19:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749757049;
 bh=36nvgb3RLVqinSwoB6Toikfenc4MXd/GpMoSKwvz5Wg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=fHWO0Z95cw6Xnif0lgMkudamEsIYQ5TItFPsp0mV44qGzrnNQ/l8ATa/QW/mlVbW+
 BJDpv6XsUOV1sfZpyXtti3XbmHIkDJB1ieS4WcckkK6g9Kf1ow7LpYemlXBMsdrifv
 EQDb8d8yeyT/lWL2Arniqju5L69l3NaMhdfc3HZKCBzriJZgyfBOPcpqqceJFNtEwE
 4zTHYWNF3D204ecOvirQqHBZov1CX7evGsPUFIKtJknlqOp+7G7qZ5AFUow9pgR754
 DWRwulVdfVVAa15hWiP1TEVqsNevAFM17wtlrxew4HG+c9atHC8iXC9XalOxCB4x9+
 UuloGJC1fGthw==
Date: Thu, 12 Jun 2025 14:37:28 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Message-ID: <20250612193728.GA924118@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250612-byeword-update-v1-16-f4afb8f6313f@collabora.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-pci@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>,
 llvm@lists.linux.dev, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 Eric Dumazet <edumazet@google.com>, Bill Wendling <morbo@google.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 linux-phy@lists.infradead.org, kernel@collabora.com,
 David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Jaehoon Chung <jh80.chung@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-rockchip@lists.infradead.org,
 linux-pm@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-clk@vger.kernel.org, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-media@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Yury Norov <yury.norov@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org, Qin Jian <qinjian@cqplus1.com>,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 linux-mmc@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Vinod Koul <vkoul@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Justin Stitt <justinstitt@google.com>, Andy Yan <andy.yan@rock-chips.com>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 16/20] PCI: rockchip: switch to
	HWORD_UPDATE* macros
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

On Thu, Jun 12, 2025 at 08:56:18PM +0200, Nicolas Frattaroli wrote:
> The era of hand-rolled HIWORD_UPDATE macros is over, at least for those
> drivers that use constant masks.
> 
> The Rockchip PCI driver, like many other Rockchip drivers, has its very
> own definition of HIWORD_UPDATE.
> 
> Remove it, and replace its usage with either HWORD_UPDATE, or two new
> header local macros for setting/clearing a bit with the high mask, which
> use HWORD_UPDATE_CONST internally. In the process, ENCODE_LANES needed
> to be adjusted, as HWORD_UPDATE* shifts the value for us.
> 
> That this is equivalent was verified by first making all HWORD_UPDATE
> instances HWORD_UPDATE_CONST, then doing a static_assert() comparing it
> to the old macro (and for those with parameters, static_asserting for
> the full range of possible values with the old encode macro).
> 
> What we get out of this is compile time error checking to make sure the
> value actually fits in the mask, and that the mask fits in the register,
> and also generally less icky code that writes shifted values when it
> actually just meant to set and clear a handful of bits.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Looks good to me.  I assume you want to merge these via a non-PCI tree
since this depends on patch 01/20.  PCI subject convention would
capitalize "Switch":

  PCI: rockchip: Switch to HWORD_UPDATE* macros

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/controller/pcie-rockchip.h | 35 +++++++++++++++++-----------------
>  1 file changed, 18 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
> index 5864a20323f21a004bfee4ac6d3a1328c4ab4d8a..5f2e45f062d94cd75983f7ad0c5b708e5b4cfb6f 100644
> --- a/drivers/pci/controller/pcie-rockchip.h
> +++ b/drivers/pci/controller/pcie-rockchip.h
> @@ -11,6 +11,7 @@
>  #ifndef _PCIE_ROCKCHIP_H
>  #define _PCIE_ROCKCHIP_H
>  
> +#include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/kernel.h>
>  #include <linux/pci.h>
> @@ -21,10 +22,10 @@
>   * The upper 16 bits of PCIE_CLIENT_CONFIG are a write mask for the lower 16
>   * bits.  This allows atomic updates of the register without locking.
>   */
> -#define HIWORD_UPDATE(mask, val)	(((mask) << 16) | (val))
> -#define HIWORD_UPDATE_BIT(val)		HIWORD_UPDATE(val, val)
> +#define HWORD_SET_BIT(val)		(HWORD_UPDATE_CONST((val), 1))
> +#define HWORD_CLR_BIT(val)		(HWORD_UPDATE_CONST((val), 0))
>  
> -#define ENCODE_LANES(x)			((((x) >> 1) & 3) << 4)
> +#define ENCODE_LANES(x)			((((x) >> 1) & 3))
>  #define MAX_LANE_NUM			4
>  #define MAX_REGION_LIMIT		32
>  #define MIN_EP_APERTURE			28
> @@ -32,21 +33,21 @@
>  
>  #define PCIE_CLIENT_BASE		0x0
>  #define PCIE_CLIENT_CONFIG		(PCIE_CLIENT_BASE + 0x00)
> -#define   PCIE_CLIENT_CONF_ENABLE	  HIWORD_UPDATE_BIT(0x0001)
> -#define   PCIE_CLIENT_CONF_DISABLE       HIWORD_UPDATE(0x0001, 0)
> -#define   PCIE_CLIENT_LINK_TRAIN_ENABLE	  HIWORD_UPDATE_BIT(0x0002)
> -#define   PCIE_CLIENT_LINK_TRAIN_DISABLE  HIWORD_UPDATE(0x0002, 0)
> -#define   PCIE_CLIENT_ARI_ENABLE	  HIWORD_UPDATE_BIT(0x0008)
> -#define   PCIE_CLIENT_CONF_LANE_NUM(x)	  HIWORD_UPDATE(0x0030, ENCODE_LANES(x))
> -#define   PCIE_CLIENT_MODE_RC		  HIWORD_UPDATE_BIT(0x0040)
> -#define   PCIE_CLIENT_MODE_EP            HIWORD_UPDATE(0x0040, 0)
> -#define   PCIE_CLIENT_GEN_SEL_1		  HIWORD_UPDATE(0x0080, 0)
> -#define   PCIE_CLIENT_GEN_SEL_2		  HIWORD_UPDATE_BIT(0x0080)
> +#define   PCIE_CLIENT_CONF_ENABLE		HWORD_SET_BIT(0x0001)
> +#define   PCIE_CLIENT_CONF_DISABLE		HWORD_CLR_BIT(0x0001)
> +#define   PCIE_CLIENT_LINK_TRAIN_ENABLE		HWORD_SET_BIT(0x0002)
> +#define   PCIE_CLIENT_LINK_TRAIN_DISABLE	HWORD_CLR_BIT(0x0002)
> +#define   PCIE_CLIENT_ARI_ENABLE		HWORD_SET_BIT(0x0008)
> +#define   PCIE_CLIENT_CONF_LANE_NUM(x)		HWORD_UPDATE(0x0030, ENCODE_LANES(x))
> +#define   PCIE_CLIENT_MODE_RC			HWORD_SET_BIT(0x0040)
> +#define   PCIE_CLIENT_MODE_EP			HWORD_CLR_BIT(0x0040)
> +#define   PCIE_CLIENT_GEN_SEL_1			HWORD_CLR_BIT(0x0080)
> +#define   PCIE_CLIENT_GEN_SEL_2			HWORD_SET_BIT(0x0080)
>  #define PCIE_CLIENT_LEGACY_INT_CTRL	(PCIE_CLIENT_BASE + 0x0c)
> -#define   PCIE_CLIENT_INT_IN_ASSERT		HIWORD_UPDATE_BIT(0x0002)
> -#define   PCIE_CLIENT_INT_IN_DEASSERT		HIWORD_UPDATE(0x0002, 0)
> -#define   PCIE_CLIENT_INT_PEND_ST_PEND		HIWORD_UPDATE_BIT(0x0001)
> -#define   PCIE_CLIENT_INT_PEND_ST_NORMAL	HIWORD_UPDATE(0x0001, 0)
> +#define   PCIE_CLIENT_INT_IN_ASSERT		HWORD_SET_BIT(0x0002)
> +#define   PCIE_CLIENT_INT_IN_DEASSERT		HWORD_CLR_BIT(0x0002)
> +#define   PCIE_CLIENT_INT_PEND_ST_PEND		HWORD_SET_BIT(0x0001)
> +#define   PCIE_CLIENT_INT_PEND_ST_NORMAL	HWORD_CLR_BIT(0x0001)
>  #define PCIE_CLIENT_SIDE_BAND_STATUS	(PCIE_CLIENT_BASE + 0x20)
>  #define   PCIE_CLIENT_PHY_ST			BIT(12)
>  #define PCIE_CLIENT_DEBUG_OUT_0		(PCIE_CLIENT_BASE + 0x3c)
> 
> -- 
> 2.49.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
