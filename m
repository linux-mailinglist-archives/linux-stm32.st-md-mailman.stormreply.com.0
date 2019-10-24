Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46579E3B38
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Oct 2019 20:44:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F091CC36B0B;
	Thu, 24 Oct 2019 18:44:39 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9568C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2019 18:44:38 +0000 (UTC)
Received: from localhost (x4d0bc9de.dyn.telefonica.de [77.11.201.222])
 by pokefinder.org (Postfix) with ESMTPSA id 5D9E82C011D;
 Thu, 24 Oct 2019 20:44:38 +0200 (CEST)
Date: Thu, 24 Oct 2019 20:44:37 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20191024184437.GE1870@kunai>
References: <1571145118-3522-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1571145118-3522-1-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] i2c: i2c-stm32f7: remove warning when
 compiling with W=1
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
Content-Type: multipart/mixed; boundary="===============6558393595741330666=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6558393595741330666==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a+b56+3nqLzpiR9O"
Content-Disposition: inline


--a+b56+3nqLzpiR9O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2019 at 03:11:58PM +0200, Alain Volmat wrote:
> Remove the following warning:
>=20
> drivers/i2c/busses/i2c-stm32f7.c:315:
> warning: cannot understand function prototype:
> 'struct stm32f7_i2c_spec i2c_specs[] =3D
>=20
> Replace a comment starting with /** by simply /* to avoid having
> it interpreted as a kernel-doc comment.
>=20
> Fixes: aeb068c57214 ("i2c: i2c-stm32f7: add driver")
> Signed-off-by: Alain Volmat <alain.volmat@st.com>

Applied to for-current, thanks!


--a+b56+3nqLzpiR9O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2x8RUACgkQFA3kzBSg
Kbbyqw/8D1GESh2wz7RCGgify6hbIO/FgUOUJigLMBvN7ElqmAgJbf23OvTg1zQx
67AJ5QhuUzw3oXySC2ntHIbBvM5pfiJjCp3knOLIrjWCUVZ2KvBPEprieW5tpBj6
sXy+6ZzojJj8vpA6LqmIu/jX0vMo9NBGLUGkWcnkklz0J0k3U+0VzdAUHGvVpJGd
xWUxHGG8q5vJ5Y4t1RDktRj+vraHaV7SZwp5QL5+tD0LDZ1e00pqupVpHL+vEzIj
GPljclhyWiF/fQzBpY4MZWZ2Gpk4ZCJ5aL2oQtY9HTzy3UmPQJAu2ZjfDzAwM2cy
UfX9vpo9Uzg5k3sphhQz8lL35KYeRNj/HHGn4ricMT05G6AnLZ3PvPN3N6XL7dbk
BFnN1xaDmiF0izsXGQQbkpHvywAL/glYaImGZ2B4cKUN58JXavsmFsW6qM1mlrNl
hAFPFwJWffGJRW91lxC++v4LwjkpuypnRghWwy6sllU28/MgBESKnQwDqW4X3hmA
SsUijLNTRUgUWjgbUJ7s0YQ0zOEP/3U0k/Jv8XY8aLRu38fJ5jCxREQinZF6+Ner
G1DvSW9mfisN2HQqV9lWdADiiM5qfDyqJMT+SkSkXuaYqWqn9FNSFNn9bWjVRqut
aTEeMGUPOljpMtVflUPoV6nPF8LhFNXGhKaZqx5RkGQD9blcWaQ=
=yMm2
-----END PGP SIGNATURE-----

--a+b56+3nqLzpiR9O--

--===============6558393595741330666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6558393595741330666==--
