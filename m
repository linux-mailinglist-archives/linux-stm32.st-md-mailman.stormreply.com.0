Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 777F1A86F1
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2019 19:25:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33300C35E01;
	Wed,  4 Sep 2019 17:25:16 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 784B4C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2019 17:25:15 +0000 (UTC)
Received: from localhost (p54B337F1.dip0.t-ipconnect.de [84.179.55.241])
 by pokefinder.org (Postfix) with ESMTPSA id E42F02C08C3;
 Wed,  4 Sep 2019 19:25:14 +0200 (CEST)
Date: Wed, 4 Sep 2019 19:25:14 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: YueHaibing <yuehaibing@huawei.com>
Message-ID: <20190904172514.GA2602@kunai>
References: <20190904122939.23780-1-yuehaibing@huawei.com>
 <20190904122939.23780-16-yuehaibing@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20190904122939.23780-16-yuehaibing@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mans@mansr.com, mmayer@broadcom.com, eric@anholt.net,
 miquel.raynal@bootlin.com, linux-stm32@st-md-mailman.stormreply.com,
 heiko@sntech.de, amit.kucheria@verdurent.com, f.fainelli@gmail.com,
 daniel.lezcano@linaro.org, phil@raspberrypi.org,
 linux-rockchip@lists.infradead.org, agross@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-msm@vger.kernel.org,
 rui.zhang@intel.com, marc.w.gonzalez@free.fr, rjui@broadcom.com,
 edubezval@gmail.com, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, gregory.0xf0@gmail.com,
 matthias.bgg@gmail.com, horms+renesas@verge.net.au, talel@amazon.com,
 linux-arm-kernel@lists.infradead.org, sbranden@broadcom.com,
 wsa+renesas@sang-engineering.com, gregkh@linuxfoundation.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, wahrenst@gmx.net,
 mcoquelin.stm32@gmail.com, jun.nie@linaro.org, computersforpeace@gmail.com,
 shawnguo@kernel.org
Subject: Re: [Linux-stm32] [PATCH -next 15/15] thermal: rcar: use
 devm_platform_ioremap_resource() to simplify code
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
Content-Type: multipart/mixed; boundary="===============8797701070358756758=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8797701070358756758==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 04, 2019 at 08:29:39PM +0800, YueHaibing wrote:
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

I think for such straightforward (and manifold) conversions, one patch
per subsystem is better than one patch per driver. But this is not my
subsystem, so I'll leave it to the thermal maintainers.


--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1v83EACgkQFA3kzBSg
KbZOUg/+Jw+mcZ79x8rHt2nPfBEtW1lYrickXXODhze40rPG/rARNtQxdyBIRKOj
cl3g5q/PL2U0k4nrUuD3osCpUNceFye3A7o5eE81j8hSOBvwADNtAIPaIXenudHD
P8krbODpUIy3ifIf24cUnCMr6teo0CduolmrCpDlmd1LWJmRpbdY+sejDVi8qAzs
xJDN67R6O8lEDJSS0o63xXu4+ZSizqcfVQqlWdkTxc3wqHhdUXFLeCWH5Ow1RsbP
ArXyH7xGG9xQxkiKavZSxYciob3PqcvRdfDv4dNRgNpJFir+mxbJVpQ2IyKr/hyn
jYzzcz9sd02cXsxAOURY1OS7AhPUiRl5XZIhWR+0VRXwJhBTkpHh/Ro4RRgzMHCC
UnRZgonQvO50HpmC3IHKPjq2rvKYYAYF2kr+rTjAiXsT2ZgECU5nQRypkMPy3CX2
YdP9JnaDd7OpDw3+tvPRmbEpAkjcXK5QQp4vHnqaTrnaqyxbMVA6uRt68uSbNHIY
gkTny6PNBTAr/0scsb7xo481yPA0MOCeShSAj6Dvk0pagXrfE4AgWf1vLPbUieUZ
PrZ+0B6jIYMKswq8FVvwSvn+Jrk/RFvFOLFpiuCnWZx0kDz8BDVrkQrwz5NsNm7D
NNOQUh/6TBD6/1TLapgeH4dtXhje3qlv8OzuEYhnkwS4UX3HvAI=
=XQ0z
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--

--===============8797701070358756758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8797701070358756758==--
