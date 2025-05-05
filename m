Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA4BAA8C3D
	for <lists+linux-stm32@lfdr.de>; Mon,  5 May 2025 08:23:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 686C5C78037;
	Mon,  5 May 2025 06:23:33 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F44CC78034
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 May 2025 06:23:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id ACAA06112E;
 Mon,  5 May 2025 06:22:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 076EFC4CEE4;
 Mon,  5 May 2025 06:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746426209;
 bh=blz46dfKcTkqUU1mdHuxtQzWM8gPcsEOF9yJwSPZQjo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=koamshTJSZ1WF/eCcwZGiyDpkwsaCADLfvS3QwjV5PotkB/YOwWC8XyuJVSsdLCIk
 /4Jtd7bMz2vmYsMNWmf/X4Sis4kqCPIcH2Wo9nzKbUDCdEWEjPm99kDdRKffgOIfVC
 GO8aK9v8GOt73LRnb9Tey6JAPxRlvzcCyhCmmdVLeIQZNUJGxNU4jtNLGVqIHj+dbm
 MEpwGnq7vCW5rHYuMgB1xOP/tAAjfa3OIH4mb6zlf/o2UpzxgLckv3VDuOX+zXChXs
 TEqMARo/LYFzdXeUg1+VrFmrPwI3ZjNDFpR2bMvYWKsJuqvZsxTYKkHx5l6dtCp9Kp
 s2eAL5PrUzyBg==
Date: Mon, 5 May 2025 08:23:26 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <20250505-beneficial-fossa-of-weather-67c676@houat>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-34-8f91a404d86b@bootlin.com>
 <20250428-wild-condor-of-defiance-cadf60@houat>
 <20250428172516.79058e22@booty>
MIME-Version: 1.0
In-Reply-To: <20250428172516.79058e22@booty>
Cc: imx@lists.linux.dev, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Paul Kocialkowski <paulk@sys-base.io>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Simona Vetter <simona@ffwll.ch>,
 chrome-platform@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
 Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>,
 Anusha Srivatsa <asrivats@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Hui Pu <Hui.Pu@gehealthcare.com>,
 linux-amlogic@lists.infradead.org, platform-driver-x86@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, freedreno@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 asahi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 34/34] drm/bridge: panel: convert to
 devm_drm_bridge_alloc() API
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
Content-Type: multipart/mixed; boundary="===============2687325984987540654=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2687325984987540654==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="fxb23j2izsboyssh"
Content-Disposition: inline


--fxb23j2izsboyssh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 34/34] drm/bridge: panel: convert to
 devm_drm_bridge_alloc() API
MIME-Version: 1.0

On Mon, Apr 28, 2025 at 05:25:16PM +0200, Luca Ceresoli wrote:
> Hi Maxime,
>=20
> On Mon, 28 Apr 2025 13:39:23 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > On Thu, Apr 24, 2025 at 10:05:49PM +0200, Luca Ceresoli wrote:
> > > This is the new API for allocating DRM bridges.
> > >=20
> > > The devm lifetime management of this driver is peculiar. The underlyi=
ng
> > > device for the panel_bridge is the panel, and the devm lifetime is ti=
ed the
> > > panel device (panel->dev). However the panel_bridge allocation is not
> > > performed by the panel driver, but rather by a separate entity (typic=
ally
> > > the previous bridge in the encoder chain).
> > >=20
> > > Thus when that separate entoty is destroyed, the panel_bridge is not
> > > removed automatically by devm, so it is rather done explicitly by cal=
ling
> > > drm_panel_bridge_remove(). This is the function that does devm_kfree(=
) the
> > > panel_bridge in current code, so update it as well to put the bridge
> > > reference instead.
> > >=20
> > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com> =20
> >=20
> > This looks fine, but we need a TODO entry to clean this up later on, and
> > a comment on devm_drm_put_bridge that this is inherently unsafe and
> > must not be used.
>=20
> Ah, I see, OK.
>=20
> Quick draft:
>=20
>  /**
>   * devm_drm_put_bridge - Release a bridge reference obtained via devm
>   * @dev: device that got the bridge via devm
>   * @bridge: pointer to a struct drm_bridge obtained via devm
>   *
>   * Same as drm_bridge_put() for bridge pointers obtained via devm functi=
ons
>   * such as devm_drm_bridge_alloc().
> + *
> + * This function is a temporary workaround and MUST NOT be used. Manual
> + * handling of bridge lifetime is inherently unsafe.
>   */

That part looks good to me

> and:
>=20
> -	devm_kfree(panel_bridge->panel->dev, bridge);
> +       /* TODO remove this after reworking panel_bridge lifetime */
> +	devm_drm_put_bridge(panel_bridge->panel->dev, bridge);
>  }
>=20
> Does it look good enough?

That too, but I was talking about an entry in
https://www.kernel.org/doc/html/latest/gpu/todo.html

Maxime

--fxb23j2izsboyssh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaBhZWgAKCRAnX84Zoj2+
dmbVAX4gMY0F9VXdFsIIKKBjn5Ev2tMwW+uv6doEaqoNJIEat9dVa/bvOYl9n6tm
ZNZ29HABeQEtltAKrypsuFB4FFzNPiZADC9MB5moran2psvsF2a1chXqCjrK2xyp
FQXpVqx4qw==
=pRS+
-----END PGP SIGNATURE-----

--fxb23j2izsboyssh--

--===============2687325984987540654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2687325984987540654==--
