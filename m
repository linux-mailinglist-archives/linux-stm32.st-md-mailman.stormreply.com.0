Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F07B64B9CE
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Dec 2022 17:32:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC553C65E74;
	Tue, 13 Dec 2022 16:32:31 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 094E6C03FC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Dec 2022 16:32:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 95C516160B;
 Tue, 13 Dec 2022 16:32:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA72DC433EF;
 Tue, 13 Dec 2022 16:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670949147;
 bh=IkaIecCAO4eWrY0lpI239OFx++zQFEtlQWKnkI52BQo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ad3nvFzjWW8V+RkbV2vX6p7dW9Y40SogM91DFQFjWZJjgpbQCNfqr7ssS8TBQ21am
 +RBV7gbzaxDjfE8YMR1grBhqMIV36HAHMwigSYkFqFR4i+Z8bVvSYErIwvgQerjQyM
 FT+hDkMzz52uYXbIKZadXEwZ5UEz/INrpImUKPy/2YTQ7aFVSf+ROXVbE8eYur8MZX
 qWuT6L+tBqHJxYcr8tQMUPW8smU80pjf5PGzENpsngKBDjBUILJ0pq1cSjXgaf9OLN
 wboA/08Os81J282u40Vl73Hbe5eMn7f4J9oNaOgTbMyLXJbN8lqDQsCtp5c0pcir1m
 0s7/c8AtsB+Cw==
Date: Tue, 13 Dec 2022 16:32:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <Y5ipFd8BfU361QzN@sirena.org.uk>
References: <CGME20221213113259eucas1p1c224898772bc5e59de90c1aa65a34de0@eucas1p1.samsung.com>
 <1670311341-32664-1-git-send-email-u0084500@gmail.com>
 <dd329b51-f11a-2af6-9549-c8a014fd5a71@samsung.com>
 <CADiBU39-FUD787RmV9Z+jsSrb2Se66A6FrLWGxf78q2Ud-SrjA@mail.gmail.com>
 <dc6c80f1-f34d-eaab-d561-32caa7fa140c@samsung.com>
MIME-Version: 1.0
In-Reply-To: <dc6c80f1-f34d-eaab-d561-32caa7fa140c@samsung.com>
X-Cookie: Edwin Meese made me wear CORDOVANS!!
Cc: gene_chen@richtek.com, markgross@kernel.org,
 ChiYuan Huang <u0084500@gmail.com>, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, djrscally@gmail.com, hdegoede@redhat.com,
 chiaen_wu@richtek.com, mcoquelin.stm32@gmail.com, yangyingliang@huawei.com,
 ChiYuan Huang <cy_huang@richtek.com>, platform-driver-x86@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] regulator: core: Use different devices
 for resource allocation and DT lookup
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
Content-Type: multipart/mixed; boundary="===============5184424491036350927=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5184424491036350927==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tNXG5geVxhetNs9+"
Content-Disposition: inline


--tNXG5geVxhetNs9+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2022 at 03:29:00PM +0100, Marek Szyprowski wrote:
> On 13.12.2022 15:19, ChiYuan Huang wrote:

> > I don't have the board. Could you help to test this change to see
> > whether it's been fixed or not?

> The above change fixes the issue. Thanks! Feel free to add following=20
> tags to the final patch:

> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thanks for jumping on this so quickly!  Marek, are these boards (or
similar ones) generally available?  They seem great at showing up issues
so it'd be good if I could get them into my CI and spot problems earlier
(or something like kernelci.org would be about as good)?

--tNXG5geVxhetNs9+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOYqRQACgkQJNaLcl1U
h9CjpQf9HoF9DFw7bEWszh/MB3OIFpb1JyFER+6n/VemFWJBfYZIlHKuVrPxw9L8
s9zZla1T6wKL7t7Jx1zl1xMJtw7xBRT0+Q+l7RSq6BNGvMFh09cbDS/7QGt5itq7
sk/NFwoySnTqUodi3u0IWsQjVGSevueyIWnI98MR5vSSHMPmAzoNiozIEZ7rKoOh
VvgM+oHfuaM2AXcXMTIyGBGbHL6N3BMvpCetgXAWakdPpQTrWO/uvtGMK6GEJELV
mJIbNHV6SQvs6tcWPbAcRprYDjVW0vbdssTy9qkkqq+fVWBIPsCMlPM8tiBmz8SN
bwTppiTf5msM1evKcwvvzGwsNxaKtQ==
=DYDS
-----END PGP SIGNATURE-----

--tNXG5geVxhetNs9+--

--===============5184424491036350927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5184424491036350927==--
