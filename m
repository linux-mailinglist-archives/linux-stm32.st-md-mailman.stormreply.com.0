Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67552714F25
	for <lists+linux-stm32@lfdr.de>; Mon, 29 May 2023 20:04:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22375C6A614;
	Mon, 29 May 2023 18:04:59 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35806C65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 May 2023 18:04:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0EA7460B65;
 Mon, 29 May 2023 18:04:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8BFC433EF;
 Mon, 29 May 2023 18:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685383495;
 bh=kKXl/E6gk/dFtNN1CB6T+UUUTzz3mIITm1Zk1GG7tus=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=JCQgSoo18UhGLXd+xiwAkYtVwqA5NX24O+I56aRUT5icZAE5vL5S/4z00fLLFRESd
 xmtuIEJUP9PBZwTuI+0IsPSpVoeCFbmYxsSqpYoivPprpeq17qBZhZKeoDsCKXvx6q
 vrj86t4tv50hcneL/qFbXMo1sBwqFaaMbvxLew+f5mFewlqU00He2X2s0NIkIkhEvp
 3SWgdCV2BCk8KzTf2KSoj9z0cjHx9bIAHhvtqHua6hDm6AwaaczsLdhVXz1DuFVVlO
 0CYy7Jx5yXRQScPNqHScGXKUPGkuVi2+2MK7Skx+uV9vWUlZN5necuhifV5TLgjf8o
 wNL20SZiI6Y7A==
Date: Mon, 29 May 2023 19:04:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <20230529-enrich-clammy-14b498baf09f@spud>
References: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
 <20230529162034.20481-3-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20230529162034.20481-3-alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, soc@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Olof Johansson <olof@lixom.net>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 02/11] pinctrl: stm32: add stm32mp257
	pinctrl support
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
Content-Type: multipart/mixed; boundary="===============0165806650174397765=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0165806650174397765==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t41OrSZBzQnUEuSq"
Content-Disposition: inline


--t41OrSZBzQnUEuSq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 29, 2023 at 06:20:25PM +0200, Alexandre Torgue wrote:
> Add stm32mp257 pinctrl support.
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.h b/drivers/pinctrl/stm32/pinctrl-stm32.h
> index e0c31c4c8bca..5e5de92ddd58 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.h
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.h
> @@ -24,6 +24,9 @@
>  #define STM32MP_PKG_AB		BIT(1)
>  #define STM32MP_PKG_AC		BIT(2)
>  #define STM32MP_PKG_AD		BIT(3)
> +#define STM32MP_PKG_AI		BIT(8)
> +#define STM32MP_PKG_AK		BIT(10)
> +#define STM32MP_PKG_AL		BIT(11)

Mainly out of curiosity, why have you go duplicate defines for these?

Cheers,
Conor.

--t41OrSZBzQnUEuSq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHTpQQAKCRB4tDGHoIJi
0prAAP4kVP4W0utKn8JZzGkGIrQ25LkCdWPdC3VDNVom01MAdQEA5+piPAcHUvh6
DL7szeSe5AxTep3AtCjEfp4OSJa+PQQ=
=2SPj
-----END PGP SIGNATURE-----

--t41OrSZBzQnUEuSq--

--===============0165806650174397765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0165806650174397765==--
