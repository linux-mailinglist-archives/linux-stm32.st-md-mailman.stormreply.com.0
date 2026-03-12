Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAWwD07qsmnBQwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 17:31:10 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0239A2759EE
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 17:31:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 711E6C9008D;
	Thu, 12 Mar 2026 16:31:09 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98FB6C8F28C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2026 12:56:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4FE4E400CD;
 Thu, 12 Mar 2026 12:56:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29CA1C2BC86;
 Thu, 12 Mar 2026 12:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773320218;
 bh=cJK3mpyT79e9qtgSDmo9xoFCS+6kGW9BW2Ply5mwOwY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hcs9nRxfcpQv9i4VUoc9iF/DJrAf6Id276T6HxF/Ib7iBm1MqhkwzZ4IfPqId91sf
 ZqTwIP18zfG/TDbMGdttgXRsihfieBSg6vZsmvZlImvkzzxOM0cbpwIWcjHdiCXdPv
 Mnl7ZTawiavyFdyTgK0aGIm/S1C8HO1unx7GoIKoxbDPOCjCfAnvIJuHbvOV4y+If3
 c/x8YlSrdrUims11yxA5JjlEFzCFR/MJugKWJ+UGBCgaTYfuLSBJJ9FYMWZ9LXsf4k
 RmzAIPbd77QF9MTrRJ0zFetOCQiNctC2pXXkacBo0ec7YFR0rxvC9WEyHJpYYooXGy
 eB/ColMjmpvyw==
Date: Thu, 12 Mar 2026 12:56:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Message-ID: <62a5a878-f88c-4ecf-a0e6-fe5430de16e1@sirena.org.uk>
References: <cover.1773306858.git.xiaopei01@kylinos.cn>
 <9391f0c3a62e698e66a4b6630ae10b329faf3c11.1773306858.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
In-Reply-To: <9391f0c3a62e698e66a4b6630ae10b329faf3c11.1773306858.git.xiaopei01@kylinos.cn>
X-Cookie: I feel better about world problems now!
X-Mailman-Approved-At: Thu, 12 Mar 2026 16:31:06 +0000
Cc: imx@lists.linux.dev, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 02/17] spi: bcm63xx-hsspi: Use helper
 function devm_clk_get_enabled()
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
Content-Type: multipart/mixed; boundary="===============9027133205576312759=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [1.19 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	MAILLIST(-0.20)[mailman];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xiaopei01@kylinos.cn,m:imx@lists.linux.dev,m:openbmc@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 0239A2759EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--===============9027133205576312759==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yl7jQAg1ktMo1H3W"
Content-Disposition: inline


--yl7jQAg1ktMo1H3W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 12, 2026 at 05:28:54PM +0800, Pei Xiao wrote:

> -		ret = clk_prepare_enable(pll_clk);
> -		if (ret)
> -			goto out_disable_clk;
> +		pll_clk = devm_clk_get_enabled(dev, "pll");
> +		if (IS_ERR(pll_clk))
> +			return dev_err_probe(dev, PTR_ERR(pll_clk), "failed
> +					     enable pll clk\n");

It's nice to print an error message but having a line break in the
middle of a string not so much, put the "failed bit on the same line as
the rest of the error.

--yl7jQAg1ktMo1H3W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmyuBQACgkQJNaLcl1U
h9CEzAf/ecvpiU7/HU5Fp3TOFVTXTv8suK734EdILMdPMYzg2XQ5APg0FjZnaDWK
n27vFo4zq7eUDrvGme1Dzv10k/4Cjpw2DrQx/Ahqa3jpKOCHGmSxpijsGaAXLiJx
+LsKIWIOva86JU+2aUnnG2N/OYF8veII4MzVSaJohLty0G5K0iDpFd0LfzMJe3Me
unarWsC/fxwcVKrf6PagZGMg1lH37wpcAC2In9I7FrtGsoZCLS1JOZrLonKf1P7w
l3S+1h6hvY2cZtV5YrpK99SnkNKC6NSRw80K3GIUzkqT6P7RiaCbldAabB4newkT
u2aU/H0zcagXZXr0ZHcpjfYPMZXG6A==
=BmZA
-----END PGP SIGNATURE-----

--yl7jQAg1ktMo1H3W--

--===============9027133205576312759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============9027133205576312759==--
