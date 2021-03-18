Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA633403E4
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Mar 2021 11:52:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 344A7C57B7B;
	Thu, 18 Mar 2021 10:52:03 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 761E4C57B77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Mar 2021 10:51:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 661C464F3B;
 Thu, 18 Mar 2021 10:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616064717;
 bh=GGf+pazItb5QrmIMPrXejMNcW2SCcwiSSjwQVQ0igKk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=igjAnYEme5rIKdM7p4HEBnrIMN/8EBwQpO8JuM8asxfeN5iq1v4j949z0o137IeCt
 UHLUvVc+srNricctNYHZQ77yC7qv+DaxFYi1T//+iWiM7M2mnJfSOGPhh1TwVPYKen
 ww1HfCcvdKGMVYgi7SYn/VUWV5uzvBcllSuTGAfER3fZgebU08aXThhJk/eneztw+c
 wH+Z0uO87nvxZFpbmO28KXvqPiPc0wj2El3+hyHQgBFlZcVUu8wE82RKfVHGjjej6q
 p26VvfhcHrBuahoczACeSkIr/eSzU/3VJfNVYfJ0WE8e8k7TUKiK6lQVUYZtl+O1+m
 Ys0Gass6TW0kw==
Date: Thu, 18 Mar 2021 11:51:53 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Pierre Yves MORDRET <pierre-yves.mordret@foss.st.com>
Message-ID: <20210318105153.GC974@ninjato>
References: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
 <1612515104-838-3-git-send-email-alain.volmat@foss.st.com>
 <d39593ea-ef47-5688-202b-66458f13ecc8@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <d39593ea-ef47-5688-202b-66458f13ecc8@foss.st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 Alain Volmat <alain.volmat@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/5] i2c: stm32f7: support DT binding
	i2c-analog-filter
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
Content-Type: multipart/mixed; boundary="===============8874418914535751390=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8874418914535751390==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4ZLFUWh1odzi/v6L"
Content-Disposition: inline


--4ZLFUWh1odzi/v6L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>

Please use "Reviewed-by" or "Acked-by" next time, then I will see it
in patchwork as taken care of. Thanks!


--4ZLFUWh1odzi/v6L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBTMMkACgkQFA3kzBSg
Kba3Xw/+InFaMGAXyoMz6thqL08q0+4FQDDeDDx5N5sdhNeLiatAR0wv+GZaNvv/
CIJmuep7LJ6IDNRsGLHn1XK/LYs3okh7981RqvrV5qVnVhtGCpXSMmybV0SLF/7Q
pJqB3L+/2feQCwZ8TbESM/bcXpp6G9Da8xi3amZ5bpxzy/5TZVvjUTak+RqrWEK5
7CH0qpRnSbX1dIhElLuHYxosS83jOGr/YhFao+N5kXZUE1Hu5vIuCCUhb1ezV8t6
WJCTGOxh1THRVFL94kTmYzsmZVkHOY4wvStFAvBKpYK98cWJ7NNemiHgdtUBtCB3
ZWxTIUheV2tPmY9t9U2GTvYqJUsYNIloGdlIMBPa81C4xr1i2UIkiaalU7uGr5Rt
IBAFyxlPwAKxNrHLlQBiagZBFNIR5Aka/n8VJqAoEzyUl2WjQ7K3dl2A+J+F1YdK
Ahw5GbVNIhHLmtz/mJ8DerX9fhpI7vItN2+DV7ebIWMFcMuwpl357sLT0fmrdcE4
iBm52QMTWDEkVjfUPxBEBDJYW0eR/EsYj+K6zecaJi2HH6RH8AUbg2ViM7FWY1rA
S150rH4yl+wR3jQNe3hGtJMQF5NsWftnqzmcoe2EGM2pBR5d7mLcz8guJe3Vo8fm
Vj9Hsdq+qnOjixksh0u6o2SBcNjfJYj2PrtBUD8sWO4QZCIwWc4=
=AnVO
-----END PGP SIGNATURE-----

--4ZLFUWh1odzi/v6L--

--===============8874418914535751390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8874418914535751390==--
