Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z1egJa91PmrmGQkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jun 2026 14:50:55 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F8C6CD279
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jun 2026 14:50:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=kFciZu6i;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2828C597BF;
	Fri, 26 Jun 2026 12:50:54 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41644C424DD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jun 2026 12:50:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 410F2600AE;
 Fri, 26 Jun 2026 12:50:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 558761F000E9;
 Fri, 26 Jun 2026 12:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782478253;
 bh=6/EMO4Xkqp5EWfNibLrVgkVHrXeObxmVUQOZpRPdNsM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=kFciZu6i07zWeKKDY/50OS1OI70Cj4lvWkQFfSD5XtViJd2eByvBcu8aj3KWP+Ukv
 X+eTj5TV3Gir4AshCO3pgdC3PnxPVcZD4iuwQ/SFGACct9WvG+7U4Tv6GD6UtvG0Nu
 bWKQPx38vfASM1850IT1mVI5Uh4QH2/cGIC6CEogxc2zpihNmpqdMHrCiDYFjYojxW
 n3NKX6j//1QPW4WtjNvvl+Bpzewi0M35lQFCC4LKi9sAoFmAfIwVWzHYgThOmzjymG
 8IHHNECFegf/L0PxcMHB2ONFWTonLZDRneFleG5rAvwrYXU836B4fEp0NwM/MWpETy
 Ci7qg7FbfYPGA==
Date: Fri, 26 Jun 2026 14:50:50 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Albert Esteve <aesteve@redhat.com>
Message-ID: <20260626-successful-badger-from-neptune-ae2bc6@houat>
References: <20260626-drm_refcount_wiring-v1-0-cca1a7b3bdef@redhat.com>
 <20260626-drm_refcount_wiring-v1-3-cca1a7b3bdef@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20260626-drm_refcount_wiring-v1-3-cca1a7b3bdef@redhat.com>
Cc: imx@lists.linux.dev, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Frank Li <Frank.Li@nxp.com>,
 Stefan Agner <stefan@agner.ch>, Mikko Perttunen <mperttunen@nvidia.com>,
 Paul Cercueil <paul@crapouillou.net>, linux-tegra@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>, Simona Vetter <simona@ffwll.ch>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Robert Foss <rfoss@kernel.org>, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter Griffin <peter.griffin@linaro.org>, linux-rockchip@lists.infradead.org,
 Jagan Teki <jagan@amarulasolutions.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-mips@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 linux-sunxi@lists.linux.dev, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Marek Vasut <marex@denx.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Inki Dae <inki.dae@samsung.com>, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 Linus Walleij <linusw@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Sandy Huang <hjc@rock-chips.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Jessica Zhang <jesszhan0024@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Andy Yan <andy.yan@rock-chips.com>,
 Paul Kocialkowski <paulk@sys-base.io>, Jyri Sarha <jyri.sarha@iki.fi>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH 3/5] drm/panel: make *find_panel*() return
 a counted reference
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
Content-Type: multipart/mixed; boundary="===============1310004336074119070=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.19 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[mripard@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:aesteve@redhat.com,m:imx@lists.linux.dev,m:heiko@sntech.de,m:geert+renesas@glider.be,m:tomi.valkeinen@ideasonboard.com,m:Frank.Li@nxp.com,m:stefan@agner.ch,m:mperttunen@nvidia.com,m:paul@crapouillou.net,m:linux-tegra@vger.kernel.org,m:Laurent.pinchart@ideasonboard.com,m:andrzej.hajda@intel.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:m.szyprowski@samsung.com,m:simona@ffwll.ch,m:rgallaispou@gmail.com,m:thierry.reding@kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:rfoss@kernel.org,m:samuel@sholland.org,m:airlied@gmail.com,m:magnus.damm@gmail.com,m:jernej.skrabec@gmail.com,m:jonathanh@nvidia.com,m:peter.griffin@linaro.org,m:linux-rockchip@lists.infradead.org,m:jagan@amarulasolutions.com,m:alim.akhtar@samsung.com,m:linux-mips@vger.kernel.org,m:luca.ceresoli@bootlin.com,m:linux-sunxi@lists.linux.dev,m:mcoquelin.stm32@gmail.com,m:marex@denx.de,m:kernel@pengutronix.de,m:jonas@kwiboo.se,m:s.hauer@pengutronix.de,m:alison.wang@nxp.c
 om,m:maarten.lankhorst@linux.intel.com,m:inki.dae@samsung.com,m:linux-samsung-soc@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:laurentiu.palcu@oss.nxp.com,m:biju.das.jz@bp.renesas.com,m:krzk@kernel.org,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:neil.armstrong@linaro.org,m:jingoohan1@gmail.com,m:linusw@kernel.org,m:sw0312.kim@samsung.com,m:hjc@rock-chips.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:jesszhan0024@gmail.com,m:kyungmin.park@samsung.com,m:kieran.bingham+renesas@ideasonboard.com,m:philippe.cornu@foss.st.com,m:tzimmermann@suse.de,m:andy.yan@rock-chips.com,m:paulk@sys-base.io,m:jyri.sarha@iki.fi,m:yannick.fertre@foss.st.com,m:l.stach@pengutronix.de,m:geert@glider.be,m:laurent.pinchart@ideasonboard.com,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,sntech.de,glider.be,ideasonboard.com,nxp.com,agner.ch,nvidia.com,crapouillou.net,vger.kernel.org,intel.com,gmail.com,st-md-mailman.stormreply.com,samsung.com,ffwll.ch,kernel.org,sholland.org,linaro.org,lists.infradead.org,amarulasolutions.com,bootlin.com,denx.de,pengutronix.de,kwiboo.se,linux.intel.com,lists.freedesktop.org,oss.nxp.com,bp.renesas.com,rock-chips.com,foss.st.com,suse.de,sys-base.io,iki.fi];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[64];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,houat:mid,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 34F8C6CD279


