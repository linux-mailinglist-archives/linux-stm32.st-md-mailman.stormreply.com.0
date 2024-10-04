Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95881990220
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Oct 2024 13:34:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E289C78023;
	Fri,  4 Oct 2024 11:34:17 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3BD8C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2024 11:34:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4BE22A44880;
 Fri,  4 Oct 2024 11:34:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 095C0C4CEC6;
 Fri,  4 Oct 2024 11:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728041648;
 bh=BSt7pD/uHnmbG4TAw0/afpFk8uU0Xb6rNz8OZmmN8M4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yqosaen8ySsoE34KsMOb9JcKkG3i/rKqABx9gHqLs/8xEgAcGwa89+zfYHaUuAo8w
 D2BFQfOBS+hKn83pftifHdnFd4UlHvMeSjYgupLYDI8LYNS3j8T68rncrFQ3USNZ0+
 YZHYKMiIpx9Vl5Elb+fQphiRbWvKs2Z6JZKDQo77kt3ZB8DspMPPxayi1wLt6E6Q48
 Jj4+2mp3sjM6Bw3m0uGlAUBAf449DzPeIBD8JKZ2jQhc+EAUfCADIilq7DcfQtM8sc
 f4Vr3jafhCNdE/GsD9kCTNCE2NwEeT0WveX2VU4bAMy0eOhawgoUOTd7rZYMPjskHp
 AM8ZJ1aq/KzoA==
Date: Fri, 4 Oct 2024 12:34:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Message-ID: <a8e2a4d5-32c3-4324-b3b1-33a3fab33ba9@sirena.org.uk>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <20241004094134.113980-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20241004094134.113980-1-sakari.ailus@linux.intel.com>
X-Cookie: A bachelor is an unaltared male.
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 37/51] regulator: stm32-vrefbuf: Switch to
 __pm_runtime_put_autosuspend()
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
Content-Type: multipart/mixed; boundary="===============0736720968341696402=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0736720968341696402==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8gHlvMQtSYqLpBEQ"
Content-Disposition: inline


--8gHlvMQtSYqLpBEQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 04, 2024 at 12:41:34PM +0300, Sakari Ailus wrote:
> pm_runtime_put_autosuspend() will soon be changed to include a call to
> pm_runtime_mark_last_busy(). This patch switches the current users to
> __pm_runtime_put_autosuspend() which will continue to have the
> functionality of old pm_runtime_put_autosuspend().

You've not copied me on the rest of the series so I don't know what's
going on with dependencies.  When sending a patch series it is important
to ensure that all the various maintainers understand what the
relationship between the patches as the expecation is that there will be
interdependencies.  Either copy everyone on the whole series or at least
copy them on the cover letter and explain what's going on.  If there are
no strong interdependencies then it's generally simplest to just send
the patches separately to avoid any possible confusion.

--8gHlvMQtSYqLpBEQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmb/0qsACgkQJNaLcl1U
h9C3kgf/QL2Cgtho9EffzZ+ti5IfCaJLE8iANdU2XiYohAwCrtqNj3xesut8g04C
vUqhuR8s+ts2ay0vo/zsj2bLLvF88hIHQMUTNZkggYRLNxode6Mb1c6gXP3PZ8Ma
lffEbnwqwMkQxETdPbHHZe8MMcYYV5A2JXkKEmstEgIpiugsZI+j11giQZuku1va
llLHktGJuD8sw8PnohHbulfK1GxVsCHjSJwCO3KCgbAV3OPLtZu38VqxucVzP8tE
A0thoP3fkl1iBrE1eGFbGHMNmkhqNaegdTzFy6UxFklm0ipfjAF5RTajPWpZA7Gv
5d88zvZcBJOIRPQYEIxqchQqQJfrpg==
=5Ttn
-----END PGP SIGNATURE-----

--8gHlvMQtSYqLpBEQ--

--===============0736720968341696402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0736720968341696402==--
