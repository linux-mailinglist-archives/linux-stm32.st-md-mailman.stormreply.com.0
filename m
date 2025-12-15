Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 092BBCBCDE2
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Dec 2025 08:56:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB4F5C35E2B;
	Mon, 15 Dec 2025 07:56:07 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FCFDC36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 07:56:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3EE2A4165B;
 Mon, 15 Dec 2025 07:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8F90C4CEF5;
 Mon, 15 Dec 2025 07:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765785365;
 bh=MlLssv01cYup7HpjM3F8nb2QRsjJ2hpns8lGvv96LxA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=deQNvTratwzTgo1nYpirqW+raG211ew5e5OBLf6eOcDnhuHXPD80+udhz+WDYVaD3
 uPznMJOefvjSB0YpIX+U8ByiU0aTknd/jqseZKkoy5F9ZGRSR7tkGy+y6ykzzT8FL5
 Y4mxOuEDOvg3ynqQGStVdFuzjvpCqNoWba/+xKiVE95RKHeBLlyRb3rHQwBjo5AZE9
 Hu73u4pMijggb8SRcIj2w963f5s6bs1PoPnE7c3IH/AeWyTj6b/anVxbt/NS5xX/7V
 iMM/XK0ynNtSqkNQoN+JRyUCgOv2LvzBGKeJ3otrWuy2CAjgb17cgQpWXcytkZKIRa
 k00BOxcaaco7g==
Date: Mon, 15 Dec 2025 16:55:57 +0900
From: Sumit Garg <sumit.garg@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Message-ID: <aT-_DbMYPN0p2CrK@sumit-X1>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
 <9e3d9ab0f7987f313237b51911865f0cccae8eb5.1765472125.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9e3d9ab0f7987f313237b51911865f0cccae8eb5.1765472125.git.u.kleine-koenig@baylibre.com>
Cc: Sumit Garg <sumit.garg@oss.qualcomm.com>, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Ard Biesheuvel <ardb@kernel.org>,
 op-tee@lists.trustedfirmware.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 09/17] efi: stmm: Make use of tee bus
	methods
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

On Thu, Dec 11, 2025 at 06:15:03PM +0100, Uwe Kleine-K=F6nig wrote:
> The tee bus got dedicated callbacks for probe and remove.
> Make use of these. This fixes a runtime warning about the driver needing
> to be converted to the bus methods.
> =

> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> ---
>  drivers/firmware/efi/stmm/tee_stmm_efi.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> =

> diff --git a/drivers/firmware/efi/stmm/tee_stmm_efi.c b/drivers/firmware/=
efi/stmm/tee_stmm_efi.c
> index 5903811858b6..7b04dd649629 100644
> --- a/drivers/firmware/efi/stmm/tee_stmm_efi.c
> +++ b/drivers/firmware/efi/stmm/tee_stmm_efi.c
> @@ -520,8 +520,9 @@ static void tee_stmm_restore_efivars_generic_ops(void)
>  	efivars_generic_ops_register();
>  }
>  =

> -static int tee_stmm_efi_probe(struct device *dev)
> +static int tee_stmm_efi_probe(struct tee_client_device *tee_dev)
>  {
> +	struct device *dev =3D &tee_dev->dev;
>  	struct tee_ioctl_open_session_arg sess_arg;
>  	efi_status_t ret;
>  	int rc;
> @@ -571,21 +572,19 @@ static int tee_stmm_efi_probe(struct device *dev)
>  	return 0;
>  }
>  =

> -static int tee_stmm_efi_remove(struct device *dev)
> +static void tee_stmm_efi_remove(struct tee_client_device *dev)
>  {
>  	tee_stmm_restore_efivars_generic_ops();
> -
> -	return 0;
>  }
>  =

>  MODULE_DEVICE_TABLE(tee, tee_stmm_efi_id_table);
>  =

>  static struct tee_client_driver tee_stmm_efi_driver =3D {
>  	.id_table	=3D tee_stmm_efi_id_table,
> +	.probe		=3D tee_stmm_efi_probe,
> +	.remove		=3D tee_stmm_efi_remove,
>  	.driver		=3D {
>  		.name		=3D "tee-stmm-efi",
> -		.probe		=3D tee_stmm_efi_probe,
> -		.remove		=3D tee_stmm_efi_remove,
>  	},
>  };
>  =

> -- =

> 2.47.3
> =

> =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
