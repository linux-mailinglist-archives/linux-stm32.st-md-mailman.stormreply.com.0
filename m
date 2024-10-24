Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCD89AEAB3
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Oct 2024 17:37:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8414DC78F6A;
	Thu, 24 Oct 2024 15:37:14 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1702C78038
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2024 15:37:07 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4316f3d3c21so10606725e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2024 08:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729784227; x=1730389027;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SCnstNue4jg85kEIiyesGcA8Rnj9rjVX17h62wnrdHU=;
 b=Uzl2+4v3q75IWfJe5J7/LrSaVXT6qNgHgOQmdTy0SRkAprYH3Dr0AdSbi2eH0w1tVY
 Wi7NZMxiBtTYeyb+520IMWyx466qGc8OdpHuj03ZhV+qTV6p/XL/3AsJqg497ZPyMqFC
 Jz+m3Tkaz+cDgEO/gMTZUEjcKI19/fNhdnR1th+BQLPe+TtWN98i9RaEBKehH7KIfxIH
 LwVJxkVSxiGsBbnz+kP6c9rBedDCsAHaFs6Oo8ex1B90TwUMe0JNC5jpV11M7AKcuJdg
 yDiYPPmee1L+VhpgtrZB6s7T63fu2R9rzHi5P4v2L0S/ABzOB6unnEYDrSQ0ynt2c0ug
 fBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729784227; x=1730389027;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SCnstNue4jg85kEIiyesGcA8Rnj9rjVX17h62wnrdHU=;
 b=hU8lb27umV+jpE2Dp13cyOvvwRvl2mqqkp3eOEP2YUFuRBtNFNH3vM511TohVvdFuy
 K8nOwKPkiyTlgn9z3Vpco0zdDYcC48PuKHdwiqrE+ldzhIL49pYRDy0F/mEVA9WmHHZB
 rNMP1IHOgkhks4DLkTdEovPW0xHxfohDppYHFIgebijQZ7+K1KULp4zJ+T5IBI91pHCm
 1FoXO0ZiuNtKZ/W+Hrqm7qX4zAXK2cJ6BGck7+Djr4+1jsp5LGBCeuQRGfyORF85dGiB
 pwOFGGR+8ypwhB9tVNwzpg4Nw6Wuy48xnoLDHW+TPjax+gKB33r2dbV46+4LLRE1gZcl
 pyDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnD1Ngh+IUBAuH364CFDvOyyS8oODUVt1KM7AZrbO1PtO1XDro2WPwIrHZqZWWFo3yNN2mfmnlqFJvjg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz8vN4mj8OcKWJUGu57A3XaZwKnaDJUYqrgRDzetxxWizH6esde
 ILXD86XhcEq9VYawMIC7iavSzdETNLD5B1V07cXw6NWdPtAjKq/F2K8gIvqB/Ds=
X-Google-Smtp-Source: AGHT+IFgeY+AzYZbHlaVERgkGi+hHj+CdTnAXQEQObCERD5nPgI8ASENpM18NFTIk7TmUwfS+F2JOA==
X-Received: by 2002:a5d:60cd:0:b0:37d:45ab:422b with SMTP id
 ffacd0b85a97d-37efcf32d1dmr4378492f8f.31.1729784227087; 
 Thu, 24 Oct 2024 08:37:07 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0b9bd6esm11615236f8f.104.2024.10.24.08.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 08:37:06 -0700 (PDT)
Date: Thu, 24 Oct 2024 17:37:03 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Inochi Amaoto <inochiama@gmail.com>
Message-ID: <7lcmhspo5xq3numdbrfc44uqppbzigwq56vmqne5ldvg2uac6z@ivu4fmwbzajm>
References: <20241021103617.653386-1-inochiama@gmail.com>
 <20241021103617.653386-5-inochiama@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20241021103617.653386-5-inochiama@gmail.com>
Cc: Eric Dumazet <edumazet@google.com>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Chen Wang <unicorn_wang@outlook.com>, Jose Abreu <joabreu@synopsys.com>,
 Inochi Amaoto <inochiama@outlook.com>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 4/4] net: stmmac: Add glue layer for
	Sophgo SG2044 SoC
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
Content-Type: multipart/mixed; boundary="===============4273583423834368184=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4273583423834368184==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aoyw5qfx5gwdpipb"
Content-Disposition: inline


--aoyw5qfx5gwdpipb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 4/4] net: stmmac: Add glue layer for Sophgo SG2044 SoC
MIME-Version: 1.0

Hello,

On Mon, Oct 21, 2024 at 06:36:17PM +0800, Inochi Amaoto wrote:
> +static struct platform_driver sophgo_dwmac_driver = {
> +	.probe  = sophgo_dwmac_probe,
> +	.remove_new = stmmac_pltfr_remove,
> +	.driver = {
> +		.name = "sophgo-dwmac",
> +		.pm = &stmmac_pltfr_pm_ops,
> +		.of_match_table = sophgo_dwmac_match,
> +	},
> +};

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers. Please just drop "_new".

Best regards
Uwe

--aoyw5qfx5gwdpipb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcaaYgACgkQj4D7WH0S
/k4cDgf+KFa71VVkDyJF4Hl2zPHZr8uawn9uZBqgpPkeGPL2gMIgZeFsbW+Ta6tM
l9QqKp1U1+CNvJx+TsnkHz0XIwAAu4+jjjLogyLd9qAvydydl7UNfs2qqtiVklt3
QKX4PUt2WLIsjSSnXZ/xvPpcHmofvemuYZcQDgiEBlHaBn+GZjD9woBQgX79OZ3W
ly+IQUOVBFIqnkBG7MrskeBodS69Snv9OGEkKCxn4me2uqdlscBZVrjIQ2H4u1Q5
K+jcXjkffyRka8EVF/QuOu90nBixXNZGAa5d/H+Gt1siRRXt6Sgw/k7KSUZ8Kb7f
UZNlLZkw0L1To+cxy3Y5F23dBVqbMA==
=+aJM
-----END PGP SIGNATURE-----

--aoyw5qfx5gwdpipb--

--===============4273583423834368184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4273583423834368184==--
