Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCQHBK+XwWkuUAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 20:42:39 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD132FC7F7
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 20:42:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5860DC87EC6;
	Mon, 23 Mar 2026 19:42:38 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB9A1C87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Mar 2026 19:42:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8D2F7434D7;
 Mon, 23 Mar 2026 19:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 167B4C4CEF7;
 Mon, 23 Mar 2026 19:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774294955;
 bh=11j9z/1fJKiQVdJE20P4e+j+9ToUEls87BE6rvgPEnQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FgPX3A5wg1iUr/7tQS9xp5e6w0B25P8zSkCFksilaSdtWF0zDITP+MM+ylpxRhqqN
 z1RrpGJ0rkK+G2tQr65a2/Xwv7EiFqD6PuLMWp6NIgNgWPZTiDGxPpc7mIWDXI+lVj
 WazCdp1gkd01GY8XHb75ph0A9LOKxkfuKGbvWtCEABYmHzURaMEXJmTzb8e3FF9HZm
 Yd94MYFdCPEkY0FJN62BvsxE7q/dbpPH7fE+CcgiWdhHVGeKHch8avzFVVHAHBzTai
 26KyXPjH454gkbq++sACIjU4amKyHo63ZwM2pIugLnvvDU+/lf1hAcY1Y2JEWVzJnR
 x0lY5DPsSmnIQ==
Date: Mon, 23 Mar 2026 19:42:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Message-ID: <7e9fc388-cdc3-4810-9136-9a1f33fed7f7@sirena.org.uk>
References: <cover.1773885292.git.xiaopei01@kylinos.cn>
 <387f2fa1b3e1a356c524bb36eab07e1b431b6382.1773885292.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
In-Reply-To: <387f2fa1b3e1a356c524bb36eab07e1b431b6382.1773885292.git.xiaopei01@kylinos.cn>
X-Cookie: The only perfect science is hind-sight.
Cc: imx@lists.linux.dev, openbmc@lists.ozlabs.org, Frank.Li@nxp.com,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 07/17] spi: orion: Simplify clock
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
Content-Type: multipart/mixed; boundary="===============2748007911050162056=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [1.19 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: ABD132FC7F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--===============2748007911050162056==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ETAL/F05848nVpj1"
Content-Disposition: inline


--ETAL/F05848nVpj1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 19, 2026 at 10:04:03AM +0800, Pei Xiao wrote:
> Replace devm_clk_get() followed by clk_prepare_enable() with
> devm_clk_get_enabled() for the "axi" clock. This reduces
> boilerplate code and error handling, as the managed API automatically
> disables the clock when the device is removed or if probe fails.

Another runtime PM clock managment one.

--ETAL/F05848nVpj1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBl6UACgkQJNaLcl1U
h9BT8Qf/dtJjSArsGgU+y0yVED55+m8067SuMbN7WPDUHaKFWCm0BD0AB2I7w1wo
Q2eV7b7mCT9le7uw8d9NPBabofnVmISnVSpguFgRIG7YVtcz6uVBHSV78j6gcMvk
kruWd2xH7oETY56WXrEH08IbyT7W1URHbuWrZ8rHqszSMdKsqCx7ASMx8O92IOx4
JX2u0m/PftCpz/ebstkEkS86e37+yNik2jfo4cb+HhAkYYkgYUzeocNaWEixMslH
FcajN7OlPOnfeey4e2Fj7/C/S62tLwDD1HckZI9Ja3rE252BzECQ9E0U/4Ocf7ZD
kMKNWTPNhkr71ULS8mV6P4nVuyLAgA==
=fMon
-----END PGP SIGNATURE-----

--ETAL/F05848nVpj1--

--===============2748007911050162056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2748007911050162056==--
