Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1015CBCDD6
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Dec 2025 08:55:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A007EC35E2B;
	Mon, 15 Dec 2025 07:55:28 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B762C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 07:55:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5574360129;
 Mon, 15 Dec 2025 07:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC736C4CEF5;
 Mon, 15 Dec 2025 07:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765785326;
 bh=2qJr895ogd7LPk/YsFAb/JfvV6B7y4KUOhDxybT1U8I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nqsTVgQ85nB3TC8WJu8my6yqsPEwgqdKMCHvbMV9Kk9vZi/KtU34Vp9mDYZkIkGvS
 Rdv6SZ2PGO5hUg31hQqFiZC/huPk/HA0qATQzmYkwMQtpaYjN+4T9amD49GWE5OTJu
 TXoehSJh6ITWFZt9u5OxLmWBwMA/F0j6FVpaB8S2Y49wXHS9cMi5fPtyXLwr3GxNGb
 OGV2YoE22969pwGcn4fcSsxyzrpMTOFqil6WPhBRXBDoPKCsD/eGYt2vQg+B7xmiwv
 3jKkeDKGQB2NhEQIhKXRSDf+rtgAke3aFRxjbovJXfcxMrj+70Iq8wHl5KE7H9xNQx
 0S+Zv6QQWugIw==
Date: Mon, 15 Dec 2025 16:55:19 +0900
From: Sumit Garg <sumit.garg@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Message-ID: <aT--5-bIY8S2PiZa@sumit-X1>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
 <0896270bc530d1e3b7fbcf5f7e168172dcc05d1e.1765472125.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0896270bc530d1e3b7fbcf5f7e168172dcc05d1e.1765472125.git.u.kleine-koenig@baylibre.com>
Cc: Sumit Garg <sumit.garg@oss.qualcomm.com>, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Ard Biesheuvel <ardb@kernel.org>,
 op-tee@lists.trustedfirmware.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 08/17] efi: stmm: Make use of
 module_tee_client_driver()
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Thu, Dec 11, 2025 at 06:15:02PM +0100, Uwe Kleine-K=F6nig wrote:
> Reduce boilerplate by using the newly introduced module_tee_client_driver=
().
> That takes care of assigning the driver's bus, so the explicit assigning
> in this driver can be dropped.
> =

> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> ---
>  drivers/firmware/efi/stmm/tee_stmm_efi.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> =

> diff --git a/drivers/firmware/efi/stmm/tee_stmm_efi.c b/drivers/firmware/=
efi/stmm/tee_stmm_efi.c
> index 65c0fe1ba275..5903811858b6 100644
> --- a/drivers/firmware/efi/stmm/tee_stmm_efi.c
> +++ b/drivers/firmware/efi/stmm/tee_stmm_efi.c
> @@ -584,24 +584,12 @@ static struct tee_client_driver tee_stmm_efi_driver=
 =3D {
>  	.id_table	=3D tee_stmm_efi_id_table,
>  	.driver		=3D {
>  		.name		=3D "tee-stmm-efi",
> -		.bus		=3D &tee_bus_type,
>  		.probe		=3D tee_stmm_efi_probe,
>  		.remove		=3D tee_stmm_efi_remove,
>  	},
>  };
>  =

> -static int __init tee_stmm_efi_mod_init(void)
> -{
> -	return driver_register(&tee_stmm_efi_driver.driver);
> -}
> -
> -static void __exit tee_stmm_efi_mod_exit(void)
> -{
> -	driver_unregister(&tee_stmm_efi_driver.driver);
> -}
> -
> -module_init(tee_stmm_efi_mod_init);
> -module_exit(tee_stmm_efi_mod_exit);
> +module_tee_client_driver(tee_stmm_efi_driver);
>  =

>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Ilias Apalodimas <ilias.apalodimas@linaro.org>");
> -- =

> 2.47.3
> =

> =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
