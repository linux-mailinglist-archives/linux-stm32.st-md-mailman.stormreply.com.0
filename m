Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EF4CC423
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Oct 2019 22:26:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4AB9C36B0B;
	Fri,  4 Oct 2019 20:26:32 +0000 (UTC)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93DCEC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2019 20:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s0qaab5J0loREYooSwO4q0fnIuPCJ2NuGQL4Xnq7rR0=; b=Ps539fHQ/+H/MrZH26sELPO7+
 zfAUdZVXvBd7JtI/bw7ObU1qy2GvswQxXlIoWn2xJK3HsylLP2wR2fChZyhh6Vkjvvx4U1tQ5efLx
 +t5Rrv/xeh0XCetnIEtdLaTlHpZE4NJLIfdfu7X5RDylA6hhhHduh8+r+sjE+8wWs1dbQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iGU9j-0004Vc-6b; Fri, 04 Oct 2019 20:26:27 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 502C72741EF0; Fri,  4 Oct 2019 21:26:26 +0100 (BST)
Date: Fri, 4 Oct 2019 21:26:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20191004202626.GG4866@sirena.co.uk>
References: <20191004044649.2405-1-yzhai003@ucr.edu>
 <20191004062336.jidzrytx4z5talro@pengutronix.de>
 <e6824330-d331-798d-0f0a-1952db028900@st.com>
 <20191004200804.ee6kedadchxoznnd@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20191004200804.ee6kedadchxoznnd@pengutronix.de>
X-Cookie: core error - bus dumped
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yizhuo <yzhai003@ucr.edu>, Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabrice GASNIER <fabrice.gasnier@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] pwm: stm32: Fix the usage of
 uninitialized variable in stm32_pwm_config()
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
Content-Type: multipart/mixed; boundary="===============4742448795200175486=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4742448795200175486==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nqkreNcslJAfgyzk"
Content-Disposition: inline


--nqkreNcslJAfgyzk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 04, 2019 at 10:08:04PM +0200, Uwe Kleine-K=F6nig wrote:
> On Fri, Oct 04, 2019 at 09:09:51AM +0000, Benjamin GAIGNARD wrote:

> > like for the your patch in IIO trigger regmap_read could only failed
> > if the hardware block is no more clocked and in this case we won't=20
> > return of regmap_read.

> I'm not sure this is aligned with how regmap is supposed to be used. I
> think the driver making use of regmap is not supposed to make any
> assumptions about how and when a read or write access can or cannot fail
> and instead is supposed to check all return values. So IMHO the patch
> goes in the right direction.

Yeah, if you're being very good about checking return values you really
should check them all the time in case something comes up - you could
get errors that don't come from the physical access, for example on read
if a register is marked as unreadable, or if physical access is required
but the map has been marked cache only.  That said a lot of people will
just not check anything since it's not common to see errors and errors
that do occur tend to have other quite visible effects like I2C bus
errors or system hangs.

--nqkreNcslJAfgyzk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2XqvEACgkQJNaLcl1U
h9CaBgf9F1R+YrO5gnXlm0rVv4WfDznyoFteVUwcOxUPCYVlAM3Mi0NWZTPV127a
+UDkmY2bVwpdMLseyucXYA8Tsh2QWW0ic2EWzUmckRhNqhRRKHKBrh+rPgnEVVeo
JKovxJ6wOBLnZiBlFSha3kcZgyk++Wk6tN0h1a+ddZyEAdQuXmnzDoSFEPaEm+75
N8gocQZjjSwrUfdywR+qiiijUGZxfMIMXszlpSAAsUQwGUNYsluAJLk1tF3Dx4zW
Ha1NmhZKe3anQv63BN3LPSy3joiGKAdPUlY3iXfH8K6DyS9uK9wiFHdsGAaaCLWb
rzBXzh6DEU1xzh4WaM7DOA5RtyjWDQ==
=l0K8
-----END PGP SIGNATURE-----

--nqkreNcslJAfgyzk--

--===============4742448795200175486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4742448795200175486==--
