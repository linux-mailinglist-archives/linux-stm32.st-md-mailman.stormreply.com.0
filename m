Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 801F6424455
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Oct 2021 19:32:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32400C597B3;
	Wed,  6 Oct 2021 17:32:36 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E085C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Oct 2021 17:32:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA90060F22;
 Wed,  6 Oct 2021 17:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633541550;
 bh=xoTeSecthPoIVCFE9eaK5YWgW5FqM8Wx1GaGkk8TILk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iIbYkjKXrup+H9Fn37cRW5UkrXPxi8XPCEh7pJPwELSWYkHM9P2RBvoyr8xSXQYq3
 OZUYyP8/0tbM5ndWjzDB3EhVUfZd9ZNshZPZEro1JQkGhGdPWogZfXEtpywQY4vGj7
 eAGd2gNPrs/+bx+28YK/h+h0YKJnxLmOfTKpkmpVR+ZtvwONSiZGMn/zUpzPojvM6S
 UQmGx3moCXZ7C2g5tPB2eC7jUjwCE+yE6HI0+9xlUQAZqIy3V9ttlHj81WvoeKzDBN
 4OoToLMnLBBmGUnLnb874Z3JkteR1r4l2WjeSTm/D7S/9j5ATxGC7Ij9qC1zkrTdyg
 lVn24l3nvK+LA==
Date: Wed, 6 Oct 2021 18:32:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Message-ID: <YV3dqmLefGVAjH2T@sirena.org.uk>
References: <YV3Hk2R4uDKbTy43@monolith.localdoman>
MIME-Version: 1.0
In-Reply-To: <YV3Hk2R4uDKbTy43@monolith.localdoman>
X-Cookie: A is for Apple.
Cc: linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 alexandre.torgue@foss.st.com, lgirdwood@gmail.com, joabreu@synopsys.com,
 michael.riesch@wolfvision.net, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [BUG RESEND] net: stmmac: dwmac-rk: Ethernet
 broken on rockpro64 by commit 2d26f6e39afb ("net: stmmac: dwmac-rk: fix
 unbalanced pm_runtime_enable warnings")
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
Content-Type: multipart/mixed; boundary="===============8410572448978105277=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8410572448978105277==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6A6VXl3ajkDFtK+b"
Content-Disposition: inline


--6A6VXl3ajkDFtK+b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 06, 2021 at 04:58:11PM +0100, Alexandru Elisei wrote:
> Resending this because my previous email client inserted HTML into the em=
ail,
> which was then rejected by the linux-kernel@vger.kernel.org spam filter.
>=20
> After commit 2d26f6e39afb ("net: stmmac: dwmac-rk: fix unbalanced
> pm_runtime_enable warnings"), the network card on my rockpro64-v2 was left
> unable to get a DHCP lease from the network. The offending commit was fou=
nd by
> bisecting the kernel; I tried reverting the commit from v5.15-rc4 and the
> network card started working as expected.

I did end up glancing briefly at this (though no idea how I ended up
showing in get_maintainers...) - the revert dropped both the runtime PM
enables and the get/puts, I suspect the driver may need the get/puts
either where they are in the commit or at a level up.

--6A6VXl3ajkDFtK+b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFd3akACgkQJNaLcl1U
h9A+tAf/R80GdTYRa1orKc1W7WXATKEMT82qq11h/wdjVecfx/p0OGtKF6DGKXE5
fiDA0ZogMuvjFc0keAF/hwoPTvfYbKyxpXFVphdvUZgprmRbY2VXXnbAvVf/nkEz
an9dEsWf4CQiMa1ZlF0klMbQN/R8+CmnTlK7bJ8tz7sRXRZOPU5Gq+DYSYKs729h
UMCqB/oD6f+9MSIqCFu0ltirDRL6Gih9ZAGcbvluUKJjkqiTrbjXIpVNw6nqBFOt
3DZMTrgWyfHOyEFnRFeGD3yEb6zFCPC/IB/PZzHN01DFw7oC0jAFBQko+Jlijzur
DZF6KX1d84dhjWLO5WeS6ctqCQQKSA==
=8enb
-----END PGP SIGNATURE-----

--6A6VXl3ajkDFtK+b--

--===============8410572448978105277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8410572448978105277==--
