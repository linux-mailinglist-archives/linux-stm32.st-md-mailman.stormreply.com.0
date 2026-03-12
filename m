Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wznjD07qsmnCQwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 17:31:10 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9B22759EA
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 17:31:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91CA4C90080;
	Thu, 12 Mar 2026 16:31:09 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5F41C8F28C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2026 13:02:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AB13160131;
 Thu, 12 Mar 2026 13:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75297C19424;
 Thu, 12 Mar 2026 13:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773320545;
 bh=6JGSpqVxm5Xk2m9ccSi9/f5mq6saFDm1oVr7MCpFyr4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ijzuRMZaAG0cxBMl7gDHrSzew3fvUz+nBqTiXPU+NIp69zqt1wfJfesyFC/fVZS3+
 fpJQfT7RAlMy6CdCes95jyDBXqJ9b0oy2+/mIhMf1FRNGI13AM1NqmAm86j3/A/552
 5kQ9+UXYzpoZsbEKqCumRSSwg+UQG2vj14Bds3PbgErv5h43Bs/xRG8wi00G2nRngr
 EIIwDGkg6bJW4vTpgIQrRiJEabuw4Tb1FNbFO22KU/UjrislDHxxzWqcPdnp2DTFq5
 sey6Gzv43mUHHEgvpwlNQvy8QnAR90ilRc2oUbTs2Xh0giY+jhiCjSVqkQ2SFWQMPl
 im56x+2su4L1w==
Date: Thu, 12 Mar 2026 13:02:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Message-ID: <8fe16029-2830-44c3-bf32-5aea31f72c62@sirena.org.uk>
References: <cover.1773306858.git.xiaopei01@kylinos.cn>
 <d239cda51bb3dcc84da4a7194a30f3be82422f70.1773306858.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
In-Reply-To: <d239cda51bb3dcc84da4a7194a30f3be82422f70.1773306858.git.xiaopei01@kylinos.cn>
X-Cookie: I feel better about world problems now!
X-Mailman-Approved-At: Thu, 12 Mar 2026 16:31:06 +0000
Cc: imx@lists.linux.dev, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 13/17] spi: stm32: Use helper function
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
Content-Type: multipart/mixed; boundary="===============4711594118873611800=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [1.19 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
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
	NEURAL_HAM(-0.00)[-0.994];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: EB9B22759EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--===============4711594118873611800==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9knHiRnV8mpI+WJ7"
Content-Disposition: inline


--9knHiRnV8mpI+WJ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 12, 2026 at 05:29:05PM +0800, Pei Xiao wrote:

> +	if (!cfg->has_device_mode && device_mode)
> +		return dev_err_probe(&pdev->dev, -EPERM, "spi-slave not
> +				     supported\n");

Similar thing in this driver here.

--9knHiRnV8mpI+WJ7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmyuVsACgkQJNaLcl1U
h9CkwggAg24YBsU71i5Djghu/lHhxeErxA+7HBjAV3TstCzfospFBacxZTrIypgS
mWtgo+SwmXbDn6WiyjDlwpIMTI6PFDzzMn6x6sxwj5/OD1osR2cJ2SYzYSbwFxbQ
uoJphNgSht3FEaDioOtHfdrgiLIkMm+/TYlf1u7+ZzrgI4ueyhtCfs0dN8EfdB+q
pAJUva6gft4S6N3uS4kagfQP8e+IwxXr5fekxL3p7Y9XYpa30rHE56Oc7sbGWGma
+WP0OfGjImbuvKtGxAPKoGBte/kLIrsSHoAFhTLSytjUxs4uuftK3Y5g3d7zq1fh
+TRESnlE15ixsifgA+1umZAfcpBjfA==
=ouCy
-----END PGP SIGNATURE-----

--9knHiRnV8mpI+WJ7--

--===============4711594118873611800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4711594118873611800==--
