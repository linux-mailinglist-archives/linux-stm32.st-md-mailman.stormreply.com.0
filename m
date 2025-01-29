Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B10A221C8
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jan 2025 17:30:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02A14C7803C;
	Wed, 29 Jan 2025 16:30:18 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3133C7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2025 16:30:10 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-436249df846so48099885e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2025 08:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738168210; x=1738773010;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kncPR1x+HrgO/UNoa6XCUy62lvyXubVaayCMa0/G3/c=;
 b=nYG8TLtqUZt7umP56qykQsW+AMecuXJw/caOxR6j9/HPEJ+C9a5QRizYrcniH5wL61
 sSoBgtKiEDhrU2+F14m+aPaP47Hr7Q2vircglNA0f4CyQjgCPLs3dOd20scXKhigELt6
 WI3Lj9c90+uKJpSw3N/kfSbCHyNETqvIFyGUVnoU5yDKo2AqBOr1LW9Nqi8kJILEX2Po
 T98ONGaJaZbZBreXz1MHlnqcAcZfqYvSqNB4Y7WEDQsWbw2jTpynID4seadaMfdxqK7l
 TZkN3h0n5tzXm/9/9YWYlw8A217ks972tsi9UwzxFV8AzIN+J5uzBMcJ5GGl28xCQGyK
 8irQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738168210; x=1738773010;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kncPR1x+HrgO/UNoa6XCUy62lvyXubVaayCMa0/G3/c=;
 b=d/GTyevS/KvHx6q3w/mFjt58Sq+y0xCMFHUfpSRSFN9S2FjVQLfyqAZwIQ4EzoY626
 cK7zFjZbPn41xwYGVu7LNtgr2D1kWT8YcgzQ/P1dTTfCcvjFfxqJ/+1bdte+D1VfaiAY
 RUcwA4nIG/lmp/oZ5mkcOWQKlGXQk48J0CCnhn2dmu/xOe9bZwlivFSFCNVEAhiR0zYt
 6nT+ta22RBB74IYz8XN1srhAo7zzF88CxjtoeyfqCIkMHcE18C68RbJz0WycJUNpRalt
 +mUGp7SNPT0hchzkTJOcHXl1xKlbN2KTpqZ+80shfWbISrBTqM4Moa2Wvs2Dqh/sGyVe
 qcxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT9rnFCZKnHn4m6BpNQzrQU1E+0KHiEIJcpHpN8fAQuP5jm8dAqEjfAv3Wy81qSUepciTM4T/lqoJlUg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywam6xmMKJXO8xZAclf3JQJrhRu374rUarz8Sp2VJ2F55ZhdW0c
 /iYdmzaRbymsVv7D1IHGyISKEEi5ziLchXTjy0mJrJUzBNLW502p
X-Gm-Gg: ASbGnctAWfsjg5mM3VGLU209lPGKHj0bAGb5ONucnlgHTEMk+V4n8IPZ/b4dvl/Ou9z
 QmxM2KUY7wc8M6UlQB0QW6NIymyN+VFV25dG4GNPAcQ2mZtuJFJX0FI7NFDEmYNf6y3nQzeDC02
 ZRgW3KQlU125bZj5qrBJp76rJ+w9DFZoqPN4qs8Rd8p3tlMth/aBEjLytqgbvtE4epudZ1W4xIm
 27/+aylZp3RI1M4kh4LInl0eMugPZr75cjVFYLfhkqToZIFMHIBxttG4oAOpk81vbrEiXcWD67H
 Q9xH+anKIEVNzNdFPpxdu3kmqzHk5svZ71gg99TlmOVbqXOTqWIOXZ+xtrocn5tnqU0Hk+sNtra
 h8Q==
X-Google-Smtp-Source: AGHT+IFm5Jm3zy7mcGZVwWe1YgDmOIk+BMdUjzsviFL4g+X0VoNE5WMhP+abocamyyaYUsUSJGXvKA==
X-Received: by 2002:a05:6000:2ce:b0:38a:8e2e:9fcc with SMTP id
 ffacd0b85a97d-38c520b7692mr3030462f8f.45.1738168209834; 
 Wed, 29 Jan 2025 08:30:09 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1bb0besm17773109f8f.79.2025.01.29.08.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 08:30:08 -0800 (PST)
Date: Wed, 29 Jan 2025 17:30:05 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Message-ID: <54mqpk7elbn3y4o4w5skiwbx6kpkpbsg45l7tfzuphf6rzziej@laywqtj7tfpw>
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
 <20250128-cocci-memory-api-v1-14-0d1609a29587@redhat.com>
 <a389f799-442e-45f3-8609-2eb2f0b7a825@suse.de>
 <li2awsqmdoye3u7n3gi2mrhbfxs77e3edjmsg5zclnyjinsnul@2bjkc5agyu5u>
 <2y3lwycrggmktamu3j3gj65uco7quvtu7tlc3724e4mpokhjz2@icedc3kervme>
 <4jn3dfea3eb5yuqobjwvbzfxhwatpvvhtpxbmt6npyrypkyruw@mgtmxignyvt5>