--===============1310004336074119070==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="7zohsnv3e6hz33ls"
Content-Disposition: inline


--7zohsnv3e6hz33ls
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/5] drm/panel: make *find_panel*() return a counted
 reference
MIME-Version: 1.0

On Fri, Jun 26, 2026 at 02:03:25PM +0200, Albert Esteve wrote:
> Callers of of_drm_find_panel() receive a pointer with no reference
> held, creating a window where the panel device can be unregistered
> and freed between the lookup and first use (e.g., drm_panel_prepare()).
>=20
> find_panel_by_fwnode() is the fwnode counterpart of of_drm_find_panel().
> drm_panel_add_follower() worked around the missing panel kref by calling
> get_device() on the panel's underlying struct device. However, get_device=
()
> only prevents the device kobject from being freed. It does not prevent the
> panel's kzalloc()'d container memory from being released when the kref
> reaches zero.
>=20
> Fix both lookup functions by acquiring a reference with drm_panel_get()
> before returning, under panel_lock. Callers are now responsible for calli=
ng
> drm_panel_put() when they no longer need the pointer.
>=20
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  drivers/gpu/drm/drm_panel.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index 545fe93dc28fe..a00ae98ed0956 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -458,14 +458,17 @@ EXPORT_SYMBOL(__devm_drm_panel_alloc);
> =20
>  #ifdef CONFIG_OF
>  /**
> - * of_drm_find_panel - look up a panel using a device tree node
> + * of_drm_find_panel - look up and reference a panel by device tree node
>   * @np: device tree node of the panel
>   *
>   * Searches the set of registered panels for one that matches the given =
device
> - * tree node. If a matching panel is found, return a pointer to it.
> + * tree node. If a matching panel is found, the panel's reference count =
is
> + * incremented before returning a pointer to it. The caller must call
> + * drm_panel_put() when it no longer needs the panel pointer.
>   *
> - * Return: A pointer to the panel registered for the specified device tr=
ee
> - * node or an ERR_PTR() if no panel matching the device tree node can be=
 found.
> + * Return: A reference-counted pointer to the panel registered for the s=
pecified
> + * device tree node or an ERR_PTR() if no panel matching the device tree=
 node
> + * can be found.
>   *
>   * Possible error codes returned by this function:
>   *
> @@ -484,6 +487,7 @@ struct drm_panel *of_drm_find_panel(const struct devi=
ce_node *np)
> =20
>  	list_for_each_entry(panel, &panel_list, list) {
>  		if (panel->dev->of_node =3D=3D np) {
> +			drm_panel_get(panel);
>  			mutex_unlock(&panel_lock);
>  			return panel;
>  		}
> @@ -538,7 +542,13 @@ int of_drm_get_panel_orientation(const struct device=
_node *np,
>  EXPORT_SYMBOL(of_drm_get_panel_orientation);
>  #endif
> =20
> -/* Find panel by fwnode. This should be identical to of_drm_find_panel()=
=2E */
> +/*
> + * Find panel by fwnode, returning a counted reference.
> + *
> + * Behaves identically to of_drm_find_panel(). On success the returned
> + * pointer has been passed through drm_panel_get(); the caller must call
> + * drm_panel_put() when done with it.
> + */
>  static struct drm_panel *find_panel_by_fwnode(const struct fwnode_handle=
 *fwnode)
>  {
>  	struct drm_panel *panel;
> @@ -550,6 +560,7 @@ static struct drm_panel *find_panel_by_fwnode(const s=
truct fwnode_handle *fwnode
> =20
>  	list_for_each_entry(panel, &panel_list, list) {
>  		if (dev_fwnode(panel->dev) =3D=3D fwnode) {
> +			drm_panel_get(panel);
>  			mutex_unlock(&panel_lock);
>  			return panel;
>  		}

This part should probably be in a separate patch

> @@ -686,6 +697,7 @@ void drm_panel_remove_follower(struct drm_panel_follo=
wer *follower)
>  	mutex_unlock(&panel->follower_lock);
> =20
>  	put_device(panel->dev);
> +	drm_panel_put(panel);
>  }
>  EXPORT_SYMBOL(drm_panel_remove_follower);

together with this one?

Maxime

--7zohsnv3e6hz33ls
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaj51qgAKCRAnX84Zoj2+
diwIAX4n8GVfdswI/CYfLEgOWgs6vyFmb4OyfcLhnjRxNbOAswd2I4Y6MISm2y2O
xbmkorsBgIsdJUP81eahqp4/Cdcc0U1VPZVV2ocSL3asD7KeHDuqM1tJ2aAS3RWB
swFnQal7+A==
=gMuG
-----END PGP SIGNATURE-----

--7zohsnv3e6hz33ls--

--===============1310004336074119070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1310004336074119070==--
