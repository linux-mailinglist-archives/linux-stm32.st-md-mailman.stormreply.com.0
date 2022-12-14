Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52ECA64CB5C
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Dec 2022 14:32:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECDF3C65047;
	Wed, 14 Dec 2022 13:32:27 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BDDB6C63326
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Dec 2022 13:32:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 43D94B81626;
 Wed, 14 Dec 2022 13:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B222AC433D2;
 Wed, 14 Dec 2022 13:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671024745;
 bh=MH89dE30fHEW9T6Oa4Zq7WWD3qJmqKbN+HrFHeVqGa0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gROYi2pCcBfsJRz2vgYRVSxAT+uujou8Kho151TO608zjks/78vyDHlhU2VoBjzWC
 gQt72/0A09av4cHS6mk+M+f8VaQp+4R7jcyzBJsL5+uf7kfOrJGIqgLjES90X+up6G
 V6Ddw+JMvaeb25fsUw+hYyVJIFyHHceWw+5TvPSA0b8O3SQttbgoGctdiEz/uteXqB
 7vpzZZ0hIaK+fWpMC2ah5vyDJi61/QcdxeH7Wg3se5XZIgQ8hTqwUbjjTW5z7pRX88
 DUWFn91dHTaHaoBa3FXZ7qA+jJozFrSXc7KDoSqGJhzuLqnLd/Jvpu/ta78HTxrJwZ
 Zinj7u0uXaIeQ==
Date: Wed, 14 Dec 2022 13:32:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <Y5nQYom7SsbFnir+@sirena.org.uk>
References: <CGME20221213113259eucas1p1c224898772bc5e59de90c1aa65a34de0@eucas1p1.samsung.com>
 <1670311341-32664-1-git-send-email-u0084500@gmail.com>
 <dd329b51-f11a-2af6-9549-c8a014fd5a71@samsung.com>
 <CADiBU39-FUD787RmV9Z+jsSrb2Se66A6FrLWGxf78q2Ud-SrjA@mail.gmail.com>
 <dc6c80f1-f34d-eaab-d561-32caa7fa140c@samsung.com>
 <Y5ipFd8BfU361QzN@sirena.org.uk>
 <be56fd97-08b5-8a7a-2630-371c83dcab18@samsung.com>
MIME-Version: 1.0
In-Reply-To: <be56fd97-08b5-8a7a-2630-371c83dcab18@samsung.com>
X-Cookie: I disagree with unanimity.
Cc: gene_chen@richtek.com, markgross@kernel.org,
 ChiYuan Huang <u0084500@gmail.com>, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, djrscally@gmail.com, hdegoede@redhat.com,
 chiaen_wu@richtek.com, mcoquelin.stm32@gmail.com, yangyingliang@huawei.com,
 ChiYuan Huang <cy_huang@richtek.com>, platform-driver-x86@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] regulator: core: Use different devices
 for resource allocation and DT lookup
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
Content-Type: multipart/mixed; boundary="===============1713398660831920539=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1713398660831920539==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FQkxBF8HaAaafbeu"
Content-Disposition: inline


--FQkxBF8HaAaafbeu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2022 at 11:23:01PM +0100, Marek Szyprowski wrote:
> On 13.12.2022 17:32, Mark Brown wrote:

> > Thanks for jumping on this so quickly!  Marek, are these boards (or
> > similar ones) generally available?  They seem great at showing up issues
> > so it'd be good if I could get them into my CI and spot problems earlier
> > (or something like kernelci.org would be about as good)?

> Well, they are quite old, but I've seen some used ones on eBay. Just=20
> look for "Samsung Chomebook XE503C12" (Peach-Pit) or XE503C32 (Peach-Pi,=
=20
> very rare).

> Getting it integrated into the CI requires a bit of manual work. You=20
> have to solder UART lines to the test points on the motherboard. The=20
> board can be fully controlled via so called Embedded Controller, what in=
=20
> practice means that you can turn power on/off by sending commands to the=
=20
> dedicated EC UART. The kernel console UART uses 1.8V, while the EC UART=
=20
> - 3.3V. Let me know if you need more details.

Ah, oh dear - I'm afraid my soldering ability isn't up to that sort of
modification.

> Peach-Pi was used on kernelci.org some time ago, but I have no idea what=
=20
> has happened to it.

I suspect it might've fallen off the end of the ChromeOS support window=20
and got pulled, I'll see if I can find out.  Perhaps there's some
modified boards kicking about that didn't get thrown out.

--FQkxBF8HaAaafbeu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOZ0GEACgkQJNaLcl1U
h9CWxQf/en9YwkNqoWhy3SMuNx5UdiC3UE/SUjy+OweHxP1Vg4uYfkWwo+DyZ1F6
x2U+wVmZDsAG4Sajt8r1xn3sMc4Mzm4By0pL2+k8dKlxtEEyvnJ1F3VimgNgACKk
NekHDfvbcxJgaDzP19XcLzHQNFJ3PvHTxr63S3zvr+b3cfPqx5NXcvhsG4YzNJrR
rjsOXYYPrulhvt5jpWdM+tTzpW5+xBuzCKDnoTg0yeQT/xnI+M9KBgCk1L4Os7kZ
FsHWf5yiut7mtfORGoH4E7YUvNgqXCfsL0shqwIHjuXPaPLRih1yu4p3ZYFU7rdf
oyshvv1XBLeguFobrvGxUxXwZE/yYg==
=3Ppm
-----END PGP SIGNATURE-----

--FQkxBF8HaAaafbeu--

--===============1713398660831920539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1713398660831920539==--
