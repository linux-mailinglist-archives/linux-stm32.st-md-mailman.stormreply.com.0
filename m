Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 398F4AACA7F
	for <lists+linux-stm32@lfdr.de>; Tue,  6 May 2025 18:09:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB01EC78F72;
	Tue,  6 May 2025 16:09:49 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6309CC78F69
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 May 2025 16:09:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 27E4D5C341F;
 Tue,  6 May 2025 16:07:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E07C4CEE4;
 Tue,  6 May 2025 16:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746547786;
 bh=1AqPf7T899io12qypJ/mms7Lr5Nr9wni8SyAes9z2vI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YL0jVWeOd2s74qnpkynu5XmWmK16ssceH5qmopx7m7dxOJjOXSGUQtCPBNOg/Oz49
 37dOweLLtPGvzHFhP+6u+7eHmpivki9joZPtkhirZHDMeNjuQyhQbr+e/jkn8GnpHL
 TLHcsZHUT3aRldmvNpMFP0hs5lL7lANiKIWvORQxCMJtTPM0s+xwtlsl6VxPr8NmA1
 LAG7B1VWtaDuWebv5PobKgCo/GNw6wioQ88wuRnMyF03mX7nPj67mGqA3YEio7dSxv
 8AhnvEk/ymk50+DUDPBY4alQGcZgnHxsOM8xy8plh/m8ZOhsf1cMSiydJsWprsfanM
 Bp/pw8/P9aN2A==
Date: Tue, 6 May 2025 17:09:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Message-ID: <20250506-tidings-backless-99cfc65a2ab4@spud>
References: <20250506093256.1107770-1-inochiama@gmail.com>
 <20250506093256.1107770-2-inochiama@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20250506093256.1107770-2-inochiama@gmail.com>
Cc: Longbin Li <looong.bin@gmail.com>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Guo Ren <guoren@kernel.org>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Chen Wang <unicorn_wang@outlook.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 sophgo@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Han Gao <rabenda.cn@gmail.com>,
 Lothar Rubusch <l.rubusch@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 1/4] dt-bindings: net: sophgo,
 sg2044-dwmac: Add support for Sophgo SG2042 dwmac
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
Content-Type: multipart/mixed; boundary="===============3335760922652301505=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3335760922652301505==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xnhOoqcIxXVoDYDg"
Content-Disposition: inline


--xnhOoqcIxXVoDYDg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 06, 2025 at 05:32:51PM +0800, Inochi Amaoto wrote:
> The GMAC IP on SG2042 is a standard Synopsys DesignWare MAC
> (version 5.00a) with tx clock.
>=20
> Add necessary compatible string for this device.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Tested-by: Han Gao <rabenda.cn@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--xnhOoqcIxXVoDYDg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBo0QQAKCRB4tDGHoIJi
0uzcAP9AXEpRJB9kYjvwkSr1RxOOhB6kQeDj6R9Xa2LcbHBQOAD9FXI/OFWlXOrQ
PME/DZ4B5w9p7Kbs85bcMHB0v6+2zAI=
=rLmY
-----END PGP SIGNATURE-----

--xnhOoqcIxXVoDYDg--

--===============3335760922652301505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3335760922652301505==--
