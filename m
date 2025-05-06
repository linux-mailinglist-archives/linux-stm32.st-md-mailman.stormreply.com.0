Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86658AACA9F
	for <lists+linux-stm32@lfdr.de>; Tue,  6 May 2025 18:14:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C262C78F72;
	Tue,  6 May 2025 16:14:42 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBCFCC78F69
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 May 2025 16:14:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 93BE75C5895;
 Tue,  6 May 2025 16:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A75C4CEE4;
 Tue,  6 May 2025 16:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746548079;
 bh=1ypU94/spMRuuaW8oUslWrYwTwesWHuCxWvGpHpQRE4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PVusvau3SFraqt+t3mhXCGUNHZNXuR8YT1Blj/uHtNCgOPPzKoJVfXJc6RMj2k1Uj
 LGLZRcoOlXxUdx5HBUKSOL8hr/QRS6D0CKJPEIlUIbCW+u6gygJlUSn2HOzQkponZT
 crySLupoTkG2s2SJnC+mnn39i/3EvwQN2otljBn6qbyXoOus9GpQsPyWlzkdNDEOpM
 yi5rdgHSiEnAYM49pNKpGWJvWSCZgLqbjpuOqNvjTe7UM8mb1id22qqH04p2wOnMVV
 9jsdq+djbJk0uQA7WLtZWJv2+wlILDuuc0KrZB3QLzDSd2Uo3Ge0jbxha48DlsMnVh
 ZJ2aT39tzrggw==
Date: Tue, 6 May 2025 17:14:35 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Message-ID: <20250506-pavilion-untitled-4fe58ac3ea8d@spud>
References: <20250505161933.1432791-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250505161933.1432791-1-robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: clock: Drop st,
	stm32h7-rcc.txt
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
Content-Type: multipart/mixed; boundary="===============3735110496662538382=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3735110496662538382==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CYQGms6AKNaAAgzh"
Content-Disposition: inline


--CYQGms6AKNaAAgzh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 05, 2025 at 11:19:32AM -0500, Rob Herring (Arm) wrote:
> The binding is already covered by st,stm32-rcc.yaml.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--CYQGms6AKNaAAgzh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBo1agAKCRB4tDGHoIJi
0jxWAP9pzilu/jY6IaMdihNS0DPg0F+ztLgSX7uvqQmKhjOleAD+NeE9OmJMCM0r
+rVYYYXrjSJM8i8/MtW3R9duxH03fww=
=JA1k
-----END PGP SIGNATURE-----

--CYQGms6AKNaAAgzh--

--===============3735110496662538382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3735110496662538382==--
