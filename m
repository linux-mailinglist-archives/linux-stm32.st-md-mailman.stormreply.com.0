Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B9F3377E9
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 16:35:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BF73C5718B;
	Thu, 11 Mar 2021 15:35:33 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3074C56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 15:35:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F214964F46;
 Thu, 11 Mar 2021 15:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615476929;
 bh=zAgboUjHHYtSTApDhEwGuBzEumVnZm12d8hI44Sy55c=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=Ke6tN8VnwcrLmL2Q2jUfC9ZA9s7EyGy3T54ZcGRmWIGRpDgIwLttVr6Ehce8IONoe
 xFb1SF7rEYR+atDV344GT0OHFUTDY35SXRhp7RczqKREG5yS2OzC+ZGFvjUJSbtHFv
 kOS2EJ7aJJdtCnT4cPC4/RTEEtOSoBUFxdepUD2Kv5SUmKZ6rPY3P412xnr7Btgc2Z
 vjE993D2QXRIBGCygPLXYpqXi7d8ABSoIyRyIlK+J9TZMHeJmqbOjk9V5VU8JvBRbt
 BTpzQJl8s4MyyjVjchocujVQYU/niPELw49UEURznPD8vVbFDtDG4M/7e4MWqurAHm
 EPHL/5qFywnWg==
Date: Thu, 11 Mar 2021 16:35:25 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <20210311153525.GI3566@ninjato>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
 <20210311152738.1318541-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20210311152738.1318541-1-krzysztof.kozlowski@canonical.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-i2c@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
 Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Tom Rix <trix@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-fpga@vger.kernel.org, devicetree@vger.kernel.org,
 Robert Richter <rric@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>,
 Arnd Bergmann <arnd@arndb.de>, dmaengine@vger.kernel.org, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 James Morse <james.morse@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Olof Johansson <olof@lixom.net>, Borislav Petkov <bp@alien8.de>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v3 13/15] i2c: altera: use
 ARCH_INTEL_SOCFPGA also for 32-bit ARM SoCs
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
Content-Type: multipart/mixed; boundary="===============3920682221096495179=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3920682221096495179==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5uO961YFyoDlzFnP"
Content-Disposition: inline


--5uO961YFyoDlzFnP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 04:27:38PM +0100, Krzysztof Kozlowski wrote:
> ARCH_SOCFPGA is being renamed to ARCH_INTEL_SOCFPGA so adjust the
> 32-bit ARM drivers to rely on new symbol.
>=20
> The side effect is that the I2C_ALTERA will now be available for both
> 32-bit and 64-bit Intel SoCFPGA, even though it is used only for 32-bit.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Acked-by: Wolfram Sang <wsa@kernel.org>


--5uO961YFyoDlzFnP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBKOLkACgkQFA3kzBSg
KbbZ/w/9GRR5AjuL/bna/Vk8wI5mY1iTWUuqDmvXapF1EgH2dIRC1PQbIpNEndNW
xqCH2kRbwlPINKD0E+N99R+T/wsk2qMu5hSkl+IQHHRzuF9ZeThFUnJCDzUF0UMS
WoMTLrYyl1/ei2jJHzvbC5mmsOg3ckJA3c/wI9oATNu8yHQ5ptkYGBYPzh8IcPQS
Z3WMvWz6Ir4NBpy68lJ0EPW5/mgLdBGI+6/JRNh+8CABa9IU/eZsHxWVj4fOE92W
Eao/3P9oVGI+fcNxIp0oMrWFkw0emhGlcS+XyiKtvHhBlvmlkeenrOYU3ARDllNj
Lv+Lrp0fT7H6kTUcJEAzLAza8h6v94J9KOdRR0Ll1sBALSv7OA5HHNgmfutZpWSs
grYmZqs34BbSr8NGOdU90f02peBMLDYt4kiV7OtbjhSnV71xI1F6dyQCLaFEXAz7
J/AAKzgBbFTtO1wtE3jwSeBGSSc7QeuKyPAERwFWjN2f2J37/bC/R6c/AxAmCNXi
+jcMDrOwQWlbaYFYQLo75tdowmM1LrEmptykTH0dWpDx2RXdmsSz6VGamqHdfTM3
FJ/VRIuqVu20LB55FSNLCxmwxnTVvv/OcnDwMAYDlQIYMsFigLTBWFNtRVmvGNPK
WHUoXN5NBygSwkUPKGDji5EAKyZBa/QMW3C9Nn1aU4MXlAFKZFk=
=53ZM
-----END PGP SIGNATURE-----

--5uO961YFyoDlzFnP--

--===============3920682221096495179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3920682221096495179==--
