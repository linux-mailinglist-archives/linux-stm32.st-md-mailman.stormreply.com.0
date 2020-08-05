Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 465AB23CA18
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Aug 2020 12:59:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 125D3C36B3A;
	Wed,  5 Aug 2020 10:59:58 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4747C36B32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Aug 2020 10:59:56 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0A9C022B40;
 Wed,  5 Aug 2020 10:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596625195;
 bh=uziuqXCitzn0yn3qcVqQktbrIktU/bdFnWIvUXG2d1A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JbMQoHTPo85qCfSbIxmgRbiP8VmVogdCuCkgmhfUc0VRYTty0OcrgsXe9VjbqzVdw
 AnOvnnkCp11BEtbHm44+ShvXz+ERCpXbKUN9sZMoZ+DseMUZBIX4Mvas3w7p5gvWXy
 qknPK8+AgzU2F0zcd/SXOiCLyI1t+IzYlAQ/0tOs=
Date: Wed, 5 Aug 2020 11:59:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200805105933.GF5556@sirena.org.uk>
References: <1596610933-32599-1-git-send-email-alain.volmat@st.com>
 <1596610933-32599-12-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1596610933-32599-12-git-send-email-alain.volmat@st.com>
X-Cookie: Fast, cheap, good: pick two.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 11/18] spi: stm32: fix fifo threshold
 level in case of short transfer
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
Content-Type: multipart/mixed; boundary="===============8443842401924053832=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8443842401924053832==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qp4W5+cUSnZs0RIF"
Content-Disposition: inline


--qp4W5+cUSnZs0RIF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 05, 2020 at 09:02:06AM +0200, Alain Volmat wrote:
> From: Amelie Delaunay <amelie.delaunay@st.com>
>=20
> When transfer is shorter than half of the fifo, set the data packet size
> up to transfer size instead of up to half of the fifo.
> Check also that threshold is set at least to 1 data frame.

This looks like another fix which should be before any new development.

--qp4W5+cUSnZs0RIF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8qkRQACgkQJNaLcl1U
h9D1Qwf/XK6Jhnh2m7+idtrH3vBpQSfYJ4/Gm+BchdfooNE/YEdndCoIkP/ZFbTq
HGasfDFqk0X+nnOBMxzvPKpSUPWYbqQd7dqb2Iak+JjLS3qKSxME/QPUQHrTwhzR
DvWFLzhLULQmUvkbvzqPnRuLYjhmRRYEjLXZJ6ZJrm3uJvqkguuDqW5F0yEFlXoh
JQSSVPe8qnb7Ok2+MUnATsFMuhlolzIYxKKgGp0MDgQxY+nBcwXcUG2UY+KZfFeD
OaG3oMz44hY1wkKWaJUa81qQMpLHl5yAU6U4ELbAYJeipCQ+uint7lh8eY9uoR1N
oISq56SrksDEpi1gC50Hs8XacwcRcA==
=HRmL
-----END PGP SIGNATURE-----

--qp4W5+cUSnZs0RIF--

--===============8443842401924053832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8443842401924053832==--
