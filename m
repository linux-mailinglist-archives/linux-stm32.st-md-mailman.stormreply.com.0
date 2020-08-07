Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E0023EE84
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Aug 2020 16:02:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9ACE3C36B3A;
	Fri,  7 Aug 2020 14:02:20 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35D51C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Aug 2020 14:02:20 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 20F822224D;
 Fri,  7 Aug 2020 14:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596808938;
 bh=Nq2JecjJJ2Z47G+FHeaADlyOH9UevSA0HjMpAG9yT1c=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=cTdICk+EnK0Kj6gH8d7mfPrKW+er46oVHRtYd7mBBErr1mld4c1pFeiyNl7xR/F1D
 G6FSSuWv+tXQsZx4KXMIHeKTqMVNQHSToiTHjROKhMNGAPp2iNUzdo9GA+kVR+JVMq
 iztElsuG0IBOfqHXKU/guabRk3b3fr6J9ZNzT2BM=
Date: Fri, 7 Aug 2020 15:01:54 +0100
From: Mark Brown <broonie@kernel.org>
To: amelie.delaunay@st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@st.com
Message-ID: <20200807140154.GK5435@sirena.org.uk>
References: <1596610933-32599-1-git-send-email-alain.volmat@st.com>
 <1596610933-32599-3-git-send-email-alain.volmat@st.com>
 <20200805104906.GB5556@sirena.org.uk>
 <20200807134254.GC12946@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
In-Reply-To: <20200807134254.GC12946@gnbcxd0016.gnb.st.com>
X-Cookie: Disposable, use only once.
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Content-Type: multipart/mixed; boundary="===============3286462025014074150=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3286462025014074150==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wRokNccIwvMzawGl"
Content-Disposition: inline


--wRokNccIwvMzawGl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 07, 2020 at 03:42:54PM +0200, Alain Volmat wrote:
> On Wed, Aug 05, 2020 at 11:49:06AM +0100, Mark Brown wrote:
> > On Wed, Aug 05, 2020 at 09:01:57AM +0200, Alain Volmat wrote:

> > > -	rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> > > -	if (!IS_ERR(rst)) {
> > > +	rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
> > > +	if (rst) {
> > > +		if (IS_ERR(rst)) {
> > > +			ret = PTR_ERR(rst);
> > > +			if (ret != -EPROBE_DEFER)
> > > +				dev_err(&pdev->dev, "reset get failed: %d\n",
> > > +					ret);
> > > +			goto err_clk_disable;
> > > +		}

> > This will not provide any diagnostics when deferring which isn't very
> > helpful if there's issues.

> Do you mean that a message when deferring would be needed ?

Yes, if for examaple the reset driver isn't being built then the driver
will defer for ever waiting for it to instantiate and the user will have
to have some method for figuring out what it's waiting for.

> I am worrying that this would lead to having too much noise during boot
> since probe deferring is kinda common. Of course it can also be due to a bad
> configuration of the kernel as well but having looked around I think that
> usually driver are rather silent in case of deferring.

This is not something that should be open coded in your driver.

--wRokNccIwvMzawGl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8tXtEACgkQJNaLcl1U
h9BqXgf9FVvSpPdiOACOZ2KYlaKp6j56CVuoPUPAXXzIt71nFzRazygx93NK217I
gUi15e+61Sq2l+aZwLTsp709lQeMPW7PfwAh/hnpKMDuIgnJ6jczJBJ7d6qW3xWC
xvavGmDtGplrRboW7gKWumFUqbionYJCJHgS1hT0mHbmmabyzPRoyAhfhVGXdMV0
xh7ROAKKV2TmT3UvlcA1f8RDK9BkikFCP40l/waqnNMRli5dqEZ9jIywKb8+Ifo2
ePtCPrbzssFSMy2QxA8YvgWYuAuTY40nE85v7JCJMcCnfvpCIwU4g7NEevdiZsAp
ft3H/L+jZnGX3fLrE3sx1NWJf7Md8Q==
=7mj5
-----END PGP SIGNATURE-----

--wRokNccIwvMzawGl--

--===============3286462025014074150==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3286462025014074150==--
