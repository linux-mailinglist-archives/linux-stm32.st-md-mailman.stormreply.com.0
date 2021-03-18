Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB24434040C
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Mar 2021 11:58:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88978C57B7B;
	Thu, 18 Mar 2021 10:58:46 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B4D2C57B77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Mar 2021 10:58:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B091C64F24;
 Thu, 18 Mar 2021 10:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616065122;
 bh=H5haXsTyRhLH/Tr8Ot7gpbm3NkcHxuV0oId1CbO3wi8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UCMC6stWkb2KilpzcwYzrjpiy5n+IpWGdjpEGJcn62LZGF/JEVu/l+o4838XaU4JF
 33dMvw4nnd8Ab9NYlRZi2stoE3seDxO8q2p2DWJzIFPAJpkWdE0CDEBNZuNmIcxn3Z
 ReodiIJP1S2W6KP/Bmy+LWtpa9+ppL4L5iegrI1TEWRohlJwMhOQtN/ffdDLbYzwjq
 WgXsJJkHtaZxDVRXT8H35kBtt2svxImYyiesoMP8jLS1yQkB1FzAd9xpibMj9VtIb9
 f/Wfj8bgsPXLi7CPqzF+XItZZ0jW4RdLjFsNGiqg/LSNs9gGK49YHjh6MUqwv6M9IY
 4+kTnXS4WC7Yg==
Date: Thu, 18 Mar 2021 11:58:39 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20210318105839.GG974@ninjato>
References: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
 <1612515104-838-6-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <1612515104-838-6-git-send-email-alain.volmat@foss.st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 5/5] i2c: stm32f7: indicate the address
 being accessed on errors
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
Content-Type: multipart/mixed; boundary="===============2322514778498902749=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2322514778498902749==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KIzF6Cje4W/osXrF"
Content-Disposition: inline


--KIzF6Cje4W/osXrF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 09:51:44AM +0100, Alain Volmat wrote:
> To help debugging issues, add the address of the slave being
> accessed when getting an error.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Applied to for-next, thanks!


--KIzF6Cje4W/osXrF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBTMl8ACgkQFA3kzBSg
KbYFGhAAqK39kHrbMrNW65/acOoglcf2ZVyUccSvCvlPuqXeheH7V39lIoRoOlwz
YjKFLQ4/WE8r5YEZfIbQKLxOjTEGCm9M3UILFEV+SL4xiCpsD6hiqjhvHdRponph
VJcnrF7mvkCC9dvybD7gqHz3LUcMeaC266wvIC/0fUcm1YUkvehIDzilECeweTV6
N4j33IOlQLd1SJ4IH0x4S0Mrh66Y6XS5dbBBHxmx4MrdSSxfGfVkyPB4JTDZgrsc
mXWx3+4bMNaZW4OnEa7NbjYEtIGZLOBE7r5NFE3w/RudmabTHOCp7Mg6YCDwKNoe
CSMQ4EfH5dpiUSEEYu/myNPtiGemyTvWbEjPFk3YYZuuTatiyyIPOPQwBKsBlDAR
IGs3fmTur/ooCyIvb1HhDIaDD/BXMt5oJcgZKItXQRQQfn3mxoy16Cajz5v3/NQM
GZkLG4pFOl41Irv1kw5hMhfBqIsqEswO9H+yRpWWjx+KRDXDzgr780fj7fPW+HGL
MNXydEy8vmf7V3Hx50aWGaVQEkEUx8wORRBdPd+HG/PhIj7b0E0x2z6OkJssf59W
ZBdKc9kfvz3hm5WzW3iVcG7tMoltGTL+5kex6ufI9TpG7P1qgt2Q/+jz15ErkTkw
m01+/cxWGPBhdRJCmgwYVGegsLXBPjM/luqJc2f2UhPZmD1Q61A=
=AQRM
-----END PGP SIGNATURE-----

--KIzF6Cje4W/osXrF--

--===============2322514778498902749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2322514778498902749==--
