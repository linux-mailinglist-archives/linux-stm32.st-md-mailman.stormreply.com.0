Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 771E05B947A
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Sep 2022 08:31:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D03DC63324;
	Thu, 15 Sep 2022 06:31:26 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDB99C0D2C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Sep 2022 06:31:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A7EE620CC;
 Thu, 15 Sep 2022 06:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B18C433C1;
 Thu, 15 Sep 2022 06:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663223482;
 bh=/j3wYkQ53wBqOy1dy0RP/FqvWpaMmnV8jV9KSEsMfb0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q+g2wvii0/E/Z8cVEDNw6sgIeuruMdFIm883E1cP1WCsrDyMYItGA8qNKop/AUPuu
 wMyNNgu/YV0JUNQHMGqvgYhgPNkxHD3WvsIcgqfcUL2QA1UNBC7kdwpEe+PEk7e6w0
 DiP0vYCA249b6Wrrbjymk/ybH1P3mub/01z5lnKVOdeRAmq7s/HNMpim2gi7n9J0F5
 nW8gWK3MkdZ2waQEVRUM0j000m4/9R9xnSWK+W0GbxbjKCh5b3NU2QvMLEKVjIYm63
 vE9uJn4I7RBa3jdBgMG893n8+sNNdOkNEdgQwr5fdR8c1j98r7qGuKs/7+w3AZYcUv
 B+pOvd/TsILAg==
Date: Thu, 15 Sep 2022 07:31:15 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Lin Yujun <linyujun809@huawei.com>
Message-ID: <YyLGsybCM5a5N1Mt@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Lin Yujun <linyujun809@huawei.com>, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, akpm@linux-foundation.org,
 wim@iguana.be, linux-rtc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220915013304.213917-1-linyujun809@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220915013304.213917-1-linyujun809@huawei.com>
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, wim@iguana.be,
 mcoquelin.stm32@gmail.com, akpm@linux-foundation.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH -next v2] rtc: stmp3xxx: Add failure
 handling for stmp3xxx_wdt_register()
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
Content-Type: multipart/mixed; boundary="===============8985522502039377128=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8985522502039377128==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="INGsqzS9vIYhwxhE"
Content-Disposition: inline


--INGsqzS9vIYhwxhE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 15, 2022 at 09:33:04AM +0800, Lin Yujun wrote:
> Use platform_device_put() to free platform device before print
> error message when platform_device_add() fails to run. Add dev_err()
> to report error in case of alloc memory to wdt_pdev fail.

The second part of the commit message is now obsolete.


--INGsqzS9vIYhwxhE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMixq4ACgkQFA3kzBSg
Kba06hAAoctutLkOr2jK9CYiGkFPE9BZufQe7ynk9RqKHGrJl8koHbPFix/eJqaj
7H7R8mleeK4NYpDq1G0YSRqyrYm9rsUrMhMI76cFCZzi8eoQhkEiDPdJY46Oqpc0
9yKUv4GVQP0wQl1GDPdag8sniYm4zzzfWN+eNYeclBoJ0PvAPaxq3RAppbgxGEkm
9C1w7xzs3z6cAZGxWS2d56uDYDiFsP+0Prs7O4uM9q1xPi3/83BA8HXKECLv9maJ
+7EI8jqEIVYrBZedcoj2+ZyG2x0DrBGMoHJ3VnjAAZqr3uUOsKWZvV8bl9S2xBv7
OYvoR6rWjfteKC+8H1mFFP5xoxpOnYXE7wcE3CmDRZgody6G4rZ9yzTc+KtuN0Hi
fskF8s4bvjT4H/k5ON8KLVVNoj3nWzwmDn25uZ84cl6dMlgTgaSX21ufIvYd5DvG
ZHQpHrgJo+PtZTOXg7hVQaF+VurZrigxyo/pxI32C8rmLD0TX79nSZNWfJm8y47f
LadpP/k77dFMoSFl4sSYpamfnJuBWAsiJBhpARsta6VRdlWubSj+DVUiy3BG1YvK
/aYMDRjkgc1yGKayHsdZgwkMzAhh2F25nSSj8AN3cpJVXcjG4rNnZ0MtNYHOTAJp
u227FUBpN67I/Oidhg3QwWZ3YqI3QXSG7b/bEqqsNKUU7gLqPfE=
=Z8sd
-----END PGP SIGNATURE-----

--INGsqzS9vIYhwxhE--

--===============8985522502039377128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8985522502039377128==--
