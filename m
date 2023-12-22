Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFD481C868
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Dec 2023 11:44:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F625C6C841;
	Fri, 22 Dec 2023 10:44:56 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43EF6C6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 10:44:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0A38961B9D;
 Fri, 22 Dec 2023 10:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C51C433C7;
 Fri, 22 Dec 2023 10:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703241893;
 bh=7e+Utf9Qlw1YNCEUEiHrjDQwDvUaHVt+rooHNGyIPmQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ir74O527NqK1c7IXNF3bkTx3shCgDtrS+5AeOie1qboYeD34/3DHCrOfd1yH1KWVG
 XRNnAlC0HE6zvH2CLyBn4x+sxBY9CB6RsUg0pJjfGxTAmhkvf1bdN77mhgsyvysrjE
 bmPjdUU3jTFb45kXveHqcaL80Jo9WEuEcyvxeXheQuZ+Xesz5Xr0ngpIvG0CteVJtM
 +oMy894FyEwLN/JspoqIXB5CivSKK9TNpbVkcg2MQAcy58Z4cOFXJElzkWUzPrvZBF
 jz6IEaXyDsiuCCa0tYYkXUC8pyntWHIMHreE8CyAQwhCZVxL9lLDIqMDGcLtTWK3ow
 hXqsWPIz7X02w==
Date: Fri, 22 Dec 2023 11:44:50 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <ZYVoolBtWqO7DLIn@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Conor Dooley <conor@kernel.org>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231215170617.95868-1-alain.volmat@foss.st.com>
 <20231215170617.95868-2-alain.volmat@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20231215170617.95868-2-alain.volmat@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/9] i2c: stm32f7: use dev_err_probe
 upon calls of devm_request_irq
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
Content-Type: multipart/mixed; boundary="===============2742094841313792201=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2742094841313792201==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hSNLBrCnvxbMjT4J"
Content-Disposition: inline


--hSNLBrCnvxbMjT4J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 06:06:05PM +0100, Alain Volmat wrote:
> Convert error handling upon calls of devm_request_irq functions during
> the probe of the driver.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Applied to for-next, thanks!


--hSNLBrCnvxbMjT4J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWFaKIACgkQFA3kzBSg
KbYwoxAApxFJGCB9R+nd+wvF2Bvp64UJBnwx5mwqvzFNB1MvH6EFwmAcOoPINY2P
kCyxayAC8Bumn73LfsMstBXIhtXrE1g4YhcJNlEOADNxIKxTtQKYABkTzXmLYDHa
kXuQ6RBGAE3YpGFZb+/Zwkt3ChsGPuanp+mclugUL09jTRDmpChMRaKtDqwoXl+A
fth/R7PnDnPHfUA5Sa7A9wvxI5Q2lPgSBaw7dDRgLq+InagiHIik/dG+8XcungFi
rTvAv56TuiyUqKfQkEm5ka3PZAF5wToApWfIh5MyMYnhSVAZf4BIkg1wbj5KcSCt
acPlqxYrOMV/YO8S07iOkY7myXHIALeHsk84wWl28stsVAe+C9XNOk7eo1HEUY7X
NWXhTjpBtOOX+tN4mS3NouDIkMi0ojeewGVej527i9x7q5muxLRrjVFmMsJYXB5V
yfyR28ErQSUdGyT1Cjd5LPukS52tzXcKrUykbgadtf+lXjVjqID2W6mfiwxp30JR
plS5NREZ/r3BDM0657QGnw+5M3tU1rpsiFcMa578iocYuV6E8RD6HXKHU4w5MZGg
Wzro00foVrM9gZQgw0m0uOnCjLLuO32jgJJ4PA9l93KABJCcsWBn9guC5NsObysE
CkR8f8YoYh83XQTVvhsw+/iNfLHmb8N14jNTC9a32qua8Hevqrs=
=MpQv
-----END PGP SIGNATURE-----

--hSNLBrCnvxbMjT4J--

--===============2742094841313792201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2742094841313792201==--
