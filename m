Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLsYKmD582lo9QEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 01 May 2026 02:52:48 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 356314A960A
	for <lists+linux-stm32@lfdr.de>; Fri, 01 May 2026 02:52:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5DF4C87ED3;
	Fri,  1 May 2026 00:52:47 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E23C9C3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 May 2026 00:52:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C3D3760142;
 Fri,  1 May 2026 00:52:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D5CC2BCB3;
 Fri,  1 May 2026 00:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777596765;
 bh=EOOhMWkdwXNe+cgIqAYVnr7cBZIq3XZI0KMFnUqE0CQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ib244CtwJUUvN8KWPb5lMj+V3cAt3pp8wwvKUMag+XKg5JDHMOtEYwLvQIdp6xLw/
 SuAEUvevA4tChXEj+76ZFA/OYARODzVt5oLc08jwP7CWYVINfkFlfn/5fQF1dXOICq
 XH3ZGXBE5C1EzeAAbLsIqR6XNrOdIiqTiYDHBPynlH4tO5XIsERzAYehSDAckiWfyH
 Mc1EvcAPlvHoibwjKqQ5VSbMK5PyhZS9FjazSC5rqaUXH9aIm4X+O31INX1YSot854
 hUO/IAoikN02Dv1EcKbWhUZ0WyGsG4SDiLRwIjHIpSkBbLLWtyDxab80brTW95TtSG
 mOibVax7L7wlA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 1290F1AC5860; Fri, 01 May 2026 01:52:43 +0100 (BST)
Date: Fri, 1 May 2026 09:52:42 +0900
From: Mark Brown <broonie@kernel.org>
To: Hans Zhang <18255117159@163.com>
Message-ID: <afP5Wlzt-dTvnzii@sirena.co.uk>
References: <20260430155456.36998-1-18255117159@163.com>
 <20260430155456.36998-4-18255117159@163.com>
MIME-Version: 1.0
In-Reply-To: <20260430155456.36998-4-18255117159@163.com>
X-Cookie: 667:
Cc: linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 mcoquelin.stm32@gmail.com, lhjeff911@gmail.com, imx@lists.linux.dev,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, haibo.chen@nxp.com, linux-spi@vger.kernel.org,
 mhiramat@kernel.org, xianwei.zhao@amlogic.com,
 linux-amlogic@lists.infradead.org, han.xu@nxp.com, sunny.luo@amlogic.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 jbrunet@baylibre.com
Subject: Re: [Linux-stm32] [PATCH 03/10] spi: cadence-xspi: Use
	FIELD_MODIFY()
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
Content-Type: multipart/mixed; boundary="===============4767136718698529659=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: 356314A960A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.69 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:18255117159@163.com,m:linux-arm-kernel@lists.infradead.org,m:neil.armstrong@linaro.org,m:mcoquelin.stm32@gmail.com,m:lhjeff911@gmail.com,m:imx@lists.linux.dev,m:martin.blumenstingl@googlemail.com,m:khilman@baylibre.com,m:hayashi.kunihiko@socionext.com,m:haibo.chen@nxp.com,m:linux-spi@vger.kernel.org,m:mhiramat@kernel.org,m:xianwei.zhao@amlogic.com,m:linux-amlogic@lists.infradead.org,m:han.xu@nxp.com,m:sunny.luo@amlogic.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:jbrunet@baylibre.com,m:mcoquelinstm32@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[lists.infradead.org,linaro.org,gmail.com,lists.linux.dev,googlemail.com,baylibre.com,socionext.com,nxp.com,vger.kernel.org,kernel.org,amlogic.com,st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[163.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.co.uk:mid,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]


--===============4767136718698529659==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JFs5EhvgRVT+vvgO"
Content-Disposition: inline


--JFs5EhvgRVT+vvgO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 30, 2026 at 11:54:49PM +0800, Hans Zhang wrote:
>  		writel(clk_reg,
>  		       cdns_xspi->auxbase + MRVL_XSPI_CLK_CTRL_AUX_REG);
>  		clk_reg = FIELD_PREP(MRVL_XSPI_CLK_DIV, i);
> -		clk_reg &= ~MRVL_XSPI_CLK_DIV;
> -		clk_reg |= FIELD_PREP(MRVL_XSPI_CLK_DIV, i);
> +		FIELD_MODIFY(MRVL_XSPI_CLK_DIV, &clk_reg, i);
>  		clk_reg |= MRVL_XSPI_CLK_ENABLE;
>  		clk_reg |= MRVL_XSPI_IRQ_ENABLE;
>  		update_clk = true;

The existing code is a bit weird here, we could just delete the
modification entirely AFAICT.

--JFs5EhvgRVT+vvgO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnz+VoACgkQJNaLcl1U
h9DEnQf/VAnw03Dnq8NVXT8eelt6wkRf2zJKsMEPrCCYPKzeWXivCbUy9eykDun+
0JMG0iLP/LpWGz4qpUWkbR2Kz8aA0BehHcrEQ56Du8lygGmGeFUNtTcr3KL8API3
DEQrtR2rOyvQ5gxfbyX9NN12jKoVi+SQ6E/W2FFwRY9o2Akuj+NK2rRSYcSmiIBO
b5oZbhABu4P6LiXAtHZ1LK+Yf7NhvgSiFch1chrm/dk225txoJfTFn5BSn14cC+8
FWtjbKtDpupiD1C94wsXHfoUDT2hOtJqxnQLE63hNAKIMqkU3raORVOemHKqcB+M
0qK9zAkxfGtf5GZdQ3rD7/lt2v0bCg==
=Ca6l
-----END PGP SIGNATURE-----

--JFs5EhvgRVT+vvgO--

--===============4767136718698529659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4767136718698529659==--
