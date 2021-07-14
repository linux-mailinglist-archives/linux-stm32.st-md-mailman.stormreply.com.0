Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 784673C7F6E
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jul 2021 09:35:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2ABAEC59781;
	Wed, 14 Jul 2021 07:35:25 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 355AEC57B5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jul 2021 07:35:23 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id a6so2010479ljq.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jul 2021 00:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=KVmbtiIK3zAhNmfdpRCO7IT3KrMJCvqmSW8XmHe1DSE=;
 b=kO44jXS2GHs/OHNjtuEl52BME2XYKDUbdkzaBh4W8GorkfEvXq3BGw7bCSfocg5FiN
 02eJyMcKEvUUulsmsmlgIzkwMZPBU6bQadhHI1iZN8VYFOnEYzbw8Iha4LoTNc9M3MWM
 cOV+of6pkbie+LHjsB4L96LO0wcfgq1EKhE31TFfiWxyHZAv61YmoAvVkGK2oO5Qq7Ts
 JJ6WkhnQPH+xDf59H9/p9q5VC9urR4d99/Uq9ATn7vIrIgp27hJF6x12Ti1ycJH9//bp
 f+s91W1cGVbI7IxwwbPMIFURbQslgJzDmHK0OgBmxit2w9DyyFl6hWOJ8Aooe/IYZxls
 kBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=KVmbtiIK3zAhNmfdpRCO7IT3KrMJCvqmSW8XmHe1DSE=;
 b=mVFr+CHv/tszE1OEfMjb/aQbq7pv301VEiGBwa3YZ+g8z49yEkVsmf7fJh4XSnjRd0
 HAOUhKE3Io8zjhmZDB3Q1YnRvFDy3fTjXBii89kM7ASwQjfMCoKnEtmVkWosole6VPhg
 N/7zzZ74rUSssb8dNjFzWNFxGNcdVx5uExq95naSW5kzjuMdGMCcgPhvFXU6ZVqu6b0Z
 quE8X4QX4PcdO7Xu9AOXL1NO4LTWcwUfZKaYqK66EPczRRxygjx6cmDkeUdkRBLwKSgP
 V4fIglrVWFNn/k92XfMNbjNC6ghk9psqWC4SCWqNhQdCmkolyfiivouWQzSCExSLLNIb
 GJ2g==
X-Gm-Message-State: AOAM531XZQodfNtDUjIimRlJw+dYRQkVEXUsvlTq6QgezuAxeRSI//+1
 w4qbeAXkDmsMeIHNdWWJYf0=
X-Google-Smtp-Source: ABdhPJzdS988Ptvlyn1e0vZtFTefs6mJBdLIypZldYFktjrPBOuukWl2/vS8MrSaL8LdiinkCbk0jQ==
X-Received: by 2002:a2e:b8ce:: with SMTP id s14mr7878581ljp.177.1626248122290; 
 Wed, 14 Jul 2021 00:35:22 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id c10sm148433ljn.11.2021.07.14.00.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 00:35:21 -0700 (PDT)
