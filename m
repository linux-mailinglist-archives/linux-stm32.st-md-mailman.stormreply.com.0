Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C437390BB
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jun 2023 22:25:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28B0CC65E4F;
	Wed, 21 Jun 2023 20:25:47 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7738C5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 20:25:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6FF6F6152D;
 Wed, 21 Jun 2023 20:25:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C38BC433C0;
 Wed, 21 Jun 2023 20:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687379143;
 bh=71PzaMyKoxBeJXspcxYu8rrOAD0xsdLBvCQ9mgAr55Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QoIEg6yMYVqBkSShPeF1qBqn4KK9Ie9YQApFL4YB34t0ofPfdSwAJwSjE26lCeReJ
 OXUOU7ekp7Rx30rDJ6F/JcUTt6jv3wGsY7bI5GqSNWFR16SgotErKqYzvNztqjotAJ
 6HOjVZGhZP2FHIoGISyT/JkOMrEzLgf0lOmDX1UOI87Jh9ohynOPEwlrKKVaUQ+wtf
 dn5uiyh5wACtsUW+1QOH/o6lSM+ZvGyyXBW0976mpYMB/MrQcjd6UC3eElRqjF18Bq
 VqJ+1R0uYrPl8heVW9FkxNT/S5eceRLs/Tb2xfmrNiqUEyKi/M/xHCzfS9I2lg8fqR
 Wlqa1iGRM4H1A==
Date: Wed, 21 Jun 2023 21:25:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Sean Nyekjaer <sean@geanix.com>
Message-ID: <20230621-coastline-dormitory-96aab31edf02@spud>
References: <20230621063339.1361073-1-sean@geanix.com>
 <20230621063339.1361073-7-sean@geanix.com>
MIME-Version: 1.0
In-Reply-To: <20230621063339.1361073-7-sean@geanix.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dantuguf14105@gmail.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 7/8] dt-bindings: arm: stm32: add extra
 SiP compatible for oct, stm32mp157c-osd32-red
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
Content-Type: multipart/mixed; boundary="===============0802761181070329046=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0802761181070329046==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eZxzdwibNvFMLjCf"
Content-Disposition: inline


--eZxzdwibNvFMLjCf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2023 at 08:33:37AM +0200, Sean Nyekjaer wrote:
> Add binding support for the Octavo OSD32MP1-RED development board.
>=20
> General features:
>  - STM32MP157C
>  - 512MB DDR3
>  - CAN-FD
>  - HDMI
>  - USB-C OTG
>  - UART
>=20
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--eZxzdwibNvFMLjCf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJNcwgAKCRB4tDGHoIJi
0oPSAQD8hyF0F6eEopPXhCPfvzs0TO2g608r7XewBzspF94b+gEAvnOvJPFRkJ3r
lvbQtBPWH5wGdAT0GqwGVk5P0Nj71gI=
=re94
-----END PGP SIGNATURE-----

--eZxzdwibNvFMLjCf--

--===============0802761181070329046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0802761181070329046==--
