Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9227C3C6BBB
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jul 2021 09:52:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F9FCC57B6F;
	Tue, 13 Jul 2021 07:52:29 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BAB4C57B5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jul 2021 07:52:28 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id a6so28627272ljq.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jul 2021 00:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=umfPdu1lrU6B3okQ5unfcwiBa6kdfuAx9EF1yLDSE/k=;
 b=kqN1K0NCZuOLIo66DGBW7GvDESI7wJ3Vo7DAytXYWMbEkDjw4qFRe5kbnbKUBChtzz
 a3moe+7hMFmfPN4Y8dACZeQdQkDsP32F8RXcdtiH6B7CEVFdezNPNfMoqCu6czfxuv8s
 4M0pf60qTKDi5iMmkrE3UgfY/1vL1HnXZXxi+x7RqXHtSQy2bSUGWrT5keFpGdiySVue
 hnhLj8C5cE2rHYoTbg36cB76Ekks9U9VlvpCvPiem5nHl0eD3rAINObvWWp9gruP/RU9
 DrwVk8ko6BgWxBUCLyNZy91RhNKW6E73kqtnv60k3D+GbdpsYQOvI9c2C70QYcdZdh4u
 pSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=umfPdu1lrU6B3okQ5unfcwiBa6kdfuAx9EF1yLDSE/k=;
 b=tAqaCo0DKlOk4QNXdS4bqteroiRrDPlxvRZFwV1nNf3uWkAHnpFqb2D9w0v8Dm11E7
 xNQS9TeW0c+AVKTb6MBa6LvMIMuZGAHVGLSOYFKamt6zAzYV4ujsqfKGWKHvTQp6fJ0i
 3b6xdrL5e3cjkavcHBx4n40uJ4icCPJ87u2r+HYxzqB4nhtxLS8fKO6ZJQVmc9zUXkHF
 6PZm4u8Jx+ev7/z8Is115XgFokoo4cinJtIhNvs2AsdH+x+6mUuUKUqGhMuqfZrakzPp
 xVQa5KZr98c5VGoAebY9JRVrnn0dEZu/b7Zij5UvMRwd1c5QjJyQR4Nqb+ibOlZ6OffI
 BuIw==
X-Gm-Message-State: AOAM532hfMkypRGEvmaRPNSWR1jAgEsYUDXbbmzg5KJanKyiQjGHRv/y
 kiDVsufx0ZV1ADaGoVcPNlk=
X-Google-Smtp-Source: ABdhPJymvkBefEBGF3M0rdNw7gmRquJu+GkPGC0OJkiXTav8YVwN0NE1AqUrDfq1zhWggpGqPVhLHw==
X-Received: by 2002:a2e:99cc:: with SMTP id l12mr3082563ljj.358.1626162747533; 
 Tue, 13 Jul 2021 00:52:27 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id r5sm662018ljn.28.2021.07.13.00.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 00:52:27 -0700 (PDT)
Date: Tue, 13 Jul 2021 10:52:14 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Message-ID: <20210713105214.5730c959@eldfell>
In-Reply-To: <f8e7db99-a4e4-c4d7-5d6a-67950184701c@amd.com>
References: <20210707084557.22443-1-raphael.gallais-pou@foss.st.com>
 <20210707084557.22443-2-raphael.gallais-pou@foss.st.com>
 <20210709110459.79ca406a@eldfell>
 <3c8331cf-fded-b6e6-3e25-666634f4b87a@foss.st.com>
 <20210712110310.540df27d@eldfell>
 <f8e7db99-a4e4-c4d7-5d6a-67950184701c@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 David Airlie <airlied@linux.ie>,
 Yannick FERTRE - foss <yannick.fertre@foss.st.com>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Philippe CORNU <philippe.cornu@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/2] drm: add crtc background color
	property
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
Content-Type: multipart/mixed; boundary="===============3607315433891930029=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============3607315433891930029==
Content-Type: multipart/signed; boundary="Sig_/7sIoOLLn+H1OrBMUDsRwLWM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7sIoOLLn+H1OrBMUDsRwLWM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 12 Jul 2021 12:15:59 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2021-07-12 4:03 a.m., Pekka Paalanen wrote:
> > On Fri, 9 Jul 2021 18:23:26 +0200
> > Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com> wrote:
> >  =20
> >> On 7/9/21 10:04 AM, Pekka Paalanen wrote: =20
> >>> On Wed, 7 Jul 2021 08:48:47 +0000
> >>> Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com> wrote:
> >>>   =20
> >>>> Some display controllers can be programmed to present non-black colo=
rs
> >>>> for pixels not covered by any plane (or pixels covered by the
> >>>> transparent regions of higher planes).  Compositors that want a UI w=
ith
> >>>> a solid color background can potentially save memory bandwidth by
> >>>> setting the CRTC background property and using smaller planes to dis=
play
> >>>> the rest of the content.
> >>>>
> >>>> To avoid confusion between different ways of encoding RGB data, we
> >>>> define a standard 64-bit format that should be used for this propert=
y's
> >>>> value.  Helper functions and macros are provided to generate and dis=
sect
> >>>> values in this standard format with varying component precision valu=
es.
> >>>>
> >>>> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> >>>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> >>>> ---
> >>>>   drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
> >>>>   drivers/gpu/drm/drm_atomic_uapi.c         |  4 +++
> >>>>   drivers/gpu/drm/drm_blend.c               | 34 +++++++++++++++++++=
++--
> >>>>   drivers/gpu/drm/drm_mode_config.c         |  6 ++++
> >>>>   include/drm/drm_blend.h                   |  1 +
> >>>>   include/drm/drm_crtc.h                    | 12 ++++++++
> >>>>   include/drm/drm_mode_config.h             |  5 ++++
> >>>>   include/uapi/drm/drm_mode.h               | 28 +++++++++++++++++++
> >>>>   8 files changed, 89 insertions(+), 2 deletions(-)

