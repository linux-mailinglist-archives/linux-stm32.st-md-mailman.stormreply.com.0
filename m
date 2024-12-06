Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 684E29E67AA
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Dec 2024 08:13:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16A8FC6DD9A;
	Fri,  6 Dec 2024 07:13:03 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3ECF2C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2024 07:13:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 589305C57E3;
 Fri,  6 Dec 2024 07:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FCA9C4CEDD;
 Fri,  6 Dec 2024 07:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733469180;
 bh=wqdP/q7jz5/cYPHRhOGlO8Dgz7Z7fVb1WpWpSjFHEtQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bbaEyGu11/UxJoI+wxVZKQze/GAiyViGlIHkW/LeTFayFPOP21hgFvJ9UQL16Of6n
 oSFi59lFAGU0zrx/RohkY08DvXuR0VVpaeGxN1xx0Tf7/qXSLG8T11zP+M57cVh+JY
 ITT1xrXF0oS+Za3klS9l6lxOteodrT7qa1MSYCRcee8O9F/hXUqsvoavGQ/2cjk8vF
 CBE6z0z04SoUUDGF0JQRrm0IllLkGhUsXYZTYSU2qh3steCGZtdFaRj89WNfpctiM2
 0jw2uJpI/yglEHWHuKoQiZklmUMtDU8E/yd6lHsgh7uyG/VaHstYWuHKxH/pidNskB
 7RzhF0hivOOyw==
Date: Fri, 6 Dec 2024 08:12:57 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Mingwei Zheng <zmw12306@gmail.com>
Message-ID: <cim6rnzdvhik4kdibfmglf6jiky7xccynqwazmxmnr2f5fvu3f@lvoo3drlgaua>
References: <20241206012605.2877412-1-zmw12306@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20241206012605.2877412-1-zmw12306@gmail.com>
Cc: linux-pwm@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, hierry.reding@gmail.com,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2] pwm: stm32-lp: Add check for
	clk_enable()
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
Content-Type: multipart/mixed; boundary="===============6029260390450951342=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6029260390450951342==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="24swak54o7mx3jph"
Content-Disposition: inline


--24swak54o7mx3jph
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH V2] pwm: stm32-lp: Add check for clk_enable()
MIME-Version: 1.0

On Thu, Dec 05, 2024 at 08:26:05PM -0500, Mingwei Zheng wrote:
> Add check for the return value of clk_enable() to catch the potential
> error.
>=20
> Fixes: e70a540b4e02 ("pwm: Add STM32 LPTimer PWM driver")
> Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>

In reply to (implicit) v1 you wrote:
> We detected this through static analysis, instead of actually hit.

Would be nice to mention the tool that actually found it in the commit
log.

Otherwise I'm happy with that change now.

Given the issue is old (the offending commit is in v4.14-rc1), I'd note
send it as a fix before v4.14. I'd send it along however if something
more urgent pops up.

Best regards
Uwe

--24swak54o7mx3jph
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdSo/YACgkQj4D7WH0S
/k58qQgAoaSkhGFgO/Kk52GXlgiISBHJAWIcISJ5+foNu36MAFY3eW6ti+GT0DBw
XuYgt/Z7uV4mklpmSb0NsHU9o1Rg0wqdqPpeOydgp+nDnWRLOU7Ym5ZLGGIna4M+
VuKtK4l3wY5wW9LXMR0YlBhNQ8LlSNIG3yGfektvc4kWLaTB1S3o3FkY3mx6PaFl
As6hDgS2eg5rGjRaAYqiBQ0RCPVDOtH4+dgVAXC7w4LNyJo6ujdPQdaSBmq05RQi
DDH6nEL/NVw3PSjoDcK3Q2YQ8Ch3O/XyzybATAlLlNNqN2/M1mwEK08vbeEnv5mP
OYIkTcu2MYynEx6XzaGy1PAATeTcqw==
=onJO
-----END PGP SIGNATURE-----

--24swak54o7mx3jph--

--===============6029260390450951342==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6029260390450951342==--
