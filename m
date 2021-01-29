Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A82308802
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Jan 2021 12:02:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0C8DC57183;
	Fri, 29 Jan 2021 11:02:48 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83AB7C56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Jan 2021 11:02:46 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id gx1so6177802pjb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Jan 2021 03:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5B8ZJ/eEdGrq9ZVi5tFpvgOqWpxyXE5Qa3+rlAwVtt0=;
 b=RgB3W58JjLK7SVA9n09xrUk09BuOxYM5wqNbUaYJkPoz+NizELEJlBLd1DYvVpUgg6
 KyFOhW10++87RoJBSYwJ6j02dYO42jVsj9/zgX23sD5PeGid4o+FPoYPoVaWJ3Wp9j1S
 AUeV+UDAUgEQN13kM9GW+lDVO7wf/WcMuM/Nwb3yW+0ooHcy7U0HRK7CBIW9rStZX3Pp
 VnEXfKb7IylWRG2fN5bOIw6ncn8C/cW3yAvCJbwzfcnCJmvqkqGOBKHzb/ln1ehY3kDS
 223RZONN+XXBR+yHNFEgG3wXRHPB0aU5t6qo2A9jIDuCxQm9hjejewrelMYaOBaqyaPe
 y50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5B8ZJ/eEdGrq9ZVi5tFpvgOqWpxyXE5Qa3+rlAwVtt0=;
 b=fLcacZFRwg1eVUkgb3C1+qo9RAS1fnaR7HRDyvHjUoeXi1TNUQc6Q/p7OBWLslb9kc
 Kc9XFI2aBUwk6wyCQ2Zf5AKdfXTfz4bbWZxVXe2tq6+rCkGAmfyUcmWhHVM5JALkF1sU
 uZHEUZJ+Ksd3EJxc+NhmtwmwW6IPhNIW/4SQ7TZE3Po+VPfEhr+SXZJSSOxEa3hwEDhc
 OkZ6byyImArN6du14ppM7uxPCVEHpxUkWfcFrxPAfqPtdKycjrd3mAxBmICA/8DfaCnL
 0pIW6GEbWAwzV6JmsTcYCmDM8yRTUNjeoV86nQkuYhM3JTzl7eEbQw/xIckxbrsafjhY
 wCxA==
X-Gm-Message-State: AOAM5325HNRR5HYR4DJumQAV+t4GctOb/d70Z+Uc84vM+WVyEek7Jth3
 tb6IbgpINOUHhFcR7enaUYs=
X-Google-Smtp-Source: ABdhPJzcR2wBjSO98V5pgi32SjS8pjFRXF7H0wEb1Ej7ys24nX8m8zWmsaKod0fC56zH8oFcyMoJ5A==
X-Received: by 2002:a17:90a:1503:: with SMTP id
 l3mr4032787pja.41.1611918164976; 
 Fri, 29 Jan 2021 03:02:44 -0800 (PST)
Received: from shinobu (113x33x126x33.ap113.ftth.ucom.ne.jp. [113.33.126.33])
 by smtp.gmail.com with ESMTPSA id
 e20sm8749421pgr.48.2021.01.29.03.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:02:43 -0800 (PST)
Date: Fri, 29 Jan 2021 20:02:29 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <YBPrRcJrqOnT4Rx6@shinobu>
References: <1611327803-882-1-git-send-email-fabrice.gasnier@foss.st.com>
 <YBPIzBhxkcsqKmMM@shinobu>
 <b1f42c99-40eb-420f-f965-f8c254a5b42f@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <b1f42c99-40eb-420f-f965-f8c254a5b42f@foss.st.com>
Cc: alexandre.torgue@st.com, linux-doc@vger.kernel.org,
 mchehab+huawei@kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, jic23@kernel.org, lukas.bulwahn@gmail.com,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] counter: stm32-lptimer-cnt: remove iio
	counter abi
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
Content-Type: multipart/mixed; boundary="===============1456815877381176117=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1456815877381176117==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TmCqVOCwfI3MWw6Y"
Content-Disposition: inline


