Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E4C319CB4
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Feb 2021 11:36:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8030AC57B5A;
	Fri, 12 Feb 2021 10:36:14 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2221CC57B58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Feb 2021 10:36:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0AB8B64E6C;
 Fri, 12 Feb 2021 10:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613126172;
 bh=l1HVYolc9K5zoog78E0hg6Q9NscFKBn5UiLoKkcCsIk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bm+6w43eahWDKpTKO5a8Ic37OrDmUsbmK9OwoGL2tGsLEcoAJV/BsN9fl7bLGkGpu
 AGS+ZlMBfZWAhCeBUHiJqcFi3I+2sPo9yUkD8qfguMQAgTMBMa+AJoqV94BTuuFuJJ
 qEc4D+OJtZfq5J+MEcPk6dmMOKD1tNIcF7cVQ06bpIki++3wVeDl7XlezODsQ6aUns
 KsZkaOlIP6UmUx5K+7VX0+fITHQcWS2UkhiWN6JqVbDCKi99gXjAea4SpyPJ5H7zIy
 rd86qUF195JJ5tpMVNUXuIJ8R0dSwqVccHdfpPZUBRRd83WLWw54DGVTWp+oEfcc/j
 1/oM9yEyV+3Og==
Date: Fri, 12 Feb 2021 11:36:07 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20210212103607.GC8038@ninjato>
References: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
 <1612515104-838-2-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <1612515104-838-2-git-send-email-alain.volmat@foss.st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/5] i2c: stm32f7: fix configuration of
	the digital filter
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
Content-Type: multipart/mixed; boundary="===============7792661699121732447=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7792661699121732447==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TYecfFk8j8mZq+dy"
Content-Disposition: inline


--TYecfFk8j8mZq+dy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 09:51:40AM +0100, Alain Volmat wrote:
> The digital filter related computation are present in the driver
> however the programming of the filter within the IP is missing.
> The maximum value for the DNF is wrong and should be 15 instead of 16.
>=20
> Fixes: aeb068c57214 ("i2c: i2c-stm32f7: add driver")
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Applied to for-current, thanks!

The rest will go in within the next cycle.


--TYecfFk8j8mZq+dy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAmWhcACgkQFA3kzBSg
KbYsWA/9GOAvOK+8eTc0vi7v5AZ7i77HxG3vZXq6Bm4XBBtXmV0eqg/U+Mr3IIC5
m6eq7LSkVtalSlJFl1penaXyJ+/d8EEWsZ2sPAFtolODkx5qzL7tZuyT3eu7br0H
VBSmAJeXUzqfdv96xL5WO2ypeMH8WljsClbp57fUxVqePxZQ9Tq0RVUD0ayyiwG+
m7tA1uMjQNn+RpYUxF7XdO7TmmN4SHqojOvGYX9qZytKXhD9Ytiw+490a31N2f9r
dHR/HN4CQdP1kIK0lKPvgQzd2b8/WuBokde7TA3fTwMog0C0Ywe0mPYjRYDwg126
znIoc646reRXWDNIAdr3g7BiZrDI1E76LzCsqaypoo5E3hz8pkPuo5gO8Mrrt6wN
aPOf6n8DxTFLvUi6XCDTpbItWC8L2Wi/XRj1gwHS0i67KHh9LZuMns6KDK6JxGyT
ve4dfYZgG4B0KTdwTrX+EfTLkAQWpr/szYaxqtfg2L//62feBuF98A4IyXJ6eQkB
mDCYjrQ8ZKGmnEHWV1+dr26M21WeoLcq6eDMOntne4zCEKOCxndtkZTCnDWUS7A/
FXTWHU3TEIYHaVuDhpqEs4ulCEITApDkNseJToMjbAWaxVmQ4xBetlJ44F4+ZTrs
YYERqcUpxvea2Iz07wgqChCMCurqPNxrKPivgn+6KKePfx634/o=
=RiX0
-----END PGP SIGNATURE-----

--TYecfFk8j8mZq+dy--

--===============7792661699121732447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7792661699121732447==--
