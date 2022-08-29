Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 854E35A4C6B
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Aug 2022 14:51:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27151C04001;
	Mon, 29 Aug 2022 12:51:44 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A978C035BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Aug 2022 12:51:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 35A47611FE;
 Mon, 29 Aug 2022 12:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F86EC433C1;
 Mon, 29 Aug 2022 12:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661777500;
 bh=+YExUL11paCuGkFEn/xxjBioMQoqHUqELISH6lg6JKY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ALT7a+zgxsT2eJDYqgsUiz5sdZV387Q/x3kgnVJmEkZwVQTmXKPkRmjWn/swSeP0b
 jcF/PTtBtwnM0/qvGQSm/599sq0Xp5h3FjexsmlVp3KPI3bHutECx8yp+UGIVp8Iuz
 cUio3+td6844UcstNFlRbl8gcnbz4ECpAv2EBqanjvNz5ZcShuPxteKGFDGFyLNrtw
 X0+7FdOwmoAY86h5BtgBDB7aZGvjwO3KEcutbfi73jczBWe0yStQKgjDLoDnZcllU3
 HFAi73M18hjffRm5NqblCxlDMgTZSIcUQRNp5xchd4JCJVL62AtzurjoAZkWnCVMln
 M7V1cWr1lZ3iQ==
Date: Mon, 29 Aug 2022 13:51:37 +0100
From: Mark Brown <broonie@kernel.org>
To: patrice.chotard@foss.st.com
Message-ID: <Ywy2WUIc7YxJv1Eo@sirena.org.uk>
References: <20220829123250.2170562-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20220829123250.2170562-1-patrice.chotard@foss.st.com>
X-Cookie: Necessity is a mother.
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32-qspi: Fix pm_runtime
 management in stm32_qspi_transfer_one_message()
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
Content-Type: multipart/mixed; boundary="===============5039086425242447204=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5039086425242447204==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Lga38wB0m89/rqLP"
Content-Disposition: inline


--Lga38wB0m89/rqLP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 29, 2022 at 02:32:50PM +0200, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
>=20
> ctrl->auto_runtime_pm was wrongly set to true when adding
> transfer_one_message() callback.
> As explained in commit 6e6ccb3d4cdc ("spi: stm32-qspi: Add pm_runtime sup=
port")
> the expected behavior is to prevent runtime suspends between each transfe=
r.

This doesn't apply against current code (the for-6.0 branch) -
please check and resend.

--Lga38wB0m89/rqLP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMMtlkACgkQJNaLcl1U
h9AWIwf7Bl8Ztd6KYTti6FFUahcShnjdHIH8gce4QYwl56qNfC9CJR4g1xwMUG7/
Y8HPMLkssDFVtTV4iHUg+7NExufImSBhqimUaLuH17IkYGecPAchTahI3Sl/RVki
VXl4J6JWSQtFVICCSyV0pVAKVa/4IGFie9UuonXSgUbSy+dTijW+kSNkeBOwfwgq
t4Sihg2WanUe+m/5gDLlH5V8bpeWQmXunSPRyWcUGJHTwMnLfgpgCV4CloCM0UPt
ChK46MrpHdaKm85RthsAQY3VQ0c33SgODoOaNtXrzGwwQrli7lFVjgAF7pYCkxMZ
v/zul2JTDqke8QmVdNxkbqP6kynzSQ==
=utvX
-----END PGP SIGNATURE-----

--Lga38wB0m89/rqLP--

--===============5039086425242447204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5039086425242447204==--