--TmCqVOCwfI3MWw6Y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 29, 2021 at 10:59:15AM +0100, Fabrice Gasnier wrote:
> On 1/29/21 9:35 AM, William Breathitt Gray wrote:
> > On Fri, Jan 22, 2021 at 04:03:23PM +0100, Fabrice Gasnier wrote:
> >> Currently, the STM32 LP Timer counter driver registers into both IIO a=
nd
> >> counter subsystems, which is redundant.
> >>
> >> Remove the IIO counter ABI and IIO registration from the STM32 LP Timer
> >> counter driver since it's been superseded by the Counter subsystem
> >> as discussed in [1].
> >>
> >> Keep only the counter subsystem related part.
> >> Move a part of the ABI documentation into a driver comment.
> >>
> >> This also removes a duplicate ABI warning
> >> $ scripts/get_abi.pl validate
> >> ...
> >> /sys/bus/iio/devices/iio:deviceX/in_count0_preset is defined 2 times:
> >>   ./Documentation/ABI/testing/sysfs-bus-iio-timer-stm32:100
> >>   ./Documentation/ABI/testing/sysfs-bus-iio-lptimer-stm32:0
> >>
> >> [1] https://lkml.org/lkml/2021/1/19/347
> >>
> >> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> >> ---
> >>  .../ABI/testing/sysfs-bus-iio-lptimer-stm32        |  62 -----
> >>  drivers/counter/stm32-lptimer-cnt.c                | 297 +++---------=
---------
> >>  2 files changed, 36 insertions(+), 323 deletions(-)
> >>  delete mode 100644 Documentation/ABI/testing/sysfs-bus-iio-lptimer-st=
m32
> >=20
> > Hi Fabrice,
> >=20
> > I noticed this is missing a Kconfig change to remove the IIO dependency
> > from the STM32_LPTIMER_CNT config option. I assume that dependency is no
> > longer necessary with the IIO code is removed.
>=20
> Hi William,
>=20
> Thanks for spotting this.
> I'll send a v2 with that fixed.
> I assume I can add your ack'ed by for v2 (as commented earlier) ?
>=20
> Best Regards,
> Fabrice

Yes that should be fine with me. :-)

William Breathitt Gray

--TmCqVOCwfI3MWw6Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmAT6zYACgkQhvpINdm7
VJIn7A/7BO/ZCC8otLlm9bBsqvvKrI662I9BAPZM6bcJdB6eIknjAVCXyjE9+tsG
8g/Oj32At4XZGW+LZ3U2IqeOd9zbLNM5gpo35XwodiY3kTj2Wq7wUHLn5iY6HpMA
RQDAVK1CC3Ig6iQXRlpLd0hZ+HcUxLYIhHPK6X0pqxjrHh7Tg4A0D8lp/QFwK6SO
AlsLpcbmdoFJcbeCMAseJ3Hff5Sfv6F9cTzrwNNIGUt43hfnHATBVrrvIeQgjiwY
g0E9D6Cv22LvY34egiqWOWE4rsFWxf834mvGD2WAAiykSCdY9BCWru1lUoQkI53o
D3bFlR+oAiKqukN0pefoJh2EAwkI4/QWdqPufkpxbsh1J3HpLHQtrlvlhBNAPoU4
L07110Uq9worRDJKiNBscqoXT5Ps1lLIWC2y4AEczd7mGK4ZrSRlN4zOpnOcpoMc
UNBvbR+EkNXfdlDPElEwZq2uAtROn+uZRMT9fCBkPu0X79dFEGiH92QKKSutYhCe
wZWsLPYes26/8MTzOL+RLrPBvdw5TpDENBtTlqGJewQ3wHD1uhzUtdRrEHgZLhp+
Oz9krK1iDrDahaP2J7iFiB7zuHLM2AsFE++meDFcD3bSWpTtcnAqRYqcL/FRZnW9
aCexEjHxUbxIv7oAx3Qew7RZ4vvHyt3xzT8s1SR/a10cyEtl0Nw=
=nhmU
-----END PGP SIGNATURE-----

--TmCqVOCwfI3MWw6Y--

--===============1456815877381176117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1456815877381176117==--