MIME-Version: 1.0
In-Reply-To: <4jn3dfea3eb5yuqobjwvbzfxhwatpvvhtpxbmt6npyrypkyruw@mgtmxignyvt5>
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
Content-Type: multipart/mixed; boundary="===============6962551968040909785=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6962551968040909785==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vlfdakvgoj7a5bm2"
Content-Disposition: inline


--vlfdakvgoj7a5bm2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 14/14] Documentation: Update the todo
MIME-Version: 1.0

On Wed, Jan 29, 2025 at 04:28:49PM +0100, Maxime Ripard wrote:
> On Wed, Jan 29, 2025 at 03:41:32PM +0100, Thierry Reding wrote:
> > On Wed, Jan 29, 2025 at 03:31:50PM +0100, Maxime Ripard wrote:
> > > Hi Thomas,
> > >=20
> > > On Wed, Jan 29, 2025 at 02:06:15PM +0100, Thomas Zimmermann wrote:
> > > > Am 28.01.25 um 23:29 schrieb Anusha Srivatsa:
> > > > > Remove the TODO now that this series addresses
> > > > > the changes needed.
> > > >=20
> > > > While your series is fine, this TODO item is unrelated. It's about =
various
> > > > ancient fbdev drivers that do not reserve their memory regions corr=
ectly. So
> > > > please drop patch 14 form the series.
> > >=20
> > > Is it? Could we rephrase the entry then? I'm the one that suggested
> > > Anusha to work on this, and it's still not clear to me what it means
> > > exactly if it's not what she worked on :)
> >=20
> > The text in the TODO sounds pretty clear to me.
>=20
> The title is "Request memory regions in all drivers", and the first
> sentence is "Go through all drivers and add code to request the memory
> regions that the driver uses". It's definitely ambiguous if only fbdev
> drivers should be considered, even more so in the DRM documentation.
>=20
> > It says that not all drivers request the memory that they are going to
> > use, and suggests to add those missing calls.
>=20
> Right.
>=20
> > But all of the drivers in this series already do that
>=20
> Nope.
>=20
> > and the only change here is to convert them to use some of the newer
> > helpers.
>=20
> For some, yes. For others, it actually adds request_mem_region.

Ah... indeed. Well, on the face of it this looks like just another mass-
conversion to the devm_platform_ioremap_resource() helper, so that's
also confusing.

Maybe the right way to do this would be to split this into two series,
one that actually does what the TODO suggests (and maybe updates the
TODO to make it more obvious that after this only fbdev drivers are
left) and another series that does the helper conversion.

Thierry

--vlfdakvgoj7a5bm2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmeaV4kACgkQ3SOs138+
s6Fc5g//QZiZGAOOwS/HvsPWCl3EAnXTtEOaH4XXTZswARVZDGZdl3jYwiZim7x3
Odn69X6NAQl5pFytjbexpzii+zH/UQZVz5kndydjXtK/JWz5VeXlKUrxYKMU+GEM
+9dEecjXOqKAtLPF/QyA387/Xp6qIIsQDHM5/akoAifYOd3TbuCl4AqBU/LYuGt6
F86Eaa7n8kChb6BpZ3Km6NfzkhJhTIw9/VZXxp21Y9izQUZuHAVvyt3e2hLr9L9W
S0XFv1mPAYUcBAao+vvEF3kJvrnVXjXDZnjVPpiKuJe4e0l2aDMNW9TEr7are4m5
8JlrAMkbGTKEKzTQlHIgKuFJYcmTyvqs4KBrxmX1bEqm2gsRqnNXl/7yvbY+s/s5
QSM9otV5y60e0IZkmuJjoEklKJ8SmyPgbrnb04ua2KQXrRvnDO+BQSWerziVyz84
6RNfGTuacRhr5C2KlI7MdELGzweRPD6TA8Qa3k71gpCXKg9063+1aRanPLWbpwue
vIBmrFZZcJRMxftEjPMRJj7IcBvIZY12Zij2eu7fWDaeXujcre4Apg3rClGnYxOq
RT0DHxbnFi9msAWdCAFZTUiyzyFZ0Vq/op7JUugsAq/nYKK9lXSyOdVvLd1Ojgm5
CBtQAEdJXMKCwmB5yb7bRv2ag/y/oiQtUsnkgViwm1FTPUFD+gY=
=XiY9
-----END PGP SIGNATURE-----

--vlfdakvgoj7a5bm2--

--===============6962551968040909785==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6962551968040909785==--
