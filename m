Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8789E3F85
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Dec 2024 17:24:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2398CC71292;
	Wed,  4 Dec 2024 16:24:04 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0024AC7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Dec 2024 16:23:56 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-434a14d6bf4so63395605e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Dec 2024 08:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733329436; x=1733934236;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZopfNxUqKzOig+vq2vgMrOIZ/FkZeqWW6Q7fCMolsnI=;
 b=ff7a9lPl9KGMIsadvTrwgoYQa9CKtN8Evl0w/2Gwt7IEXu2j3twQxdzcZ0prxdjoE1
 SCxcstXYZrD6Ips/uMNoc2FgtVkoWAaqHhyNVWu07+NHepW91382Jd/w/r8LVBF6OmvV
 mFSe58zwgU7ZXCIFVrDPdX6ypMypz5AYYQDTdoM8xg+VqeDUblg2MaySO21K4fNF/hbq
 jMqPrOr68Ra2TMot6QUMIXabwL2uUhsNmAcqZwl/ppXw0kY0nc2aPcwsN5ebWNtWoHZ5
 k4tiwLvO3PGpoyvMYSVZgB8Bulq0eUm5ZpqNiAG27Azc4SyMrkZEzZfoakjG4qKruZNE
 rwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733329436; x=1733934236;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZopfNxUqKzOig+vq2vgMrOIZ/FkZeqWW6Q7fCMolsnI=;
 b=i4VOpSWTSF+uLCtcLMiNmMZJ+gbd4nXipOfEIjonRSazBjs3cxN3R0++Qjdu4UXQFA
 l4fHmj9mwFRL4s4nzpCjEMrjW5IxH5QK/vR6yidJIOaaku+s5kSOJLmCUvl9Aj8royM6
 B5WSybBr3u2USObEs5P7IsZepPwVVyeGNfLW8F29Y9p7+04d2lzxui3ahTzA/9ISDlNI
 favhotUD6gosrLg1bkb7L1+ECTJ5pSwyUMvkg+x0i/hJzYXJZ/V0So7N5QtpaJAK4HQ2
 r/xSDfYxy6AsUhxCSeqROi2VDUeLaRyF2Ln/4PjP4pYzqmptrHfkEzjAMn3oMArfJmMf
 2EmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOWIVf95oTyTxlLr3/EgwSgV/JqSAxTGAAXdun5meVcy46SlufQsnbsMg+69lc+w7y/mnUT045J1vuyA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyVW+4qNLoJnIsMg9bjMIWjK3LR/DEckrFYePNalYyPvrJmtWyN
 aIS90wTYo8ni1ctw7wo/ND9Vj1Cyl+2Vm7RWm4wiPKkKeAlvUuaj
X-Gm-Gg: ASbGncuQW3U6eM3jcraTecIEPa6KjH3MDfDcJwwxru1cRym2DiR9L+YigB2Pni6Xxj6
 tSi2p/NvAENX3qdYWv8sE8/Lip/MAVZJj+pbrDtYLlVTw06H2/ZgLCFfyWjcMSynxfNkBGFQk4o
 IeeDn395Lt4aXo/udPsHFtszjKgbSUTAcZsQ5A0cIMgBxaJH5A878AXbdVR39xeY7LO2guqf7pU
 cYM7RARIax7t+9VWTyAs9nrZ70TmYjUoIpc4YNIn0Pw6eg8q94zrTBouFRzphY+12OLkpk+/EXX
 SzOS4W5ih3Z/tQCiV7H3tOf+NMO1NKonKXiF
X-Google-Smtp-Source: AGHT+IEBAuqD6aE0GozRqXuDmFoNCDvwnIaAsz1vt2MpdwK3ooetePeFd9j6ErzZeQHLGJ23gIUJhA==
X-Received: by 2002:a05:600c:3b23:b0:431:1868:417f with SMTP id
 5b1f17b1804b1-434d09c154fmr72688655e9.17.1733329436035; 
 Wed, 04 Dec 2024 08:23:56 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d04defb7sm47745125e9.0.2024.12.04.08.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 08:23:55 -0800 (PST)
Date: Wed, 4 Dec 2024 17:23:53 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Parker Newman <parker@finest.io>
Message-ID: <mpgilwqb5zg5kb4n7r6zwbhy4uutdh6rq5s2yc6ndhcj6gqgri@qkfr4qwjj3ym>
References: <cover.1731685185.git.pnewman@connecttech.com>
 <f2a14edb5761d372ec939ccbea4fb8dfd1fdab91.1731685185.git.pnewman@connecttech.com>
 <ed2ec1c2-65c7-4768-99f1-987e5fa39a54@redhat.com>
 <20241115135940.5f898781.parker@finest.io>
 <bb52bdc1-df2e-493d-a58f-df3143715150@lunn.ch>
 <20241118084400.35f4697a.parker@finest.io>
 <984a8471-7e49-4549-9d8a-48e1a29950f6@lunn.ch>
 <20241119131336.371af397.parker@finest.io>
 <f00bccd3-62d5-46a9-b448-051894267c7a@lunn.ch>
 <20241119144729.72e048a5.parker@finest.io>
MIME-Version: 1.0
In-Reply-To: <20241119144729.72e048a5.parker@finest.io>
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
Content-Type: multipart/mixed; boundary="===============7673964388677088519=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7673964388677088519==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qqjxn4twghzwb4kk"
Content-Disposition: inline


