Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFcrDO2XwWkuUAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 20:43:41 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C41CB2FC846
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 20:43:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74E4EC87EC6;
	Mon, 23 Mar 2026 19:43:40 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C553C87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Mar 2026 19:43:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E3D45437BB;
 Mon, 23 Mar 2026 19:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78CC5C4CEF7;
 Mon, 23 Mar 2026 19:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774295017;
 bh=v5WODaG9Gq7F9JZNXjpS+WX7LEMWIQj7OgYxY6O8wm0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PwxvSdbYYgbtTaGBexrLs+CBdI6CQ35Ad/j92i3+aRR27slb6tT7mjmS18WnawZKS
 qjPE5+FMQ7SmONBT3pbXlxEnWBTjIfNKVpfb/l301sTXf8mwulN4p+us/dq6jpk5i9
 zmFUX6viu3udkvBFk/DaAGrGZMfx4FdD1FTlGFI4EV5VGNXViAD9gJKwkJagHO/n7n
 bH5xw/iUaQ212ONZ8kV3zMeok1EQaGArnSybU57FB0e9IjaWExq9bg37mVyFciJqad
 lAe3YrFq/pvXpgB4v/Zo3VE8zAVgc4zbd/kAbUmX5YFWXCvU1Ml/2o0MMhVnax+MnN
 nUU9y+OpLYjbw==
Date: Mon, 23 Mar 2026 19:43:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Message-ID: <a4972031-e0e0-4c0d-90cf-c283010980b4@sirena.org.uk>
References: <cover.1773885292.git.xiaopei01@kylinos.cn>
 <863ab1ddc4f3b9a25c0bf79e1581b65359cef6c3.1773885292.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
In-Reply-To: <863ab1ddc4f3b9a25c0bf79e1581b65359cef6c3.1773885292.git.xiaopei01@kylinos.cn>
X-Cookie: The only perfect science is hind-sight.
Cc: imx@lists.linux.dev, openbmc@lists.ozlabs.org, Frank.Li@nxp.com,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 08/17] spi: rockchip-sfc: Simplify
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
Content-Type: multipart/mixed; boundary="===============9170559705099320608=="
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: C41CB2FC846
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--===============9170559705099320608==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T+H6iatU6AC0B8Qc"
Content-Disposition: inline


--T+H6iatU6AC0B8Qc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 19, 2026 at 10:04:04AM +0800, Pei Xiao wrote:
> Replace devm_clk_get() followed by clk_prepare_enable() with
> devm_clk_get_enabled() for both the interface clock "clk_sfc" and the
> AHB clock "hclk_sfc". This reduces boilerplate code and error handling,
> as the managed API automatically disables the clocks when the device is
> removed or if probe fails.

More runtime PM clocks.

--T+H6iatU6AC0B8Qc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBl+QACgkQJNaLcl1U
h9D4ZQf/acnRu0a4w6FJL3v12O42Uq6Atol8X/9TvvfEv8vy8qQx4u7LQH0wAamf
h5RLhWnd6nnJ0UEgty8mI544lxzYw4RRV37oEWa1YlNgWMLJk+5DOgR6Ez20DfdU
vVcwkiwN1T30Yx8oaZOvLVLtuKv3X31uzjSJLs4xVCFbvAJSqjhhnXrhBd+NqGgD
oLCC0q7KFUnaYaKyIBrZNm01jtXo6NntwK8dLHecJOuXmSAXpCnAM17uiYSQCuL9
d8SJVRLy9Dbwoz+RSHJJh97TvT0aW9by4xQABRV37vXmaj48N2TXJXgJj5xx+teB
Qqk5+3b+2LydR9XyiqHGRXrhmHGHQA==
=dt67
-----END PGP SIGNATURE-----

--T+H6iatU6AC0B8Qc--

--===============9170559705099320608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============9170559705099320608==--
