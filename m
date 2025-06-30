Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FDAAEDEAA
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Jun 2025 15:17:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CACB6C32E92;
	Mon, 30 Jun 2025 13:17:06 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24053C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 13:17:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 873375C5D4E;
 Mon, 30 Jun 2025 13:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA4EC4CEE3;
 Mon, 30 Jun 2025 13:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751289424;
 bh=k8g9WvwbCnopbVS0TZ7r7XGLH05jg43Y4ARU0L44a2Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A//kAHvqiR/9lBxy6BGD5ThUBrzqCnUf3a7UdUkl9Z6ytkKYXLjFRs/2O+2xxHuAf
 7HGserKyCUtVjFxiaUnKervlLqv5ggZ7tnjH1vFd6P0ScdLse8zN0NDHBYLv4YVepM
 nE3cXo4ndN40ZcqTRSKb3hbm/ykfA7EeIf/c9Wx2+S0CBKp2jXUROs08GbSHr/+aJZ
 k4DC3EQM0fJ9QGsXloa53a/xzYsHlX5fq69A0AyOaL2jtlU/lExB2e6OrhSzocicE3
 nZVyjatVehAGEr9j7L/AgC5iMzd34fi6RfDcyLhCrEufYWntJvxkUdTSuBIyfGqAzA
 33Vs47G3ysrtA==
Date: Mon, 30 Jun 2025 14:16:59 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Message-ID: <1170cf86-b76a-4462-89d4-472298cc4034@sirena.org.uk>
References: <20250630-spi-fix-v2-1-4680939e2a3e@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20250630-spi-fix-v2-1-4680939e2a3e@foss.st.com>
X-Cookie: Say no, then negotiate.
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] spi: stm32: fix sram pool free in
	probe error path
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
Content-Type: multipart/mixed; boundary="===============0835427259077173249=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0835427259077173249==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uhQ8pZKGQFQ+/8bQ"
Content-Disposition: inline


--uhQ8pZKGQFQ+/8bQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 02:59:23PM +0200, Cl=E9ment Le Goffic wrote:

> Changes in v2:
> - Add Alain Volmat's Acked-by.
> - Link to v1: https://lore.kernel.org/r/20250630-spi-fix-v1-1-2e671c006e1=
5@foss.st.com

There's no need to resend to pick up tags - maintainers will do that as
a matter of course.

--uhQ8pZKGQFQ+/8bQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhijkoACgkQJNaLcl1U
h9BMHAf9EmAOHlF+CSGEKHuxUPbjf2T1MfR26EqamIjCucvKDn2DKbNjugE9TZpt
1u/eBORZpXpMHNBtfNDaarrltt2zPOo7WTcqH7/bt7tKPHLvay42Vm3voCGUUwDS
0fSupWmcZxuXnSvFPEZs9UtFqWqCSnP7XI1nReImwlf8dB4EV/8AIEW11bjRPbZ4
lGw+kBsvhrW8WwUykgdg6xtYXBrCc4WKJAAC4EdvCVlUqKzryrGUb/Kzj0vl0DZb
6NGZ976iCyZuJZjRCxLw/0MF/hNwE01GyrrKaY0QXJcsxRIlDYcjxwr4YDtYFt/K
38sEAlJp4ATzVFTK+vvrcKCyg/5wQA==
=eYhh
-----END PGP SIGNATURE-----

--uhQ8pZKGQFQ+/8bQ--

--===============0835427259077173249==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0835427259077173249==--
