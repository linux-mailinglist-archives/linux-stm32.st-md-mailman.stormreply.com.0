Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4BD308711
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Jan 2021 09:35:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5038CC57183;
	Fri, 29 Jan 2021 08:35:37 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD241C56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Jan 2021 08:35:35 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id o63so6167596pgo.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Jan 2021 00:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XtbBXKmIfHn0g2OBajkM1xDbjGmIjaSXS9OuuDIXqJI=;
 b=LniwL6Q+sL+vul8AzWpA4NxZgjctltpvhMuGE4FYIm/S3c/q+j7deV591TdffDEkMP
 owXv7Gce4yDNzLhKPzCV7/MjnmJkxvfkoUkSFQ57u6cc8CAm+FJZlnKe4DbrOK7EHh80
 RbCyM8eXzHdtoDY+5Rk+A0bet0UFRDVMoCOsT1LphCTnXjhsQOTdI66P/ajyyk6kUBgj
 NazZPZBePvR1Y4hEXhDjNeaZDBv4muVOGZGIE8JSieZEHzX6ibLdPlJ308DCOSLHnFWg
 5tBHtwmOJOnlFiRdYZENa4XbUI4upS/TRd8X/BezhePpscDq75pu5ZCivNDlWiOaHUzY
 sFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XtbBXKmIfHn0g2OBajkM1xDbjGmIjaSXS9OuuDIXqJI=;
 b=UXK+GT9CSCthqTRFH9vIj5xObGp8nnZqElC9kEXjHGH6NEYw3YCn9c9wZx9e684AYf
 PwElf3Jsb3poUNfXXe/KE8H2vkq562qrKGE0NVHqEker5eMtIiJLTL0ubNVhQ/gwxSN/
 HCzD698xxsqiRKGilMdyhU+E27XldEw4PiBeketmob8jRlYx6qoibFsHiC1P1BYdotgY
 vProOIAdYhXfbCkwFMijEmjHaR6CrnOJNCKlxpu7ZziziXWoUA3AxgZ7ST6+16ms3jRy
 8hi5sItAMiXdR7hRvjXwk4/5PF88EHO7uHVmYf5+eHykpwQ1snAKA3YFvZVrQu+g0Ndx
 DpmQ==
X-Gm-Message-State: AOAM533EYL2pWGFa1v1fiuPi/ILl67X5xBBq4a9FeLJwL393Cau68Gc4
 CaCXLKxH0zOJ0AFOzdPJXx0=
X-Google-Smtp-Source: ABdhPJyx5jTVIQ8iR2SQoE24GdgbYEe5xYPb72Tx77ONd5rw7VhOPxuX6ylWH0BXguQBDvws0OHfvg==
X-Received: by 2002:a62:3503:0:b029:1aa:6f15:b9fe with SMTP id
 c3-20020a6235030000b02901aa6f15b9femr3381123pfa.65.1611909334145; 
 Fri, 29 Jan 2021 00:35:34 -0800 (PST)
Received: from shinobu (113x33x126x33.ap113.ftth.ucom.ne.jp. [113.33.126.33])
 by smtp.gmail.com with ESMTPSA id
 w16sm5027116pfj.103.2021.01.29.00.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 00:35:32 -0800 (PST)
Date: Fri, 29 Jan 2021 17:35:24 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <YBPIzBhxkcsqKmMM@shinobu>
References: <1611327803-882-1-git-send-email-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <1611327803-882-1-git-send-email-fabrice.gasnier@foss.st.com>
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
Content-Type: multipart/mixed; boundary="===============7023782494919021584=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7023782494919021584==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dUkTh4AjQJXbQk4p"
Content-Disposition: inline


--dUkTh4AjQJXbQk4p
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 22, 2021 at 04:03:23PM +0100, Fabrice Gasnier wrote:
> Currently, the STM32 LP Timer counter driver registers into both IIO and
> counter subsystems, which is redundant.
>=20
> Remove the IIO counter ABI and IIO registration from the STM32 LP Timer
> counter driver since it's been superseded by the Counter subsystem
> as discussed in [1].
>=20
> Keep only the counter subsystem related part.
> Move a part of the ABI documentation into a driver comment.
>=20
> This also removes a duplicate ABI warning
> $ scripts/get_abi.pl validate
> ...
> /sys/bus/iio/devices/iio:deviceX/in_count0_preset is defined 2 times:
>   ./Documentation/ABI/testing/sysfs-bus-iio-timer-stm32:100
>   ./Documentation/ABI/testing/sysfs-bus-iio-lptimer-stm32:0
>=20
> [1] https://lkml.org/lkml/2021/1/19/347
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  .../ABI/testing/sysfs-bus-iio-lptimer-stm32        |  62 -----
>  drivers/counter/stm32-lptimer-cnt.c                | 297 +++------------=
------
>  2 files changed, 36 insertions(+), 323 deletions(-)
>  delete mode 100644 Documentation/ABI/testing/sysfs-bus-iio-lptimer-stm32

Hi Fabrice,

I noticed this is missing a Kconfig change to remove the IIO dependency
=66rom the STM32_LPTIMER_CNT config option. I assume that dependency is no
longer necessary with the IIO code is removed.

William Breathitt Gray

--dUkTh4AjQJXbQk4p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmATyKIACgkQhvpINdm7
VJKHBA//XHVhwWFB+0je96jqOLoREBgCpiUlDDOYVwh+Wrb/82g8WbHYSLV8eixk
alqDl0eCq/H6r9TGIpT2CTzzCotN1pfQZvl+z9KtSkbUtew2SstTNiJRT9xLqwiN
OxMMZa0libImsuuElfhqHQk695HmubX1SPz2Np8545d8I+2VR3GMRTJJrGYHjObS
RTot0psoqLQfPiL7BSrV45Fp3Gdd/xtXE27oDKk3XfTqQpcqko1Fp6jmvLDnCn7g
fCO4L5GGEw0RRxyukdZC0DZWnkFkywFW1cxt9uhrzSyftypIr0U1BsVzPIxLN0OT
A1OEyCb5Glsf61oOoMnlgkLZV+epouDs0WM1iAgdEb7FnEh6Hd3ED/ymCcGxBOOU
SA/vHtd/VAhCBMNNTVL6yIIN3K3gbPC9/cjBWgedfj9vA1KZ3uAvGHZ1+24YOVgl
MrADObgJI77g2vKyXa67jrJJO+uv5HTS4qx7tXfFllRim/YXvztdvAH21v+x9Ozp
XqEG+LKpUqKU+r/MwvMONiRFFZmzsRMJqm2yfQAqYb+bi7bE2Inn/XeySPsNPKiO
lflDoh7NdS8XzVzM8CBn/I5u17xwt/+8deBZe5Jr6iqQuxHHUWVsjTLcTfaPZyE6
QxtZ4pUaK/2+j0UNBXpk91sL9yGRU7gyAmpEaX4JOtmqUHvztQg=
=8jO4
-----END PGP SIGNATURE-----

--dUkTh4AjQJXbQk4p--

--===============7023782494919021584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7023782494919021584==--
