Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJ4vGL5AvGm7vwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 19:30:22 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E66AF2D0FDE
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 19:30:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D4D7C90090;
	Thu, 19 Mar 2026 18:30:21 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 716AEC87ED5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 18:30:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 69C6660053;
 Thu, 19 Mar 2026 18:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F1BC19424;
 Thu, 19 Mar 2026 18:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773945019;
 bh=39Cu39toy/8GhZJ1SgNYS+5TuFP8tJKlZwmBlPRVTyc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mH4ZE2RMd4lnRRky54nqLEeAMEN+ykwXu0nCF43Mkdsb6H7KxQTBoK9+gR7JwoL9v
 1nw9Od46tXH5FqN8/+h+LCOnjzj+IQTvZXUGONvamwRvFflqds+TQ/9P47olGMl832
 UR8YVXcNqB7Z//D3pEFc1UpZrfvx4zImqjtWp6EkBqD/LIYbnlcBSkRygZGFo0RnoQ
 l5ETfGl44nPTnZsu/NqTiHKWDdYUyVmT3zRMDKfvQMY4ca4bG1bRRNlggmJn//2hJO
 lz2SKFJPnDgD2JZvmRCDwLDgqjJSXM7rDmCL2Ts57rtqAVDyRS8a+BH5iJu+EEXeQt
 iDbynoypmOuPQ==
Date: Thu, 19 Mar 2026 18:30:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Message-ID: <e9e26679-036f-4cfe-90b7-ec0ce57b5304@sirena.org.uk>
References: <cover.1773885292.git.xiaopei01@kylinos.cn>
 <d8a7d6cd3c33419db98027b9346cf078a6b8b4c8.1773885292.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
In-Reply-To: <d8a7d6cd3c33419db98027b9346cf078a6b8b4c8.1773885292.git.xiaopei01@kylinos.cn>
X-Cookie: Given my druthers, I'd druther not.
Cc: imx@lists.linux.dev, openbmc@lists.ozlabs.org, Frank.Li@nxp.com,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 10/17] spi: slave-mt27xx: Simplify
 clock handling with devm_clk_get_enabled()
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
Content-Type: multipart/mixed; boundary="===============4711837595094426079=="
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
	NEURAL_HAM(-0.00)[-0.768];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: E66AF2D0FDE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--===============4711837595094426079==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="noPRvBXZlo6sTtNk"
Content-Disposition: inline


--noPRvBXZlo6sTtNk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 19, 2026 at 10:04:06AM +0800, Pei Xiao wrote:
> Replace devm_clk_get() followed by clk_prepare_enable() with
> devm_clk_get_enabled() for the "spi" clock. This reduces boilerplate
> code and error handling, as the managed API automatically disables the
> clock when the device is removed or if probe fails.

This driver is dynamically managing the clock so devm_clk_get_enabled()
isn't a good conversion here, there's probably some bugs around runtime
PM being disabled but this'll not help.

--noPRvBXZlo6sTtNk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm8QLUACgkQJNaLcl1U
h9AlXwf+O/j4y9RCkRUATb7XdaYqoh/vDEx4mftt8jW3vU1SX0BXTm7XYbi1yLLO
+EKgiIdTRsnLBX/qp3gOXWkQPLLXRuFjsE0bA3x2yXeTRhQcpAEDUB55LLzEGzmd
79I+MlMlDSNmDhqsOT6/nyFYyP1HDQonwyMDlXc1Ec+qf39VS1Jf0I0jyttCAV2Z
6tRuFSmQiY59a4QR8tXqIzpLB7yqhIqqIRonUA5zuOxdB6S1O9BTh5SCXTOVE6t/
C58WLO0KgipP/jucVZUz4iCb94XRvzrRt+r9nTwbGgLxGPwbPgB12NPH/BbDwGdx
if/9vikYeWfN8GP3BkZJSg6wWr/vHw==
=JXnH
-----END PGP SIGNATURE-----

--noPRvBXZlo6sTtNk--

--===============4711837595094426079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4711837595094426079==--
