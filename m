Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4532B91BEA2
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jun 2024 14:32:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9E49C71289;
	Fri, 28 Jun 2024 12:32:42 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC54DC71282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2024 12:32:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 86F18CE3BE5;
 Fri, 28 Jun 2024 12:32:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECABCC116B1;
 Fri, 28 Jun 2024 12:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719577952;
 bh=Ha43aO+O5jHdoZI+1kv9nzT9FAFVWm3/7jHE5V8OCXY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PNPKf4A3iaA4hrrfixyi1OWjwPgHYUaY1LFb8Pm4Sg0TYfYKhzBCnz9+hQ7RJoUXc
 QDrZythMOX33/6XE5rYDTKnOkXE6pp1/xNjJbYOzAM7KncKCnCI3OChJofq2PZDIre
 SN7Ut8akfoc/TvlECnDXTmf3QLQSSPtBEcYcZ0l8+KmUTXZFp7c2YUwWPjqWlsfZVJ
 lCxixFKZBfRKja+UI2zZS0brv0cM7pZQtpWvFi3znwFk8SSCUbpzx0JfplhbYBTUMv
 THtRwfklkivGpVtAWdhTTIxVSlKPefFDv8IMIAvVas0E5rBYkHdlbPV59HLZySU4X5
 IJSElGLWfQs/Q==
Date: Fri, 28 Jun 2024 13:32:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Pascal Paillet <p.paillet@foss.st.com>
Message-ID: <e0e23cac-504b-4e93-bcdc-5c7b3c81ab6f@sirena.org.uk>
References: <20240628085814.1586186-1-p.paillet@foss.st.com>
 <20240628085814.1586186-2-p.paillet@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20240628085814.1586186-2-p.paillet@foss.st.com>
X-Cookie: divorce, n:
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/4] regulators: dt-bindings: add
 STM32MP25 regulator bindings
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
Content-Type: multipart/mixed; boundary="===============7462637240235816828=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7462637240235816828==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eoY9nVURtqN3+AEo"
Content-Disposition: inline


--eoY9nVURtqN3+AEo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 28, 2024 at 10:58:11AM +0200, Pascal Paillet wrote:
> These bindings will be used for the SCMI voltage domain.

Acked-by: Mark Brown <broonie@kernel.org>

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--eoY9nVURtqN3+AEo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ+rVoACgkQJNaLcl1U
h9BpGQf/fa9sDNcNB2MjTj0pf6Qf86Jsu58QRpw3XnmGOn1DGmAXoyo4L23ZaY8G
Y67ci3z3Sm25LXxrd5sILbJYtnuFjTYfrMeakvn6/Xf3c8OQCidTNHCi4OxOKILk
9punv8ZLiOVe7RSxLQtITSp8xhaRlCdITuHOhEvEdfdX6Z5V5YJzcRNclyRSs25U
lenNDd0LfCP3k8rYo5i1MqAzCwfOXD/sjPmsFYW7YvZ6aSSIy2kmcQKY5aJpKtzM
fe5R4XBE3bmW91/csh40cnIehZvFChKPBi95E5F38Q6YbWW+uJevWd3/CR9NyPtj
JaQ+yNriTki2RyRC1bS43VbslCM9vg==
=mBUI
-----END PGP SIGNATURE-----

--eoY9nVURtqN3+AEo--

--===============7462637240235816828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7462637240235816828==--
