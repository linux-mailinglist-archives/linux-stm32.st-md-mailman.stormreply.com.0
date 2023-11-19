Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B897F067E
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Nov 2023 14:42:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20F69C6B475;
	Sun, 19 Nov 2023 13:42:35 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0AE98C6B46B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Nov 2023 13:42:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D8E97CE0B74;
 Sun, 19 Nov 2023 13:42:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B1AAC433C8;
 Sun, 19 Nov 2023 13:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700401351;
 bh=ivH/7a0rtuqIcC1N4qUHjlirk04W9i7zLpx25t7awaw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D9glATJ0gYLuYUOP72CaUWTQcNh7jgQeDfWy/0PxArKf+yDJa3EDf1zEQ6UBcPRhR
 7o6kwvQS++aXZOm/lYMhhW2fqM7RrGqCazyFCDw+TbZk6tViEVzqIZ2EEzv4TmuL6u
 V0O0B62UOPsCZe4Qamkg9azLa7Ueg+pRTqQI61BMFP+hWXmDPPlt5G9Q2J4GfBnSLb
 fjRHFfk+s5zwuHll7BEfSLIYBIn2tAnZU9t3bzGVQIvH7J3Wp1zz1VAoPPnZH+fXFG
 jJCmPHAQaStwAWPLNh7psTo1OtpcvyrFySgzq1h7VMG3cCZts5PL7jixC2tquF/17g
 Q95KzKua8JX3A==
Date: Sun, 19 Nov 2023 13:42:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20231119-tree-improper-b031c2527128@spud>
References: <20231117143338.1173475-1-patrick.delaunay@foss.st.com>
 <20231117153310.1.I1784fc7f33cc928e9007d85354707d6382b48b72@changeid>
MIME-Version: 1.0
In-Reply-To: <20231117153310.1.I1784fc7f33cc928e9007d85354707d6382b48b72@changeid>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/4] dt-bindings: nvmem: add new stm32mp25
 compatible for stm32-romem
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
Content-Type: multipart/mixed; boundary="===============7105542917227787979=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7105542917227787979==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZoXxyyywsf/pWmKt"
Content-Disposition: inline


--ZoXxyyywsf/pWmKt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2023 at 03:33:34PM +0100, Patrick Delaunay wrote:
> Add a new compatible for stm32mp25 support.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>


--ZoXxyyywsf/pWmKt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVoQwgAKCRB4tDGHoIJi
0tbrAQCyo2zim4XR1mSVguxU651KwBRSpJJNI10F0CMpk1jK0QD+PFecoGEbntYE
vyEZHgbChgX0fsQEChjuX5OZQb/CCg8=
=gFZr
-----END PGP SIGNATURE-----

--ZoXxyyywsf/pWmKt--

--===============7105542917227787979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7105542917227787979==--
