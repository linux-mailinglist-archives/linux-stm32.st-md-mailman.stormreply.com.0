Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2B8481111
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Dec 2021 09:49:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6025DC5F1F0;
	Wed, 29 Dec 2021 08:49:45 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A315C5F1EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Dec 2021 08:49:44 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id iy13so18006744pjb.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Dec 2021 00:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mO2cAbVnF3v8h4rhBAATa6/9hT/HObJzVn6RR0z5/AY=;
 b=fD9Kjs5q7zDK2mneIzHPuhxO8bD+RMXyEKIXls+aPyDcecx//wxzObDOrwIqupMoy2
 DNOXSY3d3ZGAeYJN7jxSqgvqGqeiRDlpy/TKwsQQ/dW9eplzpE7KEs51W2IKXh2znZX4
 e4SY0njUaYIY/kyJhYMQG0ssa0mDPU6PJqR0WQav/TBIkZM2jtFQ4730kIGFrtAagIM3
 Zy50s7miw4gOsqxl2NOwLd0qPg4yyrDY+DZEzJAtRj933oIcVyX2hV8JOUl8StKkYxK0
 ++H+4gSDCfQi6xr+EgbHyfX5doQq4aSo3bt55mUf+x1KvpDR8hJE8zlSSM1Fgmz0ai2D
 u19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mO2cAbVnF3v8h4rhBAATa6/9hT/HObJzVn6RR0z5/AY=;
 b=ZuVWJxp5zZNyMUwrx6eL8w7UodFVMNMVrbzfDYKeb8AHHvx34NUZULYY1Fo7KXV+uK
 xHSuCs0awbMd8V/Kqx4c9gF2pXWUkU1rrEut2SRX50NpXqG045u7cdNo5vqqjLbAAmd7
 3nXonIZDnu6EVMVKpKtJkWZD23ZJA4Y0Re17wSqqfzB0Iodngw6CBbZ4VPU6GgaqiB/M
 rsEFdB7Z1cKBVXpEKHlHrAWiNvMhktNz7yMyeAVOdvw2tDHdsJuFmoSJp1+UQ1D6L8Z0
 iQwgmBDcb+sT/3lHxEjOftuW20+Z6uP4l3vYaE7tMHcEtTg5jZcF3m00nkK0L79mkxz+
 /Ftw==
X-Gm-Message-State: AOAM533kvEvtXbpXh2f5JQV7+HslTV4PyGsdXnlswivzF4OgT9ZDWYvg
 SnOfFBD86/iTWqIRMwDDHHA=
X-Google-Smtp-Source: ABdhPJzVJgmgsptgAq+TdPzvOb5SL/XOlJJFyjQHNTX1+0ZlJN9DKairduymjzfmUhbXdYu+HVK07A==
X-Received: by 2002:a17:90a:eb12:: with SMTP id
 j18mr31008291pjz.156.1640767782860; 
 Wed, 29 Dec 2021 00:49:42 -0800 (PST)
Received: from shinobu (113x37x72x24.ap113.ftth.ucom.ne.jp. [113.37.72.24])
 by smtp.gmail.com with ESMTPSA id f16sm20733849pfv.191.2021.12.29.00.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 00:49:42 -0800 (PST)
Date: Wed, 29 Dec 2021 17:49:30 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Message-ID: <YcwhGmOdP6QPpB3A@shinobu>
References: <20211227094526.698714-1-u.kleine-koenig@pengutronix.de>
 <c8f6446e-748b-5845-ae60-5d6b8f3e8d39@metafoo.de>
 <20211228173558.3702faa2@jic23-huawei>
MIME-Version: 1.0
In-Reply-To: <20211228173558.3702faa2@jic23-huawei>
Cc: Raymond Tan <raymond.tan@intel.com>,
 Benjamin Gaignard <benjamin.gaignard@st.com>, linux-doc@vger.kernel.org,
 linux-iio@vger.kernel.org, Patrick Havelange <patrick.havelange@essensium.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Kamel Bouhara <kamel.bouhara@bootlin.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Corbet <corbet@lwn.net>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 David Lechner <david@lechnology.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org,
 "Felipe Balbi \(Intel\)" <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Oleksij Rempel <linux@rempel-privat.de>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Syed Nayyar Waris <syednwaris@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 00/23] counter: cleanups and device
	lifetime fixes
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
Content-Type: multipart/mixed; boundary="===============0294185418818433836=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0294185418818433836==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ulhIPNF0Gpal2K//"
Content-Disposition: inline


