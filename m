Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D495839507
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jun 2019 20:57:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84C99C6EADE
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jun 2019 18:57:36 +0000 (UTC)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D680C6EADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jun 2019 18:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7YyENcgYWnUWI0h+gXa3lXdPcIrCG64rkMR0qaxWefQ=; b=ijjX8AWy397IdifJa14T0D/YX
 BkXzDVhOp95Tx13tZjLebfD1hROXcd8FgYT5w6FrrMVX5g50APbN9HlO+DU2oj4+jHhK6ljdqeRWg
 3Egtq8SlTs5zgoZ8fZsJfi6AE5qQX5amn5S4BrEICT4xNuyJxzgfzfNHeOmG1u089SiLY=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hZK3N-0003f5-6I; Fri, 07 Jun 2019 18:57:29 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 7BF8C440046; Fri,  7 Jun 2019 19:57:28 +0100 (BST)
Date: Fri, 7 Jun 2019 19:57:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Message-ID: <20190607185728.GJ2456@sirena.org.uk>
References: <ff457774d46d96e8fe56b45409aba39d87a8672a.1559933665.git.mchehab+samsung@kernel.org>
 <effeafed3023d8dc5f2440c8d5637ea31c02a533.1559933665.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
In-Reply-To: <effeafed3023d8dc5f2440c8d5637ea31c02a533.1559933665.git.mchehab+samsung@kernel.org>
X-Cookie: The other line moves faster.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Jonathan Corbet <corbet@lwn.net>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 17/20] dt: bindings: fix some broken
 links from txt->yaml conversion
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
Content-Type: multipart/mixed; boundary="===============8895478866222845957=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8895478866222845957==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hEaoa1KyNVzF3lFU"
Content-Disposition: inline


--hEaoa1KyNVzF3lFU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 07, 2019 at 03:54:33PM -0300, Mauro Carvalho Chehab wrote:
> Some new files got converted to yaml, but references weren't
> updated accordingly.

These should probably just be sent as normal patches rather than tied in
with the rest of this series...

--hEaoa1KyNVzF3lFU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlz6s5UACgkQJNaLcl1U
h9CF/gf6A8YyjbtWR9vuIU+hiuuPGNe8l/3mKrBQmFg2nEkOiWE+N7jc0/RT0WYy
PdT6jbc6Cwn5mJJ6fqF0h32OgglLotXMlY3ZtBPiTYfgyfXYLDw8717VzdoI3BBq
AAprBuCMcg0qZJLD5pYXpWCO0cMo0YZU9dRMIFYeuw/U3RMw+oCd+mf38tXh5kce
dFFdfcmYNcxsRyICaJl42uB5swb46QAtSo+9HiOLhTQy3kMJuBVAoKjG9OjVbgNX
w9xYiPp4+6GikQO7Vl+901wH80kUHNSaZYfiTUfssYQHaorIrdRYZCd2RfmK9NO7
LeseTuJ18aBVgxKkqDEkks1EQqQrEw==
=sF8P
-----END PGP SIGNATURE-----

--hEaoa1KyNVzF3lFU--

--===============8895478866222845957==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8895478866222845957==--
