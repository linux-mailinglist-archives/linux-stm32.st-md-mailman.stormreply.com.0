Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2D46A702
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jul 2019 13:09:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1143C7AB2B
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jul 2019 11:09:50 +0000 (UTC)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D738C7AB25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jul 2019 11:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GTNttLKfykU0fMB8TWGXww71EUURBDV6zbj9y9y9CVY=; b=Stdaqrb4Nzvjz4Bj7OxsqHHhD
 +Td7CdZOlzO+ek+Wlj1/FC/WJHeQ9gSPUYQBkEz/5sipVYr/hPyWPqlS7cSDQnO+iL3ns21zEDaGi
 3VvzwyAvDJ+Chvj8tqRy5yeKmx6ZrWTp1EMApgzMNqNyFnCUcN19Mpy6CuXjZ4JswoqRQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hnLKz-0004Sl-R4; Tue, 16 Jul 2019 11:09:37 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 9164A2742C01; Tue, 16 Jul 2019 12:09:36 +0100 (BST)
Date: Tue, 16 Jul 2019 12:09:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <20190716110936.GA5428@sirena.org.uk>
References: <20190715230457.3901-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20190715230457.3901-1-robh@kernel.org>
X-Cookie: May be too intense for some viewers.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-gpio@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-mtd@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: Ensure child nodes are of
	type 'object'
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
Content-Type: multipart/mixed; boundary="===============7201752264188988165=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7201752264188988165==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 15, 2019 at 05:04:57PM -0600, Rob Herring wrote:
> Properties which are child node definitions need to have an explict
> type. Otherwise, a matching (DT) property can silently match when an
> error is desired. Fix this up tree-wide. Once this is fixed, the
> meta-schema will enforce this on any child node definitions.

Acked-by: Mark Brown <broonie@kernel.org>

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0tsG0ACgkQJNaLcl1U
h9DgRwf/RVQwM4uJZfc77Bg1QUPRV93uCJ6maAGlUjFImP1U0fpoRuD/zNm5kiIp
hJhe5TMTX5ua+ajO5DV9S4HD4tRJBv5imHYgx7edGX0XnD6uBhO/Fx91okJhKb54
hmWEPpZyjursasR/A6HjQi6+OYEnCqrMoTenaZQZ/R7MlS8Z57C5m8slR9m1tSBp
xam5qvxG3pn5oNarJlCWF9VcVmZckekdU+qutRLVc3xH8bCF6pjfyR5E1M+qRJV6
av5KFLsTopgBECl4QPHGqIXqhegIjWyeqeMC69s7Nh8pDFpLIwFJfXd7x7UGStgS
RrPGZDcB2vfMfsXwQAGfu5lyMqkYJA==
=IEmg
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--

--===============7201752264188988165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7201752264188988165==--
