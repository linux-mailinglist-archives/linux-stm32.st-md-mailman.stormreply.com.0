Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA615F2055
	for <lists+linux-stm32@lfdr.de>; Sun,  2 Oct 2022 00:35:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17784C6410B;
	Sat,  1 Oct 2022 22:35:32 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50A9DC03FC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  1 Oct 2022 22:35:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EC97260D34;
 Sat,  1 Oct 2022 22:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE036C433D6;
 Sat,  1 Oct 2022 22:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664663729;
 bh=QHtjGxNukiJwu0oawJAgooFJlE+Y/aXLBK7nhSgrAhs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JrFFFETGpEjfi651l/O+52K4N71srdJkg3W87uHSKVpIAO8YlPXYTiPqVpSwOZZB/
 k2bBF1P7h2P0458f8QlXWx8ibA6SZOC8IPoOq9POlpv+ArhLOeqPsagTkw29SmePAv
 ezdJHgyqHYhTTR3OcCNr1pN66fqhE70E3p1cRtgJQjyy1atzvQ39FBpXsMGspQz4wk
 /WqoVqF/Fnjmocsk44RBOs5WOgQMiQjK8GinhvLP4D8wCq8jVOp3aY3FnViNi5/fOU
 ZS1wxRmBbEY9RoqkygPjCMlHktTV5K++t03l80PSxve+rUkk3R5+htsD+9B9cUK1LT
 MJUo7mc2wW5qA==
Date: Sun, 2 Oct 2022 00:35:25 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <YzjArfungqpuNbql@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20220926204631.381702-1-marex@denx.de>
MIME-Version: 1.0
In-Reply-To: <20220926204631.381702-1-marex@denx.de>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: i2c: st,
 stm32-i2c: Document interrupt-names property
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
Content-Type: multipart/mixed; boundary="===============7525453922964639083=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7525453922964639083==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V2jIUGGddksmaOjh"
Content-Disposition: inline


--V2jIUGGddksmaOjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2022 at 10:46:31PM +0200, Marek Vasut wrote:
> Document interrupt-names property with "event" and "error" interrupt name=
s.
> This fixes dtbs_check warnings when building current Linux DTs:
>=20
> "
> arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dtb: i2c@40015000: Unevaluated =
properties are not allowed ('interrupt-names' was unexpected)
> "
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>

Applied to for-current, thanks!


--V2jIUGGddksmaOjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM4wKIACgkQFA3kzBSg
KbaZUQ/4k86xDRdWmc1OlDKuttQO7RLR4At8fzMJFEQ9eFEzDRJJRr+JhkuFMyf0
i5g/447EPZid0rJrUXCebtPRuWtUYNcqevggTjbsDYvR/o1EvT1lk/0wz8TXEuOm
NkslIGgzFXVeuFu0MN8/Y2XLLiPCOfk4cDa7ahHeEGyhnLtXIl8up0i0EUyOsBKN
ou5982rQ/91o5rSGJlFDarRiGjGtwR9fS0PghJwPQy2xmeBgMGyPYI3WjTVX6tuV
D9htCs0r+/mo0dbyp2JZqApWIiUwuOYpO2js8t1tEAnr0WcDpous8AM4Z1J5C6Y9
KODyqqbdhWlunvs99nVSAQmuGPdmph+ysV7UhqYoFFlglZMHipDzJBAMa+bLXs7m
UNf07D6//7cT4fFeT/Cyf2q7pjMbj6DXSbBQ+E1rO4tf1T8DnsJ+uhxWp7eqSLi4
/+4u0/iRNfl6xj8PiGJpdV/LKTzS4H11KN0m18VLf6F+w9jU2haIyF0X7GW38sUb
4uzm6TA5YY9sO5YGba1aE81U70ozs+O7RW1SjvDHREfsZKtOG5kNyNGZbFghJdXC
g+Sq4Ce98OXD7kLJQPsXjruE4FFGlySMac/4OabNtPyLbcK4KzYP/bvLUiqNpT7k
0dJVOW7tTnnLxa05YyJ2qbpxRD1cE1l6kgs3rYb8LG1lKqQzCg==
=hhIn
-----END PGP SIGNATURE-----

--V2jIUGGddksmaOjh--

--===============7525453922964639083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7525453922964639083==--
