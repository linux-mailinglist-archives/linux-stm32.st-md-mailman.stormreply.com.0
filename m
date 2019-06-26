Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B444756B37
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jun 2019 15:50:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72A35C10C88
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jun 2019 13:50:32 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 696DEC10C84
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2019 13:50:30 +0000 (UTC)
Received: from localhost (p54B330AF.dip0.t-ipconnect.de [84.179.48.175])
 by pokefinder.org (Postfix) with ESMTPSA id 213A42C0114;
 Wed, 26 Jun 2019 15:50:30 +0200 (CEST)
Date: Wed, 26 Jun 2019 15:50:29 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20190626135029.GO801@ninjato>
References: <1559655253-27008-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
In-Reply-To: <1559655253-27008-1-git-send-email-fabrice.gasnier@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: i2c-stm32: document optional
	dmas
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
Content-Type: multipart/mixed; boundary="===============8599572738040432442=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8599572738040432442==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="keoAwTxaagou87Dg"
Content-Disposition: inline


--keoAwTxaagou87Dg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2019 at 03:34:13PM +0200, Fabrice Gasnier wrote:
> Add missing documentation for "dmas" and "dma-names" properties that can =
be
> used on i2c-stm32.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>

Maintainers?

> ---
>  Documentation/devicetree/bindings/i2c/i2c-stm32.txt | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-stm32.txt b/Docume=
ntation/devicetree/bindings/i2c/i2c-stm32.txt
> index f334738..ce3df2ff 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-stm32.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-stm32.txt
> @@ -21,6 +21,8 @@ Optional properties:
>    100000 and 400000.
>    For STM32F7, STM32H7 and STM32MP1 SoCs, Standard-mode, Fast-mode and F=
ast-mode
>    Plus are supported, possible values are 100000, 400000 and 1000000.
> +- dmas: List of phandles to rx and tx DMA channels. Refer to stm32-dma.t=
xt.
> +- dma-names: List of dma names. Valid names are: "rx" and "tx".
>  - i2c-scl-rising-time-ns: I2C SCL Rising time for the board (default: 25)
>    For STM32F7, STM32H7 and STM32MP1 only.
>  - i2c-scl-falling-time-ns: I2C SCL Falling time for the board (default: =
10)
> --=20
> 2.7.4
>=20

--keoAwTxaagou87Dg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0TeCUACgkQFA3kzBSg
KbYAzRAApZytjukntjxaFMm+so69LjERp5Yg3pQwCd5U0L3E3OjLo5dsPhuffoi8
je+cHGsEMB7A8KV48HJ581rmyC/elLIsJ+rr39tLbiyUMvWrabTLB4BvFPq1FKRR
ZTavWSA01Z+q6BTcrEynX6woY/SYD3WeES+sC+fILuqp1sY6t/RtSLPfT7Y657+g
PU0AlBy/Z3reWy9pQVUWe93UHuEI4KP3MJXuEiRylCUq7FSip2BdMnVyEY7QIrCJ
z9o1MeJ4BJD402tJI++NTPX4uxbkqCsIq1OaQkxn/lWcirCy8oL23oN7YAOzPMSw
5akc4UgfiBeE5lxSyapgnUe2Bd4zPI1epSbiQpPCt5mWTRac3MhUko4YcjCTq6Lm
i2RgCsQre1/B4ZBUOeD1A9atsqVsJvYj+X9sJW+9C/AWRT0VrIYlc0OVHZpIJO1L
M2o0LQFeQdaSfcH/2xmVFAXilcUQYHi8AWb7X0awvBY65XeDA+Khl7cvQQ3lA+kL
oJyQy0W52P6piSns80Ho+F77uGqJvKwca9GxFmNs6kM+21Ipfxux8NXaMeCWUEjR
O1BUWFFumbh7VS4BN5pGsFJ6VWt9vrQe4ko37UkkLGkzNXvq2X6+OSAwQqLkiYTv
MmykLVk1yMcVJAKSny8k/bjJKE5ushPTIINoUA6LiGxgBby4+TQ=
=uE1/
-----END PGP SIGNATURE-----

--keoAwTxaagou87Dg--

--===============8599572738040432442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8599572738040432442==--