--qqjxn4twghzwb4kk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/1] net: stmmac: dwmac-tegra: Read iommu stream id
 from device tree
MIME-Version: 1.0

On Tue, Nov 19, 2024 at 02:47:29PM -0500, Parker Newman wrote:
> On Tue, 19 Nov 2024 20:18:00 +0100
> Andrew Lunn <andrew@lunn.ch> wrote:
>=20
> > > I think there is some confusion here. I will try to summarize:
> > > - Ihe iommu is supported by the Tegra SOC.
> > > - The way the mgbe driver is written the iommu DT property is REQUIRE=
D.
> >
> > If it is required, please also include a patch to
> > nvidia,tegra234-mgbe.yaml and make iommus required.
> >
>=20
> I will add this when I submit a v2 of the patch.
>=20
> > > - "iommus" is a SOC DT property and is defined in tegra234.dtsi.
> > > - The mgbe device tree nodes in tegra234.dtsi DO have the iommus prop=
erty.
> > > - There are no device tree changes required to to make this patch wor=
k.
> > > - This patch works fine with existing device trees.
> > >
> > > I will add the fallback however in case there is changes made to the =
iommu
> > > subsystem in the future.
> >
> > I would suggest you make iommus a required property and run the tests
> > over the existing .dts files.
> >
> > I looked at the history of tegra234.dtsi. The ethernet nodes were
> > added in:
> >
> > 610cdf3186bc604961bf04851e300deefd318038
> > Author: Thierry Reding <treding@nvidia.com>
> > Date:   Thu Jul 7 09:48:15 2022 +0200
> >
> >     arm64: tegra: Add MGBE nodes on Tegra234
> >
> > and the iommus property is present. So the requires is safe.
> >
> > Please expand the commit message. It is clear from all the questions
> > and backwards and forwards, it does not provide enough details.
> >
>=20
> I will add more details when I submit V2.
>=20
> > I just have one open issue. The code has been like this for over 2
> > years. Why has it only now started crashing?
> >
>=20
> It is rare for Nvidia Jetson users to use the mainline kernel. Nvidia
> provides a custom kernel package with many out of tree drivers including a
> driver for the mgbe controllers.
>=20
> Also, while the Orin AGX SOC (tegra234) has 4 instances of the mgbe contr=
oller,
> the Nvidia Orin AGX devkit only uses mgbe0. Connect Tech has carrier boar=
ds
> that use 2 or more of the mgbe controllers which is why we found the bug.

Correct. Also, this was a really stupid thing that I overlooked. I don't
recall the exact circumstances, but I vaguely recall there had been
discussions about adding the tegra_dev_iommu_get_stream_id() helper
(that this patch uses) around the time that this driver was created. In
the midst of all of this I likely forgot to update the driver after the
discussions had settled.

Anyway, I agree with the conclusion that we don't need a compatibility
fallback for this, both because it would be actively wrong to do it and
we've had the required IOMMU properties in device tree since the start,
so there can't be any regressions caused by this.

I don't think it's necessary to make the iommus property required,
though, because there's technically no requirement for these devices to
be attached to an IOMMU. They usually are, and it's better if they are,
but they should be able to work correctly without an IOMMU.

Thanks, and apologies for dropping the ball on this,
Thierry

--qqjxn4twghzwb4kk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmdQghYACgkQ3SOs138+
s6GbwA//QaUQrLioM0UTRNYWW6ecsfiMO/nk5jBbz5LbMh7211gzUPPg83dUc3w8
PnF586hTlqDo6mLikH3nc7DOt18GNUfjadV8xtLuJX6kYH/VDUEvjQaznfVpfrXo
QdsbMn8MJT6DCq9Qcjvv3shtaGlDyJY/CFKkdKUVwvaw5IXzWdtoxX5Q9vF3v/W3
fxoHRE90syhc9GmFKH9ntlt1Ku+mpNOm6pWYB6QLNTMqctjXJZsxnM+EvGqL57k7
+UCaJvfR2laTf41FkDbLGziIrHmSwoZLMIh08eyIjTGFfOvKqtpO9/a5ckCo9a+t
zjlhdWI0GzRplmw2KYxkWGboZCUrGHzNSbp2GRUKaBs0MB7UVVrVCIDJ2Vj81l4f
JoVhBQUQjNXSuQtZM3GKNq/8SkuQUfdSSt7xCw1lBMBCxXtbEtz7FvbmBjd2qx5o
8vIzqLhXQNp5QfJZT+tTtWnAIm+5GEIZG2mr/pg9CCPKqtAhugSNZc18Me/IS+CM
xXZWZLTQrfmHzUq2eTe0l9iVaTwLUf9ZDF3giHwXoyposgYTugBcHzbp10v1jB4M
L/GJKcC8Lmv1vHMtTrhRJk/UWNSL4TVC7gmcvfXPQRdPB4Q9lXFTuHs0w+ggZVi4
W2Ino7yR62yUh5iLveyTQqBAv5FT2c2EkB7TECfxyb0xGOLYpTw=
=kEPd
-----END PGP SIGNATURE-----

--qqjxn4twghzwb4kk--

--===============7673964388677088519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7673964388677088519==--
