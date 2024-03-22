Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D539388712E
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Mar 2024 17:48:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D745C6DD95;
	Fri, 22 Mar 2024 16:48:57 +0000 (UTC)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC70DC6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Mar 2024 16:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=Ezxi
 fZ/NdoltWKmyiuN6imx75HAhf4NgVqu/1YvSeb0=; b=C5Ewx1W/xQ3t7Ny7X3wq
 1OaJ45FEPAkLMBSzdSgEzZ37WKuAp+iNFi7wdpgvolxjlFs5YI8R50J7U4LU1Onb
 c/bgsMRNiT47Vq/CQ/fvSzj7W+LjUfCJRY41x3yt+gopV7zbErpMsh7MwXZ40V3Q
 FZn1nDgS02CrbdF5ZPqlgid9ZOYuUVHnYqB542i4G/yIpEjsTQLPJ8kgTyfk+ShR
 HrcGrKOBhl/LLBnNpMcPLod1ozLcpM7Knt9Ho9sDxUGzbhXKvunqy+2j/lQFJ/2O
 8w/wX7B/pQJTkQe/IEYkvdWAyKj2EUlGd6rjmjcpN3jpm3GqlbnKFTPRztTh9pxu
 HQ==
Received: (qmail 3924065 invoked from network); 22 Mar 2024 17:48:55 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 22 Mar 2024 17:48:55 +0100
X-UD-Smtp-Session: l3s3148p1@YwRumUIUZNtehhtF
Date: Fri, 22 Mar 2024 17:48:54 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <Zf22dmwBpN7Ctk3v@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 imx@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
 <Zf2tSLJzujUHbJjp@smile.fi.intel.com>
MIME-Version: 1.0
In-Reply-To: <Zf2tSLJzujUHbJjp@smile.fi.intel.com>
Cc: chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-mips@vger.kernel.org, virtualization@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 asahi@lists.linux.dev
Subject: Re: [Linux-stm32] [PATCH 64/64] i2c: reword i2c_algorithm in
 drivers according to newest specification
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
Content-Type: multipart/mixed; boundary="===============1413436998113736937=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1413436998113736937==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gk90DgmVWePBMrYC"
Content-Disposition: inline


--gk90DgmVWePBMrYC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >  static const struct i2c_algorithm at91_twi_algorithm =3D {
> > -	.master_xfer	=3D at91_twi_xfer,
> > +	.xfer	=3D at91_twi_xfer,
>=20
> Seems you made this by a script, can you check the indentations afterward=
s?

Yes, I noticed as well. But other (not converted) drivers have issues
there as well, so this will be a seperate patch.

Thanks!


--gk90DgmVWePBMrYC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmX9tnUACgkQFA3kzBSg
Kbbr8A//XEXud+6wIKsFTjfvJagkwqlNQp4For0+4AnAo3VuIMv44faNDOSxB63k
K+vOfRi2HAVzhVrYUBQLf4thG+KXeX+7OXTO+HUwm81u+mdor/KfhPshTZfelzR4
Sn9yxlg5kv2BQ3uCiNdv/7iznbabfUZPtQb9BnqBCj5O3nq5k1+WJYnm/1FamL9y
M4h0p+yg14kIIMPV8fvDzWKHwQGsrEUcVMGLo7Nhj2tFai5yPJZCMzHpakzhVZQE
wWsnWISmOwkFScr8cI8K8I5IQ1u4+2gDSUK0egM/spTBPqLfGamRt0SeVJnYEQQ7
Owy4DrIPRiOITKuNc/DG6/+TeujZjLkyRuVwHbmP2woTVZcpc9pijAxzZDi8uQZg
2zDdXj5mwtQMwkc+YwfTjnyAA8P8tbiAFdXgBcxn5w/4/by3uM4EtZBCEGhjXyDu
8yTFnBzKNuNJJ3tiixvkB/GrTApip1rQ1vMxqZ706IMyPKXLQkJpbkBgVQ7vZtSt
3AHRdwSBxBYBupcBKOxK5hMQLceYqyLnTVwppS7Om/ey7MkrnEFuCYWhmFuDb5MF
5Tk6iReI6pt7T2lU/JNW9vWpkeMHDomHJ7T23RSMUmzQfsi4YvWFFJ87Yd4JRtrD
wpacw1VztKHA12REQNWJHMwslzINn556NtcsRtarShBM5Xboofo=
=euQt
-----END PGP SIGNATURE-----

--gk90DgmVWePBMrYC--

--===============1413436998113736937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1413436998113736937==--
