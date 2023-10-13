Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC3A7C7F26
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Oct 2023 09:59:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC227C6A613;
	Fri, 13 Oct 2023 07:59:46 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B235C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Oct 2023 07:59:46 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id
 a1e0cc1a2514c-7b625d782b9so785514241.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Oct 2023 00:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697183985; x=1697788785;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=REWI9aVVUrDk67MWEBoCKN3t/aYt3f7m0oP9Ii5DchY=;
 b=ybPpnBr6D6any9RJuNjWf35RVvnyFkYpLoBDb/nKAlnw2WervNB4exudctbACgA4cT
 NZtXb8+/QfMyhqPB9QYRhXyNLxPsB/yEQcdaYOTR3OkfecU7HM8Id235Cx4rQY+4HREz
 y+CMrszX90SswzlQ8xUZKh3NchSq65fWAnrec00jo5iS9FZ9FHPg1cPcUOKloOe+h5gx
 M45LkqdAkm3Y3NaJhtPfdaBNEO0Gdzq7NRCCQxeBSCHOYybHzICxygLGwoWTmErOsGy/
 h5Wz2I9YCIK76DhcGDcO8ibduRgKRb7F6Y/1v26gLOnau/Ad9VxnROn++cCePDnt2HWs
 irVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697183985; x=1697788785;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=REWI9aVVUrDk67MWEBoCKN3t/aYt3f7m0oP9Ii5DchY=;
 b=wWzDmwF6+3EdAxsG9p+QQJaqvQswaNxglXwx5/KIYQ+zj2sgXDK45SuCwKqT1YTGww
 5AcgSjdTDalDvoMAxmB9V5YwIq20tXhs99MwaN8fn8n/+SGNCjpCZRbkCuaGyuNtd/79
 RpnhHGl7/ZZNX+o17azdH8rDAoybUkV9gHq+wM7DxBi3fvMwGgZhmoK4hnhFoQk4wg1i
 pyspIg6wugfp2TxgNdjZLReqRpNzlnTCtRbjpfjmc/zkOeyyjHcz64RXdFGcZyWQPs7d
 cw9MHoukHX+36jiq9G1lWnU+w9pwfrqugkARwn7MvZHILgZ5FD78WBkjkgvRqdWCRlMl
 Qz+w==
X-Gm-Message-State: AOJu0Yx+qwejHzXuWrv1OYnlA8KSZ11MXlpU2GCytjDd6ZPSv3dCYQ88
 PFU+0oAmTckhzk/9G2yNgHVU4+YIu77NUlF8zXFyYw==
X-Google-Smtp-Source: AGHT+IHhTeTi3Gj505Mx41j5LL+4dFLAR7SjmoTwKizwc56WY8GM2CHR/4kcLzIx9ca66aTrVt4/PRvpPsiimuxIb6M=
X-Received: by 2002:a05:6102:f09:b0:457:79e5:50df with SMTP id
 v9-20020a0561020f0900b0045779e550dfmr16193319vss.33.1697183985048; Fri, 13
 Oct 2023 00:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20231013074540.8980-1-masahisa.kojima@linaro.org>
 <20231013074540.8980-7-masahisa.kojima@linaro.org>
In-Reply-To: <20231013074540.8980-7-masahisa.kojima@linaro.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 13 Oct 2023 13:29:34 +0530
Message-ID: <CAFA6WYMoWn6MgoRp8hD89PwmLeHaO+X1sGB0QOMQDLJtuseP3g@mail.gmail.com>
To: Masahisa Kojima <masahisa.kojima@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, Jan Kiszka <jan.kiszka@siemens.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>, op-tee@lists.trustedfirmware.org,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ard Biesheuvel <ardb@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v9 6/6] tee: optee: restore efivars ops
 when tee-supplicant stops
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Kojima-san,

On Fri, 13 Oct 2023 at 13:18, Masahisa Kojima
<masahisa.kojima@linaro.org> wrote:
>
> When tee-supplicant stops, tee-based EFI variable service
> is no longer available. Restore the efivars generic ops at the
> moment when tee-supplicant stops.

This is a layering violation as evident from below linking error. The
tee-supplicant is internal to how OP-TEE is implemented. I have
already shared a unified way to handle shutdown of supplicant
dependent devices here [1].

[1] https://lore.kernel.org/all/20230728134832.326467-1-sumit.garg@linaro.org/

-Sumit

>
> Linking error occurs if we set CONFIG_OPTEE=y and
> CONFIG_TEE_STMM_EFI=m. Use IS_REACHABLE() guard to call
> tee_stmm_restore_efivars_generic_ops() function.
>
> Signed-off-by: Masahisa Kojima <masahisa.kojima@linaro.org>
> ---
>  drivers/firmware/efi/stmm/tee_stmm_efi.c | 8 +++++++-
>  drivers/tee/optee/supp.c                 | 4 ++++
>  include/linux/efi.h                      | 1 +
>  3 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/efi/stmm/tee_stmm_efi.c b/drivers/firmware/efi/stmm/tee_stmm_efi.c
> index edc165bc1bb0..e804b260edaa 100644
> --- a/drivers/firmware/efi/stmm/tee_stmm_efi.c
> +++ b/drivers/firmware/efi/stmm/tee_stmm_efi.c
> @@ -572,10 +572,16 @@ static int tee_stmm_efi_probe(struct device *dev)
>         return 0;
>  }
>
> -static int tee_stmm_efi_remove(struct device *dev)
> +void tee_stmm_restore_efivars_generic_ops(void)
>  {
>         efivars_unregister(&tee_efivars);
>         efivars_generic_ops_register();
> +}
> +EXPORT_SYMBOL_GPL(tee_stmm_restore_efivars_generic_ops);
> +
> +static int tee_stmm_efi_remove(struct device *dev)
> +{
> +       tee_stmm_restore_efivars_generic_ops();
>
>         return 0;
>  }
> diff --git a/drivers/tee/optee/supp.c b/drivers/tee/optee/supp.c
> index 322a543b8c27..d07d4fc4e72e 100644
> --- a/drivers/tee/optee/supp.c
> +++ b/drivers/tee/optee/supp.c
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2015, Linaro Limited
>   */
>  #include <linux/device.h>
> +#include <linux/efi.h>
>  #include <linux/slab.h>
>  #include <linux/uaccess.h>
>  #include "optee_private.h"
> @@ -58,6 +59,9 @@ void optee_supp_release(struct optee_supp *supp)
>                 complete(&req->c);
>         }
>
> +       if (IS_REACHABLE(CONFIG_TEE_STMM_EFI))
> +               tee_stmm_restore_efivars_generic_ops();
> +
>         supp->ctx = NULL;
>         supp->req_id = -1;
>
> diff --git a/include/linux/efi.h b/include/linux/efi.h
> index 489707b9b0b0..9b60893d6299 100644
> --- a/include/linux/efi.h
> +++ b/include/linux/efi.h
> @@ -1365,5 +1365,6 @@ extern struct blocking_notifier_head efivar_ops_nh;
>
>  void efivars_generic_ops_register(void);
>  void efivars_generic_ops_unregister(void);
> +void tee_stmm_restore_efivars_generic_ops(void);
>
>  #endif /* _LINUX_EFI_H */
> --
> 2.30.2
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
