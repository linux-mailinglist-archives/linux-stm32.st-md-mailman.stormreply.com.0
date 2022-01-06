Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3F148658B
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jan 2022 14:51:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA7B7C5F1FA;
	Thu,  6 Jan 2022 13:51:28 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF90AC5F1F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Jan 2022 13:51:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C2952B8216A;
 Thu,  6 Jan 2022 13:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 078B3C36AE3;
 Thu,  6 Jan 2022 13:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641477085;
 bh=9rdZAeLsUyj9v9gaJNRkMhgxgzmJttu+aTeMrHIrIqU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jLt9JCgXW5yVZrGpW8qdeHdnoZug4vDwaxXo2rLkbbTGecX1QVDzlsL5raVMe1pI/
 qeKSIc/p2/O6UUvUFuQLJEAAdG2GICmy+VR5JqzYzQ4XFsJ3bhxgYRZNQw31qta94U
 S6dTq7oBMdU8C8Yqf8alvvjbD6tRCiv8QDrfHToXtfsgwxjjs4F8axlIsDeP/PfAsW
 RS4k9WhF0M8aSWQtsdHlvisvlXE9gH42lKfac85H9wve76OrmOu/mBemS2GCZrKoMl
 GU2HUCqa7bXe7b9bhmLkqJM1viK2kao+mGj6MTzHLHSdwEoiuLCnPGkaLMzafSknBE
 kS1xxP+UBzGyg==
Date: Thu, 6 Jan 2022 13:51:20 +0000
From: Mark Brown <broonie@kernel.org>
To: patrice.chotard@foss.st.com
Message-ID: <Ydbz2JkT8jRvNBBZ@sirena.org.uk>
References: <20220106132052.7227-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20220106132052.7227-1-patrice.chotard@foss.st.com>
X-Cookie: I think we're in trouble.
Cc: linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] spi: stm32-qspi: Update spi registering
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
Content-Type: multipart/mixed; boundary="===============4436238681630015310=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4436238681630015310==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YYOP+xPh7cdL05sG"
Content-Disposition: inline


--YYOP+xPh7cdL05sG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 06, 2022 at 02:20:52PM +0100, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
>=20
> Replace devm_spi_register_master() by spi_register_master() to ensure
> that spi sub-nodes are unregistered in the correct order when qspi driver
> is removed.

This commit message doesn't describe the actual issue.  The change is
fixing ordering within the driver itself - the driver is freeing things
in the remove() callback which are used by the controller but thanks to
the use of devm the controller isn't unregistered from the core until
after the remove() callback has run so we might still have something
running.  "Subnodes" aren't an issue here.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--YYOP+xPh7cdL05sG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHW89cACgkQJNaLcl1U
h9ALYgf/alknJs2Xw7QDMlNENN0v5aGZepFImNoIF+MG+Z7JBhPh+nlvN5ozU0jA
k1OXYLsZwIlhc8OESLxTSipWlYf7N7UPJVnpkuTjLkNQHGMCQg3JEGPvZ34JG2vy
gu6YV6voQPJJs9Lhy0DOzyT/8b0TUtv11CR6GDZGD85Amlr+7Vp3kEqslVuslvAR
irCFPzUc4L66O6LuJwH3blcQOLh7f0gnlSv4AI/DWClT/PcvNy/I+6K0AzlbRCth
F+1eMArVQLS7I49ldfqSfS8kuBMDtZOPcwmve1KAimPwyEsQj5BhOSQvugcVT0YP
9cbCfaK320vSdx28c9xLZEd3zZfFAw==
=Kk5C
-----END PGP SIGNATURE-----

--YYOP+xPh7cdL05sG--

--===============4436238681630015310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4436238681630015310==--