Date: Wed, 14 Jul 2021 10:35:18 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Message-ID: <20210714103518.578e70aa@eldfell>
In-Reply-To: <70c8467c-560d-517d-63a0-97763803b06d@amd.com>
References: <20210707084557.22443-1-raphael.gallais-pou@foss.st.com>
 <20210707084557.22443-2-raphael.gallais-pou@foss.st.com>
 <20210709110459.79ca406a@eldfell>
 <3c8331cf-fded-b6e6-3e25-666634f4b87a@foss.st.com>
 <20210712110310.540df27d@eldfell>
 <f8e7db99-a4e4-c4d7-5d6a-67950184701c@amd.com>
 <20210713105214.5730c959@eldfell>
 <70c8467c-560d-517d-63a0-97763803b06d@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Cyr, Aric" <Aric.Cyr@amd.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 David Airlie <airlied@linux.ie>,
 Yannick FERTRE - foss <yannick.fertre@foss.st.com>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Sebastian Wick <sebastian@sebastianwick.net>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Philippe CORNU <philippe.cornu@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
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
Content-Type: multipart/mixed; boundary="===============6836799757998879789=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============6836799757998879789==
Content-Type: multipart/signed; boundary="Sig_/iqrwcZ1ld8+2K8FT.QVsgyh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/iqrwcZ1ld8+2K8FT.QVsgyh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 13 Jul 2021 09:54:35 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2021-07-13 3:52 a.m., Pekka Paalanen wrote:
> > On Mon, 12 Jul 2021 12:15:59 -0400
> > Harry Wentland <harry.wentland@amd.com> wrote:
> >  =20
> >> On 2021-07-12 4:03 a.m., Pekka Paalanen wrote: =20
> >>> On Fri, 9 Jul 2021 18:23:26 +0200
> >>> Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com> wrote:
> >>>    =20
> >>>> On 7/9/21 10:04 AM, Pekka Paalanen wrote:   =20
> >>>>> On Wed, 7 Jul 2021 08:48:47 +0000
> >>>>> Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com> wrote:
> >>>>>     =20
> >>>>>> Some display controllers can be programmed to present non-black co=
lors
> >>>>>> for pixels not covered by any plane (or pixels covered by the
> >>>>>> transparent regions of higher planes).  Compositors that want a UI=
 with
> >>>>>> a solid color background can potentially save memory bandwidth by
> >>>>>> setting the CRTC background property and using smaller planes to d=
isplay
> >>>>>> the rest of the content.
> >>>>>>
> >>>>>> To avoid confusion between different ways of encoding RGB data, we
> >>>>>> define a standard 64-bit format that should be used for this prope=
rty's
> >>>>>> value.  Helper functions and macros are provided to generate and d=
issect
> >>>>>> values in this standard format with varying component precision va=
lues.
> >>>>>>
> >>>>>> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.co=
m>
> >>>>>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> >>>>>> ---
> >>>>>>   drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
> >>>>>>   drivers/gpu/drm/drm_atomic_uapi.c         |  4 +++
> >>>>>>   drivers/gpu/drm/drm_blend.c               | 34 +++++++++++++++++=
++++--
> >>>>>>   drivers/gpu/drm/drm_mode_config.c         |  6 ++++
> >>>>>>   include/drm/drm_blend.h                   |  1 +
> >>>>>>   include/drm/drm_crtc.h                    | 12 ++++++++
> >>>>>>   include/drm/drm_mode_config.h             |  5 ++++
> >>>>>>   include/uapi/drm/drm_mode.h               | 28 +++++++++++++++++=
++
> >>>>>>   8 files changed, 89 insertions(+), 2 deletions(-) =20
> >=20
> > ...
> >  =20
> >>>>> The question about full vs. limited range seems unnecessary to me, =
as
> >>>>> the background color will be used as-is in the blending stage, so
> >>>>> userspace can just program the correct value that fits the pipeline=
 it
