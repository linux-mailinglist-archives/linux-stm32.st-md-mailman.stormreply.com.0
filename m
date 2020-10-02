Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A123A2816E3
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Oct 2020 17:42:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FE04C424B8;
	Fri,  2 Oct 2020 15:42:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCC4FC424B3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 15:42:09 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E3CF02074B;
 Fri,  2 Oct 2020 15:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601653327;
 bh=v5iehWcOX0VLo1AP99P9bUun2tqq3LWKlFh9oC0pM6A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vlFOtcqOxfyc22WCafJBSQo1lA+ZbQIvpliVp5g+LacQS99cqT50bn3+vFDF+rpbf
 9O0c5qNtP/fwlvgZ9oVP7lGlhLbedjAsUNUFgwBzyndZI4MgINYQI4itJqbXsFbSBC
 77+q/QTtoD8VTqtvt7RQsUcbtA/ANEIvZN+tL8ic=
Date: Fri, 2 Oct 2020 16:41:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Message-ID: <20201002154107.GC5527@sirena.org.uk>
References: <20201002152904.16448-1-olivier.moysan@st.com>
MIME-Version: 1.0
In-Reply-To: <20201002152904.16448-1-olivier.moysan@st.com>
X-Cookie: Words must be weighed, not counted.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org, perex@perex.cz,
 linux-stm32@st-md-mailman.stormreply.com, arnaud.patard@rtp-net.org
Subject: Re: [Linux-stm32] [PATCH 1/1] ASoC: cs42l51: add soft dependency
	declaration
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
Content-Type: multipart/mixed; boundary="===============1690349743372416588=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1690349743372416588==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MnLPg7ZWsaic7Fhd"
Content-Disposition: inline


--MnLPg7ZWsaic7Fhd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 02, 2020 at 05:29:04PM +0200, Olivier Moysan wrote:
> When configured as module, CS42L51 codec driver uses two modules
> snd-soc-cs42l51 and snd-soc-cs42l51-i2c.
> Add soft dependency on snd-soc-cs42l51-i2c in snd-soc-cs42l51,
> to allow smart module dependency solving.

Doesn't the userspace tooling usually manage to figure this out from
symbol usage?

--MnLPg7ZWsaic7Fhd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl93ShIACgkQJNaLcl1U
h9AfMgf/bO5iRl+FHKAa69Dt5NyALR5rJ9EhOt2FrK6Ql/DPOjT4GJE2wWdt/fKD
H9c2EU6rY0lAp4X7M5PNZJrq4gOcyWdGaHfIOfXBf2qiEzN3L6AvX6iA5oBi1s3O
eECGQmaRqcwv/nSuoOnzpkoKyywBq9+o9lkHWu1jBg7uhYU1kjp4kJmifrl1aeFU
QrxFCjLwGSjmNFfm7v3N/33M/aNRwvhyrG9ct+19u1GabgzXBQpLqVj/7Qf1R4Ab
4Wx8zbP9UI9kW+NLwFewr2wDMP4+WC86biyvT8yU2RYGfxzU3l5U6GtawF+TDhpR
yBPJ2eIvTmHz66uX7dvMIHlzF2V+GA==
=ioD8
-----END PGP SIGNATURE-----

--MnLPg7ZWsaic7Fhd--

--===============1690349743372416588==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1690349743372416588==--
