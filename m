Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D34684614CE
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Nov 2021 13:12:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 896FDC57B6F;
	Mon, 29 Nov 2021 12:12:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47DA3C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Nov 2021 12:12:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 03B8961333;
 Mon, 29 Nov 2021 12:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 289B2C53FCE;
 Mon, 29 Nov 2021 12:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638187954;
 bh=J6RU2160OUE42YClmwCyG+Es52HOmnCZuL2GlsaaDUA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YPRGsL++uiB3n5nNE5PzP2RGHUyBDokqG/NKvrtScM9Oh4RKIMg86l5nanCG7PrFx
 iFMbwUcqhy8fRD/W++CIRzMnk0Ptf91HS6XtY7JReJiexj3VhWRdau+eg+Ij/GZU2F
 2bOcooFnAgY59Yql6MD9P700Q+vT0NRVCUwlUwyRb5NAO+UY7RvmxyHtFQEFcd5uts
 S8+zK4cvkKzcXZA1T141wTP7p2XzALwsLeEbN9ZWYIH04ccR125TZgrvTPiSqtKfil
 V1uvWJj9SyRzRCjoD2qtCwvxRowyesZwEkIvV8gS4jJlxbWCiImkx31eBObYUovW64
 xi4aJxt5yV8CA==
Date: Mon, 29 Nov 2021 13:12:31 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <YaTDr7tFo844UAIf@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 pierre-yves.mordret@foss.st.com, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
References: <1632151292-18503-1-git-send-email-alain.volmat@foss.st.com>
 <1632151292-18503-2-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <1632151292-18503-2-git-send-email-alain.volmat@foss.st.com>
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/4] i2c: stm32f7: flush TX FIFO upon
	transfer errors
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
Content-Type: multipart/mixed; boundary="===============0909150157321925227=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0909150157321925227==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1sYfu5XiG+wi/5C6"
Content-Disposition: inline


--1sYfu5XiG+wi/5C6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 05:21:29PM +0200, Alain Volmat wrote:
> While handling an error during transfer (ex: NACK), it could
> happen that the driver has already written data into TXDR
> before the transfer get stopped.
> This commit add TXDR Flush after end of transfer in case of error to
> avoid sending a wrong data on any other slave upon next transfer.
>=20
> Fixes: aeb068c57214 ("i2c: i2c-stm32f7: add driver")
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Applied to for-current, thanks!


--1sYfu5XiG+wi/5C6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGkw68ACgkQFA3kzBSg
KbY0GQ/9FflxoUzCZMy+SZ4u/71HEEbXOxCS4MJG2HYHtPtgSgzzXqHEnPkkO7y1
3w0wztsBDOVyam0ooiwOgYaP2sQmB3WPFnz3e3OcV2nXgr7Y9MravpnwKF9LO6Lq
tywOzSI/MVbuRQeb2RlzGyIQ0l3Cbm/rzKoc1bPmhklD6j0qzHV4EH+HQpSHbSZy
sehUSx3tA8KL8CtGr9Nr2mwj3d3rtjHXB5SLzR3tPH+0ScALH/E3B3OUK69xUaHz
crKTFwdQL8Rx2XNsyRbGpO3LKanzcu36iTUZGGo5OI8JOh6eD4O8ft0HSId4wIr1
56fiIUU84iVh6cTPWhSOsHFE46w+bxiTgtqR3x5KiWUSFTf1VljdVKW/e38d55M0
CY69kMcYirqiOtrsdHpYGDjUZ/5QWI8zNxYTKVuln1JGIcv3sZF9U6yTEdbUzPbG
GJ/vatVo7LJJlFoFrxZma40ozkUUp+Xb19yN6lxlk/w08N0lRyDyxu0gCHV7Ho8A
A8gODXZDfw9POXXJPXSf2CZzoN9myMiEks1U33JmbLlNUZA012x9mU2V3Zk0Pbi7
r0EEngpsrnXeH6laHBTHdjXTH2fSOLP6uxA0GDZwhz1+OuIrhDvHSmhROnjmtNWj
gbt0uIPbT+BWcveNKvB7pBkJ0uAtsrP/PItvYm1k8aS9qQva99E=
=tguV
-----END PGP SIGNATURE-----

--1sYfu5XiG+wi/5C6--

--===============0909150157321925227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0909150157321925227==--
