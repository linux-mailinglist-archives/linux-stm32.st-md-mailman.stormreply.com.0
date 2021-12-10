Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ABF4721E0
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Dec 2021 08:45:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7283DC5F1EF;
	Mon, 13 Dec 2021 07:45:49 +0000 (UTC)
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E98DFC5E2C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Dec 2021 18:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 4E744FB04;
 Fri, 10 Dec 2021 19:13:07 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o6mwTDWk7X1X; Fri, 10 Dec 2021 19:13:06 +0100 (CET)
Date: Fri, 10 Dec 2021 19:13:04 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Message-ID: <YbOYsENSsiG1jM7O@qwark.sigxcpu.org>
References: <20211210174819.2250178-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211210174819.2250178-1-jagan@amarulasolutions.com>
X-Mailman-Approved-At: Mon, 13 Dec 2021 07:45:47 +0000
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-amarula@amarulasolutions.com
Subject: Re: [Linux-stm32] [PATCH 1/3] drm: bridge: nwl-dsi: Drop
	panel_bridge from nwl_dsi
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi,
On Fri, Dec 10, 2021 at 11:18:17PM +0530, Jagan Teki wrote:
> panel_bridge pointer never used anywhere except the one it
> looked up at nwl_dsi_bridge_attach.
> =

> Drop it from the nwl_dsi structure.
> =

> Cc: Guido G=FCnther <agx@sigxcpu.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Reviewed-by: Guido G=FCnther <agx@sigxcpu.org>

> ---
>  drivers/gpu/drm/bridge/nwl-dsi.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> =

> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nw=
l-dsi.c
> index a7389a0facfb..6becdcdc99fe 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -65,7 +65,6 @@ struct nwl_dsi_transfer {
>  struct nwl_dsi {
>  	struct drm_bridge bridge;
>  	struct mipi_dsi_host dsi_host;
> -	struct drm_bridge *panel_bridge;
>  	struct device *dev;
>  	struct phy *phy;
>  	union phy_configure_opts phy_cfg;
> @@ -924,13 +923,11 @@ static int nwl_dsi_bridge_attach(struct drm_bridge =
*bridge,
>  		if (IS_ERR(panel_bridge))
>  			return PTR_ERR(panel_bridge);
>  	}
> -	dsi->panel_bridge =3D panel_bridge;
>  =

> -	if (!dsi->panel_bridge)
> +	if (!panel_bridge)
>  		return -EPROBE_DEFER;
>  =

> -	return drm_bridge_attach(bridge->encoder, dsi->panel_bridge, bridge,
> -				 flags);
> +	return drm_bridge_attach(bridge->encoder, panel_bridge, bridge, flags);
>  }
>  =

>  static void nwl_dsi_bridge_detach(struct drm_bridge *bridge)
> -- =

> 2.25.1
> =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
