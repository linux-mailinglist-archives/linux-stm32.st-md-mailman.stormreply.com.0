Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2723D81C876
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Dec 2023 11:45:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2D28C6C841;
	Fri, 22 Dec 2023 10:45:42 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8305BC6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 10:45:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 800F861BAC;
 Fri, 22 Dec 2023 10:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B0FC433C9;
 Fri, 22 Dec 2023 10:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703241940;
 bh=QjenKszVnxW19P9qm+vCaf2vsR+u42Hmz70A3f7Ircw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=plZeel0CDn+GDpO7sYmPmXPFRcCxjWtyRlYZ3Pf/LXJxiv/ZpZRg4UnGIFMoByY8L
 m3N6NUI5rR3RxA/s6wygvE3Nb93NlCsuSLaX7g8JPWVhFvTWH0jDFWP5KfxXes3W7b
 nUBQP881GyHXJWCbN5xK9r5Ray/EqPIrsyJkyp9mlZS/5/5SecSCORlbuPw+ExIoWq
 Wy+pgZoXCEze7vvn04k5vhV2Wh32RXis9o+Jftyc+QNuXmgSFOX9wnuWwU43q8kBpd
 7h+MY88ZhTKPejo8SKVSbniJjky42mbfQTQynN4fuGseJioFxwtechsHx8AcIZhCmV
 Pce3IOsmyUv1g==
Date: Fri, 22 Dec 2023 11:45:37 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <ZYVo0X1q9w19qTwg@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Conor Dooley <conor@kernel.org>,
 Valentin Caron <valentin.caron@foss.st.com>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231215170617.95868-1-alain.volmat@foss.st.com>
 <20231215170617.95868-7-alain.volmat@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20231215170617.95868-7-alain.volmat@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 6/9] i2c: stm32f7: add support for
	stm32mp25 soc
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
Content-Type: multipart/mixed; boundary="===============8008910757623483502=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8008910757623483502==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gW2s4LrwYHnx5p2E"
Content-Disposition: inline


--gW2s4LrwYHnx5p2E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 06:06:10PM +0100, Alain Volmat wrote:
> The stm32mp25 has only a single interrupt line used for both
> events and errors. In order to cope with that, reorganise the
> error handling code so that it can be called either from the
> common handler (used in case of SoC having only a single IT line)
> and the error handler for others.
> The CR1 register also embeds a new FMP bit, necessary when running
> at Fast Mode Plus frequency. This bit should be used instead of
> the SYSCFG bit used on other platforms.
> Add a new compatible to distinguish between the SoCs and two
> boolean within the setup structure in order to know if the
> platform has a single/multiple IT lines and if the FMP bit
> within CR1 is available or not.
>=20
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Applied to for-next, thanks!


--gW2s4LrwYHnx5p2E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWFaNEACgkQFA3kzBSg
KbaoKg//cIf0sRmkSwiPwi3Vba09BJKXqrH9/uMfduP0Rr0B4WnUp6EnVNsKCrji
2ZWMtbXr5PobpUeKSIg7J0J46gCwYujIGu8uhpw4EaO9JcNZoYWjtdrdeJTXM8fN
c9zdIHe2FzMWVFqQKK8EymudivlSoKWJQq3zkrzjKkUKFU7f0fG1PQx6DS+isXVD
Zmnf0sUrKq2xCT5c/B06EuXawzkulolf2iymqFaU/WSGHY0vK6lj+JDlZrrm4ta3
r/chFdDGNdRQvoqdv+IBjGDhPnxrRlsBXdBOHUJbZCz8Gf9ROx8HZ5yOMc9AjVO4
kvJrmXiUEnwnCzd94hU3geEutPsQLdGBwMsywHXwBXuzMOYEg9yLBHJJJSbsI3kK
n1OF55sI26F4nReHHVCT03AiHrpyyLZvmCJu2Xa6V1gYWKUxNOncWFFFkee40Qcg
il4HUkRpCTjl+wFHvATVjj6/M8qvNaQQfiDY68Mk2t694CR7eDEvbiRKskukPitM
wHJgMP8o7jCSPxGgjdaR1ZUuGCcKf9tXtX/3WCV3FRg45aAKveZJ9BH6uOBuWJfN
JrnJzft9qzvUs6rmIBwrXcmcRFlEZxp173oQHJjnnkDN5ULUpJKJw9+zZFEofqdm
i1JySSKElQsjzSKPPR6dejvhn1nMayRlC8f0gOrvRprRLM4wAAo=
=vmW5
-----END PGP SIGNATURE-----

--gW2s4LrwYHnx5p2E--

--===============8008910757623483502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8008910757623483502==--
