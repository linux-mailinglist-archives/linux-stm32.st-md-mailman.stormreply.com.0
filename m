Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBBB899864
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Apr 2024 10:48:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96998C6C83C;
	Fri,  5 Apr 2024 08:48:43 +0000 (UTC)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8023CC6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Apr 2024 08:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=D3bA
 ysj0N+3ktsukYn/zGLisNXUDp098hBJ07HyHzKc=; b=R8T/4zsl0Zd0dNbaommC
 kCLTauMRf6yuGZlEbnNrPo+sDuLbN4s8BfD2QtEyqFV73GtOSagiQmnkLEuHWGCQ
 vRejlIPlKU/mYMv+6t8UkEAMEtwYdgwHTAQorcdRr9Ope6KAX7AmqTkxF537SxfY
 hbp2DrU8wtJm0oExDm1ozx0tnjR+RM/n3EJ7Hxedj1A/sxIF9bIEt0Q6uqjDDZO6
 DhN5dSoCZRnlewvb/Wq/ACyPQ8GtSN3yttgw0BjHvy2Oz86yt92QQcC0xPBJXssA
 1OMpCVAZHpK9gwh4XkivjtbsyOTJWxSQAZ6QWGsn2F7XdFdDJmCqNTrRYM5kOmvv
 nA==
Received: (qmail 4044863 invoked from network); 5 Apr 2024 10:48:34 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 5 Apr 2024 10:48:34 +0200
X-UD-Smtp-Session: l3s3148p1@j8VihVUV/oogAwDPXwEGAANOsN0UmmrN
Date: Fri, 5 Apr 2024 10:48:34 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Message-ID: <kd2gnsosi5xar3mwc3zz7wqtqkfgicq3wical5ch34sbmlgegk@mb2c2hxzzoi4>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
 asahi@lists.linux.dev, 
 chrome-platform@lists.linux.dev, imx@lists.linux.dev,
 linux-actions@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-omap@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-rpi-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, 
 openbmc@lists.ozlabs.org, virtualization@lists.linux.dev
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <ug266trshvhhbsln3eoh53fmsuj3l63ziz6gavcl7rv2jhjr5t@3av5givh5n7m>
 <j2l7tu24itjelylrgwe6gdsy3mfrw3dnve4rdofmri3z7xdroc@se56t5ylmdak>
MIME-Version: 1.0
In-Reply-To: <j2l7tu24itjelylrgwe6gdsy3mfrw3dnve4rdofmri3z7xdroc@se56t5ylmdak>
Cc: imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 linux-mips@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-actions@lists.infradead.org, virtualization@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 asahi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH 00/64] i2c: reword i2c_algorithm according
 to newest specification
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
Content-Type: multipart/mixed; boundary="===============5018993907798235727=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5018993907798235727==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c5kq2kdwqrnl4eet"
Content-Disposition: inline


--c5kq2kdwqrnl4eet
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andi, hi everyone,

thank you for reviewing and waiting. I had a small personal hiatus over
Easter but now I am back. This series needs another cycle, so no need to
hurry. I will address some of the review comments but not all. The
conversion (and API improvements) are some bigger tasks, so
inconsistencies inbetween can't be avoided AFAICS.

I'll keep you updated.

Happy hacking,

   Wolfram


--c5kq2kdwqrnl4eet
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYPut4ACgkQFA3kzBSg
KbbwnxAAtFWKOWnU/VyFFeZnqQCgQ76FzO93xERcjysHlgnZv3BnA6UpxFnrHrs4
Cn7RTWa0i9Ct1ns2AkkjOQ5rUIqczF7M2dVS0tqODwyazGPaDHYtsa3urfkCsLT7
Gz0y5V+oHHUNj1hypkKtQ37/7iFSYbo5oryt9MFK6eFfs878jel/4BCGJk3SEa48
ewNnEuM8aYfzlrn7/VbkWqHkCS5J6x8/VFk3PjlxgEW45UtEI3r30K6/jT9HOdx4
6lCofEZKn4Bl0VbfJJ7MXd1Be2/Dk6ZaY09e97iAKt2+fM1OLrBwig2V8PAdV7ei
LlHolA153CWJAAkzXE2bJsr252IuCLpVpZobTSQRfr+u5vVV354dfo2ek11R8iff
DSr94kqdKVvOvegpxt4vyHUxQrfy70R9vlkgVhkdvdGbi3JfLeiCK+C+IcBZlbXr
uTaPlNvOt6p+VJNAlucnKQF3mK0FvVMK7bTwqjbKR8ZzB8J20qj5pqxqtBZDjfOl
fpTR9f9+kHWdmBuCLBq35aes6Lxq4JtNRH+czt8F8wIAfx/xcgTf2uPThVoFPO9s
jyO4fy773Wsfo8PGo9SqSKr7K6gQW3dIDoFTk489lp3e9Y/DYJ+ZV2ixvCQKATjO
3K0umrWHYd25+mhripLMPzaz3h1GPtmAiQq/dq2GUviAFUPoZas=
=RWT2
-----END PGP SIGNATURE-----

--c5kq2kdwqrnl4eet--

--===============5018993907798235727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5018993907798235727==--
