Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 121F259C468
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Aug 2022 18:50:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B101EC64118;
	Mon, 22 Aug 2022 16:50:48 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 167C1C03FE1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Aug 2022 16:50:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DACFB611FC;
 Mon, 22 Aug 2022 16:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6FE7C433D6;
 Mon, 22 Aug 2022 16:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661187045;
 bh=irFANRY3GsRjnwPRI0klPXy+ob+GF+Bw2G52YNbFAI0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ijr/HM85cyz6VY0jd4a5MoWWZnMiH7N8aCu9H0tmPQE7N9pwWgBRK+uINBNYY7HYx
 iH0koBmAN8HQtsctV4cYzd7PulXqWvejNJ3nCTb3GLDdNbYxSdfJX1ap52dVios0sE
 AiBtZRS8YSFOw1c0lerTWmkc52E7sz9ISPIKiXZAQSUmvdvfLsH30C4eOW5QXKdU1a
 qu3EKa3sxvYKZqTUfPx9n+3Bqy4VXg5NSPBTPPOLECYSzV0ud0ESuivqhSMhocdL2R
 tr+IgDdimQ88E659yB31S2Whpez6zjzJdzck/2eyR2fWvTXtu6i5Goz9Zi3EY9CKuo
 k/1z14geqGyDw==
Date: Mon, 22 Aug 2022 17:50:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <YwOz4MJ5zc4YOb4s@sirena.org.uk>
References: <20220816161344.2599908-1-patrice.chotard@foss.st.com>
 <166118433897.209120.16190099503428270567.b4-ty@kernel.org>
 <319927f9-5265-81fd-2c6b-7c5146d90687@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <319927f9-5265-81fd-2c6b-7c5146d90687@foss.st.com>
X-Cookie: Do not write in this space.
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] (subset) [PATCH v3 0/2] spi: stm32_qspi: use QSPI
 bus as 8 lines communication channel
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
Content-Type: multipart/mixed; boundary="===============3489617489669672549=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3489617489669672549==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ru+ez317Ifnz+ENP"
Content-Disposition: inline


--Ru+ez317Ifnz+ENP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2022 at 06:21:16PM +0200, Patrice CHOTARD wrote:
> Hi Mark
>=20
> I just noticed that the cleanup() callback is useless as the gpiod is=20
> automatically freed by devm.
>=20
> As you haven't send your pull request, do you accept a fixup patch you wi=
ll squash=20
> with patch [2/2] "spi: stm32_qspi: Add transfer_one_message() spi callbac=
k"
> or standalone patch ?

Normally you should just send an incremental patch but since it was the
top commit of the branch and I only just pushed it I've dropped this
commit (b051161f44d414e736fa2b011245441bae9babd7) so you can resend
with the fix squashed in if you want.

--Ru+ez317Ifnz+ENP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMDs98ACgkQJNaLcl1U
h9DjzQf/Xo7tBkOen7IJaH+SY49+yGc6Dq0+ywUqN5DVyTWKStCNrtpcCNWwph2a
DV79ZqI4YEaptZq95gwDcaxLxnFHxG9qGIXzPbScCKDyvMkjc9DWqDAMiq+A+PYX
awYxyh7tFX7zpfbD/2Pm61SpPg4myZNxbX+gq7tcB9j53+ULFJOeiSva9YQE1rNm
jrDLOLIgzbQTFXbsQ3K8Ipi6rbwTfHhHHs6ubzJlWcStXzxF4EZlggbv3PBW1bpt
IQp/+8hXNnpQl3NfsLpkGldV6gtBDS1P16quHh/cMZNiEOAAKtBtIbFUE+IJY4QQ
Pqr9astR2dA5vinRQx1+7maV1g84Bw==
=gTVk
-----END PGP SIGNATURE-----

--Ru+ez317Ifnz+ENP--

--===============3489617489669672549==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3489617489669672549==--
