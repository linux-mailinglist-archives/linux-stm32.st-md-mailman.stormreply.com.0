Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22761A1B6AE
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jan 2025 14:16:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA1ACC78F90;
	Fri, 24 Jan 2025 13:16:08 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C97EC78F8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2025 13:16:01 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso13722775e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2025 05:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737724561; x=1738329361;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1ZAh71u7iDW5TgFuwIN4/oX/du7eXN1HEZL6hdOP2kw=;
 b=HbGGw4nh7CwZZ4MOjflkdMxVxyS2R13VUZKlK7gs++R//dJOu7xg4q0iXdVEmahAfq
 hHhYWgINbGE0phjYXkJrmXNJmFx9/ZDXBA0sJysMk6ZP2IjqZyBVueZJVWKp48tw99R+
 P5jb/9n7JIhecSKVF2AKgS6UWU8pVqU1rbxndgxL7FrwKscWbx2wSZoJBjdpR8sdAsUE
 nyRgXKmAiUQPwDLkiuox8XHw7yVgrwq9LbrwIC70nR7zFp9wVPfjMgs4jisVBzv7De2z
 GzqFokK1Mj+1v8yOgJKwGGvfzV1lf1yB8gKRAb6sbLcZDWsG6Ml0t8sDKtH0P34couib
 +oMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737724561; x=1738329361;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1ZAh71u7iDW5TgFuwIN4/oX/du7eXN1HEZL6hdOP2kw=;
 b=ox4Q+Q3e9iszI/q+p7qPVAcs7zsgYIy2albeb2znueuzNjXxaqKdcMdPA/RrPxWf7l
 NJsUPr5ZAsxqLwIy3Iuuyw8nMpl8a/Z7j7UH+avHW8gJTF/bMi7qi81NUbOqW7DZ3104
 LJzSbZfEtqUPJ4Z6kvPyJJBFhT8jVtqrugpVTWoHHMyIidQGB156gXU4fm5ukchz+LoR
 6QdvD/OptA3EIgx55yD09fxA5v7p6Vi5ZcW6N8mQv/MtqZHvQKU7vO5Z487pS1vScwxE
 UpK0f+SDWNAjY95zp6Cs5GZxI88v+5rexW3u8oCAP3hUEf8BXtuh0zNTJZkTMYAvuwdv
 fx6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5+96/Ka5RqnWFyxCvUN5n4gc55wf6wx2Sts5gwu8WKh71v2xwkcmqqTgSCfSPY3SHblmjfDhn88obmw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyrkXNTmQQ3TzFPzlQbH7tkxpewxjV+/2ZHp6OOjFVSlggVsVyL
 4InKvHhFpRzIZ2Xq5B8XbgJkWjdq1FjatPdWaXGliH8PRHukeG51
X-Gm-Gg: ASbGncvD53e5R9FR8g2h7WiO2S1KmDEuJQxEJ9N+zkH1cJZuVDiaBp4nJrNXhcreMvh
 ThPEgoiRN4+m66xoc+uUdFvPr4ZaPT5EkMF0/MMc8ugyHlvuPt/YjORLqV2VzHBDxFNMbP58Pk7
 /grHMBYp5n52OamNrHY01XvQtVOeMMRdhx58BwQrAzgmma6fNmrhalIZWpqt4dK3JF0Qd10ycbI
 i1TzppR3w6rvqFDfJnBn1o89pyA7i3+nI/DMNO2xBi74AgZktFjECwrIiKpcIvpuiy22BIQnmKn
 h78i5x/f9tIxy0dhTOpU0adwCsg44gGdXvm1O0vahwoIs6BwrwK87zAfxGvtyJKk24k=
X-Google-Smtp-Source: AGHT+IEwZbXxm4SZObd9WNjYWzy5X3F1IMVKmUJqH/hwSmh0/AUzwz0DpjVKAw0L1FgMgzHEfw0kPQ==
X-Received: by 2002:a05:600c:3546:b0:434:fc5d:179c with SMTP id
 5b1f17b1804b1-438b885f8ebmr72834675e9.13.1737724560477; 
 Fri, 24 Jan 2025 05:16:00 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd501c2dsm25668225e9.13.2025.01.24.05.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 05:15:58 -0800 (PST)
Date: Fri, 24 Jan 2025 14:15:56 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <qkjv53fn32qdi5jh2d6bqdfnnl5x4x74cmir6fjtstfw2ijds6@eoxctjkqij7u>
References: <cover.1736910454.git.0x1207@gmail.com>
 <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
 <d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
 <20250124003501.5fff00bc@orangepi5-plus>
 <e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
 <ccbecd2a-7889-4389-977e-10da6a00391c@lunn.ch>
 <20250124104256.00007d23@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20250124104256.00007d23@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
 Joe Damato <jdamato@fastly.com>, linux-kernel@vger.kernel.org,
 Brad Griffis <bgriffis@nvidia.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/4] net: stmmac: Switch to
 zero-copy in non-XDP RX path
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
Content-Type: multipart/mixed; boundary="===============8012016505725354069=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8012016505725354069==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qeva6rbep4nl2wrp"
Content-Disposition: inline


