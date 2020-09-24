Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A951277A8D
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Sep 2020 22:39:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65151C3FAE1;
	Thu, 24 Sep 2020 20:39:55 +0000 (UTC)
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBBE9C3FADE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Sep 2020 20:39:53 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 283BB20079;
 Thu, 24 Sep 2020 22:39:53 +0200 (CEST)
Date: Thu, 24 Sep 2020 22:39:51 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Yannick Fertre <yannick.fertre@st.com>
Message-ID: <20200924203951.GN1223313@ravnborg.org>
References: <20200922074253.28810-1-yannick.fertre@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200922074253.28810-1-yannick.fertre@st.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=CaYmGojl c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=8b9GpE9nAAAA:8 a=e5mUnYsNAAAA:8
 a=jgFxdXKw9Db9PIIa09sA:9 a=CjuIK1q_8ugA:10 a=T3LWEMljR5ZiDmsYVIUa:22
 a=Vxmtnl_E_bksehYqCbjh:22
Cc: Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] drm/panel: otm8009a: allow using
 non-continuous dsi clock
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

On Tue, Sep 22, 2020 at 09:42:53AM +0200, Yannick Fertre wrote:
> From: Antonio Borneo <antonio.borneo@st.com>
> 
> The panel is able to work when dsi clock is non-continuous, thus
> the system power consumption can be reduced using such feature.
> 
> Add MIPI_DSI_CLOCK_NON_CONTINUOUS to panel's mode_flags.
> 
> Changes in v2:
>   - Added my signed-off
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
> Signed-off-by: Yannick Fertre <yannick.fertre@st.com>

Applied to drm-misc-next.

	Sam
> ---
>  drivers/gpu/drm/panel/panel-orisetech-otm8009a.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> index b6e377aa1131..6ac1accade80 100644
> --- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> +++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> @@ -452,7 +452,7 @@ static int otm8009a_probe(struct mipi_dsi_device *dsi)
>  	dsi->lanes = 2;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> -			  MIPI_DSI_MODE_LPM;
> +			  MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
>  
>  	drm_panel_init(&ctx->panel, dev, &otm8009a_drm_funcs,
>  		       DRM_MODE_CONNECTOR_DSI);
> -- 
> 2.17.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
