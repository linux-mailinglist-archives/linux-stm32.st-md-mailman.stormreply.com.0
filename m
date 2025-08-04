Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 660A6B1B782
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Aug 2025 17:32:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 014A7C3F932;
	Tue,  5 Aug 2025 15:32:24 +0000 (UTC)
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAA6FC32EBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Aug 2025 22:00:30 +0000 (UTC)
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
 by leonov.paulk.fr (Postfix) with ESMTPS id E28EB1F00050
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Aug 2025 21:59:46 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
 id 6662BB0117A; Mon,  4 Aug 2025 21:59:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on spamassassin
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
 autolearn=disabled version=4.0.0
Received: from shepard (unknown [192.168.1.1])
 by laika.paulk.fr (Postfix) with ESMTPSA id 02B54B01170;
 Mon,  4 Aug 2025 21:59:27 +0000 (UTC)
Date: Mon, 4 Aug 2025 23:59:25 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Message-ID: <aJEtPd_-IzQZVBfl@shepard>
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
 <20250802-media-private-data-v1-54-eb140ddd6a9d@ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20250802-media-private-data-v1-54-eb140ddd6a9d@ideasonboard.com>
X-Mailman-Approved-At: Tue, 05 Aug 2025 15:32:20 +0000
Cc: Heiko Stuebner <heiko@sntech.de>, Devarsh Thakkar <devarsht@ti.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Christian Gromm <christian.gromm@microchip.com>,
 Dmitry Osipenko <digetx@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jacob Chen <jacob-chen@iotwrt.com>, Steve Longerbeam <slongerbeam@gmail.com>,
 Bingbu Cao <bingbu.cao@intel.com>, linux-sunxi@lists.linux.dev,
 Sascha Hauer <s.hauer@pengutronix.de>,
 =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Nas Chung <nas.chung@chipsnmedia.com>, Andy Walls <awalls@md.metrocast.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-usb@vger.kernel.org,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Ming Qian <ming.qian@nxp.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-doc@vger.kernel.org,
 Yunfei Dong <yunfei.dong@mediatek.com>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Magnus Damm <magnus.damm@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Dongliang Mu <dzm91@hust.edu.cn>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Jerome Brunet <jbrunet@baylibre.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 linux-media@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Houlong Wei <houlong.wei@mediatek.com>, linux-amlogic@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Zhou Peng <eagle.zhou@nxp.com>,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-mediatek@lists.infradead.org,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, imx@lists.linux.dev,
 Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>, linux-tegra@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>, Mike Isely <isely@pobox.com>,
 Jackson Lee <jackson.lee@chipsnmedia.com>, linux-staging@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bin Liu <bin.liu@mediatek.com>,
 mjpeg-users@lists.sourceforge.net,
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>, Tomasz Figa <tfiga@chromium.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Hans de Goede <hansg@kernel.org>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Todor Tomov <todor.too@gmail.com>, Mirela Rabulea <mirela.rabulea@nxp.com>,
 Alex Shi <alexs@kernel.org>, Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Corentin Labbe <clabbe@baylibre.com>,
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Benoit Parrot <bparrot@ti.com>,
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
 Hans Verkuil <hverkuil@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [Linux-stm32] [PATCH 54/65] media: hantro: Access v4l2_fh from
 file->private_data
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
Content-Type: multipart/mixed; boundary="===============2508602915374472565=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2508602915374472565==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/6X2y1A/1uo421sv"
Content-Disposition: inline


--/6X2y1A/1uo421sv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Very nice cleanup, glad to see this abstracted away from drivers!

Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>

All the best,

Paul

