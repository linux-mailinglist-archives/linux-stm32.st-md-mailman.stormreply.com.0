Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADED2AC8D5
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Nov 2020 23:47:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D18BC3FAE2;
	Mon,  9 Nov 2020 22:47:44 +0000 (UTC)
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3B82C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Nov 2020 22:47:41 +0000 (UTC)
Date: Mon, 09 Nov 2020 22:47:27 +0000
From: Paul Cercueil <paul@crapouillou.net>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Message-Id: <3NWJJQ.S916PME9WPQT@crapouillou.net>
In-Reply-To: <20201107233630.9728-2-rikard.falkeborn@gmail.com>
References: <20201107233630.9728-1-rikard.falkeborn@gmail.com>
 <20201107233630.9728-2-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] remoteproc: ingenic: Constify
	ingenic_rproc_ops
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

Le dim. 8 nov. 2020 =E0 0:36, Rikard Falkeborn =

<rikard.falkeborn@gmail.com> a =E9crit :
> The only usage of ingenic_rproc_ops is to pass its address to
> devm_rproc_alloc(), which accepts a const pointer. Make it const to
> allow the compiler to put it in read-only memory.
> =

> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  drivers/remoteproc/ingenic_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/remoteproc/ingenic_rproc.c =

> b/drivers/remoteproc/ingenic_rproc.c
> index 1c2b21a5d178..26e19e6143b7 100644
> --- a/drivers/remoteproc/ingenic_rproc.c
> +++ b/drivers/remoteproc/ingenic_rproc.c
> @@ -135,7 +135,7 @@ static void *ingenic_rproc_da_to_va(struct rproc =

> *rproc, u64 da, size_t len)
>  	return (__force void *)va;
>  }
> =

> -static struct rproc_ops ingenic_rproc_ops =3D {
> +static const struct rproc_ops ingenic_rproc_ops =3D {
>  	.prepare =3D ingenic_rproc_prepare,
>  	.unprepare =3D ingenic_rproc_unprepare,
>  	.start =3D ingenic_rproc_start,
> --
> 2.29.2
> =



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