--qeva6rbep4nl2wrp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net-next v3 1/4] net: stmmac: Switch to zero-copy in
 non-XDP RX path
MIME-Version: 1.0

On Fri, Jan 24, 2025 at 10:42:56AM +0800, Furong Xu wrote:
> On Thu, 23 Jan 2025 22:48:42 +0100, Andrew Lunn <andrew@lunn.ch> wrote:
>=20
> > > Just to clarify, the patch that you had us try was not intended as an=
 actual
> > > fix, correct? It was only for diagnostic purposes, i.e. to see if the=
re is
> > > some kind of cache coherence issue, which seems to be the case?  So p=
erhaps
> > > the only fix needed is to add dma-coherent to our device tree? =20
> >=20
> > That sounds quite error prone. How many other DT blobs are missing the
> > property? If the memory should be coherent, i would expect the driver
> > to allocate coherent memory. Or the driver needs to handle
> > non-coherent memory and add the necessary flush/invalidates etc.
>=20
> stmmac driver does the necessary cache flush/invalidates to maintain cach=
e lines
> explicitly.
>=20
> See dma_sync_single_for_cpu():
> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/=
include/linux/dma-mapping.h#n297
>=20
> dma_dev_need_sync() is supposed to return false for Tegra234, since the e=
thernet
> controller on Tegra234 is dma coherent by SoC design as Brad said their
> downstream device tree has dma-coherent turned on by default, and after a=
dd
> dma-coherent to mainline ethernet node, stmmac driver works fine.
> But dma-coherent property is missing in mainline Tegra234 ethernet device=
 tree
> node, dma_dev_need_sync() returns true and this is not the expected behav=
ior.

My understanding is that the Ethernet controller itself is not DMA
coherent. Instead, it is by accessing memory through the IOMMU that the
accesses become coherent. It's technically possible for the IOMMU to be
disabled via command-line, or simply compile out the driver for it, and
the devices are supposed to keep working with it (though it's not a
recommended configuration), so exclusively relying on the presence of
an IOMMU node or even a dma-coherent property is bound to fail in these
corner cases. We don't currently have a good way of describing this in
device tree, but a discussion with the DT maintainers is probably
warranted.

> The dma-coherent property in device tree node is SoC specific, so only the
> vendors know if their stmmac ethernet controller is dma coherent and
> whether their device tree are missing the critical dma-coherent property.

What I fail to understand is how dma-coherent can make a difference in
this case. If it's not present, then the driver is supposed to maintain
caches explicitly. But it seems like explicit cache maintenance actually
causes things to break. So do we need to assume that DMA coherent
devices in generally won't work if the driver manages caches explicitly?

I always figured dma-coherent was more of an optimization, but this
seems to indicate it isn't.

Thierry

--qeva6rbep4nl2wrp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmeTklsACgkQ3SOs138+
s6Fg5A//RRfim9bUu9i1xTkv/GjjLWaRJ7VtWKD5ewVFok31BQU5MKDr06GxqWN9
ARoiC9XZPn/1W8+BYFrZKgWGeT6M47a8Z74LDBbfA2seTEokZWTH8jCyk5LEiVn3
5bKSSMe/2UmmQrGHvAg5Z8FYzaQVP6BcWZoT5K6o6vxRGj9LTgNz/nXlAaFUZFRj
PfnyyrCfF8NfiMOnRtDo8HVB1rxshscjOf/SpDjq++B3rzaLnUUBPI676WlWg0Ru
jMwQbr9Q8ynJBetKGA3Fy5TrAIP2vACLqW7kn4+OJYh9Cwo9HAelQ27y5aur/gdJ
UJCX5pCDtoyVEQwtxwbinOcG1TKGDGBPYUqv/1+IWjiKuHJuAC4/qgPxNLk7sGxp
CiKDGJBYl4vXfbyS43BJj6XqyjOIyFhK2/DEJ2ep64wIi82kJlx6qx6euZ52Ie++
41xc7Ek1ZOUVpz/mou/pAMOmyawOZiSCq/ai0Zzfg8aCsFdrfotasjzUZRh80a6H
4UQgUQSPS6aVitDSga17U6+lA8z62pCx7CQwup3GYNZSma/xLlFIbXNXYlIqsh66
ByAjxG5EK7+Qz4N32+axkdd8g0D6BGesvuHFbYQ8Fo69QfUMpcznChBJUoFH3V60
pKaMDF8b3UJMzAsljZtkby9xqYTiMVqZcGUYVyNRNOkZRo7DfAI=
=kOxw
-----END PGP SIGNATURE-----

--qeva6rbep4nl2wrp--

--===============8012016505725354069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8012016505725354069==--
