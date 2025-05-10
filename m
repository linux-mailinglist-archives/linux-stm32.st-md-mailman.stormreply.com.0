Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 522B7AB223C
	for <lists+linux-stm32@lfdr.de>; Sat, 10 May 2025 10:44:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16790C7A82A;
	Sat, 10 May 2025 08:44:34 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52219C7802F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 May 2025 08:44:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 19A2EA4D751;
 Sat, 10 May 2025 08:44:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF10C4CEEB;
 Sat, 10 May 2025 08:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746866671;
 bh=+jzMMg+8qQHgg35V15goKA1QTUFHCDmPs4KrlKdhpME=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W0Xl54h3KjjKFfTFEhHErwdQSHjucmw9GxgRfmYr5AHOE8RdJLUMfrlB+EL9szQ3g
 wWJ6PvTy57+0j6UxvyxCZP+ogkCuUVr8EzuYAHe1D7jAq8AaVVtGH58OUz/K8cOTi+
 1lhwI6ek1VZS7afqt3H/1UDAu/WND0BOvw4KdHy3XqqqpWQ+DcXgKRz6jNksLbRwiN
 dvTIdOU2LvXm7sfvoiXIB8SdDKODR81RoQqtHeH2+l7huHS81Z62jyckBWAZzEaINS
 9p+J9o3MAWYHHQha0YYwAAqmbno0ym1V4LqWfvYngjvWeDv1RJ6PVDrmITfAnni059
 2gpVwDNGZp3PA==
Date: Sat, 10 May 2025 10:44:28 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <xf44dsvdlzwxuzxgsmysf62azyv7tvq7dqgy2ixpcw4sb3jifq@gvgpl5qjozld>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-4-b8bc1f16d7aa@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-4-b8bc1f16d7aa@bootlin.com>
Cc: imx@lists.linux.dev, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Paul Kocialkowski <paulk@sys-base.io>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Simona Vetter <simona@ffwll.ch>,
 chrome-platform@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Aradhya Bhatia <a-bhatia1@ti.com>,
 David Airlie <airlied@gmail.com>, Anusha Srivatsa <asrivats@redhat.com>,
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
Subject: Re: [Linux-stm32] [PATCH v3 04/22] drm/bridge: cdns-dsi: convert to
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
Content-Type: multipart/mixed; boundary="===============4378683780600263451=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4378683780600263451==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="5n64y2ueq77czjvz"
Content-Disposition: inline


--5n64y2ueq77czjvz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 04/22] drm/bridge: cdns-dsi: convert to
 devm_drm_bridge_alloc() API
MIME-Version: 1.0

On Fri, May 09, 2025 at 03:53:30PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--5n64y2ueq77czjvz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaB8R6wAKCRAnX84Zoj2+
duEOAYD5W8gO3mYzy/rzNOgxh+og+ZXDnXUK5Epp9vOFPU7ZJjHyo+4t6VnXTLBA
aRhwVKIBgNklbO9mFaRUYvyZAYKC4STPZvzgX7VRFZ+IUPjgiEFG3YFlCeRAP/yY
JptKD6dJQQ==
=9/Jk
-----END PGP SIGNATURE-----

--5n64y2ueq77czjvz--

--===============4378683780600263451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4378683780600263451==--
