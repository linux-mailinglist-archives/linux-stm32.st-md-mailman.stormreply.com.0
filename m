Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABB8C324D5
	for <lists+linux-stm32@lfdr.de>; Tue, 04 Nov 2025 18:21:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA00EC62ED5;
	Tue,  4 Nov 2025 17:21:46 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 341ECC62ECF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 17:21:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E3E84402E7;
 Tue,  4 Nov 2025 17:21:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C666FC4CEF8;
 Tue,  4 Nov 2025 17:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762276903;
 bh=8EJ06/xu+MF3npKBmkZkcX4nKJgZvz6INMbxir4/Xe4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O09p6ApLebmrl/aHzF6TcAoaXfhDCrzMISaQ5q8vGfdY8Bd6AIySyugt1StuAtiar
 ozDRdquvT8cnFImmxDdKkLTu08IgDACEku9FuBDOfWnqsrVwDaq4S016OwF2C4P8Dx
 Fve71DPcsTCjSmGb0ZQszdeS3QxPKwBTpvRIeGwgNNaMJEZlmBzmjiGTQd+lGutRe3
 3eu26Fs9ShJx51vYDGf58SqAjHdICcA0pF01t6Gxd2kZwEivF2ZyFdVJ555Fj7rx+T
 WuYKQXsdojm6sHUUbGlPmeG9garKVVzsMsj+ppOuaOgr7KlPZgCltdQYcUUNlO9O6T
 orin7P94k+zxw==
Date: Tue, 4 Nov 2025 17:21:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <20251104-cycling-paralyses-8e99cda7944c@spud>
References: <20251104-rifsc_debugfs-v1-0-7ebdfbf8d33f@foss.st.com>
 <20251104-rifsc_debugfs-v1-1-7ebdfbf8d33f@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20251104-rifsc_debugfs-v1-1-7ebdfbf8d33f@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: bus: add stm32mp21 RIFSC
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
Content-Type: multipart/mixed; boundary="===============1933419225169387554=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1933419225169387554==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ja5NuCERZEEhWodx"
Content-Disposition: inline


--Ja5NuCERZEEhWodx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 04, 2025 at 02:54:10PM +0100, Gatien Chevallier wrote:
> The STM32MP21x platforms have a slightly different RIFSC. While its
> core functionalities are similar, the wiring is not the same. Hence,
> declare a new compatible.
>=20
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Ja5NuCERZEEhWodx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQo2IwAKCRB4tDGHoIJi
0sdCAP9L1bHKFI2Qo75eH5i+O1mmMlb2f4QGSM0NNzMxwNGoRwEA6NFzMMoR4anc
eHAn0FSEmUesoeTP9grmuAiPkOVScAw=
=8oy3
-----END PGP SIGNATURE-----

--Ja5NuCERZEEhWodx--

--===============1933419225169387554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1933419225169387554==--
