Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E68227E0503
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Nov 2023 15:52:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 860AFC6B457;
	Fri,  3 Nov 2023 14:52:09 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8408AC6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Nov 2023 14:52:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3EBC4CE2298;
 Fri,  3 Nov 2023 14:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B2EBC433C8;
 Fri,  3 Nov 2023 14:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699023124;
 bh=4bHaoYOS4B9eXzOUxbBMi4UFw6BQf47ZMRIEzv/wmGk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H/hhCnHgvk0wtt4RmBnnVGvhZ2iYuOefHbOYtZ+3xY+pocEj9jM8jbswuiz4f8sM9
 0HpfMQTmAc18HxjUgLduXc3eSh7JTVyDL1OvR7m/gSsWcI2VdJUd7EdVNY4w/SdgLj
 GAyk3x6O9spbV+q0EdkVG7HU8Md5a4TgMxTYZ7MarmdUQmXPBxm8+jImSh6AonzGMn
 4MsH7LHsUTi5khe9KkkYyD8bu2yOw2XyR+3sF++K6rtGxMJRAjFzqsVGsVNKziZXmj
 OSlSVhk5fIYKWMwLhKU6rnq5mlo/WWtRlBHpylWmme/Fx8/at520Z2eKx8T9a7Irla
 EnxIPPzaFifxg==
Date: Fri, 3 Nov 2023 14:51:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Message-ID: <20231103-appendix-emission-952777ef7c4f@spud>
References: <20231102193722.3042245-1-ben.wolsieffer@hefring.com>
 <20231102193722.3042245-4-ben.wolsieffer@hefring.com>
 <20231103-recognize-unwashed-b8f1a83fe851@spud>
 <ZUT1qFieeCby9ALg@dell-precision-5540>
MIME-Version: 1.0
In-Reply-To: <ZUT1qFieeCby9ALg@dell-precision-5540>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/5] dt-bindings: spi: add stm32f7-spi
	compatible
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
Content-Type: multipart/mixed; boundary="===============7454271337795534400=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7454271337795534400==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tTMlnMyASVIYvi+Q"
Content-Disposition: inline


--tTMlnMyASVIYvi+Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 03, 2023 at 09:29:12AM -0400, Ben Wolsieffer wrote:
> Hi Conor,
>=20
> On Fri, Nov 03, 2023 at 12:50:53PM +0000, Conor Dooley wrote:
> > On Thu, Nov 02, 2023 at 03:37:20PM -0400, Ben Wolsieffer wrote:
> > A wider range of supported word sizes and some additional buffers,
> > implies that the F4 could be used as a fallback compatible. Does the
> > register map change incompatibly in the process of widening the FIFOs or
> > something like that?
>=20
> Yes, the F4 has a single bit to select 8 or 16 bit word size, while the
> F7 uses four bits to select an arbitrary word size from 4 to 16 bits.
> This series supports the packing mode, to allow sending two <=3D8 bit
> words with a single write to the FIFO, but even if we didn't want to
> support this feature, the F7 would require setting the FRXTH bit (not
> present in the F4) when using <=3D8 bit word sizes.

Oke.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--tTMlnMyASVIYvi+Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUUJCwAKCRB4tDGHoIJi
0uZNAQDaM89wVrUomad2qB/scux1aTsV0078OLOhPo1oBRJU6QEAreeGymSr+62N
2wgkvW+8zNqVcQ2CZILtHMikzYCVbwI=
=lzfn
-----END PGP SIGNATURE-----

--tTMlnMyASVIYvi+Q--

--===============7454271337795534400==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7454271337795534400==--
