Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2089722CAC5
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jul 2020 18:16:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1F45C36B27;
	Fri, 24 Jul 2020 16:16:42 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D7ACC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jul 2020 16:16:41 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id s9so10512999ljm.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jul 2020 09:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=G3jgH9IJtnDPS4GzMfQzYedGbY2dUDD4L8Drje8NRlU=;
 b=nrUSmfpaTpszweIRHhqWJLQQZtbutSiCM3PQrV1OkVvq6RfvffjRE1yf0vpuGKHaJH
 GwbC6/ZnQJoUwZ5oss1A3GDiGgrViVQydfS95yWJjFzW26+Z78e5ixZr2r45JXwe5Nue
 Qx7ULKX0G91/kYXx5WyUZXGgO8tBIUuq9vEKXvR9QvQUNhJIO43nxaEUtUmvwRrYtM0b
 zbADhSwV1bbaYEtEs5FfIHr+gnkzeYd5k9fgY5N7ob9S80HD8SQPWHgfcjukumtj+Cky
 OSp7+V1WEu9ga05UIEVmoCY52dhnmRxE27Q2NFqvlBLz34SML1A0oXul2I0Z6X1oF3i5
 sdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
 :date:message-id:mime-version;
 bh=G3jgH9IJtnDPS4GzMfQzYedGbY2dUDD4L8Drje8NRlU=;
 b=cCmxxtwoMGqhct7wabAfU7hAIxSCEtniwca2TTgw2u9su3OUO1sITE/pFCgBfNua85
 06hFnHRZ3ijPo2dguzzmaLmfyAOFnJCK4ksAOjuAmGkQtGwFkAem8KkgqY4rOc28Teka
 EPfvdXLjUys8PvfmCatOGBXi0hmi6MG/ioplsiUxL27tDSynW3W0UCsy5gX2sKYNUIzg
 dzqmmSBBgICXi0ys0yn9sVVB/24K4G5fIaoKtqTfkhq6d8BPVdPuXXcINYny/KmoUaUh
 4EGOXgRvjH3e11RZVznSoZOWdroH62u6cw284dVZkTHqQ56wpEOWLHYUfI3qhiuIep5O
 ftSA==
X-Gm-Message-State: AOAM531IT5zQCe673/01Azgebo2j9F9ghc+vAY5BkPI+kLaR6YUhwDyG
 godmyHGQRf5VnbLED6KPrQ8=
X-Google-Smtp-Source: ABdhPJzZZxJFgz/JhY1AQxrSNFLKjFlzqxRkySRQt6pWYKe77616ATr0A1ybIV2h7qX8Q8N/3qdvRw==
X-Received: by 2002:a2e:960a:: with SMTP id v10mr4860375ljh.223.1595607400472; 
 Fri, 24 Jul 2020 09:16:40 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
 by smtp.gmail.com with ESMTPSA id r15sm335077ljd.130.2020.07.24.09.16.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Jul 2020 09:16:39 -0700 (PDT)
From: Felipe Balbi <balbi@kernel.org>
To: Amelie DELAUNAY <amelie.delaunay@st.com>,
 Minas Harutyunyan <hminas@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>
In-Reply-To: <fcff5f96-8383-fd84-35f1-3eb291cd65df@st.com>
References: <20200724104711.5474-1-amelie.delaunay@st.com>
 <4c44f596-d2c3-6d2f-bf28-9e3964b6e6f1@st.com> <878sf9owcw.fsf@kernel.org>
 <fcff5f96-8383-fd84-35f1-3eb291cd65df@st.com>
Date: Fri, 24 Jul 2020 19:16:29 +0300
Message-ID: <871rl0q46a.fsf@kernel.org>
MIME-Version: 1.0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fabrice GASNIER <fabrice.gasnier@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3 0/3] Add USB role switch support to DWC2
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
Content-Type: multipart/mixed; boundary="===============5101201100778616751=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============5101201100778616751==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Amelie DELAUNAY <amelie.delaunay@st.com> writes:

> Hi,
>
> On 7/24/20 3:50 PM, Felipe Balbi wrote:
>>=20
>> (no top-posting, please)
>>=20
>> Hi,
>>=20
>> Amelie DELAUNAY <amelie.delaunay@st.com> writes:
>>> Series dropped.
>>=20
>> what do you mean with this? Should I drop all patches related with this =
series?
>>=20
>
> As v1 patches were in your next branch, I've prepared a new patchset=20
> which contains fixes, on top of you next branch :
> https://lore.kernel.org/patchwork/project/lkml/list/?series=3D454959
>
>
> What do you prefer ? Drop all patches related to the v1 "Add USB role=20
> switch support to DWC2" series and I send a v4 in replacement or keep=20
> all patches and wait for new series review ?

I've dropped those because they caused the build breakage :-) I can take
a new series, let's take the opportunity to avoid the build regression.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8bCV8ACgkQzL64meEa
mQZc7w/7BbjxTemwrP+zsnhES1GyFOmMB+RtZe3AKqd2aNcuD7rhQAPH2At/2pfK
bVw4evguMHwzuyeHPw/3p6wy0udW/NGnxuqNR5TX+fQaydDlp4MFJj7qLK7zRpd1
b7cYxDKXgcXpI4rMORF6w/6rOdcweTGRlTZJ+Jk8/I/cee+JB7ZmQbqwvAr2pURP
AE6tu8v8jzcguyIm7IC0vdvTigkdQGTrNp+qmrECbf+gr5TMvvY8CYRIwmgz312O
8Xqc2GzEm02HLK2GxZDTl31ImnXO8sRjCkkZH33BOeMka6+Jw4PqrGVj7zIGG5zG
uxal+yZwCub2JfEPo+sVP/GbGg8iHzMeoXzBwDPHbGyvCizRqrRfUoRiSVav6Yy+
0dtrs3vcOwnvHIo2frrxei7PMV5U/AqTNmhBik8eRr0U8aFwf2i/2IeJAZt+te0p
z5t9wRGPop1RzMtai2jCcvxCA0e/tX8exBXB7+0UuuuPPjWBIFYSSbhqovYiyk1G
CRbk5L4Gw4Kh8OLJzmXv+O4Awpf5PsPt8VmoWy2SVyMxwPPBiCyklwtiVYt/TpAZ
Tsw+MnaT1USiMoluo3LLzpNLFp6p1uqgKaJGEVoLBeI5czoFP9mBdEAkUGx0Z/Zl
HUDcXMpUkSydzN840QymcMm15u0etdm9IPdA3cwW4LZxhwEGtjk=
=JWEE
-----END PGP SIGNATURE-----
--=-=-=--

--===============5101201100778616751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5101201100778616751==--
