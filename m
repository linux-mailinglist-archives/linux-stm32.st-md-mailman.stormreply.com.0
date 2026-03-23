Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id O0BdAnK1wWlyUwQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 22:49:38 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC922FDEDC
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 22:49:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22B24C87EC6;
	Mon, 23 Mar 2026 21:49:37 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58A0BC5A4C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Mar 2026 21:49:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 06FEF44186;
 Mon, 23 Mar 2026 21:49:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E23DC4CEF7;
 Mon, 23 Mar 2026 21:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774302574;
 bh=e2ZhSCx0wJsAx1emJeyO4FU08Tb6VMlBPPL5XXi0V+k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MXR3s6Iie7Hp0vfWKYIxZqEwcifDLvFfeZtG7iRbEA0DhAy6OrFcIRNASgmDu1wES
 zn4IB9ubKrtOy0wXus4wPsc0eBevTbJva1lSU9ESfklLjSd5pBNB1nV24Q36di4wYW
 0lXP0/FiXiQNTgJjuefwj+TrVnsIet/iqOzKs3Iq+mE+Od+sUt35pv7eHj4n55e+gz
 13fLIGiGQyk69OH0znKnUMNM0rDD9dbru0bdVoDvY3E2gfDe4vCze6n6yxC9kUGOMb
 kSLEBVcMkyjMZKjC+Q98InaQDpdQcVNO4WZCXfb7pbVZYBqGq7rQw4g31sEWJnyczt
 1LJaq/W2VhUWw==
Date: Mon, 23 Mar 2026 21:49:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Message-ID: <2f623083-5846-48d4-8c36-e55d663047c0@sirena.org.uk>
References: <cover.1773885292.git.xiaopei01@kylinos.cn>
 <bcfc4a5191976b2ada9cd4094b61ac67a0ea9da7.1773885292.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
In-Reply-To: <bcfc4a5191976b2ada9cd4094b61ac67a0ea9da7.1773885292.git.xiaopei01@kylinos.cn>
X-Cookie: Advancement in position.
Cc: imx@lists.linux.dev, openbmc@lists.ozlabs.org, Frank.Li@nxp.com,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 15/17] spi: uniphier: Simplify clock
 handling with devm_clk_get_enabled()
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
Content-Type: multipart/mixed; boundary="===============8841098369401795416=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [1.19 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xiaopei01@kylinos.cn,m:imx@lists.linux.dev,m:openbmc@lists.ozlabs.org,m:Frank.Li@nxp.com,m:linux-kernel@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 8EC922FDEDC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--===============8841098369401795416==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y/Y2tr05pHZcxD/m"
Content-Disposition: inline


--Y/Y2tr05pHZcxD/m
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 10:04:11AM +0800, Pei Xiao wrote:
> Replace devm_clk_get() followed by clk_prepare_enable() with
> devm_clk_get_enabled() for the clock. This removes the need for
> explicit clock enable and disable calls, as the managed API automatically
> handles clock disabling on device removal or probe failure.

This breaks an allmodconfig build:

/build/stage/linux/drivers/spi/spi-uniphier.c: In function =E2=80=98uniphie=
r_spi_remove=E2=80=99
:
/build/stage/linux/drivers/spi/spi-uniphier.c:773:35: error: unused variabl=
e =E2=80=98pr
iv=E2=80=99 [-Werror=3Dunused-variable]
  773 |         struct uniphier_spi_priv *priv =3D spi_controller_get_devda=
ta(host
);
      |                                   ^~~~

--Y/Y2tr05pHZcxD/m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBtWkACgkQJNaLcl1U
h9BGOQf+P4qqM5W2u6LtXeZ+RqwAf5bIlruWN7Zu6y+s0RsmbnL8SLo7ezN1P5XA
CaagW1s3A1znQ+f+UOmPpt7CUIM1lfu4JMWMQEq/cZthfywlxT0GzJCFxfwmIfXc
CIg28KtEajxKDNgRhc5AUvY+uPwX0bN3q2rUJ/kMcSeopHH61rIVinefkvqchzj3
FcC4NVtnG1cKpbV/hwswiKs7/f4NPM3PJs/PUgGtrqtvcaylsOcjEkL/tUQN5bHY
TupvhVwEX8LSCuTL2A0ihBwbZj1FWzwTqmb2nkc+zwDd0wOWosktdz/D4qYx04Ox
knJf2rx/baCD+1NxJPUJXi0GgY9dkg==
=IvRp
-----END PGP SIGNATURE-----

--Y/Y2tr05pHZcxD/m--

--===============8841098369401795416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8841098369401795416==--
