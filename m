Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B970390A03
	for <lists+linux-stm32@lfdr.de>; Tue, 25 May 2021 21:54:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0ECA0C5978D;
	Tue, 25 May 2021 19:54:00 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 692D3C5978A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 May 2021 19:53:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 52D94610A5;
 Tue, 25 May 2021 19:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621972434;
 bh=HgxpqZZ8l2SbOe5FloTwZYVSDDUodjonSzDlKnO5XEM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NxoeKBw8EurWVzk9nhr0aoyB+atJDfZtkSDT1xX1UOPPJ3WeY9b1S6xvourjtJ4FE
 l7DoXS4glpTCGx5QLnG32rj8lgpEIuURUGQl+u/d/i5hYnx55AaMfQGcsOjcnLehvd
 lTMabTU/ekrt2F9bx192FrAXb18NZGBlaDkp/c1QgS71SYsi9HWz6cU8xed/fno4i+
 1s/MD9pAGqWiWE2QudIEtI/ez8i3JV8CeiGqihdAgBBQoBtxsJ3q/eemOeQDe+dvNe
 oM7PolVW/IVM20AYE7a0uHuFVNIOxaEtWxXChfADod1/aIhiMePwrHR9lP7k+8Ckkp
 EaSg5uYMxyDkA==
Date: Tue, 25 May 2021 21:53:50 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <YK1VzirZB/U59isX@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>, robh+dt@kernel.org,
 mark.rutland@arm.com, pierre-yves.mordret@foss.st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@foss.st.com
References: <1620220479-2647-1-git-send-email-alain.volmat@foss.st.com>
 <1620220479-2647-2-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <1620220479-2647-2-git-send-email-alain.volmat@foss.st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/2] i2c: add binding to mark a bus as
 supporting SMBus-Alert
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
Content-Type: multipart/mixed; boundary="===============8201890893853485773=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8201890893853485773==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AKRPigYTIbga29mT"
Content-Disposition: inline


--AKRPigYTIbga29mT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 05, 2021 at 03:14:38PM +0200, Alain Volmat wrote:
> Since SMBus-Alert is an optional feature of SMBUS which
> requires an additional pin, the smbus binding cannot be
> used to indicate its support.
>=20
> Add an additional smbus-alert binding specific for it and
> update the description text of smbus to avoid mentioning
> SMBus-Alert
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Applied to for-next, thanks!


--AKRPigYTIbga29mT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCtVcoACgkQFA3kzBSg
KbZRHw//XOHGt+Fis/ZvIW57WMjfZfRFfvk/dG8KknIIXILWUTnAiy9kzCKSsEES
l/x7+Csx7fR05vjsNkkh/S+dMq360Ox5dNnLUoHo75Ng28tDEcJ+cRNTTpMGP2dO
8zDdhmiuyFvASEGqtPLxkSSX7FVVylJwyxCHbwHnbHXK2NXArot5j3tcburX/B5a
PFlXsYRnPiKv0InSKSk4Lvf4iAZcOFGuSbIKnWP6Jvpd/BKEhKWHj7/znI5L3qVa
3v86g3NE/VKCud86MT41FAyRvba8uExBKfizYq1qoZ2yVPAqLxQzoSLJcCnOPbmQ
Bc/GolJFJRGaiIi0mCHdTXpEI/S+1iNZnMaUFvfqCEtjZcvVy01RR4rR02EJT8PT
P3PLfX2pXq/vcWTm0ZEtPq1lCWETV93SG6fjv5MZ6tCILwT18NvSfXoE8nreB9d/
/AoLsP7VEN3b5hHfQmps25GXWkkcO80/Ye10WBiC49bLjmZyTUo3yUxgpPC3m+0A
Xno3YNiyV3JgwNnx/jChW+hZjjcl4m93csgMrV/bKrH6N8OE7HU8cRrNUCu15pUI
RS+uX0kx+Jly0Fhku/QKsYgwdjm5icGAS0OEKyheDER6AJKZMwjNmuzWwSkIWQrx
f7iV4qL6wPD8OwApY/GYZlgQictaQr8NbEUk5x1rtosDSd0bWFY=
=UjR6
-----END PGP SIGNATURE-----

--AKRPigYTIbga29mT--

--===============8201890893853485773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8201890893853485773==--
