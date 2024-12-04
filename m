Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA5D9E42DD
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Dec 2024 19:06:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28F00C71292;
	Wed,  4 Dec 2024 18:06:40 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE25AC7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Dec 2024 18:06:33 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-434a099ba95so911515e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Dec 2024 10:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733335593; x=1733940393;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uyHKOxEKj03rgX35m/QxXvHrY0ktDc+PNXLib8Uap+M=;
 b=QITvwFNoJMcHJrabywMfIqTgqde+FGMWjuRhhbQNZRRSUqCbq8YV9pnG576Uu+AyE0
 MXknHGaIXsmVDytXSCmV11FsAsASFqVECC/io2bSt45mJ7nkxxTPyjQJpAnZIqm1tZQh
 6qn8nR3IF+qrJ6+dpdj86loVTDDsZ60o8X9bXA2JB6Dfm/7K+xSxd7WinBScYOkvb0iJ
 P5xc2QuzbiVAxMUYtRay+e/k8oe53TKA77ljcJrC3KVi1v6t1gOHHcT6KRzK/uwEwFXb
 12/r8UMlYPsYJapcQRIMWsUI3zv1Tkb7XcDEkWlgL06s0hhNkI8FU/OBUA+9allAsT2n
 Ckcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733335593; x=1733940393;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uyHKOxEKj03rgX35m/QxXvHrY0ktDc+PNXLib8Uap+M=;
 b=br6ozhKnJxzKKISTSe/uKVQsuhXwrLoBglzi+zfUJGxqeS5c0B9b+A1BpwlBWyvRE2
 n0hOA8H2MrUVwxSXHuHveycYtxmx/UzPFIScaz+go8wAS9vLD1rxM8u6OAxdL3s17xEK
 +kpssqL4Br/HuEdhGQ3d28D0rNJkJrfE0M/ocSbilh2LqPPaslY+J72DKf/KJ1SACxKn
 XMXQM7waDAkis6VTY0h+kd6/U7csWtEoTpnRZL1lyrtRNbwjU07dxWZVTL/bOairqNkf
 3WM751RLTCPK2GshnWESll3W+i0DxCyWyskzkvwmVVG5kpEMdsx1kFA2yBhsZAbZGLbB
 YsKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmZEjaXi0BM6vju8daS9RSt0uLje2HkNBN9TqNjg5NB6GRGpx4NKV7Kj1E498S0DT0e9ZiUV3A6ee8yg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxpgpsylpcRfNYynEZHOvVXbBgF1HplLAkmZ3tDFEaziNEczvd7
 LbXZ9rLSqTBXMWHDrFtE5aoFb//qRPE7eCqPeovy+3OM4CY7V4Y0
X-Gm-Gg: ASbGncubwGKrLrgO0uJ4NOP4Bxs+jNFJ3wErt/7gdYOIRcx2cM5sT16Jqwbg1mZUw/e
 mmHh4RCHilqN8ETOQUH8z0LsI4SLs227BwlBIaAvKK0vJQ5QQmYOZzbm4KVcqUcb0wejxibDJic
 WgxMcfSwGykjVp84Kw2MUkn63guJZk3vv74wADdtijvgHRVtFMeokhNDCn7gG4PxBnhbaNVFM4j
 FWeRq5YETCkRb5KJCFzGNIvIinLIV1ZDAjmAkcOpU7qguyV1jM/w+8kWhoWTduyCb2PnG7MqfYQ
 TAr6TuGeP6ddb1zGEs2mlr1pl0Vo8+Fym2xI
X-Google-Smtp-Source: AGHT+IHJCMa0Jw2obBkAdIaN6jxKiTpv9JchsF8d03P1qW1tmylQdi2YTYrJIpa49ocoRTyBhVpRnA==
X-Received: by 2002:a7b:c34f:0:b0:434:a923:9313 with SMTP id
 5b1f17b1804b1-434d4101881mr42697335e9.25.1733335592675; 
 Wed, 04 Dec 2024 10:06:32 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d5273131sm32003255e9.12.2024.12.04.10.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 10:06:32 -0800 (PST)
