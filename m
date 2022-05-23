Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1EA53159F
	for <lists+linux-stm32@lfdr.de>; Mon, 23 May 2022 20:57:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54414C03FDB;
	Mon, 23 May 2022 18:57:15 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E1E6C03FC4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 May 2022 18:57:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BDE2D61167;
 Mon, 23 May 2022 18:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC736C385AA;
 Mon, 23 May 2022 18:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653332232;
 bh=879aFF9uyZobIk3fQF2c9wXlxyMRKkOB5AS/hxoLmCQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OZ0Fz27lmYi9vc0z6gjxUs4iDf1yXVgq8phBOCOq/XLnnMfEpeUbbvfwLGQGlQr0P
 rpTAzxje0YupT/MeWjRDu5yO+t1hNCJFleqS/kkt//Uifpodnl+djn3OIO7BDxGnYF
 PKusv/w5+29LXPpNTkM47qlY6AV4SL4JATD7mmwtgOx5HXOpkiz81PZhtnk7FDfGTA
 eIyhEMm4qCOibkpCj7t9twTy7XWrNWlPD77CFocHB8qI3fgz1QSy6WollY478qtPIk
 tZDshiU96Q4nQy3fo/6aYmk0Z217b3JKakNw8oMEIdXG0w2vWmhDveIt9Qup27f5lX
 UPBQ3tMFudFow==
Date: Mon, 23 May 2022 19:57:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Olivier MOYSAN <olivier.moysan@foss.st.com>
Message-ID: <YovZAf4S0XphBsco@sirena.org.uk>
References: <20220519124235.21100-1-tangbin@cmss.chinamobile.com>
 <69d5cef3-57c0-9bc7-a83b-a85ef1c4cf29@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <69d5cef3-57c0-9bc7-a83b-a85ef1c4cf29@foss.st.com>
X-Cookie: Sales tax applies.
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, Tang Bin <tangbin@cmss.chinamobile.com>,
 tiwai@suse.com, perex@perex.cz, mcoquelin.stm32@gmail.com,
 arnaud.pouliquen@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ASoC: stm32: sai: Use
 of_device_get_match_data() to simplify code
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
Content-Type: multipart/mixed; boundary="===============0254551675973849805=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0254551675973849805==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D+p6NkMZHcHp/pjf"
Content-Disposition: inline


--D+p6NkMZHcHp/pjf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 23, 2022 at 03:28:48PM +0200, Olivier MOYSAN wrote:

> The current patch requires a change in the driver.
> Either changing STM_SAI_x_ID enums, or replacing data by a struct.
> For instance:
> struct stm32_sai_comp_data {
> 	unsigned int id;
> }
> struct stm32_sai_comp_data stm32_sai_comp_data_a = {
> 	.id = STM_SAI_A_ID;
> }
> struct of_device_id stm32_sai_sub_ids[] = {
> 	.data = &stm32_sai_comp_data_a},
> }

Either approach works for me (or a revert for that matter).

--D+p6NkMZHcHp/pjf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKL2QAACgkQJNaLcl1U
h9DuAwf7B4DIzNtZ0XzfzZJZ+4+f3o1jf4181qlohJddMInl8qu8NI3UjsBmG/6V
kbnPnNFNA8Dt0Y4M/1Qgsux2KKSf71TBiU4F0u1sLUWdmfmevcRSb3dDryoOxnhe
y1ztzF3lErZxTRTpbK0fhud5x3CQuOpHVtY0NsOmB3nAtOcebC7Y+NsV7duG68zR
FWHJUlYGhm0+D3EambBVFiT6hYxgMNk239MLMBCSLbpCaZTCj+9q0RCzYmG8F17Y
pzmwNKfe1F9xoWVWBgxz/EA5o2/jebc75dUdjLfz+y0eCGaHEYnugd6/cFSWLeQr
CZYC5j7tJ4vB8J7WFGhYwA+xMvoL8w==
=UNvf
-----END PGP SIGNATURE-----

--D+p6NkMZHcHp/pjf--

--===============0254551675973849805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0254551675973849805==--
