Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCCA1A9BC4
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2020 13:09:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76BECC36B0C;
	Wed, 15 Apr 2020 11:09:18 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08B13C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2020 11:09:16 +0000 (UTC)
Received: from localhost (p54B33507.dip0.t-ipconnect.de [84.179.53.7])
 by pokefinder.org (Postfix) with ESMTPSA id 958422C1FF1;
 Wed, 15 Apr 2020 13:09:16 +0200 (CEST)
Date: Wed, 15 Apr 2020 13:09:16 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200415110916.GO1141@ninjato>
References: <1585226661-26262-1-git-send-email-alain.volmat@st.com>
 <1585226661-26262-3-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1585226661-26262-3-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/2] i2c: i2c-stm32f7: allows for any
	bus frequency
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
Content-Type: multipart/mixed; boundary="===============9160461740963538447=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============9160461740963538447==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Iys0Un1O+0sigPHU"
Content-Disposition: inline


--Iys0Un1O+0sigPHU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alain,

On Thu, Mar 26, 2020 at 01:44:21PM +0100, Alain Volmat wrote:
> Do not limitate to the 3 (100KHz, 400KHz, 1MHz) bus frequency but
> instead allows any frequency (if it matches timing requirements).
> Depending on the requested frequency, use the spec data from either
> Standard, Fast or Fast Plus mode.
>=20
> Hardcoding of min/max bus frequencies is removed and is instead computed.
>=20
> The driver do not use anymore speed identifier but instead handle
> directly the frequency and figure out the spec data (necessary
> for the computation of the timing register) based on the frequency.

Useful improvement!

> +static struct stm32f7_i2c_spec *get_specs(u32 rate)

This is quite a generic namespace. Can we prefix stm32f7_<sth> here?

> +		if (rate <=3D i2c_specs[i].rate)
> +			return &i2c_specs[i];

Same for i2c_specs here?

> +static u32 get_lower_rate(u32 rate)

Here, too.

Rest looks good to me.

Regards,

   Wolfram


--Iys0Un1O+0sigPHU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6W61wACgkQFA3kzBSg
KbZhDA//QrjQyZGByv+sQkmvBPGnIsAXz2Nca2UGy56ln4/UAfHo1NvwTx3mqBJ3
ovBURYObhG5pCwDi0hi/T0jQTXjTHy5KsA/F/OoF/KnJwruXcUa+vLGfcWztPc3c
B/n22uncMOcZ84AadcTWe6wBQOQojeV25sEjfkSMMuFvfzRM/r5NXARqxDdIqsV0
lEtTPBe6ol9wwAZJwYZR3ErrDkic3GBE9aMP8TQzfvsvmMgN/qBWlSEI5Sp9930e
XSVymfMPebXhdUH6cbfTUZ8S+0+c5i/l3KA/BpV1weltc/EueYz9HH/fCsF2FHNW
5RNWV9XHSzkhe0f9ryVPmuNuTFNz9/GRzR1TIio3n/VTemC7cZxCVUQo5VURHWc0
D87DMgOz5dFL48zHLessi8n8/vOpOpweDgMHtPfYzEsIfZIRCjJxXEO+QIMD7cSp
PT26ks9/zK36lqydCx6Jpo1TLTDNlr/dJY8ag6iQjjSWgxQxm354yFTavOds15Ua
i1bGeKwYXkhFyH/TsnzX0I503nQpebW+StiPCIUOnKWS5pWA/8YvDVOAdAULOp0s
pJags5YBAv0Bd8v/mCVnbbzUKXbTuZDIT2f1rbQxl2T4//AfeLhMJ5UPVmczr4DH
08VuS7rAy0VGCvxXrWnoBgcR99qkXG8jHyecTgZzVVPHLVLT5uo=
=rnTO
-----END PGP SIGNATURE-----

--Iys0Un1O+0sigPHU--

--===============9160461740963538447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============9160461740963538447==--
