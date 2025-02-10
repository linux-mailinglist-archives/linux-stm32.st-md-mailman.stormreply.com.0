Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 774F9A2E891
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Feb 2025 11:05:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22EE3C78F83;
	Mon, 10 Feb 2025 10:05:00 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0BE82C78025
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2025 10:04:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81F17442A5;
 Mon, 10 Feb 2025 10:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1739181892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AJb8bkauCDhTBOcu8X/HjYqi4iRH5JJNhU2FKZwS+C4=;
 b=djT9CY5JnUvFf4Rd2gWUzxSrpbB9MCYbNvoDPDv3FKOuTwvv6X4g3AhUpMHjJGjPo+jlpT
 AFI4rCoyH7VDsFmSSLDgWxOvgrTa2MXWWNcxzHtFjeExYlOp6L2k+rBjgelQmnk/g0zQtD
 y0ICAmmzdAoNV28D6kuxTkA25Xcy9ZH/UsaVbVUDFwQO9cIgrcxLYnogyAsCzKhoJEXSLU
 vQZB2QqhFD/u3H3VrVOvEFisMee4/6do/wEPOBW8Tgc1aWrDkzNSBMedbrFWSSSLvzM9Sc
 5cKP5ReoDV39Zvz/uAhIBDkwUs8i3D7b9cslvpUazE6Cq1A+/fEweUAhsoDVJw==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@outlook.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Jisheng Zhang <jszhang@kernel.org>,
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 Simon Horman <horms@kernel.org>, Furong Xu <0x1207@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, Lothar Rubusch <l.rubusch@gmail.com>,
 Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>, Inochi Amaoto <inochiama@gmail.com>
Date: Mon, 10 Feb 2025 11:04:40 +0100
Message-ID: <5868742.DvuYhMxLoT@fw-rgant>
In-Reply-To: <20250209013054.816580-3-inochiama@gmail.com>
References: <20250209013054.816580-1-inochiama@gmail.com>
 <20250209013054.816580-3-inochiama@gmail.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefjeejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkjghfgggtsehgtderredttdejnecuhfhrohhmpeftohhmrghinhcuifgrnhhtohhishcuoehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieekkeffvdeugfekjeegfefhvdetuefhtdelieduheeileduledvteelgefgffffnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehffidqrhhgrghnthdrlhhotggrlhhnvghtpdhmrghilhhfrhhomheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefkedprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtoheprhhos
 ghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: romain.gantois@bootlin.com
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] Re: [PATCH net-next v4 2/3] net: stmmac: platform:
 Add snps, dwmac-5.30a IP compatible string
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
Content-Type: multipart/mixed; boundary="===============6353665220432535861=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============6353665220432535861==
Content-Type: multipart/signed; boundary="nextPart6136790.lOV4Wx5bFT";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart6136790.lOV4Wx5bFT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 10 Feb 2025 11:04:40 +0100
Message-ID: <5868742.DvuYhMxLoT@fw-rgant>
In-Reply-To: <20250209013054.816580-3-inochiama@gmail.com>
MIME-Version: 1.0

On dimanche 9 f=C3=A9vrier 2025 02:30:51 heure normale d=E2=80=99Europe cen=
trale Inochi=20
Amaoto wrote:
> Add "snps,dwmac-5.30a" compatible string for 5.30a version that can avoid
> to define some platform data in the glue layer.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../ethernet/stmicro/stmmac/stmmac_platform.c   | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c index
> d0e61aa1a495..8dc3bd6946c6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -405,6 +405,17 @@ static int stmmac_of_get_mac_mode(struct device_node
> *np) return -ENODEV;
>  }
>=20
> +/* Compatible string array for all gmac4 devices */
> +static const char * const stmmac_gmac4_compats[] =3D {
> +	"snps,dwmac-4.00",
> +	"snps,dwmac-4.10a",
> +	"snps,dwmac-4.20a",
> +	"snps,dwmac-5.10a",
> +	"snps,dwmac-5.20",
> +	"snps,dwmac-5.30a",
> +	NULL
> +};
> +
>  /**
>   * stmmac_probe_config_dt - parse device-tree driver parameters
>   * @pdev: platform_device structure
> @@ -538,11 +549,7 @@ stmmac_probe_config_dt(struct platform_device *pdev,=
 u8
> *mac) plat->pmt =3D 1;
>  	}
>=20
> -	if (of_device_is_compatible(np, "snps,dwmac-4.00") ||
> -	    of_device_is_compatible(np, "snps,dwmac-4.10a") ||
> -	    of_device_is_compatible(np, "snps,dwmac-4.20a") ||
> -	    of_device_is_compatible(np, "snps,dwmac-5.10a") ||
> -	    of_device_is_compatible(np, "snps,dwmac-5.20")) {
> +	if (of_device_compatible_match(np, stmmac_gmac4_compats)) {
>  		plat->has_gmac4 =3D 1;
>  		plat->has_gmac =3D 0;
>  		plat->pmt =3D 1;

LGTM

Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>



--nextPart6136790.lOV4Wx5bFT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmepzzgACgkQ3R9U/FLj
286J5g//fmDyVJafzX14tHwfj8aI+uwgNu7ZJxduC9DnxnYWy+EN+dby2S6/rlPN
T4ypshgRrmYqPoji5FJKurYu3LHwUE/V8N2z06jexZaWXA8/VW+aNUkHoIbyHHko
fYFD4Op0fKrWBGBHR+Hj8qJv2QbWFBc8vo4Swzk3PjbzLTx36g3gFWb/CUkP569I
12TrG1wPA0ZBtugewKlLSdXOFVtDqsh0mTfCpQ8dsRjTc4TrVrcFDaxIW1aENksw
0SIncY9LUMPnCW+IHHB7E8Ln6y84/ipUGsySMvtUOg/cnobji2ehcScRVh+QpuZQ
L/P1dWf83kE5M1Kll9HPhs0R1qtrK2bWAaBamcDl79AW6c+4MPdBPxk9gaQmMuov
/tiHVI0LagpoFV+Y/hXy7mMMRmqLAhlwwkmNiJuzYPnBJOReYcJ5kJ4QvCr+n0I9
YQ+zLGBWxvi0aQk8p+qh8a6VZ+8I1aGmjGDluy9M+7f1wl1Rj3RMOOL8G86M4ZxD
BnbNszU+FrI1fZObie8NsvvQwunu/bJcR1Mhn9RcyVcc/b6bIpAekcjcctz07P7B
KWTz8PjEv0dHTX7k40Lr9GhZjKIQeVR3YMCNjzqvANzcCeEcSnnIY/r+U/hpK5jp
ShGT0E6pno6LqL/YVkx+G1N/T736ljcC/BCLeQvGusrPc6Md3Aw=
=KCpu
-----END PGP SIGNATURE-----

--nextPart6136790.lOV4Wx5bFT--




--===============6353665220432535861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6353665220432535861==--



