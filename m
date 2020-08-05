Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A7523CA1A
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Aug 2020 13:01:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A91DC36B3A;
	Wed,  5 Aug 2020 11:01:51 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0154EC36B32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Aug 2020 11:01:49 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1020622CAE;
 Wed,  5 Aug 2020 11:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596625308;
 bh=E48uURU/e4C3y5TjlfnNrUSBQnpVCadc+z+Vd9h/kdU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vjiEPe14+OtcSgTUe6IvKe9v7YtFnMHcqLyu1+yzJV2lHJlinrgdZttz+o/8wF2Pn
 kjWCfnTxkN2Yt08lbE1MOKOyiYlxVVYDwGj7fNWqJoh2bRTgpr9ZnCA1QsL5FJRKXD
 2Qe0hIMyvTa1JtLSs+tAhtngoaoynx1LzvqEakcg=
Date: Wed, 5 Aug 2020 12:01:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200805110125.GG5556@sirena.org.uk>
References: <1596610933-32599-1-git-send-email-alain.volmat@st.com>
 <1596610933-32599-13-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1596610933-32599-13-git-send-email-alain.volmat@st.com>
X-Cookie: Fast, cheap, good: pick two.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 12/18] spi: stm32: move spi disable out of
	irq handler
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
Content-Type: multipart/mixed; boundary="===============1314111779247999819=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1314111779247999819==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KR/qxknboQ7+Tpez"
Content-Disposition: inline


--KR/qxknboQ7+Tpez
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 05, 2020 at 09:02:07AM +0200, Alain Volmat wrote:
> From: Antonio Borneo <antonio.borneo@st.com>
>=20
> The spi disable could potentially require some time to finish.
> It has to be executed at the end of a transfer, but there is
> no reason to call it in the irq handler.
>=20
> Simplify the irq handler by moving out the spi disable. The
> synchronization through xfer_completion is used to defer the
> execution of spi disable.

Should this be an unprepare_transfer_hardware() operation?  That would
allow the framework to take care of scheduling this in an appropriate
context with the added advantage of not needing to do it when there's
another message scheduled immediately.

--KR/qxknboQ7+Tpez
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8qkYUACgkQJNaLcl1U
h9Amcwf/Z9jbsoaJGZe0lTnEB+ZN1x7Xo629kRG1It/WXDUx01vXa/0BIFFomSB8
5z4skhqGXkfncS+6lCZzBW1dJjVMTxJTXztD4zCbb45cYbGA+rjWIn2JPMvHLLxO
swSm5Poy0PDGddU6aVh9PrZgMJXe6z5+hogGuIfxuPIdDi0gudqZ6mxH1N7emcQh
52kzLDjvPtfeYESQYhtaCyD/MDbrAvSPC/946BHXzIcDWpWeHJIsdNUQCghTUHHg
D3dpBhZhYrJfaE8Iv81hlGdlEbzrRDsmdJLi918xEECHBPWEoKItosC0DRKFVo2q
/gSifjQBt0a6jA65RbRP4i8WXRUTNA==
=6vOj
-----END PGP SIGNATURE-----

--KR/qxknboQ7+Tpez--

--===============1314111779247999819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1314111779247999819==--
