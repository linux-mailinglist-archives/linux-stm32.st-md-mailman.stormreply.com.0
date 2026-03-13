Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lLzzDYUuuGm3aAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 17:23:33 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F221029D499
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 17:23:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B598C8F28A;
	Mon, 16 Mar 2026 16:23:32 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07310C8F29B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2026 12:55:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F07486012B;
 Fri, 13 Mar 2026 12:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8865AC19421;
 Fri, 13 Mar 2026 12:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773406556;
 bh=Zjx0eOHVxG9gyRtEPqgdCcdKSmIhSdKw+KfUYhGrs8w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LKDNhWqZ9gcLlJdoxr0XynPiyUoe0daj5KnfLIG4JofOAQVLnpfys+tsWuBfR2BP+
 6BJj6yZqfdm3hP9/V+3GjcABC4QPZaLJh+UehwPfjEiiPgBRLJ6mgswvf9usqZ5HyW
 B35LWJTwY7IrxQ1ooNqsQWH1kQI+VgfVN7nqixPusURihdngD8rUG+kVXzeu3RPREe
 HL0ID1LecKPKPy/Ia8QeXmRWoF6BA05QvmnIjDA4KKqSsmWbqzdha1+mMcteN7bbhf
 Hzm7r3p3USkrdmFn6vaEWdLOJOjaqX2Y8UmAlpDxnlihm5RiCIr2WOGSb3NBQJJndm
 MHJylAxBihjJQ==
Date: Fri, 13 Mar 2026 12:55:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Message-ID: <d54214f4-b57a-455e-991e-8700d03eea95@sirena.org.uk>
References: <cover.1773381582.git.xiaopei01@kylinos.cn>
 <d78ba5faa6ed3f5e009b41fc1ee1c2bcdaff882b.1773381582.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
In-Reply-To: <d78ba5faa6ed3f5e009b41fc1ee1c2bcdaff882b.1773381582.git.xiaopei01@kylinos.cn>
X-Cookie: Monitor not included.
X-Mailman-Approved-At: Mon, 16 Mar 2026 16:23:30 +0000
Cc: imx@lists.linux.dev, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 01/17] spi: axiado: Use helper function
 devm_clk_get_enabled()
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
Content-Type: multipart/mixed; boundary="===============7547113345718874239=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [2.19 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	DATE_IN_PAST(1.00)[75];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xiaopei01@kylinos.cn,m:imx@lists.linux.dev,m:openbmc@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.836];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: F221029D499
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--===============7547113345718874239==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1oJhbZS/zdMQ8Obt"
Content-Disposition: inline


--1oJhbZS/zdMQ8Obt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 13, 2026 at 02:08:17PM +0800, Pei Xiao wrote:
> devm_clk_get() and clk_prepare_enable() can now be replaced by
> devm_clk_get_enabled() when driver enables the clocks. Moreover, it is no
> longer necessary to unprepare and disable the clocks explicitly.
> Simplify code.

> -	xspi->pclk = devm_clk_get(&pdev->dev, "pclk");
> +	xspi->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
>  	if (IS_ERR(xspi->pclk)) {

This doesn't update the remove function which while it doesn't free the
clock does disable it.  Please check all the other patches for similar
issues too.

--1oJhbZS/zdMQ8Obt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm0CVcACgkQJNaLcl1U
h9AmBQf+NZmcjADEavTXUkEkwog1B2fWsPoumOErBPGPp/uNMBzFPkj7gtNd5btL
ucVKvAua02jhgHneB/r1FG0shTauJc9wVpal3XmgRnMdqN8XRjML+ZWlF1SI+tpc
v45g2somStcn0QaQOUiGzrwcZddKdUwXCKwidznhryq4fm4Qm0d0jSLg5ayUdLhN
iavAAr+18xMj0UyCJQttiVZ5oR4PdExtioX/4xm4pJhL+H9TPdBC1fouESmEEOG4
krxSjVZLRrIxK8ZTjQ4RCV9ykypPyOl3bheFPN7rtI234NlAhUQu6ujoUgoC4aXU
IoIqyGMXFEt63B8KRgz9kIl/lz6DCw==
=oV3/
-----END PGP SIGNATURE-----

--1oJhbZS/zdMQ8Obt--

--===============7547113345718874239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7547113345718874239==--
