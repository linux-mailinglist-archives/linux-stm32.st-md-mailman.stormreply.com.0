Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CCA262A8E
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Sep 2020 10:39:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E693C424BA;
	Wed,  9 Sep 2020 08:39:56 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C37D4C424B7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Sep 2020 08:39:54 +0000 (UTC)
Received: from localhost (p54b33098.dip0.t-ipconnect.de [84.179.48.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 79E3B215A4;
 Wed,  9 Sep 2020 08:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599640793;
 bh=8XEwCJdH8trsu8T/gd+RIVCXaoeI6Ibj6+vvgipWRxQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=woc2gl+8Zg8c/9HA+Wat8GGHtledWTXvxjTv7NNC9uAThk6RzMNPqN3xfKtFj9rGu
 BBkFOqf5ZRa6AQxXLUODCMfsXH8k6nox45Fc4Vcgm4aMnXMeLP8t2XXKMvFBdv7J9t
 JbVmPWWYEbIzvuy+b2hUicWkq0fqqgyPm+Kj57v8=
Date: Wed, 9 Sep 2020 10:39:50 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200909083950.GF2272@ninjato>
References: <1596431876-24115-1-git-send-email-alain.volmat@st.com>
 <1596431876-24115-2-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1596431876-24115-2-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
 linux-i2c@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/2] i2c: smbus: add core function
 handling SMBus host-notify
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
Content-Type: multipart/mixed; boundary="===============8404124262294781141=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8404124262294781141==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="27ZtN5FSuKKSZcBU"
Content-Disposition: inline


--27ZtN5FSuKKSZcBU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 03, 2020 at 07:17:55AM +0200, Alain Volmat wrote:
> SMBus Host-Notify protocol, from the adapter point of view
> consist of receiving a message from a client, including the
> client address and some other data.
>=20
> It can be simply handled by creating a new slave device
> and registering a callback performing the parsing of the
> message received from the client.
>=20
> This commit introduces two new core functions
>   * i2c_new_slave_host_notify_device
>   * i2c_free_slave_host_notify_device
> that take care of registration of the new slave device and
> callback and will call i2c_handle_smbus_host_notify once a
> Host-Notify event is received.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@st.com>

Applied to for-next, thanks!


--27ZtN5FSuKKSZcBU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9YlNUACgkQFA3kzBSg
KbargA/+Mx0jnagcE3Z5BZha8at8CzPwiC7r5rtL8V3E4h2lUgCjOzXnDoLgpWZu
u6VY2U7RO1n86oOlzzT6yQ/SDT5LouaGfs5ytpMn20A8P5H0zORi5vHERmTHeJ/J
JjLuhD+2UrnFAVGLhylRNl66/qSMyV22aSSKMWVDvBbj7X9bktLg70QhimmJWFf+
YW9HY2N3eot8+KgqiB6asAACGdNbCUMy/gYWv5ZmvTE7f9fPUdxFVcxKr0Eueg8e
a7o9tXRMf6Wpa/Vz4U/KXCX+Kqwz6cdWwWLqNWKkoFXR52AWML+hQ1eo4y3G7lJK
JqQ+kR2FwaH3t0xuc4tjtAcI2sPWZEjcMFJ9Bvje3ms/NcX/KHtlzPlXO/OJcC6b
omu0QLVcgeDmIVn3d9LM45nSkOqwt+ZQKYdu6ZzlR0l9DhVDVz2ma//4iZpQ3wBL
5euK8TGjlA1I8KkKOEfvV9xoZrazaUj3EUf38ujAtV8RPkglluKxQIkpDitNSvAB
SCD5UbcFYDtLLXNCGuxF6zAgc5OlIxDCxTDlyWt26WgSFY+DKUP+ZDfbdbyU2gol
83CZMVihVcfsTFbDFSvznACXuQS1X8ziVZ/Pn3mfWCMBkmH3Aosca7T+iDXogV2l
w7zQxNCJI9VY1913TCeHU4SHSJ/I8YFBYmKqlgLs6zxrsRI4UPg=
=i7Ml
-----END PGP SIGNATURE-----

--27ZtN5FSuKKSZcBU--

--===============8404124262294781141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8404124262294781141==--
