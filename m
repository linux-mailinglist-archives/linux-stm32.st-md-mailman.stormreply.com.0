Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E494CA7E71D
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Apr 2025 18:47:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8BB8C78F97;
	Mon,  7 Apr 2025 16:47:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B126CC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Apr 2025 16:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744044436; x=1775580436;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=d/9rF2v6gxz+aVjjloTd50bAqLAn569sdN/hKyUhniA=;
 b=XXPQpt6RBJRHCEjfcFqBJU0edNdFCKeDBOYmKhHFq8pd6Ene6AxTjPO7
 kTHki87mNF6b9lg4iffzXyKSyvQv04OX81+10uTponIZSEc28zjLPEVui
 SsYOvHtYamLkQlUUYtBeNV5OAuzhgBwLTawF9iSKY9yXxJ/dHJIQHEptn
 mwGKfaQrH2y4Ip9b0c2tBBCUHJK17foX7WA2cBmPEHwOsPKfN2l4n7qFo
 8m4wOEHDCTRYWjGIXgDu4njIwsnbCht0zOWoreRsFWI9pw4tECuLcoANa
 XA8bZbkpeMwETwH0N88Xy0V9/KCEKdiabi7TlR0dlHfga4WMt8efjNWMC g==;
X-CSE-ConnectionGUID: ehaxHeMQSYmGTqsU0bBiGg==
X-CSE-MsgGUID: f0duHvRzSrKSphj9TpsMHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45533301"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="45533301"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 09:47:13 -0700
X-CSE-ConnectionGUID: dEMeJzZ7RJaZ+YDO48bYaw==
X-CSE-MsgGUID: yioqSJnkQC+IzOwpsUAeHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="127767783"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.229])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 09:47:02 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 7 Apr 2025 19:46:59 +0300 (EEST)
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-2-42113ff8d9c0@bootlin.com>
Message-ID: <a9000632-a6d1-d369-c317-9ee73aa645dc@linux.intel.com>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-2-42113ff8d9c0@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1316811861-1744044419=:936"
Cc: imx@lists.linux.dev,
 =?ISO-8859-15?Q?Herv=E9_Codina?= <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Paul Kocialkowski <paulk@sys-base.io>, LKML <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Simona Vetter <simona@ffwll.ch>,
 chrome-platform@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
 Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>,
 Anusha Srivatsa <asrivats@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Hui Pu <Hui.Pu@gehealthcare.com>,
 linux-amlogic@lists.infradead.org, platform-driver-x86@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, freedreno@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 asahi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 02/34] platform: arm64: acer-aspire1-ec:
 convert to devm_drm_bridge_alloc() API
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
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1316811861-1744044419=:936
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 7 Apr 2025, Luca Ceresoli wrote:

> This is the new API for allocating DRM bridges.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> ---
>=20
> Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
> Cc: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/arm64/acer-aspire1-ec.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/platform/arm64/acer-aspire1-ec.c b/drivers/platform/=
arm64/acer-aspire1-ec.c
> index 958fe1bf5f85bb69ac7962f217de9f0b40cde9a1..438532a047e68799ac53a16a4=
c813fc16be997b9 100644
> --- a/drivers/platform/arm64/acer-aspire1-ec.c
> +++ b/drivers/platform/arm64/acer-aspire1-ec.c
> @@ -452,9 +452,9 @@ static int aspire_ec_probe(struct i2c_client *client)
>  =09int ret;
>  =09u8 tmp;
> =20
> -=09ec =3D devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
> -=09if (!ec)
> -=09=09return -ENOMEM;
> +=09ec =3D devm_drm_bridge_alloc(dev, struct aspire_ec, bridge, &aspire_e=
c_bridge_funcs);
> +=09if (IS_ERR(ec))
> +=09=09return PTR_ERR(ec);
> =20
>  =09ec->client =3D client;
>  =09i2c_set_clientdata(client, ec);
> @@ -497,7 +497,6 @@ static int aspire_ec_probe(struct i2c_client *client)
>  =09fwnode =3D device_get_named_child_node(dev, "connector");
>  =09if (fwnode) {
>  =09=09INIT_WORK(&ec->work, aspire_ec_bridge_update_hpd_work);
> -=09=09ec->bridge.funcs =3D &aspire_ec_bridge_funcs;
>  =09=09ec->bridge.of_node =3D to_of_node(fwnode);
>  =09=09ec->bridge.ops =3D DRM_BRIDGE_OP_HPD;
>  =09=09ec->bridge.type =3D DRM_MODE_CONNECTOR_USB;

Hi Luca,

It took a while to locate where the code for the new helper is. I suggest=
=20
if you need send another version of the series directly linking to the=20
commit in the cover letter so that it won't take multiple hoops to find it=
=20
if one wants to review the code and is not having all drm trees easily at=
=20
hand. Here it is for the benefit of other pdx86 people:

https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cc6aadd7fc1e629b71=
5ea3d1ba537ef2da95eec


Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

I assume you want this to go through the drm tree where the helper already=
=20
is?

--=20
 i.

--8323328-1316811861-1744044419=:936
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--8323328-1316811861-1744044419=:936--
