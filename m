Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D53FA313EA
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Feb 2025 19:19:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DAF12C78006;
	Tue, 11 Feb 2025 18:19:13 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A84EAC71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 18:19:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 486EDA40BE6;
 Tue, 11 Feb 2025 18:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A9DC4CEDD;
 Tue, 11 Feb 2025 18:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739297945;
 bh=2Kp4Zi09nuv/kuORUiQJl1dYvW4RXdPB6gTsNvTY3CI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HAz0HdbEmfMot5nLBQmD75IFwZRqJATTQq+XEA3Py2vGD1Y9HmEUKepf/qOXfc9iU
 eJxbJceHVdPWesVXvMENGYpvvcUIC8aNi9fl4twGE7BzlXiF1B5lGnNV62HlbBvnIU
 O3tSBq3S4UwGgX2LrAm0FeSKAlD2+d0iCvdIhmgi85LaCLrBcvqPfaaqR7SsPU0fM+
 oD4XYMbVHToR4eFWAJNoepJ6nxla44PrtwOQGlbsCcYxCoSnsJ1zmHvbjWBEBpp+K7
 gCk/LRB1eUx/bRPAUmG0ONlMb/Om7TIg5tR3Hna7wj+fV4xtKh3xS/DAK7F/vuAixx
 LK2/f+gwqvqeg==
Date: Tue, 11 Feb 2025 18:19:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <20250211-surviving-bunch-f4de29898d71@spud>
References: <20250210-b4-stm32mp2_new_dts-v1-0-e8ef1e666c5e@foss.st.com>
 <20250210-b4-stm32mp2_new_dts-v1-5-e8ef1e666c5e@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20250210-b4-stm32mp2_new_dts-v1-5-e8ef1e666c5e@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Richard Cochran <richardcochran@gmail.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 05/10] dt-bindings: stm32: document
	stm32mp235f-dk board
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
Content-Type: multipart/mixed; boundary="===============5979182822619012546=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5979182822619012546==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ueo0e+SD1hPCV0MU"
Content-Disposition: inline


--Ueo0e+SD1hPCV0MU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 04:20:59PM +0100, Amelie Delaunay wrote:
> Add new entry for stm32mp235-dk board.
>=20
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Ueo0e+SD1hPCV0MU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6uUlAAKCRB4tDGHoIJi
0nTOAQDJ4oscU2Sfp60SfXJoCMC3ARGWSbzSfjc1JO2iL40lJwEA3gV6SLlmwCn8
9am4zS12tt9N3U9+3EGMeTGdy9mptg4=
=MiP+
-----END PGP SIGNATURE-----

--Ueo0e+SD1hPCV0MU--

--===============5979182822619012546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5979182822619012546==--
