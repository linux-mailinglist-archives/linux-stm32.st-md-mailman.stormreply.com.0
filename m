Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8556C23CA03
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Aug 2020 12:49:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43237C36B3A;
	Wed,  5 Aug 2020 10:49:32 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6731CC36B32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Aug 2020 10:49:30 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6197C2173E;
 Wed,  5 Aug 2020 10:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596624568;
 bh=TuD7rFAbWeXGXfO48w+uANMpsm8+3sr+qVMoZIj74Wc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mznLBtYSdMwh7Rxb/WqB+6kygGvOEhGgtGchcIiA5nuPKrsZvrCMIk247BwdWV6GP
 4gm+EBZY8HCesibxRB/KHu2NGYSyhprYQk17/JkgBIHtxRB4ZzmZAQFrwTD1STA0vj
 pBJ+ur/kPc/lYpZhzjRvd241Ozw3HBi+xm+v36yE=
Date: Wed, 5 Aug 2020 11:49:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200805104906.GB5556@sirena.org.uk>
References: <1596610933-32599-1-git-send-email-alain.volmat@st.com>
 <1596610933-32599-3-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1596610933-32599-3-git-send-email-alain.volmat@st.com>
X-Cookie: Fast, cheap, good: pick two.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 02/18] spi: stm32-spi: defer probe for
	reset
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
Content-Type: multipart/mixed; boundary="===============7079566533294118213=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7079566533294118213==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gj572EiMnwbLXET9"
Content-Disposition: inline


--gj572EiMnwbLXET9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 05, 2020 at 09:01:57AM +0200, Alain Volmat wrote:

> -	rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> -	if (!IS_ERR(rst)) {
> +	rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
> +	if (rst) {
> +		if (IS_ERR(rst)) {
> +			ret = PTR_ERR(rst);
> +			if (ret != -EPROBE_DEFER)
> +				dev_err(&pdev->dev, "reset get failed: %d\n",
> +					ret);
> +			goto err_clk_disable;
> +		}

This will not provide any diagnostics when deferring which isn't very
helpful if there's issues.

--gj572EiMnwbLXET9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8qjqEACgkQJNaLcl1U
h9AfFgf+Mr4pGgE8brqH0oVCwN0GR7P/KHKjoEu7C48dCVJ/Lafn8xQ56JOQEt2Y
QtnuobjoB+Aki1qqzYB7AdBhSbcGzn7nn11us2yX9l8mfTEEabJzpjGRVvWEazYq
pQAm0glN9EyuWJXFu8Fhi/VKCAHVJCuQ3oPovefH1zqgO9iF0nVGmq0BFYUR4aGI
tggDXwwrdiEZYcsgvdQjLc3SV+sur+7rgnRyLcZXYyfuWCrQVDbH88TdzpuZAjok
TCMjGsG0hg34iAYLI5+5W0TQyFvGyc9IVrLOC680ApM4xsJAJhDeXugzRqKDpYIv
zvam9f0cn5IjneizIVbdkkKzvfsz1g==
=0sVy
-----END PGP SIGNATURE-----

--gj572EiMnwbLXET9--

--===============7079566533294118213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7079566533294118213==--
