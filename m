Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF09E546631
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jun 2022 14:03:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63F49C5F1D7;
	Fri, 10 Jun 2022 12:03:25 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE1B5C03FFF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 12:03:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A4AC5CE35D7;
 Fri, 10 Jun 2022 12:03:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9656BC3411D;
 Fri, 10 Jun 2022 12:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654862598;
 bh=f91prLddVZ6W3Wxb6Hqxhw4VdV2kGrg/IH7kR4PdhnY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U1znS8ABzt3/7+3tW8r9w0ODLWoHYuds726WAKeoahr9hFltRLm81H0CA03oc5Onx
 23VM+SJfFghn425BmH1i2xpNVPDVsNSvEL/cpHEuCZoyxDGEaAo989Whdcq+w8Xr0x
 eM1QnspuhULq9B32zaxPnZEYYuRFsh5AvVkZYA+n9Rb1/XRe3sNm605YjInqypuQGf
 Ct0RLvUATkkDNkfEu+LaV/yPbv5tU1dN7tRgiZFdckQmCpZSAeMflyqASdKidO9ISp
 ZlUgqPC+kRCvY06U7U1bpuV5knThQEuewmaR79v8OzQme2AWBWAAH0vkrEzq39r705
 METMJ1sJh6Oyg==
Date: Fri, 10 Jun 2022 13:03:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Message-ID: <YqMy/FkxDPKmzdrB@sirena.org.uk>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
 <165478153064.1052094.1721875477574787769.b4-ty@kernel.org>
 <2a498819-dbbf-31c1-4145-bbd2d7179bd8@sholland.org>
MIME-Version: 1.0
In-Reply-To: <2a498819-dbbf-31c1-4145-bbd2d7179bd8@sholland.org>
X-Cookie: Teachers have class.
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
 srinivas.kandagatla@linaro.org, peter.ujfalusi@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-sunxi@lists.linux.dev, linux-xtensa@linux-xtensa.org, nsaenz@kernel.org,
 ckeepax@opensource.cirrus.com, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, patches@opensource.cirrus.com,
 nicolas.ferre@microchip.com, jarkko.nikula@bitmer.com, kernel@pengutronix.de,
 shawnguo@kernel.org, daniel@zonque.org
Subject: Re: [Linux-stm32] [PATCH 00/56] Specify clock provider directly to
	CPU DAIs
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
Content-Type: multipart/mixed; boundary="===============0641056400367845282=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0641056400367845282==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uQXJNv1MQUHjV+R+"
Content-Disposition: inline


--uQXJNv1MQUHjV+R+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 09, 2022 at 09:03:15PM -0500, Samuel Holland wrote:
> On 6/9/22 8:32 AM, Mark Brown wrote:
> > On Thu, 19 May 2022 16:42:22 +0100, Charles Keepax wrote:

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

> > [22/56] ASoC: sunxi: Update to use set_fmt_new callback
> >         commit: 7cc3965fde74c9c725ed01de4ac35bc7d562d16a

> This patch is wrong, which I pointed out earlier[1]. It will break audio on the
> Allwinner A33 and A64 SoCs. Charles said he would send a v2[2]. Excluding the
> changes to sound/soc/sunxi/sun8i-codec.c from the patch would fix it.

Your mail doesn't say that this will break, it says the change is
unexpected.  In any case, please send an incremental fix - there's no
need to revert the entire series for this.

--uQXJNv1MQUHjV+R+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKjMvsACgkQJNaLcl1U
h9DEiwgAg5/u/EffroYC0gc/E++OVOkz3gwInEgNAC9hOiZUubIV0pLgHmDWF03b
jPn25vdDiJrTgFiUmwAYyaI1N8iwXmd1UllhVOv/gLkFfltVeVeI5bb7VHjskvpU
Xx9nbpqcM0LhbDF9NG+WYAoVy5NB/aJZRKoCWoc2qbqyxE4kHlcQ+uGmXHyJDseS
8BmRAzbUgyMhj1H2rxUsdSJBv07mGmLozTE9V6Ah8CM/7n4PVN9VjDs29qDcs1v2
4cxYC5JHT+tbp1KldMeaAv50v0292Sfvps0RbW8zrLY4WwXo5mYJWrS+TYv1UQ+M
XNVup9oVA23wO2KVtvmWoirnwl8blg==
=hG/3
-----END PGP SIGNATURE-----

--uQXJNv1MQUHjV+R+--

--===============0641056400367845282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0641056400367845282==--
