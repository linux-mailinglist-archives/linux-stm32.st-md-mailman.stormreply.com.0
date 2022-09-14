Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 225455B90B1
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Sep 2022 01:02:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B076BC63324;
	Wed, 14 Sep 2022 23:02:30 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2EF52C0D2C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Sep 2022 23:02:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B432FB81D04;
 Wed, 14 Sep 2022 23:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB03EC433D6;
 Wed, 14 Sep 2022 23:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663196547;
 bh=3kkWgbvO9bEVvPrgr2yHaS27i2sauSwrvj21/TsPcVs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iC0zA2V4RI+NMWe8YKz6QNGcKu/qYLXVoyzGDJpptjnKTYzSmV9TlzgX7O8p0hAPL
 r/vKNEumu+IdDPwO08xicOWw7CS/e5MxkGfsyreKLVbASuxFuJ/hOda/OMxgSRUMiJ
 r3x46I14i4CTy3hz5yDSoqkPUgVaCk1E3SiiOjTcXAWUVLIPIKplKPaghad7SO9Kyi
 oWL+WnpnvMkIKFQj3bcv3IeSzW5AVkvpu5HQ19bxK9Aphi69CAvwc1dnlNGTLrDFqQ
 Wr0WC8tZFFxvdkbG+UUBVHEuAt+H8VSoljOBGiwSiBJ787Jsb3ZhqLk0hvFpkm8WDP
 IWhYdh1K2TNlQ==
Date: Thu, 15 Sep 2022 00:02:23 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Lin Yujun <linyujun809@huawei.com>
Message-ID: <YyJdf1AswoJNUcu0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Lin Yujun <linyujun809@huawei.com>, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, akpm@linux-foundation.org,
 wim@iguana.be, linux-rtc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220914032159.94812-1-linyujun809@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220914032159.94812-1-linyujun809@huawei.com>
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, wim@iguana.be,
 mcoquelin.stm32@gmail.com, akpm@linux-foundation.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH -next] rtc: stmp3xxx: Add failure handling
 for stmp3xxx_wdt_register()
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
Content-Type: multipart/mixed; boundary="===============1748280991858565971=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1748280991858565971==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0GaYQqpmyMEinp5d"
Content-Disposition: inline


--0GaYQqpmyMEinp5d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> +		if (rc)
> +			platform_device_put(wdt_pdev);

This is correct, thanks.

> +	} else {
> +		dev_err(&rtc_pdev->dev,
> +			"failed to allocate stmp3xxx_rtc_wdt\n");

This is superfluous because rc is initialized to -1.


--0GaYQqpmyMEinp5d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMiXX8ACgkQFA3kzBSg
KbYo2RAAiL2PQuOoLXMbiSpW7Xq2C7tLSYErAQDhF4eWx/rfgxJ6+iwsqL0iaCyH
ehlDH+yrJivfDTpsOlj+u/CMoNq+PQTbKK82WLeSD86L8/gT4jeCFq1w4LDPdv4Y
C2xmtQngRYrnd+LZwRECDoTSL/yzoW7+kdJ59HoPEvwSIEDd8yVgpiyxJ/yX6T1t
KkT21eZBKhnAUw5SrKtSthUu/KCDyciHQFnwC7b8AyecgdmoWy+8MIjmulnyNBn7
sINWTsKy3q0kQLAnILl2FeCnuYshc7RK+pgu79Pq3ZZGdD4PvV7kIZhH3NtTO2q1
+yzhIEPeIYSM0aVEAdrZstk1waorixEkQY6Q4yAN2ibDBQN9KoSI7ztHkIrGUU0J
k4B+k3KaJCUJ/QLsvsme/wgA5+9Qdo8tlu3QJepCTzyGpEyrpVEBMa1rps204JxX
LYS8ivW31wEj+PVOhKWc09VnxzQGnteB7lkTcan8Y+ZQsz1P4dMW8Tx9Q4Uvclgt
dAyztAxGZCRBiNzHKR3som5pexW31dE3T7DEKbZoJoquoyfsNdr+43ln4xPNlLv+
xE355xb5Q/7lzsNnJEmYH0ep4z2lQVuwzmuxWgum1TA1WqVlqGAM89klDqPZ6Yi/
RrtwsKkTq0SoNBVex8j9GvcIbDkL9bAeVxfKBMmvSST7MYHb8kI=
=E9lP
-----END PGP SIGNATURE-----

--0GaYQqpmyMEinp5d--

--===============1748280991858565971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1748280991858565971==--
