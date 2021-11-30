Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EA2462F96
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Nov 2021 10:28:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F157C5EC72;
	Tue, 30 Nov 2021 09:28:03 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A44B7C5A4D4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Nov 2021 09:28:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 04482B817CB;
 Tue, 30 Nov 2021 09:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DD1FC53FC1;
 Tue, 30 Nov 2021 09:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638264479;
 bh=FBNdYA1ekU53UM+Z0zPdQkztZh3+oVIjQExU995I4U0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F/+xvE5e3mwgPcAj7zf6VIhC3JBjW1Rq5+6VSxyemD685G7UunQA2xXm1zgadMEi0
 Nb4/qRNPawnQ9EqxPSumxqwHjJprQorFW0IX9uD3loea6ch5ZFMii2X4f26e+VuZki
 d1CGi8QZ3bM71zmcuxGgGI2aPS3FK62/upnUqva4Jp8sAxCCUr7QLqIVDXIaBP58aQ
 0EZepIsiq4W2ap4iCLodE75n4CzwaEVObVOhf7vlk+TZxvGt5ZfjenmQmHT1kwr/jv
 7iZdTyoE+uA5wedcwDswxEzC/jY16Bmotg35WM1lVhAlN13pf7fp5Iw++DhJWlsoEw
 ln9OChBaqs10w==
Date: Tue, 30 Nov 2021 10:27:56 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <YaXunKuYf9S4/GOr@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 pierre-yves.mordret@foss.st.com, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
References: <1632151292-18503-1-git-send-email-alain.volmat@foss.st.com>
 <1632151292-18503-4-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <1632151292-18503-4-git-send-email-alain.volmat@foss.st.com>
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/4] i2c: stm32f7: stop dma transfer in
	case of NACK
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
Content-Type: multipart/mixed; boundary="===============4668228658286087377=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4668228658286087377==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TzOmG6v0i68yd2Fg"
Content-Disposition: inline


--TzOmG6v0i68yd2Fg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 05:21:31PM +0200, Alain Volmat wrote:
> In case of receiving a NACK, the dma transfer should be stopped
> to avoid feeding data into the FIFO.
> Also ensure to properly return the proper error code and avoid
> waiting for the end of the dma completion in case of
> error happening during the transmission.
>=20
> Fixes: 7ecc8cfde553 ("i2c: i2c-stm32f7: Add DMA support")
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Applied to for-current, thanks!


--TzOmG6v0i68yd2Fg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGl7pwACgkQFA3kzBSg
KbY/FQ//WnDVD0iswoT8WYcu/TTCEfsHGhSi5ELnU4DlZrmAPo6qxC8HE+62tdrh
g1GmaKJofEStWIpbNL/weh6siMp/01jHrA4H9Vws5NpG6W8/U5MF5XZNVbh1hBx1
wtUOI3NperjifGXhAUjJH9O4W0zPo3oCFqcq8MUBLZHQywYRCNnJZPwVrZAFcW/5
PgO46Jj6MHIfkt0V3tAvaI0heXLZbMa03ywQ/LmqxJ48+3rNGYidwKuqFiPdmfPG
JZ3AZDgfcRT5nAWvaORc5V7eqj/X6oBEBiLGLocGXexo7jg4LQAFwqYYA2o0Jtvq
s0NAsa9GjIV6BMo5Al1fVsN2u1RNzt1uPrxPbuG+oNk4h/cKcj+aqk8X7BN0EKfj
cOLiyJOAkNi/fSrIIfOTE7ZLGgROOTZxy+imEdJQT/L2b23iX4Eg7yX7/4+C8nwI
Ge9xtyEqOfL9VTn6P8vkkMjRDp/b8OTjT+4XinKuNJUh3gp1UIQk6Zc0ZKmurfNc
qBx1rWQqorTNGFFR7shHoJpXFWTUriEjKHlLVLqqYTruH/q5FV+WKGUNo17VoPRL
MPcRpPYFIzCw5WOJoYIVFG8KD6PIATfJNmgO59zdtcwyunq6GTozl7U0/OT/FThe
S/dB+z9qWmlcRr9c5NsQ5MGv6WScQAQMUDJx0KoAxjJGM+PpY50=
=43U7
-----END PGP SIGNATURE-----

--TzOmG6v0i68yd2Fg--

--===============4668228658286087377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4668228658286087377==--
