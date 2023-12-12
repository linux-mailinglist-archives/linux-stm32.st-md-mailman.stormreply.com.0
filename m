Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB6C80F408
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Dec 2023 18:07:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 098AFC6C85B;
	Tue, 12 Dec 2023 17:07:45 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35B3EC6C856
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Dec 2023 17:07:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id AC8B9B815AE;
 Tue, 12 Dec 2023 17:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA70C433C8;
 Tue, 12 Dec 2023 17:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702400862;
 bh=J/lDad9QrmDvv4QIJLMBuzqTunxmfmWR+ks34mIko04=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YAi0UICmaENZ3T+M5TG7HDCc6sJCcZ8HaQJxeGXrjzmPUdaJtXEQHQJvGQWzzKGEM
 bEv2+iJ+NEw7xlqJDyNxi7j81X9Y444vBIOT7c+bRgpWKqQPygU/twIWYzgPowxlfS
 J1SZcysNWY8o/bnTrZwtIRiUXLD5mo6D1xRoMh7yFTKkUWp/ZEZ9eGDjXF/ptE+x1Q
 80nmw9+aEJ3i9RaO0ona2ewwPe2cyl0Wdk74F3ITBtMnv7C6l68pXwIIKcVE/WMEqu
 Mj6sXaPiHAxKU5wZHt1mwHLPkEdo1lRq2bCTVZ22X28qZFY5SVXoq6JIPrF851KP7T
 JG2NxvQ1d/r4g==
Date: Tue, 12 Dec 2023 17:07:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20231212-slander-violation-8893701db296@spud>
References: <20231208164719.3584028-1-alain.volmat@foss.st.com>
 <20231208164719.3584028-4-alain.volmat@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20231208164719.3584028-4-alain.volmat@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/7] dt-bindings: i2c: document st,
 stm32mp25-i2c compatible
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
Content-Type: multipart/mixed; boundary="===============2216375763375325543=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2216375763375325543==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RxsCoi3prQ3ojpc+"
Content-Disposition: inline


--RxsCoi3prQ3ojpc+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 08, 2023 at 05:47:12PM +0100, Alain Volmat wrote:
> Add a new compatible st,stm32mp25-i2c for the STM32MP25 series which
> has only one interrupt line for both events and errors and differs in
> term of handling of FastModePlus.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--RxsCoi3prQ3ojpc+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXiTWAAKCRB4tDGHoIJi
0ia4AP94GUpXrWSgXUwTiHVQEqUOc5uleAfgethSzbxUEhDU9wD/WJXmyLAmhwPA
9/YV+dk3M7vTu6PZXunKOZOX/JRu4Q0=
=iMKk
-----END PGP SIGNATURE-----

--RxsCoi3prQ3ojpc+--

--===============2216375763375325543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2216375763375325543==--
