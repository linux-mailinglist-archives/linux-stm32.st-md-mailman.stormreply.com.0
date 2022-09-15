Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C281A5B9514
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Sep 2022 09:14:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85303C63324;
	Thu, 15 Sep 2022 07:14:49 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B6D4C0D2C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Sep 2022 07:14:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CF7D462115;
 Thu, 15 Sep 2022 07:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53788C433D6;
 Thu, 15 Sep 2022 07:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663226086;
 bh=sP+mf27rpzQewNKmHATbFvxbwmIP1vT96/dnVf67BGE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HzbzvksJv084a0UrE6q/2aKgn4atqBzVeINSsND2hXnrUdHgyHprCEPup+L9FzJ7L
 C/1usAQH9GRzXklrt9P1GvwZolWpMeQXG/FKNyeq1aaYU0bNDH27OdA4GxVwh7EqH8
 tpWnYxdnXc8TNtyIyl20nvZsX5RN+RYqVOcx0WqF6QLYOJYJFevevIDVnarpsEn5TA
 pB8WVvrRcwRV6Q9nW47mitfpggZ+3R+Ym+Fu2811EpCEqQ5RavSFRrOKRyTYt7iTN+
 4m1Bi3IWugs3Ju3nOFkWqQrVPdetyqRC9/1IJt0ntDufbH0Uqdcgz3KpZ7E0wqki4H
 5xhRAFcZ5Q1+Q==
Date: Thu, 15 Sep 2022 08:14:42 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Lin Yujun <linyujun809@huawei.com>
Message-ID: <YyLQ4k54vK+3239d@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Lin Yujun <linyujun809@huawei.com>, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, akpm@linux-foundation.org,
 wim@iguana.be, linux-rtc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220915065253.43668-1-linyujun809@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220915065253.43668-1-linyujun809@huawei.com>
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, wim@iguana.be,
 mcoquelin.stm32@gmail.com, akpm@linux-foundation.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH -next v3] rtc: stmp3xxx: Add failure
 handling for stmp3xxx_wdt_register()
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
Content-Type: multipart/mixed; boundary="===============0257320494635713915=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0257320494635713915==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zY9MrxLdtodLpJSH"
Content-Disposition: inline


--zY9MrxLdtodLpJSH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 15, 2022 at 02:52:53PM +0800, Lin Yujun wrote:
> Use platform_device_put() to free platform device before print
> error message when platform_device_add() fails to run.
>=20
> Fixes: 1a71fb84fda6 ("rtc: stmp3xxx: add wdt-accessor function")
> Signed-off-by: Lin Yujun <linyujun809@huawei.com>

Reviewed-by: Wolfram Sang <wsa@kernel.org>


--zY9MrxLdtodLpJSH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMi0N4ACgkQFA3kzBSg
KbYPbw/9GACuotdUXQczt6AehOptdIothwIs3XpY86K9M6HD1roJOQWAj1kGSbW1
VnbIddLxCwMJbgISgy1imJlLM1b9L+aaFi4hwv7jtAx7SZNQDXEASW5jjQGLGODx
/iv0rWdQfFdMJ+7v1ZSvLTLE8zuKCZjp/Q8Gb2t5GYEFhIoVHELnB7hHIO324IPd
ZqJxY69c5Q4DPblzOsEolA8959y9cFY8RDBcDssP7YIvXXJyQPYUOFtv0tHHM38p
ezZg+aoZu6QMiQsxQZ8vGom5ojws57ESBCFRtSP2R2W4e0JF6lbeY8e53VJqJrxE
VpJxTxSEoBX+0+Unnj4HITienCObC4C/fiSRzxangICn8ItE+/U+42xYf3sVhlk9
/geNPmJj2iNYVrd9mI4uNoOMjsQMVxBUgLdV3WHtlwsuyvNbF4Td7awPJIGxYlTZ
HtaO4EN6MPapP2VjF41Nkco6qcTzJmPa9b3cV+Z8kprD2Z9ApDbOovVNJ7QdrsAY
0fPGNEXu2q2ZkwoX8LKOiEqm8+ltIzOYXRIEJxNYvMXzx1TY8oALcQuqF3RfPlvC
Yy+nLNoa3oTANMrXDTmu21q+n9UUaxFJ9gcTXn2hzu65i+Evqsiy7q0hrtdItCFf
YJLw7JcXEvHXhfbw3XN60QCr88vi8yHZrScifnLO4znAcCi3ZYw=
=OsHN
-----END PGP SIGNATURE-----

--zY9MrxLdtodLpJSH--

--===============0257320494635713915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0257320494635713915==--
