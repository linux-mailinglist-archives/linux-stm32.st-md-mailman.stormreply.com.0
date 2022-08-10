Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF25C58ED08
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Aug 2022 15:23:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E1D1C04000;
	Wed, 10 Aug 2022 13:23:14 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA9A1C03FCB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Aug 2022 13:23:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 842EAB81C63;
 Wed, 10 Aug 2022 13:23:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 975E7C433C1;
 Wed, 10 Aug 2022 13:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660137791;
 bh=kuNflv+LVlGRoYVP2WgVIcz5hqpvWrWoxTBC7R1vsXg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tFphcB8NZQsJQb23XV66rnyNs0qbvkQFV4BueYle5FvmXdXB0CtbunK/tNHyKN1h4
 UxVHVuEmg1RobuwXHWbXf1IOUqwKFsiLOqdKhCR/vHKquavbqQqqEOK3pl6dbcmx2j
 mIoGsBn2JHgbMuCCHqCJ9DMXZlIIpAWuSilP/NLWIWyp0sm8uZoKQRQROc78v8SESx
 xJSMiRcTumujAYSbcY0i2iq4evuk/1XDyWHpRX0x4A9cts7Qg4e7gExHBLbxxGcRQW
 Nrwu0+c5PZMOUJBlvBcnxT/PlRzgMeHm2SDgKYAzoYHiJM9gKRK0qIiZgzUMtvAMPW
 /hDuOGRBtJz4A==
Date: Wed, 10 Aug 2022 14:23:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <YvOxOg0vXSGrZLfP@sirena.org.uk>
References: <20220810093215.794977-1-patrice.chotard@foss.st.com>
 <20220810093215.794977-2-patrice.chotard@foss.st.com>
 <YvOtZtrRHd4AT+j+@sirena.org.uk>
 <d41e3814-3fab-18a3-7218-d5c28eaecff8@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <d41e3814-3fab-18a3-7218-d5c28eaecff8@foss.st.com>
X-Cookie: First pull up, then pull down.
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] spi: stm32_qspi: Add
 transfer_one_message() spi callback
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
Content-Type: multipart/mixed; boundary="===============0936087686011075475=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0936087686011075475==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="au179GULwQfaFnA3"
Content-Disposition: inline


--au179GULwQfaFnA3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 10, 2022 at 03:15:08PM +0200, Patrice CHOTARD wrote:
> On 8/10/22 15:06, Mark Brown wrote:

> > Do we need to add something to the DT bindings to indicate that
> > parallel-memories is valid?

> You mean in the st,stm32-qspi.yaml DT binding file ? Right i think it could be preferable to add it.

Yes.  Though I'm not clear if the bindings actually want to enforce it
there, it's a device level property not a controller level one so it
might not be something where controller support gets validated.

--au179GULwQfaFnA3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLzsTkACgkQJNaLcl1U
h9Cdbwf9GfH8m3PsuOTa3pYMAN0Nk1rdYEzikCwnvXUkj8XIuLIexNhLOLUWOiBA
tdpgbrT4RPr4RShT/C2aMRKrVU+q/WFimT82mnk7VWMcYGFRNIolC3sASsuSE+7P
5lIJ94GPPAaUj6IDdDMt4f7SAD83occf53beBuBpbGvKPjHtOYeVjLmviiBlN1Fp
80vlYY/RfwhqjhKOedUShF+0KtxZeEpoaRL4bV2gM6qk5bz/+XBYNSYExXuBf9F+
KVAAejPEh45t8kaOyv+v5mlbpZXXOO66QKBB+bhafNrWtWLYS5xFYV80gt267WJu
CGlMBWb9JOZDooK5F7t8QWWs8s80/Q==
=TfEc
-----END PGP SIGNATURE-----

--au179GULwQfaFnA3--

--===============0936087686011075475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0936087686011075475==--
