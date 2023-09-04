Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0CE791E4A
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Sep 2023 22:36:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C47A3C6B455;
	Mon,  4 Sep 2023 20:36:42 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFBF2C6B454
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Sep 2023 20:36:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 499F5B80CAA;
 Mon,  4 Sep 2023 20:36:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1545CC433C7;
 Mon,  4 Sep 2023 20:36:37 +0000 (UTC)
Date: Mon, 4 Sep 2023 16:36:35 -0400
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZPY/033Z0dDi5zJB@ishi>
References: <20230829134029.2402868-1-fabrice.gasnier@foss.st.com>
 <20230829134029.2402868-2-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20230829134029.2402868-2-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/8] counter: chrdev: fix getting array
	extensions
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
Content-Type: multipart/mixed; boundary="===============7281593808766701605=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7281593808766701605==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+/TWu6qhPiWTQHjU"
Content-Disposition: inline


--+/TWu6qhPiWTQHjU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 29, 2023 at 03:40:22PM +0200, Fabrice Gasnier wrote:
> When trying to watch a component array extension, and the array isn't the
> first extended element, it fails as the type comparison is always done on
> the 1st element. Fix it by indexing the 'ext' array.
>=20
> Example on a dummy struct counter_comp:
> static struct counter_comp dummy[] =3D {
> 	COUNTER_COMP_DIRECTION(..),
> 	...,
> 	COUNTER_COMP_ARRAY_CAPTURE(...),
> };
> static struct counter_count dummy_cnt =3D {
> 	...
> 	.ext =3D dummy,
> 	.num_ext =3D ARRAY_SIZE(dummy),
> }
>=20
> Currently, counter_get_ext() returns -EINVAL when trying to add a watch
> event on one of the capture array element in such example.
>=20
> Fixes: d2011be1e22f ("counter: Introduce the COUNTER_COMP_ARRAY component=
 type")
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Applied to counter-fixes as commit 3170256d7bc1.

Thanks,

William Breathitt Gray

--+/TWu6qhPiWTQHjU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZPY/0wAKCRC1SFbKvhIj
K9hLAQDqPhZP1YNYM6y5RMNfkbjoeJho9SeB13EQIOIjwx/59gEAlFxHbZqubcku
dRYQXe4YDx4kLA6cbnrZfx8lg4Phugk=
=RCOJ
-----END PGP SIGNATURE-----

--+/TWu6qhPiWTQHjU--

--===============7281593808766701605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7281593808766701605==--
