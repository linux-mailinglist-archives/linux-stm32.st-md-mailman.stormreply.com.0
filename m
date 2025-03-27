Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E99E5A736FD
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Mar 2025 17:38:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 888A7C78F72;
	Thu, 27 Mar 2025 16:38:19 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F341C78F6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Mar 2025 16:38:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AD8CA5C35A5;
 Thu, 27 Mar 2025 16:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15777C4CEE8;
 Thu, 27 Mar 2025 16:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743093496;
 bh=NvC16u1aqR/2KG04a8f4N6Xoq/iI1HOtNPpUepOa0Ms=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o3ztZUCEsTgAufZFIr54bxgGmr3liOeSSxSNHer94WsXcmqD6VkiFMJpgxN4qBDpI
 BtOIwp8CLI6Ri4PDU0wPxHZv5eCUfsEgY7UXGM0/Ipj1Quhx6WA8bn+cnuw5/RSjpN
 bGulEuC72O8WOwISAx5IXkbmdCIw4BWmhGMyjjoQINgPphdojzU37IE9tM1hJf4cHc
 O4CLk/OaeYXzHinKCDM+z/NZ/ltVO6XamoCGyi9f6WXu+dYHBuxHbEWcS2uYtUzd9Q
 XeWV1DkJRBHxTNFVnGvmccUeI6FFgZYGXMTEfcfvg4P/nF4X5H6d7Hs+9tSjt4MFvc
 v8so7ojzrKQSA==
Date: Thu, 27 Mar 2025 16:38:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20250327-defiant-quicksand-83cfdd8cf8d8@spud>
References: <20250327082721.641278-1-arnaud.pouliquen@foss.st.com>
 <20250327082721.641278-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20250327082721.641278-2-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: remoteproc:
 stm32-rproc: Add firmware-name property
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
Content-Type: multipart/mixed; boundary="===============2124926111879395585=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2124926111879395585==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ytieV3SLIaVgIcdG"
Content-Disposition: inline


--ytieV3SLIaVgIcdG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 09:27:20AM +0100, Arnaud Pouliquen wrote:
> Add the 'firmware-name' property to the remote processor binding
> to allow specifying the default firmware name in the device tree.
>=20
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ytieV3SLIaVgIcdG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ+V+8wAKCRB4tDGHoIJi
0rA7AP9JyUbjLOakoM+hJBNcmQksv1MkDD5pE8noBMWu3qQ68AEAsjA4jPrHo7Co
a14daJ3eTuSb4JbviHqOsCWo9L2j0As=
=9SvW
-----END PGP SIGNATURE-----

--ytieV3SLIaVgIcdG--

--===============2124926111879395585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2124926111879395585==--
