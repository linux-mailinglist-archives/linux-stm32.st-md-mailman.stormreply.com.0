Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42897791D9E
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Sep 2023 21:31:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4455C6B455;
	Mon,  4 Sep 2023 19:31:57 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D2D1C6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Sep 2023 19:31:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 402F8CE0F1F;
 Mon,  4 Sep 2023 19:31:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A86C433C7;
 Mon,  4 Sep 2023 19:31:51 +0000 (UTC)
Date: Mon, 4 Sep 2023 15:31:49 -0400
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZPYwpdQUWp0V43FU@ishi>
References: <20230829134029.2402868-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20230829134029.2402868-1-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/8] counter: fix,
 improvements and stm32 timer events support
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
Content-Type: multipart/mixed; boundary="===============0511935170270417683=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0511935170270417683==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CVt1obDrKjorrKCm"
Content-Disposition: inline


--CVt1obDrKjorrKCm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 29, 2023 at 03:40:21PM +0200, Fabrice Gasnier wrote:
> This series combines some fix and improvements to the counter interface,
> found while stm32 timer counter driver developements.
> It also introduces a new tool that can be used for testing.
>=20
> Then, it improves the stm32 timer counter driver by introducing new signa=
ls,
> e.g. counting frequency, and missing channels.
> It also adds support for interrupt based events using the chrdev interfac=
e.
> Two event types are added in this series: overflows and capture.
>=20
> Up to now, stm32 timer counter driver focused mainly on quadrature
> encoder feature. With this series, all timer instances can be enabled
> for simple counting (with overflow and capture events).
>=20
> Fabrice Gasnier (8):
>   counter: chrdev: fix getting array extensions
>   counter: chrdev: remove a typo in header file comment
>   tools/counter: add a flexible watch events tool
>   mfd: stm32-timers: add support for interrupts
>   counter: stm32-timer-cnt: rename quadrature signal
>   counter: stm32-timer-cnt: introduce clock signal
>   counter: stm32-timer-cnt: populate capture channels and check encoder
>   counter: stm32-timer-cnt: add support for events
>=20
>  drivers/counter/counter-chrdev.c     |   4 +-
>  drivers/counter/stm32-timer-cnt.c    | 585 ++++++++++++++++++++++++++-
>  drivers/mfd/stm32-timers.c           |  46 +++
>  include/linux/mfd/stm32-timers.h     |  26 ++
>  include/uapi/linux/counter.h         |   2 +-
>  tools/counter/Build                  |   1 +
>  tools/counter/Makefile               |   8 +-
>  tools/counter/counter_watch_events.c | 348 ++++++++++++++++
>  8 files changed, 998 insertions(+), 22 deletions(-)
>  create mode 100644 tools/counter/counter_watch_events.c
>=20
> --=20
> 2.25.1
>=20

Hi Fabrice,

There are a number of precursor changes in this series that are somewhat
independent, so I'll be taking some patches separately to simplify
things and review this patchset a little at a time.

Thanks,

William Breathitt Gray

--CVt1obDrKjorrKCm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZPYwpQAKCRC1SFbKvhIj
K3XrAQCnJXaTzbk3S1ZQotXMnidjHAeezrMw2IP6V2HkdsTgeQD+IwiZkXrVD0n/
fcBlRITVdLaPEwU4OA/RUVBqbs83ZQw=
=/BPa
-----END PGP SIGNATURE-----

--CVt1obDrKjorrKCm--

--===============0511935170270417683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0511935170270417683==--