Date: Wed, 4 Dec 2024 19:06:30 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Parker Newman <parker@finest.io>
Message-ID: <uad6id6omswjm7e4eqwd75c52sy5pddtxru3bcuxlukhecvj4u@klzgrws24r2q>
References: <ed2ec1c2-65c7-4768-99f1-987e5fa39a54@redhat.com>
 <20241115135940.5f898781.parker@finest.io>
 <bb52bdc1-df2e-493d-a58f-df3143715150@lunn.ch>
 <20241118084400.35f4697a.parker@finest.io>
 <984a8471-7e49-4549-9d8a-48e1a29950f6@lunn.ch>
 <20241119131336.371af397.parker@finest.io>
 <f00bccd3-62d5-46a9-b448-051894267c7a@lunn.ch>
 <20241119144729.72e048a5.parker@finest.io>
 <mpgilwqb5zg5kb4n7r6zwbhy4uutdh6rq5s2yc6ndhcj6gqgri@qkfr4qwjj3ym>
 <20241204115317.008f497c.parker@finest.io>
MIME-Version: 1.0
In-Reply-To: <20241204115317.008f497c.parker@finest.io>
Cc: Andrew Lunn <andrew@lunn.ch>, Parker Newman <pnewman@connecttech.com>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Jonathan Hunter <jonathanh@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-tegra@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 1/1] net: stmmac: dwmac-tegra: Read
 iommu stream id from device tree
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
Content-Type: multipart/mixed; boundary="===============8022528740313888618=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8022528740313888618==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eyf27zncx4uh4ucn"
Content-Disposition: inline


--eyf27zncx4uh4ucn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/1] net: stmmac: dwmac-tegra: Read iommu stream id
 from device tree
MIME-Version: 1.0

On Wed, Dec 04, 2024 at 11:53:17AM -0500, Parker Newman wrote:
> On Wed, 4 Dec 2024 17:23:53 +0100
> Thierry Reding <thierry.reding@gmail.com> wrote:
>=20
> > On Tue, Nov 19, 2024 at 02:47:29PM -0500, Parker Newman wrote:
> > > On Tue, 19 Nov 2024 20:18:00 +0100
> > > Andrew Lunn <andrew@lunn.ch> wrote:
> > >
> > > > > I think there is some confusion here. I will try to summarize:
> > > > > - Ihe iommu is supported by the Tegra SOC.
> > > > > - The way the mgbe driver is written the iommu DT property is REQ=
UIRED.
> > > >
> > > > If it is required, please also include a patch to
> > > > nvidia,tegra234-mgbe.yaml and make iommus required.
> > > >
> > >
> > > I will add this when I submit a v2 of the patch.
> > >
> > > > > - "iommus" is a SOC DT property and is defined in tegra234.dtsi.
> > > > > - The mgbe device tree nodes in tegra234.dtsi DO have the iommus =
property.
> > > > > - There are no device tree changes required to to make this patch=
 work.