...

> >>> The question about full vs. limited range seems unnecessary to me, as
> >>> the background color will be used as-is in the blending stage, so
> >>> userspace can just program the correct value that fits the pipeline it
> >>> is setting up.
> >>>
> >>> One more question is, as HDR exists, could we need background colors
> >>> with component values greater than 1.0?   =20
> >>
> >> AR4H color format should cover that case, isn't it ? =20
> >=20
> > Yes, but with the inconvenience I mentioned.
> >=20
> > This is a genuine question though, would anyone actually need
> > background color values > 1.0. I don't know of any case yet where it
> > would be required. It would imply that plane blending happens in a
> > color space where >1.0 values are meaningful. I'm not even sure if any
> > hardware supporting that exists.
> >=20
> > Maybe it would be best to assume that only [0.0, 1.0] pixel value range
> > is useful, and mention in the commit message that if someone really
> > needs values outside of that, they should create another background
> > color property. Then, you can pick a simple unsigned integer pixel
> > format, too. (I didn't see any 16 bit-per-channel formats like that in
> > drm_fourcc.h though.)
> >  =20
>=20
> I don't think we should artificially limit this to [0.0, 1.0]. As you
> mentioned above when talking about full vs limited, the userspace
> understands what's the correct value that fits the pipeline. If that
> pipeline is FP16 with > 1.0 values then it would make sense that the
> background color can be > 1.0.

Ok. The standard FP32 format then for ease of use and guaranteed enough
range and precision for far into the future?

Or do you want to keep it in 64 bits total, so the UABI can pack
everything into a u64 instead of needing to create a blob?

I don't mind as long as it's clearly documented what it is and how it
works, and it carries enough precision.

But FP16 with its 10 bits of precision might be too little for integer
12-16 bpc pipelines and sinks?

If the values can go beyond [0.0, 1.0] range, then does the blending
hardware and the degamma/ctm/gamma coming afterwards cope with them, or
do they get clamped anyway?


Thanks,
pq

--Sig_/7sIoOLLn+H1OrBMUDsRwLWM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDtRi4ACgkQI1/ltBGq
qqeaYxAAlKsXIdhtMGdhLiHKsFuM2ocvI/5alaiQD0SWSgB2OJuz7wltI5aV53Am
LhPDY1h0zPnpT5v3WvvJZSSCHSSwlm5TkJX24DOuqwFJWINcmBYWQsMb0/ab7f76
fZERpWuaiB2rpOMOzAzgKMXI8Ss1gVVdztQmKZj3WrTwnu+6p2LAQn8NwYgH7Fi9
ZL8+acw2A3xPuT5gkgk8IosBVt5WGeeBY0R92uLRU47V7nzbtJADziLlkv+pM8dL
3o+Tdglgxnlb4SsEYwv/saJmAAe5Uyzst4vOBfI6BqbxegNeU+gsJUVqpTv5z+tj
NoMVzxXIzZPY6vD0fgCvZWiEECR+kmc/CVY/kmwKjoZhaWRuCPEzNz2QjH3ETM9f
AMl+V5/uLpvgpTlvi/HLrcapU89/7tw5drqjcmacygejDWz2BH+KWwB5uXYNRFkQ
QzUhY0pV+fY4O+hMtNVWEfHjZr9qCzD9dyfDz5EUI5I1LJyAZLUnSmzWsXaNh+yA
LmbJuLu3XtKECtGsTnSYWO52g8f/ihqE+vBgEzm+t05r3MSV/WXAaLrtWmWh4cUc
wrQFi4EmblkUrd3gi2okv9AWZ3Gqzo25qYIMHswndLVdMc1QborQO1bTSctH9xFv
aw8ajlVrK9YiZ6723kVTsYaWAGq4aalnOQw7mW2xdGxlWFvXI/I=
=O57I
-----END PGP SIGNATURE-----

--Sig_/7sIoOLLn+H1OrBMUDsRwLWM--

--===============3607315433891930029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3607315433891930029==--
