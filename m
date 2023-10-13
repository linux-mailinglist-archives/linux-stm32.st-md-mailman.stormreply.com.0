Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B757C9113
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Oct 2023 00:57:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4E31C6B442;
	Fri, 13 Oct 2023 22:57:21 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC6C5C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Oct 2023 22:57:19 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id
 ada2fe7eead31-457cba20cb7so360387137.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Oct 2023 15:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697237839; x=1697842639;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6wPwnmETenw6MmBk8K6nY/876otg8xGa1r8lksqWFBc=;
 b=CYbnTezjSs0rCP/TSGYm9TQigs9hLqofaQnpHNEDcI7DKgGbmKC5lDLmgWrihMwo5t
 7D2D4sSE+o03hUDja2Od+UoRdb2sHVDqYs1nPEqJFcFYi010Zfg3JMyB0EzEYXvboEle
 m2AZOAAhgw5+E+AEKbDoWov0bhEqR16Ke8JsWfePKGCYv2F89RBkqNHRuu1R64zWeumA
 EYCK4iYGtjB2OqisCkcZA9Pgchc9o1mEMm9r8Y0D9yK4J5cdfnXyVWzTmaQCpG0BkaLW
 IAjQ5LiTJJJltQziw5+4wbOTX3sOEjB9Wy9dIGkjFqfJAACpQnbIgmOgKoO9E2x8CtwX
 pUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697237839; x=1697842639;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6wPwnmETenw6MmBk8K6nY/876otg8xGa1r8lksqWFBc=;
 b=U2twrQMiAJwI06LUbFrFuGZK3350EE9tp1jN6wYQvZFmOBn5QXpIrOrx+YeTv8KbUE
 5ls2rM2+Kq7TR/ZncUsSekZ33f9z81G7Tpk/Krkwkhwa8MFMgW6UQArXIqyZz98WKYeu
 4P8LgTfmoMWFDGivQ/p3U3QbTEMafo5H4emAvXnAJ8APIbxQPKEQJwIECBD4LWJUQF/g
 bkcNwjixoxI3hCL01vpUbMxaaCvyDXvIEYijFhK9I4T24Jvk4EFFRjs7r5ml660Pk72N
 HXUgogg9P+gDxeVDEcpROlfbNuP3EtoLgwZ2G5lzV0mWwv0Iavf5v9xpp2jQxTvLe/r7
 B9Zg==
X-Gm-Message-State: AOJu0YxELwOpfFZzb7FaF9za5bB8ZRhofqPahH4fdPN6zpgkbkKeqtk/
 uuuvs4pR5BtwJor/htiCO1O55w==
X-Google-Smtp-Source: AGHT+IEm521axeEFcZNtZSTDXsrzq0pBe+Wjc+fnqpTA3yy2QUWHpG+Ba3EbnGKWa7HD0w1qKfSdyg==
X-Received: by 2002:a67:ce81:0:b0:454:607d:196f with SMTP id
 c1-20020a67ce81000000b00454607d196fmr29124394vse.20.1697237838405; 
 Fri, 13 Oct 2023 15:57:18 -0700 (PDT)
Received: from fedora (072-189-067-006.res.spectrum.com. [72.189.67.6])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a056102244d00b00450fc8d2c76sm540643vss.28.2023.10.13.15.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 15:57:17 -0700 (PDT)
Date: Fri, 13 Oct 2023 18:57:15 -0400
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZSnLSwsr7RxLdPie@fedora>
References: <20230922143920.3144249-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20230922143920.3144249-1-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/6] counter: fix,
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
Content-Type: multipart/mixed; boundary="===============6784042451785347341=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6784042451785347341==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fFNMSGoF3fO7Sh+E"
Content-Disposition: inline


--fFNMSGoF3fO7Sh+E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 04:39:14PM +0200, Fabrice Gasnier wrote:
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

Hi Fabrice,

Would you give a brief summary of the possible configurations we can
have for these devices. For example, the existing driver supports a
quadrature counting mode where Channel 1 and Channel 2 serve as A and B
inputs; I also see that another mode is a simple tally counter with the
internal clock serving as the input. How do Channel 3 and Channel 4 fit
in here?

If you list out all the possible arrangements, I think it'll help me
understand how the signals match up with each particular mode.

Thanks,

William Breathitt Gray

>=20
> Changes in v2:
> - counter fix and improvement patch applied, hence dropped in v2 series
> - mfd patch applied, hence dropped in v2 series
> - revisit watch events tool (mainly command line interface)
> - add one patch to rename STM32 Timer counter
> - various review comments from v1
>=20
> Fabrice Gasnier (6):
>   tools/counter: add a flexible watch events tool
>   counter: stm32-timer-cnt: rename quadrature signal
>   counter: stm32-timer-cnt: rename counter
>   counter: stm32-timer-cnt: introduce clock signal
>   counter: stm32-timer-cnt: populate capture channels and check encoder
>   counter: stm32-timer-cnt: add support for events
>=20
>  drivers/counter/stm32-timer-cnt.c    | 558 ++++++++++++++++++++++++++-
>  include/linux/mfd/stm32-timers.h     |  15 +
>  tools/counter/Build                  |   1 +
>  tools/counter/Makefile               |  12 +-
>  tools/counter/counter_watch_events.c | 368 ++++++++++++++++++
>  5 files changed, 934 insertions(+), 20 deletions(-)
>  create mode 100644 tools/counter/counter_watch_events.c
>=20
> --=20
> 2.25.1
>=20

--fFNMSGoF3fO7Sh+E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZSnLSwAKCRC1SFbKvhIj
KzirAQDCyH9zW+B+KquLIfRNSk5vcmFjucDHtM60OcOVpFTebgEAxPZD+Cu+RmK1
WYaD1a0bSMAQ1xu3JYrlOIxW+sxb5QM=
=QW5W
-----END PGP SIGNATURE-----

--fFNMSGoF3fO7Sh+E--

--===============6784042451785347341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6784042451785347341==--
