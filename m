Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4D1576DE4
	for <lists+linux-stm32@lfdr.de>; Sat, 16 Jul 2022 14:25:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1058C64101;
	Sat, 16 Jul 2022 12:25:17 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A5D8C640F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jul 2022 12:25:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B64BCB80187;
 Sat, 16 Jul 2022 12:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD92C34114;
 Sat, 16 Jul 2022 12:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657974315;
 bh=4Hh0Hb1VmNIO85liwlyCNlhINhQwN+E6mmhpqNPCkg8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q4RNjKn423TevH0wC1Iieib6bDyZsDEvoDRnm9+rlqi/l/QieimSfxvC60Ej/m2P9
 niEDaooV5IeLikFGm9A0dJfi6R375PyvThdgmpMp3vtlAe/bpMjHpwAQKJmqSEEC9c
 Gi6CitLuaDIciPK6ZpsNeaK8fbE/qmn7G321iXd0Qw3pGAqk4x8N3m//wSJv7ze5PC
 EtmbTaadkpBxnMDFlNIU+iOOzUHatpOHKgCti4gqyDGOoqF/lgM3Umv5lHFItMwmXJ
 sSKM4D4VSXQczgWwSikQd5XZlms6xEBn1dir5sfQ5iAvhu9YHiksd2eLonGsUkHq87
 t67V+3zqH90aA==
Date: Sat, 16 Jul 2022 14:25:11 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <YtKuJ6YFQtMFi5jD@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>, robh+dt@kernel.org,
 mark.rutland@arm.com, pierre-yves.mordret@foss.st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
References: <20220707074402.2429786-1-alain.volmat@foss.st.com>
 <20220707074402.2429786-3-alain.volmat@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20220707074402.2429786-3-alain.volmat@foss.st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/2] i2c: stm32: add support for the
	STM32MP13 soc
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
Content-Type: multipart/mixed; boundary="===============1739918531218916669=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1739918531218916669==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UmV9tOl/xeljXOjt"
Content-Disposition: inline


--UmV9tOl/xeljXOjt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 07, 2022 at 09:44:02AM +0200, Alain Volmat wrote:
> Add a new compatible for the stm32mp13.  Fast Mode Plus control
> register address differ from the one for STM32MP15.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>

Applied to for-next, thanks!


--UmV9tOl/xeljXOjt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLSricACgkQFA3kzBSg
KbY79Q//a303XMkTPCd5Gq21pbNS57rqo0RkC0kqvj6VCM7IhAeJbX6Acuy9+0Hv
TuBYxWFkBFiF5sMqGmz7ouhYpo0faNHNkN+8Mrg9VHyUjS5B4S2ke3FeRki7pwiq
X+D2Or++MGSYatoXlM/D2quG9fie4KxZG7B3c6+oNbm6UkPMDiER+KciC+TMssJP
RDWpDFkoi0pXUHkhb66LwioccIQd1BFChQWDzINz/c6D0oqITN1zgt4tV+42WTYn
H+xq+qaoRg73Pdnf1MlS9Zdh32Dh5qFKXz+iFK7dBbGmNWKl1a4DSEniusBbWQY2
3PDxNSM6tIyVcfqNqrjoqkm1knYRx9UInuiX7Xy93nAp9vDM6+zV1l/PXfumYooL
FX6Rm2duQd5NlBtXW/kq/130o/NEzZn7P6y2iAOaVjCUqxc3okxRotTNXxmbiq87
oaqs0uz5svq8+EpbhzSfrbWtgqL11dzEkZaeQFqDwKAFI07p55H4JBl4FzTmh3sK
nQcBln2qKeSNZA6wWaBSeQOBb/6qwi7CnIPMeBnKkPHjBV5O7w2d4ofM6nhypkFM
SIy0MtJZnOFi7Iio5Rq9YGr9SDanq6U9Cqg0T2/AApKJYTvqK35Xynxk0iPT8sBv
gRGkEI+I13AEI83RDCU7AkNcSPUmpeqjzLUlw2snZaukyParbMI=
=BHXX
-----END PGP SIGNATURE-----

--UmV9tOl/xeljXOjt--

--===============1739918531218916669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1739918531218916669==--
