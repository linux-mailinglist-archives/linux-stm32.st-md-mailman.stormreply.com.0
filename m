Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FC9B2A8E2
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Aug 2025 16:10:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E36F0C3F93B;
	Mon, 18 Aug 2025 14:10:43 +0000 (UTC)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B212C3F93A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Aug 2025 14:10:42 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250818141041euoutp01198781292bd5d26e9ea7136d3d3d73e8~c4dDIkjfs2135921359euoutp01S;
 Mon, 18 Aug 2025 14:10:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250818141041euoutp01198781292bd5d26e9ea7136d3d3d73e8~c4dDIkjfs2135921359euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1755526241;
 bh=ts3A4MvB+pLF9b1fYr1OaRKHsIG9rXzjaSyR872fx0Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nweMstTkqZUfTDcgSuzWRYVoV9JvbPK+l2fq2+I3gRx0SKOetrGBglidgci/XLRHG
 yKiRGPTghNY65ZYuW+rQetbaj0UlX84N/HJy2tuH4Qs0xmThMbES7YZyWuK/y2EQwa
 pANBPLppgOKGZUguwTqkajXJsHrX4XbKh4XzMW6k=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250818141040eucas1p12598f376bdd8cfcb984a8a799373111d~c4dCdErup2133021330eucas1p1j;
 Mon, 18 Aug 2025 14:10:40 +0000 (GMT)
Received: from localhost (unknown [106.120.51.111]) by eusmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20250818141040eusmtip168497366a830534395c067398c2a3939~c4dCY3Ph_0814408144eusmtip1d;
 Mon, 18 Aug 2025 14:10:40 +0000 (GMT)
From: Lukasz Stelmach <l.stelmach@samsung.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Mon, 18 Aug 2025 16:10:40 +0200
In-Reply-To: <20250802-media-private-data-v1-11-eb140ddd6a9d@ideasonboard.com>
 (Jacopo Mondi's message of "Sat, 02 Aug 2025 11:22:33 +0200")
Message-ID: <oypijda53wra8v.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CMS-MailID: 20250818141040eucas1p12598f376bdd8cfcb984a8a799373111d
X-Msg-Generator: CA
X-RootMTR: 20250802092520eucas1p2d0edfe269d3c423e6157bd7a0ec0b43c
X-EPHeader: CA
X-CMS-RootMailID: 20250802092520eucas1p2d0edfe269d3c423e6157bd7a0ec0b43c
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
 <CGME20250802092520eucas1p2d0edfe269d3c423e6157bd7a0ec0b43c@eucas1p2.samsung.com>
 <20250802-media-private-data-v1-11-eb140ddd6a9d@ideasonboard.com>
Cc: imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 11/65] media: Replace file->private_data
 access with custom functions
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
Content-Type: multipart/mixed; boundary="===============5147569648986204296=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============5147569648986204296==
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
	protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2025-08-02 sob 11:22>, when Jacopo Mondi wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Accessing file->private_data manually to retrieve the v4l2_fh pointer is
> error-prone, as the field is a void * and will happily cast implicitly
> to any pointer type.
>
> Replace all remaining locations that read the v4l2_fh pointer directly
> from file->private_data and cast it to driver-specific file handle
> structures with driver-specific functions that use file_to_v4l2_fh() and
> perform the same cast.
>
> No functional change is intended, this only paves the way to remove
> direct accesses to file->private_data and make V4L2 drivers safer.
> Other accesses to the field will be addressed separately.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---

[...]

> diff --git a/drivers/media/platform/samsung/s5p-g2d/g2d.c b/drivers/media=
/platform/samsung/s5p-g2d/g2d.c
> index ffed16a34493be2edbdaee13619467417487c1e7..44fcedbbc90a9863827aacbcd=
5f56d850cb552ea 100644
> --- a/drivers/media/platform/samsung/s5p-g2d/g2d.c
> +++ b/drivers/media/platform/samsung/s5p-g2d/g2d.c
> @@ -25,7 +25,10 @@
>  #include "g2d.h"
>  #include "g2d-regs.h"
>=20=20
> -#define fh2ctx(__fh) container_of(__fh, struct g2d_ctx, fh)
> +static inline struct g2d_ctx *file2ctx(struct file *filp)
> +{
> +	return container_of(file_to_v4l2_fh(filp), struct g2d_ctx, fh);
> +}
>=20=20
>  static struct g2d_fmt formats[] =3D {
>  	{
> @@ -272,7 +275,7 @@ static int g2d_open(struct file *file)
>  static int g2d_release(struct file *file)
>  {
>  	struct g2d_dev *dev =3D video_drvdata(file);
> -	struct g2d_ctx *ctx =3D fh2ctx(file->private_data);
> +	struct g2d_ctx *ctx =3D file2ctx(file);
>=20=20
>  	mutex_lock(&dev->mutex);
>  	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);


Acked-by: Lukasz Stelmach <l.stelmach@samsung.com>


[...]


=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAmijNGAACgkQsK4enJil
gBDoIQgAm0zhFQfQO2pDJE9DC0t6P4lrJ//jtdrQJtVSYpcaXDYP9Oq1iygQ3s54
2wjf/n/+kXlE2cUM5pvbFc0c1qeuZipb+lexBpwBdogDE3njAsinDf4ohsWPGhJC
TMOuWPadHmM0CXjuSWpeF+MoKtOJYJjdyVizq8ZoFwgGHssYApRxGVuXx6DRlsZK
aqNXp4P9HNaVsxLl5JOCaeEaJLBkU++5rhIooxbmm/jPuM6WuOWil+jQKADaODeJ
UfkLjfRCLFc4WdsXOBZuwqUiyU4imB8qJOlrjosCChiqKqr7up+cyr3YZ7PJEXPv
jN4MErP/mPjxbYUi+bON3CbY2FlWfw==
=alRq
-----END PGP SIGNATURE-----
--=-=-=--

--===============5147569648986204296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5147569648986204296==--
