Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F77124B75E
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Aug 2020 12:52:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4D08C3FAD7;
	Thu, 20 Aug 2020 10:52:25 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F86AC36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Aug 2020 10:52:23 +0000 (UTC)
Received: from localhost (cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 [82.37.168.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6F34C206FA;
 Thu, 20 Aug 2020 10:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597920741;
 bh=ZqG3th/b5Uxk50ROdnLR+gts/eCRrmj90/L+6Vb52wc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pKDANHIIeJcjOAaMWCQFzyJXu/r70du2ZKYKRhRDh7VOW0vGBNtjTAJk8z0IVbhAw
 JCszTZds6S/hxCXmwDrfok82iKPXNDKGgNImJdSIvMJ2P9fr6wInj5PcJ3bNLOBRFw
 kCUYhb9pBv6JtwL9RlZ/VriQJ42RkSuLBgvIoGME=
Date: Thu, 20 Aug 2020 11:51:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Message-ID: <20200820105148.GA5854@sirena.org.uk>
References: <20200820152926.42c48840@xhacker.debian>
 <20200820154626.79d83157@xhacker.debian>
 <20fc45ab-4daf-3855-5817-1898d50c9efc@st.com>
 <20200820163232.54b59e1d@xhacker.debian>
MIME-Version: 1.0
In-Reply-To: <20200820163232.54b59e1d@xhacker.debian>
X-Cookie: Dead?	No excuse for laying off work.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Support Opensource <support.opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [Linux-stm32] [PATCH 11/12] regulator: stm32-vrefbuf: Fix W=1
 build warning when CONFIG_OF=n
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
Content-Type: multipart/mixed; boundary="===============4639573376785433147=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4639573376785433147==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 20, 2020 at 04:32:32PM +0800, Jisheng Zhang wrote:
> On Thu, 20 Aug 2020 10:13:12 +0200 Fabrice Gasnier wrote:

> > You could probably adopt "__maybe_unused" here ? E.g. like:

> __maybe_unused also fixes the warning. I'm not sure the maintainers' preference.

> which solution do you prefer?

__maybe_unused is a bit nicer.

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8+VcAACgkQJNaLcl1U
h9CIQQf8CpLxeYGvZPi26wQNd0LwMWOfzS5DReNlci1HTCE1X6GKANsxjGudPCHZ
dxEIuBuC4eqVCHu4xfXjX+WdYnavp80dGD83kJGzHvMlu6z6gtRUezjspbWClDJF
S92rmkLD1DZo/gMFHKEdyLs7RUNrOVcW/SbesClYSL0S649zBIljRvwibJsFKX9p
npNlMDrRtpx87Rdux0cCAqIXuQEOjFCLs5oFZcHHbIHxvh042022JW7NmyQ5wHx4
sZTeM1eC1wyJqQihJkjziS+VaFwJG3k6vaQZIbkddcRrl1UHC/B7NarX0onCkAso
NGsTd9rE3rfVV9jK51V27xg9pkhIlg==
=fXEC
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--

--===============4639573376785433147==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4639573376785433147==--
