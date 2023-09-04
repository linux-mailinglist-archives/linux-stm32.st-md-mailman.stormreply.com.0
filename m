Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAE7791E53
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Sep 2023 22:40:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FA12C6B455;
	Mon,  4 Sep 2023 20:40:09 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8BBDC6B454
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Sep 2023 20:40:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 727306187C;
 Mon,  4 Sep 2023 20:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C59BC433C8;
 Mon,  4 Sep 2023 20:40:04 +0000 (UTC)
Date: Mon, 4 Sep 2023 16:40:02 -0400
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZPZAoh6B1vN2jqsR@ishi>
References: <20230829134029.2402868-1-fabrice.gasnier@foss.st.com>
 <20230829134029.2402868-3-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20230829134029.2402868-3-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/8] counter: chrdev: remove a typo in
	header file comment
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
Content-Type: multipart/mixed; boundary="===============4421614591618885736=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4421614591618885736==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="thz1GdxEjcCjOPaP"
Content-Disposition: inline


--thz1GdxEjcCjOPaP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 29, 2023 at 03:40:23PM +0200, Fabrice Gasnier wrote:
> Replace COUNTER_COUNT_SCOPE that doesn't exist by the defined
> COUNTER_SCOPE_COUNT.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Applied to counter-next as commit 631c15d5f14d.

Thanks,

William Breathitt Gray

--thz1GdxEjcCjOPaP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZPZAogAKCRC1SFbKvhIj
K+noAP4+sSxlfiB2yBCeIDnhQcYNL15lMsj6+dHGrph+FsYuhAD/WFonHP2nDxW1
uapdulAZHV5XAKZVynE0IbaHpNnRKgE=
=QE7P
-----END PGP SIGNATURE-----

--thz1GdxEjcCjOPaP--

--===============4421614591618885736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4421614591618885736==--
