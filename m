Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C58F81C871
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Dec 2023 11:45:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8F9BC6C841;
	Fri, 22 Dec 2023 10:45:25 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E555C6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 10:45:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 803B6CE210D;
 Fri, 22 Dec 2023 10:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3364FC433C7;
 Fri, 22 Dec 2023 10:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703241922;
 bh=j6u6qc8mKIXCYNvw3/ltEB01MEkVvYdNodFa5ihcHbU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jFsjYMDnA+EK3KETfTX1ys4qoDEGj8edi1SiA3UCa+ctPaH2N4SL38ntWeqBaeQCR
 tPpy3u9wacnQVwXR8R6XoVvm6/5ocLKyPrTvVTm6u60qNG51ZYJBozfdr2y53MATtv
 S7KhDddmfTUNaRc4/7u6cP+BnCGx7hcrAAArEaIpISxUaYtB9CxqXCl0805hsDn6bo
 sRXp9OGzMnys59HVtD/r34EKQuu3kDFvNBJQ0RV5um9pkI5ULmF7WjAMTl/LqG0xkI
 mP9Poi5YXhzfIyE/EThUtrCFYtxEkc3xXC8iJpgN2pGN2iJOnHBapxP2ORYQq2daXq
 CmGRAms9DEpeQ==
Date: Fri, 22 Dec 2023 11:45:18 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <ZYVovt1SmdgS58yH@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Conor Dooley <conor@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231215170617.95868-1-alain.volmat@foss.st.com>
 <20231215170617.95868-5-alain.volmat@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20231215170617.95868-5-alain.volmat@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 linux-i2c@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 4/9] dt-bindings: i2c: document st,
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
Content-Type: multipart/mixed; boundary="===============3112289457339609440=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3112289457339609440==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SfM8nc8lNtqzF+65"
Content-Disposition: inline


--SfM8nc8lNtqzF+65
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 06:06:08PM +0100, Alain Volmat wrote:
> Add a new compatible st,stm32mp25-i2c for the STM32MP25 series which
> has only one interrupt line for both events and errors and differs in
> term of handling of FastModePlus.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Applied to for-next, thanks!


--SfM8nc8lNtqzF+65
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWFaLoACgkQFA3kzBSg
KbZWzg//Ql52lah+pe7q8sJkG29V+WvWUxZU+A0JXdE3pcghyKz3zG46xRo3hNDl
wfHBdYj0T6jAcrKDX88BXfCiyqi3MjWf9TK18Ec9YAiRss57wd2RholFYWZCh5nf
lMcgR0+4KmHwte0CH3G+WNUd30AzwtFZy5MuNFWLj7PgNSIHHqvDd/8TFHAj5mCp
aOAnKivDRVHsv4fSCynVDqA1aHs0938+ZG6gqCR3etC13ybQy/cqOhg0e3w4Jx0f
5kVDH9UTpiliFi+ZMxI+CCtesWZ1OnzDIbURxnj6tHU4JmJcAQFVAScp4XTinSmi
DUnT/yN70dYYdzTsAj5FEUbAxTA6FKl3RQUxj7cOyQusFQi2b36DlzVy4MSrEMun
VDQpfpIid1mwc8PNnjbinOba1LXuywnx3aOXT4p2cJ5Jedhn2Mt0TK4CN8Cim6Qp
n+ezbaUyl7lWoWce0JnQZj7SzlojUxkfY8WG71TsPBQPCD4DEJWYW47bv063S5Cz
vWdd42XPQp1BgZwWhAkOPDUA+FGHIncr9ag0rDjHaBgJaHBHEU+xNj7W0G0lnCUz
7W3XGmlVZTlEi1tpsI6TNA261XNAd+0vSueyfy3tNcpxEG2tnfVvDArZu0QlrJxh
nn0pNTyLdsCMG1DU/UkBYC61gJPJbWpiEMfS9ial50vw+Hu6aGA=
=STyA
-----END PGP SIGNATURE-----

--SfM8nc8lNtqzF+65--

--===============3112289457339609440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3112289457339609440==--
