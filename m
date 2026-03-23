Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMEcMWCXwWkuUAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 20:41:20 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D2A2FC75F
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 20:41:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 386CBC87EC6;
	Mon, 23 Mar 2026 19:41:20 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F9ECC87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Mar 2026 19:41:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 82ECB600AC;
 Mon, 23 Mar 2026 19:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B06B0C4CEF7;
 Mon, 23 Mar 2026 19:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774294877;
 bh=zr8+lYtKw72pHAPt5RM+e4aIZvvehLBMSQxMXfk5GvA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tq+oxJt2YMht2bBZTFfKphF7mn6pccuIjaZ2WdoGqND03PSfnBcBQB1NIgNl3z61/
 UYjZvaYvOqOLA7E7yYH/HWnze2466c1O7qr8kwURq3Awqez0yJLns68n/QUpifX44i
 NGciV5iFQONI6v29a9Le0gLcVfC1bx1VYglGZLg2GWEDvGnLbMY3SkICaK5hKK5XkD
 avgro6JAqTPWd/CiQqwSpmCTGS3nwGJk6qZqYH1oieE5MsIqFiCjJFlwAJAuUrVFLV
 CmAIhZkRT5QaFJoHBEaM4h8+RF8SJRC4ha1+uWRl2AUhuZrju5id589FaWrhR+9y4I
 k2MF7ywBcuyyg==
Date: Mon, 23 Mar 2026 19:41:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Message-ID: <3fcb0dd7-ff17-4d09-b8ad-15f0f1211f42@sirena.org.uk>
References: <cover.1773885292.git.xiaopei01@kylinos.cn>
 <9d0fa929a4158e7f4e9adec21dd351e6cdd2984d.1773885292.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
In-Reply-To: <9d0fa929a4158e7f4e9adec21dd351e6cdd2984d.1773885292.git.xiaopei01@kylinos.cn>
X-Cookie: The only perfect science is hind-sight.
Cc: imx@lists.linux.dev, openbmc@lists.ozlabs.org, Frank.Li@nxp.com,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 05/17] spi: imx: Simplify clock
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
Content-Type: multipart/mixed; boundary="===============2374781751517663100=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [1.19 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	MAILLIST(-0.20)[mailman];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 74D2A2FC75F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--===============2374781751517663100==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/sLNV2LkpKlEA+Pv"
Content-Disposition: inline


--/sLNV2LkpKlEA+Pv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 19, 2026 at 10:04:01AM +0800, Pei Xiao wrote:
> Replace devm_clk_get() followed by clk_prepare_enable() with
> devm_clk_get_enabled() for both "ipg" and "per" clocks. This reduces
> boilerplate code and error handling, as the managed API automatically
> disables the clocks when the device is removed or if probe fails.

This one also uses runtime PM.

--/sLNV2LkpKlEA+Pv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBl1YACgkQJNaLcl1U
h9ALkQf+MCWziHjA3VCeQ6Z0O3ebkwfUwmCcxHPAsV+PSLGPTi2YbR/I9ctOMekg
tXlv5rI17nBcZCGCxil1OEOnjgOC7jRGuVmWaApY5nSEx2X4GZRS3GDna8dUsAJN
xQVd9DSQEfJv1mEe/jXE+eCG6eoVIPoltsgeEEIhZVAtQ1tkszyzlURiBKoteOLU
O4khFyG2m6n7gfyTKD6aRl3n8L8fhLz8Kd+75V58qWN711xIsaoqhyXSfJbucEgX
/CR+2K4QdEZFmVfW5zRzRMlbi6QniSd9lc/ROJWYjvQovVpyckuvH31KgwID8IHx
qLpvFYg7YLU7kgQy/nI7ksShV4LZsg==
=Gpc2
-----END PGP SIGNATURE-----

--/sLNV2LkpKlEA+Pv--

--===============2374781751517663100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2374781751517663100==--
