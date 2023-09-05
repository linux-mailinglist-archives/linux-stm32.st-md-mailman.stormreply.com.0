Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE2879213B
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Sep 2023 10:59:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F8ECC6B454;
	Tue,  5 Sep 2023 08:59:46 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7157C6B44E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Sep 2023 08:59:44 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (ftip006315900.acc1.colindale.21cn-nte.bt.net [81.134.214.249])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EEA8A10FE;
 Tue,  5 Sep 2023 10:58:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1693904298;
 bh=9zflABAqPmbg2ONt1yRMuQjAcZe9cEzAC/XOnQAauSY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k5ztUP4cRawFTeRRyx/raq1/2zA3AKLiQ/KSeeVrNKtIuvBTVnV6/dvg5lCl1iPH/
 Vi8nYpm9xLX6wajtAKmROs6xJZ0G//aGtkjnbaYy9J3LZS5UAw+wl1FeOgLXtI0+KB
 +/9PlEbqUWnWKRS0fmcKzUQ9G6ydlav/RfsQe5K0=
Date: Tue, 5 Sep 2023 11:59:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20230905085956.GB31594@pendragon.ideasonboard.com>
References: <20230901155732.252436-1-alain.volmat@foss.st.com>
 <20230901155732.252436-3-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230901155732.252436-3-alain.volmat@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Dan Scally <dan.scally@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 2/5] media: MAINTAINERS: add entry for
 STM32 DCMIPP driver
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

Hi Alain,

Thank you for the patch.

On Fri, Sep 01, 2023 at 05:57:21PM +0200, Alain Volmat wrote:
> Add the entry related to the STM32 MEDIA DCMIPP driver within the
> MAINTAINERS file.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 228bed60e006..d2c6fd410dcf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13171,6 +13171,15 @@ T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
>  F:	drivers/media/platform/st/stm32/stm32-dcmi.c
>  
> +MEDIA DRIVERS FOR STM32 - DCMIPP
> +M:	Hugues Fruchet <hugues.fruchet@foss.st.com>
> +M:	Alain Volmat <alain.volmat@foss.st.com>

If you volunteered to also maintain the DCMI driver, this could be
folded in the "MEDIA DRIVERS FOR STM32 - DCMI" entry :-)

Either way,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +L:	linux-media@vger.kernel.org
> +S:	Supported
> +T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
> +F:	drivers/media/platform/st/stm32/stm32-dcmipp/*
> +
>  MEDIA INPUT INFRASTRUCTURE (V4L/DVB)
>  M:	Mauro Carvalho Chehab <mchehab@kernel.org>
>  L:	linux-media@vger.kernel.org

-- 
Regards,

Laurent Pinchart
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
