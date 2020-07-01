Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E4C210E8D
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Jul 2020 17:09:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 703E8C36B24;
	Wed,  1 Jul 2020 15:09:51 +0000 (UTC)
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A899C36B22
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Jul 2020 15:09:49 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 989F420025;
 Wed,  1 Jul 2020 17:09:46 +0200 (CEST)
Date: Wed, 1 Jul 2020 17:09:45 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Yannick Fertre <yannick.fertre@st.com>
Message-ID: <20200701150945.GA669248@ravnborg.org>
References: <20200701145258.2782-1-yannick.fertre@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701145258.2782-1-yannick.fertre@st.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=8b9GpE9nAAAA:8 a=e5mUnYsNAAAA:8
 a=YTZQKkLrOCVqNVj5krQA:9 a=eq0Tk01GMUV6gyqT:21 a=rLxRNCjj-UiVEZYG:21
 a=CjuIK1q_8ugA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=Vxmtnl_E_bksehYqCbjh:22
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] drm/bridge/synopsys: dsi: allows LP
 commands in video mode
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

Hi Yannick.

On Wed, Jul 01, 2020 at 04:52:58PM +0200, Yannick Fertre wrote:
> From: Antonio Borneo <antonio.borneo@st.com>
> 
> Current code only sends LP commands in command mode.
> 
> Allows sending LP commands also in video mode by setting the
> proper flag in DSI_VID_MODE_CFG.
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@st.com>

> Change-Id: Ib78fa37bcc7559ce63017acd6ee0bbf00c61a397
Change-Id is not used in kernel patches to my best knowledge.

> Reviewed-on: https://gerrit.st.com/c/mpu/oe/st/linux-stm32/+/153242
> Reviewed-by: CITOOLS <smet-aci-reviews@lists.codex.cro.st.com>
> Reviewed-by: CIBUILD <smet-aci-builds@lists.codex.cro.st.com>
Reviews by humans, not machines..

> Reviewed-by: Yannick FERTRE <yannick.fertre@st.com>
> Reviewed-by: Philippe CORNU <philippe.cornu@st.com>
> Tested-by: Yannick FERTRE <yannick.fertre@st.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index d580b2aa4ce9..0cd43e7a69bb 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -367,6 +367,13 @@ static void dw_mipi_message_config(struct dw_mipi_dsi *dsi,
>  
>  	dsi_write(dsi, DSI_LPCLK_CTRL, lpm ? 0 : PHY_TXREQUESTCLKHS);
>  	dsi_write(dsi, DSI_CMD_MODE_CFG, val);
> +
> +	val = dsi_read(dsi, DSI_VID_MODE_CFG);
> +	if (lpm)
> +		val |= ENABLE_LOW_POWER_CMD;
> +	else
> +		val &= ~ENABLE_LOW_POWER_CMD;
> +	dsi_write(dsi, DSI_VID_MODE_CFG, val);
>  }

We have following code:

static void dw_mipi_dsi_set_mode(struct dw_mipi_dsi *dsi,
                                 unsigned long mode_flags)
{
        dsi_write(dsi, DSI_PWR_UP, RESET);

        if (mode_flags & MIPI_DSI_MODE_VIDEO) {
                dsi_write(dsi, DSI_MODE_CFG, ENABLE_VIDEO_MODE);
                dw_mipi_dsi_video_mode_config(dsi);
                dsi_write(dsi, DSI_LPCLK_CTRL, PHY_TXREQUESTCLKHS);
        } else {
                dsi_write(dsi, DSI_MODE_CFG, ENABLE_CMD_MODE);
        }

        dsi_write(dsi, DSI_PWR_UP, POWERUP);
}

Here DSI_MODE_CFG is used to set vidoe mode or not.

But the code snip above checks DSI_VID_MODE_CFG.
It looks inconsistent.

I do not know the HW - and just stumbled over this.

	Sam


>  
>  static int dw_mipi_dsi_gen_pkt_hdr_write(struct dw_mipi_dsi *dsi, u32 hdr_val)
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
