Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8A1A21F69
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jan 2025 15:41:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD755C78026;
	Wed, 29 Jan 2025 14:41:45 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1906FC7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2025 14:41:39 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43624b2d453so77365315e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2025 06:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738161698; x=1738766498;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zSEV+em0N0SfQE1alVhrq6tX6ofwmLyBx4bRZxI20Mc=;
 b=hFGIiJMGFggeNEdVzUSsbHvD9K66Ri9QFX23KZ3PFqocRUCknyQXlR+0pHi5ygy7iX
 G+r+guO9n9/S6EZlrDDWw44MKdiD6+luR63DZ0+rxpm1q4HSdSAxIhOuMBDiTwghDbHj
 lxeekzypc19hAKY0ClP/oXmiw4IdEx+LBLgxAB0TbEgJerg8nNRMYf/qEuwdESkAN1TP
 ++Dxoy9bHBj4eeVfwS6pzIqAtUxQX2ZwoJ9SKTNZ/75JhrC+B8ByDR6cA5djkWjZeY/J
 3303Km3rM/ACUvvxMjLfVFPc/QRFO/gZ6IyQmIR1juaBqC9P3wxi904/lO3rquLve21N
 rf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738161698; x=1738766498;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zSEV+em0N0SfQE1alVhrq6tX6ofwmLyBx4bRZxI20Mc=;
 b=TCgbNCOf2HAbMxJvRg0lYOzc3wmiitl8OFyBa0jRBhBzeHg7CfRZhJF8vByXIyhn+b
 bsAkJqxIfb7fEXbCkTiWMmDJ1WzZ8pxQrr+4KecvcaMctM40GFj3Ck7PrcCd4mc7b5rJ
 MDvg0nvx5Rnmh931AY+SAalAtkAQDXsQ6Ac83T5BLYO4hEFbQFhMjMPkSlbtqxcejthv
 8AY7fDi14lnQ/HAEjc1MYdpua6FuiQD24eK37e3PILo5AEGic+cpUURwC4L68dR1ZfAC
 66R3yzqEQjUl9BqasTK20I0RJ3RD0klQOdfD9OmOWPZg/vgYYDLm8+yfMkdZmPHwErUg
 Kyug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcD611IhsVWXWUSwF5D3PiLBm8jl8wHImGCd4SM9ShD4ZAOlLpLOyWDccBwOhfe7aP6S3EpHfosALKQw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxHCg9F0PNZ1w6uPm/BXSDl5Cj8MPx4G8WFIbd72QiHJKk+FVDK
 0bhat9yxmmu67wx7/1WjRzWu3IuKO3N0W6XP+XDhNV+ngmyd4agP
X-Gm-Gg: ASbGncthvH4e9s8U7hAJ+/BqfmKQkvf3OSr8Wvi6WJUJFAgBIQ2fccXGprzFUpgP7ri
 wzIVHK56onZb/dDZm1nEtJlsuMpITVDn1/QGUxEly6mUrHFDwFiN2kAJCQ4XP0/gY/7UIKmbckc
 CXn4+RMPrv6xxotqKO10USxTS276QjpnNN80SLj6sFOUXBI/hBIoi/iIvV7Z0qC9dqJ6wxYrFiO
 A8Fmf2W/agusnd0EpNFthtNwU5WwYuf7G3vlWIKEfS8Ax7iNnKZiBuWPd7LJ+FcB3D++1reSKWm
 +r0ZQXfdkdWvdzK99r8NA+/oApp4KRMsbm3eO/TC1wYbvvkYlOax/MYH8lJwC/crz4+hlAibfFT
 WVg==
X-Google-Smtp-Source: AGHT+IGdWBqWeiv+jbIoBfzm7k0/2DrarU7EXB90OvgtRbMeVkAoe8ODcFAhL4eNP6mW3P0r12bwJA==
X-Received: by 2002:a05:600c:4e07:b0:436:e86e:e4ab with SMTP id
 5b1f17b1804b1-438dc4353e7mr35398335e9.30.1738161698102; 
 Wed, 29 Jan 2025 06:41:38 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc2b1d9sm24718285e9.21.2025.01.29.06.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 06:41:36 -0800 (PST)
Date: Wed, 29 Jan 2025 15:41:32 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Message-ID: <2y3lwycrggmktamu3j3gj65uco7quvtu7tlc3724e4mpokhjz2@icedc3kervme>
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
 <20250128-cocci-memory-api-v1-14-0d1609a29587@redhat.com>
 <a389f799-442e-45f3-8609-2eb2f0b7a825@suse.de>
 <li2awsqmdoye3u7n3gi2mrhbfxs77e3edjmsg5zclnyjinsnul@2bjkc5agyu5u>
