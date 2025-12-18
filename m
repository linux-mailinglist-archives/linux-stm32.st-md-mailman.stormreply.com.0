Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B57FDCCAC13
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Dec 2025 09:01:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6557EC5663A;
	Thu, 18 Dec 2025 08:01:05 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95792C030AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Dec 2025 08:01:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 538F743FF8;
 Thu, 18 Dec 2025 08:01:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FDE6C4CEFB;
 Thu, 18 Dec 2025 08:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766044862;
 bh=HHlYP/1oT2kinphPQ9/3fzfi/qcVW054/WKuEsDPs0E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rwV3hKNzLZdlo15r6xATauOc2HzLW5FLvt0Sy/qcHArFX7+rnS1maXD1iZWc48330
 dkKqbS/udUDkqWveQYdACybLxBc6QoEuNVqLBVYED4s/AqqzvnwD305wSeeO3OMxvS
 k/lb3xWkNTasd02uI9ETI0UjGHrCw25GfgI6uYSccJjTgyjIqC6poTL5J5oACHwtJx
 mTnwOQKDrdOBba96aUGdQ93nJM5rTkOzUdBFyps3w6c6NnGHgBKFUbqa7iAua948NN
 umZyshCU9oNNtN7gnx27obLHQOM7MFudQ89pJfWtBc5oe7/ta8cz82JFUjOmI2JeGC
 Y/fvFaTu+9+5A==
Date: Thu, 18 Dec 2025 08:00:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <129a4deb-ec9c-41f0-910c-57cd43d17fcd@sirena.org.uk>
References: <20251217-stm32-spi-enhancements-v1-0-943348b8ff66@foss.st.com>
 <20251217-stm32-spi-enhancements-v1-3-943348b8ff66@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20251217-stm32-spi-enhancements-v1-3-943348b8ff66@foss.st.com>
X-Cookie: Close cover before striking.
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/4] spi: stm32: properly fail on
	dma_request_chan error
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
Content-Type: multipart/mixed; boundary="===============3464604707640539273=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3464604707640539273==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xdYKEQLQFnGb8Mm8"
Content-Disposition: inline


--xdYKEQLQFnGb8Mm8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 17, 2025 at 10:51:33PM +0100, Alain Volmat wrote:
> Correct handling of the dma_request_chan call in order to avoid
> misleading warn message if no DMA is provided within the device-tree
> and moreover fail if dma_request_chan has returned a valid error.

Bug fixes should go at the start of serieses to avoid spurious
dependencies on new or cleanup changes.

--xdYKEQLQFnGb8Mm8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlDtLgACgkQJNaLcl1U
h9C+xQf/f0u/7bqNRt7Lu7GnVRORacWjnXmidDhHzPASrPGgt/BgyySgqqLUtsT3
RZnxPRAkHkYlSW+Q5OlSlxnIXV+BBEK80tAUKZmTOSruQQBgkDUm+YJx932XBSUA
jqRZMpuH3zoYwVrWociYeo2PJClBKdsP8NYvQqj62Ns/xrNy/eM9Ow1afZgt+DQI
KKE+YHtIFNgTXUOokDuWbNQ6oR1BiP1UYw4M0iIgdSFAJ80q5bDf6EafpZ8s3UN8
NL6NiqggvpS0sSIJ4PFSheZnwNrdiNoH0I0kvjvuKpmQRBbBE2Jecrzy9WY+G0lA
brTbY9z8iMKd3oSOP4L64sMAhd1u3A==
=gJz4
-----END PGP SIGNATURE-----

--xdYKEQLQFnGb8Mm8--

--===============3464604707640539273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3464604707640539273==--
