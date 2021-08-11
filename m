Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F5A3E9297
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Aug 2021 15:26:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D5FDC5A4CD;
	Wed, 11 Aug 2021 13:26:20 +0000 (UTC)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FF87C424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Aug 2021 13:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=k1; bh=fHSX0vPbRfacShDGjzOH0plzFkRt
 V9grWotu/WWmi8g=; b=Z3JiJRLSL7RHQwKo7bizR3HPrr81Az5pOeg7P9xG9LHy
 c9/dnOj5sTEX3OwEbXKB2yCxE0oBCR7L9XivHiMXQ9I8CNJn5O/qfPvcWswJQgk0
 oVAfqrTM8C/puxROBoYKb8gkwescEiK/0Ej2d8mOmjWRWTFivrjgqiQ8/PQCZvY=
Received: (qmail 2665231 invoked from network); 11 Aug 2021 15:26:18 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 11 Aug 2021 15:26:18 +0200
X-UD-Smtp-Session: l3s3148p1@w9kzkEjJ+p0gARa4RTP4AfHKOCm/nqrR
Date: Wed, 11 Aug 2021 15:26:17 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Message-ID: <YRPP+f1tZXVSJ0Tb@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20210623095942.3325-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
In-Reply-To: <20210623095942.3325-1-wsa+renesas@sang-engineering.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/7] i2c: use proper DMAENGINE API for
	termination
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
Content-Type: multipart/mixed; boundary="===============1103764813076843311=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1103764813076843311==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TcI5yjMXB98ejYbA"
Content-Disposition: inline


--TcI5yjMXB98ejYbA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 23, 2021 at 11:59:34AM +0200, Wolfram Sang wrote:
> dmaengine_terminate_all() is deprecated in favor of explicitly saying if
> it should be sync or async. Update the drivers I audited.

I applied the patches now, except for i2c-rcar and i2c-stm32f7 where
this approach can't be used because of interrupt context. I will check
for i2c-rcar how to do this properly and Alain for i2c-stm32f7 and we
will resend then.


--TcI5yjMXB98ejYbA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmETz/kACgkQFA3kzBSg
Kbb/LA/+IwP6xJ0aVBJFXMzV4oywUhWP+AtDF9TkLjiZuZKyoSvx/oJtJbeskjkT
6/Bz6ASA6rnltX0Nfu8K0YICSjGpUp1N7Nl/KeLNIRtlKDJDxzG5p8YF+gJ+Sket
uMD4x2W0Wend8ifHBk5DOxrGX2wjnIiPzhZBnukZdkx1TuRjGpS4/k2at6jK/Bvr
W3+jK4ydWsYSe6tzAYK0fa9ZY8+6RjVN3HFcY53qzYerVVNIb8LzlUIOC6DgW4g2
xD8qkddxWzD25pveh3RnJgwAlOwrfKaz+yj6dxR6BMjxD9vEM2NdIBLHIPGMqPfs
9Rf7koS4MO2H4GAQoWp6zPPChEczk1cpjmGpLstj/woS80EEMG9EYvyRw62BBPkL
HZJ0RbYxjG5ckJIXkWtEDA/S65uoMnSm1j3nJPMbfsWSspuqY9hR2YkGJzLcnO3A
HfXVCg3OyjMhQYZulQ7ynlNRltxhp25fk7JTKPo66MV0DJuO+6lJXtMAaO63GALO
l7uc4JopNWGK8QBkCtACyNnpXAsO/BnsE0KmSrjSsK+QM1Q/qmKHj4CyV0PYj/hX
k8z4EjR88vVYSxzBIdqDJq/368behrlBa2kafUqrfLM9QSLgYmWhHUkOWXo+AzWV
EMJ7EUSxuMO2vo93QNmb8Zwn89z33m1HUBl5o5Zd0+qjy5d3T98=
=JYQZ
-----END PGP SIGNATURE-----

--TcI5yjMXB98ejYbA--

--===============1103764813076843311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1103764813076843311==--
