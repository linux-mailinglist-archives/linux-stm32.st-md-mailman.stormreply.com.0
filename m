Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE08264657
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Sep 2020 14:50:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20F7CC3FAFE;
	Thu, 10 Sep 2020 12:50:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 769B5C3FADF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 12:50:08 +0000 (UTC)
Received: from localhost (p5486ceec.dip0.t-ipconnect.de [84.134.206.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD22320882;
 Thu, 10 Sep 2020 12:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599742207;
 bh=DqxNaNfAxBAFdZARRzshzmaGwx327r2VxbQbaMWY+Jc=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=pbXOrTd5KXxDPnmhFcVLnfFAZcllCFUP+VVM53WJsVW9sf1O7HXBU6EylvrYVEV5w
 vyXbueUqRW/dJjj7rgj/walpI+dkjHuIyj6qFIkRJ6DzzEBF54FubPkkrH5x1tyi6j
 m/Zukaa9CC2cg2EGmwdf0PNshU6qn4kRu1ofy4zo=
Date: Thu, 10 Sep 2020 14:50:04 +0200
From: Wolfram Sang <wsa@kernel.org>
To: pierre-yves.mordret@st.com, alexandre.torgue@st.com,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@st.com, Krzysztof Kozlowski <krzk@kernel.org>,
 Holger Assmann <h.assmann@pengutronix.de>
Message-ID: <20200910125004.GK1031@ninjato>
References: <1599730349-2160-1-git-send-email-alain.volmat@st.com>
 <20200910100607.GJ1031@ninjato>
 <20200910122739.GA5093@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
In-Reply-To: <20200910122739.GA5093@gnbcxd0016.gnb.st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Linux-stm32] [PATCH] i2c: stm32: do not display error when DMA
 is not requested
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
Content-Type: multipart/mixed; boundary="===============2286914792860021015=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2286914792860021015==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iSeZnk6FyAS3EJ1y"
Content-Disposition: inline


--iSeZnk6FyAS3EJ1y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Indeed, that's a good point. I'll rework it then, to avoid the dependency
> on dev_err_probe change. If that is ok, I propose to push a two patches serie
> with both this fix (updated) followed by a rebased version of the
> dev_err_probe patch from Krzysztof for dev_err_probe change.

Perfect!


--iSeZnk6FyAS3EJ1y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9aIPgACgkQFA3kzBSg
KbYgHA//TZ1dChdYgru0+uAzrZfxdIpwWVnNaKn7ETaRe5xAJba24FzjiYdHUiTy
lI6TI4QbPc4Pc/YavOEmnuj6gRXsYSZE/ZKkLNdhESkNuGYcBfHwhWfXecs5J6RB
D55pc+nbkXwHZZZp/Ojo9e2/XW8m6I5BvophEKb3ORb54VENLekaF7YWBm0nzliy
yxQ6kwUQfJ9zQk9wr8QGRKy4XvRJp4VrOq8DfSdjnGev9rYIfsfDOn5RyHetUOqJ
D/wBck/RKqXYM+CXWijwe7qZLp3wHOGtgmv9KdBE4j/Jb4ZKk70K8xE8rRE9hUSS
7ZjoWIEfYbZs7pPvja2svuOy9cslLIjhOigaZn/hCVHQS5+uebRBUKUoyqZVUjcH
2JD7IdC6UtCqcv0D4HKMw6F01HQxx/YKUIs8Ik+ObRdeB3MKZNeGlM1HpRRDq52C
5G6wKWTlD+JQqRtrypvpYUNo151keAi5pKcPsKSPynglOc06Vadeagl1hwcP4tTD
dT4NjtsmAASoQcakM3QZ1TQ7pjnOwjj9C2QlN99+2/ysGKggMy/EimM4YNC8Ne9N
7FAtAFMS8awvHPjaHyXm77fcApgnMot6D6JpsINKEwRQ+T0ayVXRBVRSuU6/TCGK
995S7CtiEWnQgR9k0+HfuMHZCbRKT+/b6W//CMDaGzhnesfHJ54=
=9MtT
-----END PGP SIGNATURE-----

--iSeZnk6FyAS3EJ1y--

--===============2286914792860021015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2286914792860021015==--
