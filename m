Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C59D85EBFE2
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Sep 2022 12:37:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A7BBC63326;
	Tue, 27 Sep 2022 10:37:12 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28F47C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 10:37:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A06ACB81ADD;
 Tue, 27 Sep 2022 10:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2825C433D6;
 Tue, 27 Sep 2022 10:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664275029;
 bh=4N6WKH/3dxI6M6RbsWDJhZfD/BEokUj4BWJv4Wu0EU0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AY+QpZ4QlPtYpboQIKabFDadUEpFguTdO83MQp1mdSnhFGEAicwIMUbjnk/xblaAG
 TB3D9tw+qhhQ6oTXmsgbJrKVOSYKR+JmtqgKnPg3AJR3Ua3E3urASywClIoUr3+IvK
 FNdW39AujXQjvfZ1o3aw0Yv83PsG8Stqe4j0j+dPNmLCW9HZUbLOoBOPLa4mScyngp
 w/FE0MT4n/zKw1YfHLrH706NQ2WI4R5bqr0uNdgfWI3swAlFdZ3YVweHGkSxEwpd1e
 zvlp9LxXN5h3yHaNaxNLHgGTVIH+T72BRnEYYkT9p20JUNAI8f9d4NcZ77GjFexeZg
 Cbmwfdr7eEDFg==
Date: Tue, 27 Sep 2022 11:37:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <YzLST/bYxqd0S/i4@sirena.org.uk>
References: <20220927002004.685108-1-marex@denx.de>
MIME-Version: 1.0
In-Reply-To: <20220927002004.685108-1-marex@denx.de>
X-Cookie: Vote anarchist.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: sound: st,
 stm32-sai: Document audio OF graph port
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
Content-Type: multipart/mixed; boundary="===============7516427815259670318=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7516427815259670318==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Du9wpDWt1y+c5xqH"
Content-Disposition: inline


--Du9wpDWt1y+c5xqH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 27, 2022 at 02:20:04AM +0200, Marek Vasut wrote:
> It is expected that the SAI subnodes would contain audio OF graph port
> with endpoint to link it with the other side of audio link. Document
> the port: property.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--Du9wpDWt1y+c5xqH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMy0k8ACgkQJNaLcl1U
h9Andgf/QmV0+vIA5bfdtCHk18ybF0TXlpGWK3K7FAt3k4uJwPybU+rISAH7EiHB
JkO5dhxqhmjhBMX4nKTAmZUkJKa64n68ZIyBxXgpVCiBa69HeWZYEMPSEW3lTfX6
RmdFdabCPxtGh+RUdU6rG+VtusMQ1maA6THru9KERBlCWSuQfjVINpIikbIMJ4YP
GdGga62WSKhUwivJy5JtpJCsfcfFHMiSwLRRYpHKzo5UpHkPMyn74LBxsslZ/v2W
jtyV0L39m6sR2Mk0UvYD3FdSLxgzHcNABgXXDn+iqr7t9C4W/EjEyQb/T6aj+7NN
BX+AbFS66KGjeJufKynzBTdxtBA2/Q==
=iQWe
-----END PGP SIGNATURE-----

--Du9wpDWt1y+c5xqH--

--===============7516427815259670318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7516427815259670318==--
