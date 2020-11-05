Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 852402A84D6
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Nov 2020 18:27:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44668C3FAD4;
	Thu,  5 Nov 2020 17:27:22 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB07FC36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Nov 2020 17:27:20 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D23A2072E;
 Thu,  5 Nov 2020 17:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604597239;
 bh=JVyaK2Bc+3BkcXl4M6uXDnBk+5oS5ZI21JmwYz628WA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o5B7FAL9v3LzHw6/5YkZUC5Xs79j+7XEW4Rg9fgEvOZSSKTEddHftksj49lvIG3cs
 L0J+ab7qIQzj24xDJTxFPr79AI6DGjV+a+NkpcR8qO4+4jgbvPXPAyi12TIJr9c283
 A48gsSZVckOf4u6j6PyJcm1hOf1FXNe958gP2EG4=
Date: Thu, 5 Nov 2020 17:27:07 +0000
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Message-ID: <20201105172707.GA4362@sirena.org.uk>
References: <7ede83e8d78414d8618e1044fd8fd11e8ed7a09f.1604544767.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
In-Reply-To: <7ede83e8d78414d8618e1044fd8fd11e8ed7a09f.1604544767.git.mirq-linux@rere.qmqm.pl>
X-Cookie: Sigmund's wife wore Freudian slips.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: lgirdwood@gmail.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 wens@csie.org, Corentin Labbe <clabbe.montjoie@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] regulator: debug early supply resolving
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
Content-Type: multipart/mixed; boundary="===============3289035867143320890=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3289035867143320890==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2020 at 03:54:07AM +0100, Micha=C5=82 Miros=C5=82aw wrote:
> Help debugging the case when set_machine_constraints() needs to be
> repeated.

This doesn't seem to apply against current code for some reason, git am
can't find the SHA1 it's based on.

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+kNeoACgkQJNaLcl1U
h9A8IQf/SlNkNhXB5bJvzN8QMoDCSxD82Zs4kyisWxTnEXVit+JxydCI4yHs9Pi6
+galPeEaMhHjRizn9RTmlEZ8o4QVEegPdyOcyEFBZWASpzDvLZImhZasgpNHB2n7
T1C5wASEAzkhSu9bW22KzVAEykxhb0EinforCVj3xTWEKJMZhZ+qL4W4pROO8vw9
AqHdVt2MSSWQEhiWnDRzW/qaei0cVPqx3NSi8i4SEyLJanuGV7tiyRA0uNbNlfXM
+Bx8gtrroqe0UyjDggaxPYxD+2VKDlsdjPkJBOsSRpa+0sMrMZnAgPZrmDOwJKqX
TzPE1V7bdMb+TGUDZxllugHj7siRCA==
=yHXF
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--

--===============3289035867143320890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3289035867143320890==--