--ulhIPNF0Gpal2K//
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 28, 2021 at 05:35:58PM +0000, Jonathan Cameron wrote:
> On Mon, 27 Dec 2021 13:25:25 +0100
> Lars-Peter Clausen <lars@metafoo.de> wrote:
>=20
> > On 12/27/21 10:45 AM, Uwe Kleine-K=C3=B6nig wrote:
> > > [...]
> > >
> > >   - I wonder why counter is a bus and not a class device type. There =
is
> > >     no driver that would ever bind a counter device, is there? So
> > >     /sys/bus/counter/driver is always empty.
> > > =20
> > There used to be a time when GKH said that we do not want new driver=20
> > classes. And all new subsystems should use bus since bus is a superset=
=20
> > of class. This restriction has been eased since then.
> >=20
> > But it was around when the IIO subsystem was merged and since the=20
> > counter subsystem originated from the IIO subsystem I assume it just=20
> > copied this.
> >=20
>=20
> Yup. Discussion about this back then with one view being there
> should never have been class in the first place.
>=20
> https://lore.kernel.org/lkml/4B571DA4.6070603@cam.ac.uk/
>=20
> For anyone who loves the history of these things...
>=20
> FWIW I think Greg suggested IIO should be a bus because we were hanging
> a bunch of different types of device off a class and it was getting messy.
> Kay then gave some history on class vs bus and suggested no new
> subsystem should use class.
>=20
> Ah well, opinions change over time!
>=20
> Also interesting to see we were discussing a bridge to input all that
> time ago and it's still not gone beyond various prototypes (with
> exception of touch screens).
>=20
> Jonathan

Yes this is the reason: Counter subsystem just followed the structure of
the IIO subsystem originally which is how it ended up as a bus; changing
it to a class now would break userspace expectations so that is why it
remains a bus still.

William Breathitt Gray

--ulhIPNF0Gpal2K//
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmHMIRoACgkQhvpINdm7
VJKdGw/8DSuO6HGcXF2c1ChPZDJ+eF7e4FwznBOmwFZuui+Etz1RjciazjOGXRwC
qi/+e6qNrOcZoQr5IQ+BNrSbMN+pBR9zFSsxBu1HdfrUAFq6uzmaYdC3cUtrY0OV
jPPldinP4VhASWRokScS1xR+CFrP8YEwzsIljGAhRpYfXlm87EfY8xPcBLW/EOYb
Ex4gBeYBaW3E5Ath2Ho6VMTb9Kcni+jIOSrxvhHv/XkewguyGJIXK8yy57BtwhDv
lLUG8LoV43mFYYQJHi/+UvYC+qoHvvlHGUVPatA6/uRP8JnWp1QN3jO6bQulti3T
SzWYjrOzjOqfomVfuUakaNK1yYNgjhVEH+gykqcqMC0J+DZtg3+1PyAtNNZ38hxe
Vp9+lFTA/06YeWHBuW+bAiskbPZ6LRc3jPB6uSlxd4YRpCqr8K9CU9EaAo3SuPV1
zguKpB3drJ0Ifz6gjcr5mxDrCUoiseTd7Xi9uzDehuOet38g1PXfoisepp5KbYHl
GKnqkVQzceOpLRpWkbv8ryhoMixVFG3mmwPzuxgkNinnEZWDFPskLNy7wAt7hIK9
0r2PalzvaFpP+mh+A6kZwAtiCRtTU54yjEL15QerAeo2Cpb7/SQ60PbGr899MWi5
8GpEW0v8QAjretoQiYeYiuYjcQqKJSiOgWY2FkzLYy01SBfBMSY=
=PvzH
-----END PGP SIGNATURE-----

--ulhIPNF0Gpal2K//--

--===============0294185418818433836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0294185418818433836==--