MIME-Version: 1.0
In-Reply-To: <li2awsqmdoye3u7n3gi2mrhbfxs77e3edjmsg5zclnyjinsnul@2bjkc5agyu5u>
Cc: imx@lists.linux.dev, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Xinliang Liu <xinliang.liu@linaro.org>, Stefan Agner <stefan@agner.ch>,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org,
 John Stultz <jstultz@google.com>, Andy Yan <andy.yan@rock-chips.com>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Simona Vetter <simona@ffwll.ch>,
 Marek Vasut <marex@denx.de>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kevin Hilman <khilman@baylibre.com>, Anusha Srivatsa <asrivats@redhat.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Joel Stanley <joel@jms.id.au>,
 Orson Zhai <orsonzhai@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Alison Wang <alison.wang@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@gmail.com>, Tian Tao <tiantao6@hisilicon.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-stm32@st-md-mailman.stormreply.com, Sandy Huang <hjc@rock-chips.com>,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Yongqin Liu <yongqin.liu@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 14/14] Documentation: Update the todo
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
Content-Type: multipart/mixed; boundary="===============8741001859650767386=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8741001859650767386==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cigenp6alv7pkbet"
Content-Disposition: inline


--cigenp6alv7pkbet
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 14/14] Documentation: Update the todo
MIME-Version: 1.0

On Wed, Jan 29, 2025 at 03:31:50PM +0100, Maxime Ripard wrote:
> Hi Thomas,
>=20
> On Wed, Jan 29, 2025 at 02:06:15PM +0100, Thomas Zimmermann wrote:
> > Am 28.01.25 um 23:29 schrieb Anusha Srivatsa:
> > > Remove the TODO now that this series addresses
> > > the changes needed.
> >=20
> > While your series is fine, this TODO item is unrelated. It's about vari=
ous
> > ancient fbdev drivers that do not reserve their memory regions correctl=
y. So
> > please drop patch 14 form the series.
>=20
> Is it? Could we rephrase the entry then? I'm the one that suggested
> Anusha to work on this, and it's still not clear to me what it means
> exactly if it's not what she worked on :)

The text in the TODO sounds pretty clear to me. It says that not all
drivers request the memory that they are going to use, and suggests to
add those missing calls. But all of the drivers in this series already
do that and the only change here is to convert them to use some of the
newer helpers.

Thierry

--cigenp6alv7pkbet
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmeaPhkACgkQ3SOs138+
s6H45hAAkHi6OubObNKNwO2CYc2mT8gjjY3iZP3UvxqouoU05ylZ0uUIxHOz8K8T
vXb+tkMFtsqIZZTJZGti+67m/YYOCtZsvXO79IMZy7WUab/bKWX7x2vy3WjN5lyG
yqlo8kp85y69za3sJHjRrUvr4acQSDyDejrwBdWN2xMCnDgzG5lzXkXhibhyOaMd
p0wyLE4EkS0pdxCg2FGGjiFOAnWmHd3+DPW3wRSMVsiXpVgWxEAQ6aGmNMtl0Y7F
KM7UDu0umziZxMyR2/4SFn7Q772BDa1dwInJhSBF3ugkGdQ3mSPpBeDPjf+cI2Mj
69Z5AA1KQOhvGcKM9WOW/kXV9/CeXD1dv6Z5c4ho4gnOWA9Sjj0PUVRIJy7oDtm5
4SdccVE1EPL/+IzByDQFxbG6/UFTJroG0+N9mpx9p2tZ0fJDGiQepxQ6XqLKlbZg
olV21Xytohgotp2SlQ8tk2PIln70QKzEanmMVBl2WEkxAByKbu/XK+4A9+3/Hy9l
+RdZ/r1pHfzlW7nzFGKpNeNaH3uMkupcb4PsceavHYDmabcKJtyK4J2/xp218nwA
EopzxkwqOiYMAHl1/tBeNlt4bEIhph/3ldgBr6fgUWSbddKQxr6YjU/Lyvp5KOFH
qkb1aCLDg6nKqceZe1QQeEDsVyZJA2a3ACyQ5rpyrniazDRDlU8=
=VcN2
-----END PGP SIGNATURE-----

--cigenp6alv7pkbet--

--===============8741001859650767386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8741001859650767386==--