> >>>>> is setting up.
> >>>>>
> >>>>> One more question is, as HDR exists, could we need background colors
> >>>>> with component values greater than 1.0?     =20
> >>>>
> >>>> AR4H color format should cover that case, isn't it ?   =20
> >>>
> >>> Yes, but with the inconvenience I mentioned.
> >>>
> >>> This is a genuine question though, would anyone actually need
> >>> background color values > 1.0. I don't know of any case yet where it
> >>> would be required. It would imply that plane blending happens in a
> >>> color space where >1.0 values are meaningful. I'm not even sure if any
> >>> hardware supporting that exists.
> >>>
> >>> Maybe it would be best to assume that only [0.0, 1.0] pixel value ran=
ge
> >>> is useful, and mention in the commit message that if someone really
> >>> needs values outside of that, they should create another background
> >>> color property. Then, you can pick a simple unsigned integer pixel
> >>> format, too. (I didn't see any 16 bit-per-channel formats like that in
> >>> drm_fourcc.h though.)
> >>>    =20
> >>
> >> I don't think we should artificially limit this to [0.0, 1.0]. As you
> >> mentioned above when talking about full vs limited, the userspace
> >> understands what's the correct value that fits the pipeline. If that
> >> pipeline is FP16 with > 1.0 values then it would make sense that the
> >> background color can be > 1.0. =20
> >=20
> > Ok. The standard FP32 format then for ease of use and guaranteed enough
> > range and precision for far into the future?
> >  =20
>=20
> I don't have a strong preference for FP16 vs FP32. My understanding is
> that FP16 is enough to represent linearly encoded data in a way that
> looks smooth to humans.
>=20
> scRGB uses FP16 with linear encoding in a range of [-0.5, 7.4999].
>=20
> > Or do you want to keep it in 64 bits total, so the UABI can pack
> > everything into a u64 instead of needing to create a blob?
> >=20
> > I don't mind as long as it's clearly documented what it is and how it
> > works, and it carries enough precision.
> >=20
> > But FP16 with its 10 bits of precision might be too little for integer
> > 12-16 bpc pipelines and sinks?

The 10 bits worries me still.

If you have a pipeline that works in [0.0, 1.0] range only, then FP16
limits precision to 10 bits (in the upper half of the range?).

> >=20
> > If the values can go beyond [0.0, 1.0] range, then does the blending
> > hardware and the degamma/ctm/gamma coming afterwards cope with them, or
> > do they get clamped anyway?
> >  =20
>=20
> That probably depends on the HW and how it's configured. AMD HW can handle
> values above and below [0.0, 1.0].

Right, so how would userspace know what will happen?

Or do we need to specify that while values outside that unit range are
expressable, it is hardware-specific on how they will behave, so
generic userspace should not attempt to use values outside of the unit
range?

I guess this caveat should be documented for everything, not just for
background color? LUT inputs and outputs, CTM input and output ranges,
FB formats...


Thanks,
pq

--Sig_/iqrwcZ1ld8+2K8FT.QVsgyh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDuk7YACgkQI1/ltBGq
qqdXzg//VeZDTvR59aZJgWM61L4EBT92+upgHUfftk++NWbDbV4gHocBGY9LlCYN
VO3/+U4hnumIAFmOIMy+x60vRm5T2p6YOMkjmYXy0nkBQZF8l/BNgL3xrC0+Grgo
lkZrU8N+FKTSP+g9fN+mMo2dm3YKPsi9ZGbvK8u7c38ljHXpIqxnbRX5Kosh0zbf
rkmut/rmk88iScsmmj8/uIjje0Y8edgDLtDS523nZ9ooX8esVRKVNt/5fmIAjrbu
rkt7iTqNNm6B2y+1g1goDBL9tgPRvqPMpW8sQRFUNIuPA4XKe8wSH0XzsUkjXwBP
k9VNc7vAr/9M5MNEDIrfZoR3Nr3mT8mLK/+P+mmLICDdDikmwmdvkdLn0kifP+kV
bHTnGFpBgySDFOjg4AJKo2PU+bvDxtcBm9OkHjJqRajZo8Sy4u2lb02hp0kGHH1Z
hyECblvWNavNzc2v6YLCPjNwErvQYd9w73qDpbeo6EYA+oIj9xZlx8r9PQbszz8c
WCFtpvqNR+nH5f+5M6v6sylLi4XpysuaifrH2l8iHKg28ZQ5Xtbhg0EqOHkGwA0a
S9NCTnFA9a53LPUxdIO0wz34BLvcjRH0rzER2dfBoYRd2auHSEb/AQPl3fXIHffz
AaeXFTHXTCapt/ccT3wqAgB/0r/E8VpRIx9bD3N4v9rxD4kmRXM=
=tSPr
-----END PGP SIGNATURE-----

--Sig_/iqrwcZ1ld8+2K8FT.QVsgyh--

--===============6836799757998879789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6836799757998879789==--
