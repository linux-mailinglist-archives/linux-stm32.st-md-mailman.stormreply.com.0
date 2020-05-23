Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0261DF6BB
	for <lists+linux-stm32@lfdr.de>; Sat, 23 May 2020 12:49:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 740E5C36B25;
	Sat, 23 May 2020 10:49:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46DBAC36B23
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 May 2020 10:49:10 +0000 (UTC)
Received: from localhost (p5486c962.dip0.t-ipconnect.de [84.134.201.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 114212071C;
 Sat, 23 May 2020 10:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590230948;
 bh=PwN7sbTfwjxokBMf2pQ6vdFoh1qOEfNMu3Sb2acCJLk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yqU8BxaXnxk5yfChKX00KjJi6wXK8AyKSi9Ck6/1vjD8GC+44IkzsTpsLfB5cru41
 ub+p9rhbNL/pla+G9KANF73zBDVhc2ZRXUsD5TAadIgiaJecjat+okf4qH2DodX98j
 1DO2+VcMYfxk9RmNAQk8s3A7NVskaf7RnGSpKIIk=
Date: Sat, 23 May 2020 12:49:05 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200523104905.GC3459@ninjato>
References: <1588657871-14747-1-git-send-email-alain.volmat@st.com>
 <1588657871-14747-3-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1588657871-14747-3-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/4] i2c: addition of client reg/unreg
	callbacks
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
Content-Type: multipart/mixed; boundary="===============5816346580905010157=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5816346580905010157==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O3RTKUHj+75w1tg5"
Content-Disposition: inline


--O3RTKUHj+75w1tg5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2020 at 07:51:09AM +0200, Alain Volmat wrote:
> Addition of two callbacks reg_client and unreg_client that can be
> implemented by adapter drivers in order to take action whenever a
> client is being registered to it.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@st.com>

Sorry, but NACK. After years of work, we just recently got rid of attach
and detach callbacks. They were abused in quite a lot of ways. I think
we can find other solutions to what you need them for. Let's move the
discussion to patch 4.


--O3RTKUHj+75w1tg5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7I/6EACgkQFA3kzBSg
KbY8sw//eYS5M5Hm0dRPhWdFSAPvlR6gpu7Lij+OZODRclsET4UCmF1C4JPJEivx
XVs+jQuhJ+IEt0g8Uxp4xFVyCsPXH8Ryf/crCWEFuspbxsB8EK7CIV3dsPIsl2xQ
zlH+nE53j1osvtMm0eKPjQXv75/nDrjePqqz6FIq8DHcIkj5OJBFvCsP7eIaADXM
w72rJ9kGijPvwXgtigtDmD4wNuK46yRY1PkKH94f9t8qE3HbYULCu5UvkhjhrvPs
ZwaE0zUcquaYiMFj2zn9FYIBVceFKSEvajYwGKr2cMWYotdwZwf4SgKRKMO7AgWE
EEYdU9V/vIfHXMpEMFzMtv2qznWc1EHQBFQ6tk3El15KCc/DjGc2QywOQWaOJG2H
Cn/FOePVGd7bBtJSyaC+xxee6gShx01q6RhfeOI7GyBkAIt8pqJtKD9XeLeSg3zl
3Zjs1F5xZ2kYoogjgOJc+y8cb5Ht+STS84CfE2ZcbJw14kx4WYsIlckkNVlLS+vW
+AfUUX5pmB44cW304TPZdj9AN2wpKsKb5qpMOE8Grx8S3sJ/5sGAjhkjyp8o865b
bdTfS68nBRj4GpDQAzO7ugyfffPABndGm89RDrlFCeqJIn5WG3U2uOVAr3SCYhLX
nt6VRQ/O5/uE1pbDlafNleBv4NV8rzXC++jUyRGQqjT04vL7rfc=
=OrqO
-----END PGP SIGNATURE-----

--O3RTKUHj+75w1tg5--

--===============5816346580905010157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5816346580905010157==--