On Sat 02 Aug 25, 11:23, Jacopo Mondi wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
> To prepare for the introduction of video_device_state as second argument
> of the v4l2_ioctl_ops handler, access the v4l2_fh from
> file->private_data instead of using void *priv.
>=20
> The file->private_data is initialized to point to the v4l2_fh
> by the usage of v4l2_fh_init() in the v4l2_file_operations.open()
> handler.
>=20
> While at it remove the only left user of fh_to_ctx() and remove
> the macro completely.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/platform/verisilicon/hantro.h      |  5 -----
>  drivers/media/platform/verisilicon/hantro_v4l2.c | 22 +++++++++++-------=
----
>  2 files changed, 11 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/=
platform/verisilicon/hantro.h
> index 0f10714f1953945472e11d8c8ad87f8ec009b39f..e0fdc4535b2d73c5260057b0a=
89aee67a4732dd2 100644
> --- a/drivers/media/platform/verisilicon/hantro.h
> +++ b/drivers/media/platform/verisilicon/hantro.h
> @@ -382,11 +382,6 @@ extern int hantro_debug;
>  	pr_err("%s:%d: " fmt, __func__, __LINE__, ##args)
> =20
>  /* Structure access helpers. */
> -static __always_inline struct hantro_ctx *fh_to_ctx(struct v4l2_fh *fh)
> -{
> -	return container_of(fh, struct hantro_ctx, fh);
> -}
> -
>  static __always_inline struct hantro_ctx *file_to_ctx(struct file *filp)
>  {
>  	return container_of(file_to_v4l2_fh(filp), struct hantro_ctx, fh);
> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/m=
edia/platform/verisilicon/hantro_v4l2.c
> index 7c3515cf7d64a090adfb8d8aff368f9a617f8c8a..6bcd892e7bb49c654aae58416=
64d68c1692064bd 100644
> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> @@ -185,7 +185,7 @@ static int vidioc_querycap(struct file *file, void *p=
riv,
>  static int vidioc_enum_framesizes(struct file *file, void *priv,
>  				  struct v4l2_frmsizeenum *fsize)
>  {
> -	struct hantro_ctx *ctx =3D fh_to_ctx(priv);
> +	struct hantro_ctx *ctx =3D file_to_ctx(file);
>  	const struct hantro_fmt *fmt;
> =20
>  	fmt =3D hantro_find_format(ctx, fsize->pixel_format);
> @@ -217,7 +217,7 @@ static int vidioc_enum_fmt(struct file *file, void *p=
riv,
>  			   struct v4l2_fmtdesc *f, bool capture)
> =20
>  {
> -	struct hantro_ctx *ctx =3D fh_to_ctx(priv);
> +	struct hantro_ctx *ctx =3D file_to_ctx(file);
>  	const struct hantro_fmt *fmt, *formats;
>  	unsigned int num_fmts, i, j =3D 0;
>  	bool skip_mode_none, enum_all_formats;
> @@ -297,7 +297,7 @@ static int vidioc_g_fmt_out_mplane(struct file *file,=
 void *priv,
>  				   struct v4l2_format *f)
>  {
>  	struct v4l2_pix_format_mplane *pix_mp =3D &f->fmt.pix_mp;
> -	struct hantro_ctx *ctx =3D fh_to_ctx(priv);
> +	struct hantro_ctx *ctx =3D file_to_ctx(file);
> =20
>  	vpu_debug(4, "f->type =3D %d\n", f->type);
> =20
> @@ -310,7 +310,7 @@ static int vidioc_g_fmt_cap_mplane(struct file *file,=
 void *priv,
>  				   struct v4l2_format *f)
>  {
>  	struct v4l2_pix_format_mplane *pix_mp =3D &f->fmt.pix_mp;
> -	struct hantro_ctx *ctx =3D fh_to_ctx(priv);
> +	struct hantro_ctx *ctx =3D file_to_ctx(file);
> =20
>  	vpu_debug(4, "f->type =3D %d\n", f->type);
> =20
> @@ -398,13 +398,13 @@ static int hantro_try_fmt(const struct hantro_ctx *=
ctx,
>  static int vidioc_try_fmt_cap_mplane(struct file *file, void *priv,
>  				     struct v4l2_format *f)
>  {
> -	return hantro_try_fmt(fh_to_ctx(priv), &f->fmt.pix_mp, f->type);
> +	return hantro_try_fmt(file_to_ctx(file), &f->fmt.pix_mp, f->type);
>  }
> =20
>  static int vidioc_try_fmt_out_mplane(struct file *file, void *priv,
>  				     struct v4l2_format *f)
>  {
> -	return hantro_try_fmt(fh_to_ctx(priv), &f->fmt.pix_mp, f->type);
> +	return hantro_try_fmt(file_to_ctx(file), &f->fmt.pix_mp, f->type);
>  }
> =20
>  static void
> @@ -648,19 +648,19 @@ static int hantro_set_fmt_cap(struct hantro_ctx *ct=
x,
>  static int
>  vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_forma=
t *f)
>  {
> -	return hantro_set_fmt_out(fh_to_ctx(priv), &f->fmt.pix_mp, HANTRO_AUTO_=
POSTPROC);
> +	return hantro_set_fmt_out(file_to_ctx(file), &f->fmt.pix_mp, HANTRO_AUT=
O_POSTPROC);
>  }
> =20
>  static int
>  vidioc_s_fmt_cap_mplane(struct file *file, void *priv, struct v4l2_forma=
t *f)
>  {
> -	return hantro_set_fmt_cap(fh_to_ctx(priv), &f->fmt.pix_mp);
> +	return hantro_set_fmt_cap(file_to_ctx(file), &f->fmt.pix_mp);
>  }
> =20
>  static int vidioc_g_selection(struct file *file, void *priv,
>  			      struct v4l2_selection *sel)
>  {
> -	struct hantro_ctx *ctx =3D fh_to_ctx(priv);
> +	struct hantro_ctx *ctx =3D file_to_ctx(file);
> =20
>  	/* Crop only supported on source. */
>  	if (!ctx->is_encoder ||
> @@ -691,7 +691,7 @@ static int vidioc_g_selection(struct file *file, void=
 *priv,
>  static int vidioc_s_selection(struct file *file, void *priv,
>  			      struct v4l2_selection *sel)
>  {
> -	struct hantro_ctx *ctx =3D fh_to_ctx(priv);
> +	struct hantro_ctx *ctx =3D file_to_ctx(file);
>  	struct v4l2_rect *rect =3D &sel->r;
>  	struct vb2_queue *vq;
> =20
> @@ -738,7 +738,7 @@ static const struct v4l2_event hantro_eos_event =3D {
>  static int vidioc_encoder_cmd(struct file *file, void *priv,
>  			      struct v4l2_encoder_cmd *ec)
>  {
> -	struct hantro_ctx *ctx =3D fh_to_ctx(priv);
> +	struct hantro_ctx *ctx =3D file_to_ctx(file);
>  	int ret;
> =20
>  	ret =3D v4l2_m2m_ioctl_try_encoder_cmd(file, priv, ec);
>=20
> --=20
> 2.49.0
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--/6X2y1A/1uo421sv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmiRLT0ACgkQhP3B6o/u
lQzrNQ//exzkeWe4akWNjtSBn1Bl653EfO7v/aMS3Y3CCAKwErQrOulake7C7uWp
FWmge5iMC9U/bJjnJn6lW9WfRnVUXmp5akqOeWHMSQNTJOKjpKKu2vbmpqvYuw8/
EZ2UXBGtg72QjRVuzMJ+SE6pK4JPFM8d4TgJxzk49W5ABja+ipgEbdccHOOiSC6+
uFVnPmJI1kOcxLhh4CLeJsq2rbT56LiAWFj/BcsoRnz0+2o3/E8FL3f2KG5T4/Hj
6hZjsZySX3X+bwDVFBhMXv1d/ecgXPjUrdhj2kM+v50DMAu1jbz9aNM1kFzxA01q
9uh4AeSC65gQ8YnjC8mUo9BH/9JWzvf8SsGLTqLfDxkaHZcs5dIfqvNkmTs+sAM9
syJ2hplhAYUk20Pn/AAda2drxoqYYnUjt6R+UOaVcaJMLIr2z8CS60rWr2+Uwhpd
njA1mv/Zih/rq8uNN8l+j4DAQabNh8g/LPeroTO0/eF5WsPTvZM/BKtKrJgoy3Rv
E+C0EwaEiCNxZH9vUSmqw/DkWRX2CBe6NoDzUGwjWGJeSAjSCgbklwdyUuhKaJq0
MTDz/VZ2xLIMFm8RRFfYBjKohUK+RXA2OHHst4bQGq0rvjqtJo9yd3UzIFz+ww+L
VpD0vh+lndjqAQHcpftyzMcgB6AVADDZydaRUFdLGm9OHaeZA5k=
=4/Uq
-----END PGP SIGNATURE-----

--/6X2y1A/1uo421sv--

--===============2508602915374472565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2508602915374472565==--