> > > > > - This patch works fine with existing device trees.
> > > > >
> > > > > I will add the fallback however in case there is changes made to =
the iommu
> > > > > subsystem in the future.
> > > >
> > > > I would suggest you make iommus a required property and run the tes=
ts
> > > > over the existing .dts files.
> > > >
> > > > I looked at the history of tegra234.dtsi. The ethernet nodes were
> > > > added in:
> > > >
> > > > 610cdf3186bc604961bf04851e300deefd318038
> > > > Author: Thierry Reding <treding@nvidia.com>
> > > > Date:   Thu Jul 7 09:48:15 2022 +0200
> > > >
> > > >     arm64: tegra: Add MGBE nodes on Tegra234
> > > >
> > > > and the iommus property is present. So the requires is safe.
> > > >
> > > > Please expand the commit message. It is clear from all the questions
> > > > and backwards and forwards, it does not provide enough details.
> > > >
> > >
> > > I will add more details when I submit V2.
> > >
> > > > I just have one open issue. The code has been like this for over 2
> > > > years. Why has it only now started crashing?
> > > >
> > >
> > > It is rare for Nvidia Jetson users to use the mainline kernel. Nvidia
> > > provides a custom kernel package with many out of tree drivers includ=
ing a
> > > driver for the mgbe controllers.
> > >
> > > Also, while the Orin AGX SOC (tegra234) has 4 instances of the mgbe c=
ontroller,
> > > the Nvidia Orin AGX devkit only uses mgbe0. Connect Tech has carrier =
boards
> > > that use 2 or more of the mgbe controllers which is why we found the =
bug.
> >
> > Correct. Also, this was a really stupid thing that I overlooked. I don't
> > recall the exact circumstances, but I vaguely recall there had been
> > discussions about adding the tegra_dev_iommu_get_stream_id() helper
> > (that this patch uses) around the time that this driver was created. In
> > the midst of all of this I likely forgot to update the driver after the
> > discussions had settled.
> >
> > Anyway, I agree with the conclusion that we don't need a compatibility
> > fallback for this, both because it would be actively wrong to do it and
> > we've had the required IOMMU properties in device tree since the start,
> > so there can't be any regressions caused by this.
> >
> > I don't think it's necessary to make the iommus property required,
> > though, because there's technically no requirement for these devices to
> > be attached to an IOMMU. They usually are, and it's better if they are,
> > but they should be able to work correctly without an IOMMU.
> >
> Thanks for confirming from the Nvidia side! I wasn't sure if they would
> work without the iommu. That said, if you did NOT want to use the iommu
> and removed the iommu DT property then the probe will fail after my patch.
> Would we not need a guard around the writes to MGBE_WRAP_AXI_ASID0_CTRL a=
s well?

Well... frankly, I don't know. There's an override in the memory
controller which we set when a device is attached to an IOMMU. That's
usually how the stream ID is programmed. If we don't do that it will
typically default to a special passthrough stream ID (technically the
firmware can lock down those register and force them to a specific
stream ID all the time). I'm not sure what exactly the impact is of
these ASID registers (there's a few other instances where those are
needed). They are required if you want to use the IOMMU, but I don't
know what their meaning is if the IOMMU is not enabled.

There's also different cases: the IOMMU can be disabled altogether, in
which case no page tables and such exist for any device and no
translation should happen whatsoever. But there's also the case where an
IOMMU is enabled, but certain devices shouldn't attach to them. I should
make it very clear that both of these are not recommended setups and I
don't know if they'll work. And they are mostly untested. I've been
meaning, but haven't found the time, to test some of these cases.

Thierry

--eyf27zncx4uh4ucn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmdQmiMACgkQ3SOs138+
s6E9NBAAg1IQLMIDjLwoG2qSLXuu9qrgbn1s1FcJGJYi0aJ5A40jrzC2BMsmUQw+
rjMgze/1lUPdJ+p3uYQtKVkIGqNihbfjhPeY/f06tNey05/yb52eL6SXKWRKiQUQ
ndr0fNRwdLg2wx09qWHHpo05jBic5iKvW0RtVBOdNSZ2HYHAE/hXWxOyUbYlI8wg
1qtbxERJ8Tz0EivZjui3U0DqiPJwIjZ/qlcf97UNVxIqYJGvFdBdAt0mcSlb2029
tASjFveIuFi0d5VgRDNzBn6iYmK5GrXtiM1IbUPPuKkasFHHSu8NQrFJBBqWZaeQ
1YQr1Um3c4ZeTPVH52KXXdGIr/SfA1W/Ybp1B7JImuTkysUTQFcNQGiCGU8BwV7k
TNpCsJTUL9b+L+Rd0cjlieG7O9OUnvA4ikJaZqtc5qZVJVPbxctCe+p+UfG3uBfV
SgGXmBFiyYXisQJB5SpRjXgY12Tzrgy3v234c/zGZ9WjUqOAEl49O+VUvJWnXjIq
bI94Uh8+VY3PkEdvFk2W6eZ/Eolp+FM1LwBfQeOgraUHDKI8Plf5EHsXwhpF0tH9
HgZ0S6zdhYMi2AWoVNM0kJLPHFLrTlL4q6ighq4Pdn3jaxjbhaFMnkiQ3/r9IPiW
CZHmKP4gSmGVmLCBKbPOahWDtQaBVoM2GM9ZtraOG524LGqIXys=
=zKRe
-----END PGP SIGNATURE-----

--eyf27zncx4uh4ucn--

--===============8022528740313888618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8022528740313888618==--
