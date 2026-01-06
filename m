Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B555CF84B5
	for <lists+linux-stm32@lfdr.de>; Tue, 06 Jan 2026 13:22:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97CF4C8F277;
	Tue,  6 Jan 2026 12:22:27 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF8E3C60463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jan 2026 12:22:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9A02A43C13;
 Tue,  6 Jan 2026 12:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11FA7C116C6;
 Tue,  6 Jan 2026 12:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767702145;
 bh=jrWrmUEcepjc/MxZzu/XcC1bCoyGapqRcLqcZx24Lh0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HLEhYDz1TABUPl7Bt+1isx1W/IoqjaL0c9Bf8+Ejn7ltzoHcT8txIDSsusunYH2Gd
 AEnQpgkabg5E14S7Xsffe5rTmchjuF96RorZW8htJhJ4USnPHdSuWYVef9LslrKGF6
 FMtjp0BZiGTmVQvfLfLFUq2igbf2tginL2GyFbTxBCS2S8vPMm0WMyB6HKqdIW92rm
 Xrur1LTvo7zCApwER3eHjBOQp0ddEQa7hnOjb71FzT8HSpgFZLzZMTHdqQ+am0Dk4p
 pNoAnXaLUS3X+thFmGlAUm0AqjTKfiqo2kXoGqozTqHOzqLHYhE7YqEqaFdG+8vrL4
 1+9mS7ARkBKxA==
Date: Tue, 6 Jan 2026 12:22:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <fe48d1c2-07c4-451c-a2e7-338570557e93@sirena.org.uk>
References: <20260106-spi_st_maybe_unused_removal-v1-0-8f5ca7136e96@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20260106-spi_st_maybe_unused_removal-v1-0-8f5ca7136e96@foss.st.com>
X-Cookie: People respond to people who respond.
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/4] drivers: spi: st: use pm_ptr and
 remove __maybe_unused
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
Content-Type: multipart/mixed; boundary="===============7361534553268674911=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7361534553268674911==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RUu1iIbwe7xJ/Z4d"
Content-Disposition: inline


--RUu1iIbwe7xJ/Z4d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 06, 2026 at 01:14:16PM +0100, Alain Volmat wrote:
> Update ST related SPI drivers in order to remove the __maybe_unused
> statements on pm related functions thanks to the usage of pm_ptr.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--RUu1iIbwe7xJ/Z4d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlc/nwACgkQJNaLcl1U
h9AbdQf+JYxZvoJLlKwbsDUTQjC4Mk5hdBG2qxuT/3zMqhob+VxeKNv5oFGesf+E
E3qS3sArsrkBNbU40i4mb4fCuGKhA+WILehyZ0DE3BmyjE1zwBWI6rruHu7AVuMG
uQ+2IA00P2lMlGF9Nsj5sf2r7kQ+EwOB2IfLJUPQs1BsBk9yoPbp8aNmMPuYWGiB
o18LxSypSDRAvCLu1IpBQ82TSjuAINHON+dHgiltYVXfebxeyvBocGulD5858d9v
i4+ghAzTRxSrol2f7BRtHjgK/n8+IVgHEC+FTa400Bwqh5gCezuol2de7fIRDXPK
NH/e26NI4zMfPcZ7HuTt+orpJyzEfQ==
=ZYVd
-----END PGP SIGNATURE-----

--RUu1iIbwe7xJ/Z4d--

--===============7361534553268674911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7361534553268674911==--
