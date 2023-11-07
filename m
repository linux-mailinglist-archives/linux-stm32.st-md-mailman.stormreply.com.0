Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9497F7E348E
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Nov 2023 05:37:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48A53C6B461;
	Tue,  7 Nov 2023 04:37:08 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76C01C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Nov 2023 04:37:06 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2800f7c8125so4952166a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Nov 2023 20:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699331825; x=1699936625;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WGCkBY5WRLeayy3l30tNZQ/lx6Qo6qQvQDwDMwFQ+1I=;
 b=E3Ztft2bYDGPI+dE1H3/eNGqQaaTbcncODgFqccKr848q0FC2Z5d7vHkOvfDlM37H0
 74hiFZ56QvpaMNb5N25sK/jf/h2BCZmZln9SunQo9c3ql463s4NRLBQOgmNvO/XmbVwJ
 qdRoo/UGtMkR6BiVDig0qXLn28lclYaXFFRpaNjRa8r8DTg58/OLbG9Xxl+RH4+Blxbh
 1ZwOPa1hNEOhH6LTErzxc9D9zL8rFj942oIUqqUNFHkDo329bUYeYYuDwBahhVj3QOOH
 6Sd6vI0iH3+Twxe5lzJvMLQ9xriMfH15CxRez+ZDJuug2LJXUJ/u9MVckK6cUG+RxZmk
 VIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699331825; x=1699936625;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WGCkBY5WRLeayy3l30tNZQ/lx6Qo6qQvQDwDMwFQ+1I=;
 b=bmaNuQm2GMobXnkkoFUgYcyGNfVAIwSysqJDCmFixGGZWkWVGUzThgfiUiyAUWGaJc
 Pdw/lwYme5R8Nr2i6YD6nZ9yEn7KhhBRhCSq/AfM6N3N/YAY6owNbte0+NPGdr91qfHO
 hb2lHjlqaM9RjwCyRgYjk25M4ktpVjs76m3MQw5UYklX41tAHDRkglJWP3xUnz1hsSKb
 qLOLO51ik5OUcvLmHqTNramCVVIZ5YM7P/qfnOQki2Z9ylk8UXvtrZczX068WDGJ1Dnj
 rBh4GlGP7XhTCqq/EzkWjo6ninv0p0lkFrYTRcYf44EXJJQ8qQeJcVsu+bAaQgrVzfq9
 txlw==
X-Gm-Message-State: AOJu0Yz5cLRnELtNzUUR6nyWbf6qpBFgW/7uHODDAbQcjhmkrghaj1ZW
 c7ZLRmpGsWh9HPBLT9QBd4Aczj28Js1XE1KV6cQkUw==
X-Google-Smtp-Source: AGHT+IGg4IOO6iwAswJi2mx9of/jHYKlPfVVgAfZJKHgBHD1eD+l0sMvC0aW2GnKG+Lb8F2pQhN8cJmgPngMWzUV98w=
X-Received: by 2002:a17:90b:1d06:b0:268:808:8e82 with SMTP id
 on6-20020a17090b1d0600b0026808088e82mr2056098pjb.1.1699331824947; Mon, 06 Nov
 2023 20:37:04 -0800 (PST)
MIME-Version: 1.0
References: <20231013074540.8980-1-masahisa.kojima@linaro.org>
 <20231013074540.8980-7-masahisa.kojima@linaro.org>
 <CAFA6WYMoWn6MgoRp8hD89PwmLeHaO+X1sGB0QOMQDLJtuseP3g@mail.gmail.com>
In-Reply-To: <CAFA6WYMoWn6MgoRp8hD89PwmLeHaO+X1sGB0QOMQDLJtuseP3g@mail.gmail.com>
From: Masahisa Kojima <masahisa.kojima@linaro.org>
Date: Tue, 7 Nov 2023 13:36:53 +0900
Message-ID: <CADQ0-X99y_q+3L+dRWr39uV63YX6_9HrNQzFpZW5_SvmDn1vqQ@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
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

Hi Sumit,

On Fri, 13 Oct 2023 at 16:59, Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Hi Kojima-san,
>
> On Fri, 13 Oct 2023 at 13:18, Masahisa Kojima
> <masahisa.kojima@linaro.org> wrote:
> >
> > When tee-supplicant stops, tee-based EFI variable service
> > is no longer available. Restore the efivars generic ops at the
> > moment when tee-supplicant stops.
>
> This is a layering violation as evident from below linking error. The
> tee-supplicant is internal to how OP-TEE is implemented. I have
> already shared a unified way to handle shutdown of supplicant
> dependent devices here [1].

I will drop this patch, and send the next version.

Thanks,
Masahisa Kojima

>
> [1] https://lore.kernel.org/all/20230728134832.326467-1-sumit.garg@linaro.org/
>
> -Sumit
>
> >
> > Linking error occurs if we set CONFIG_OPTEE=y and
> > CONFIG_TEE_STMM_EFI=m. Use IS_REACHABLE() guard to call
> > tee_stmm_restore_efivars_generic_ops() function.
> >
> > Signed-off-by: Masahisa Kojima <masahisa.kojima@linaro.org>
> > ---
> >  drivers/firmware/efi/stmm/tee_stmm_efi.c | 8 +++++++-
> >  drivers/tee/optee/supp.c                 | 4 ++++
> >  include/linux/efi.h                      | 1 +
> >  3 files changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/firmware/efi/stmm/tee_stmm_efi.c b/drivers/firmware/efi/stmm/tee_stmm_efi.c
> > index edc165bc1bb0..e804b260edaa 100644
> > --- a/drivers/firmware/efi/stmm/tee_stmm_efi.c
> > +++ b/drivers/firmware/efi/stmm/tee_stmm_efi.c
> > @@ -572,10 +572,16 @@ static int tee_stmm_efi_probe(struct device *dev)
> >         return 0;
> >  }
> >
> > -static int tee_stmm_efi_remove(struct device *dev)
> > +void tee_stmm_restore_efivars_generic_ops(void)
> >  {
> >         efivars_unregister(&tee_efivars);
> >         efivars_generic_ops_register();
> > +}
> > +EXPORT_SYMBOL_GPL(tee_stmm_restore_efivars_generic_ops);
> > +
> > +static int tee_stmm_efi_remove(struct device *dev)
> > +{
> > +       tee_stmm_restore_efivars_generic_ops();
> >
> >         return 0;
> >  }
> > diff --git a/drivers/tee/optee/supp.c b/drivers/tee/optee/supp.c
> > index 322a543b8c27..d07d4fc4e72e 100644
> > --- a/drivers/tee/optee/supp.c
> > +++ b/drivers/tee/optee/supp.c
> > @@ -3,6 +3,7 @@
> >   * Copyright (c) 2015, Linaro Limited
> >   */
> >  #include <linux/device.h>
> > +#include <linux/efi.h>
> >  #include <linux/slab.h>
> >  #include <linux/uaccess.h>
> >  #include "optee_private.h"
> > @@ -58,6 +59,9 @@ void optee_supp_release(struct optee_supp *supp)
> >                 complete(&req->c);
> >         }
> >
> > +       if (IS_REACHABLE(CONFIG_TEE_STMM_EFI))
> > +               tee_stmm_restore_efivars_generic_ops();
> > +
> >         supp->ctx = NULL;
> >         supp->req_id = -1;
> >
> > diff --git a/include/linux/efi.h b/include/linux/efi.h
> > index 489707b9b0b0..9b60893d6299 100644
> > --- a/include/linux/efi.h
> > +++ b/include/linux/efi.h
> > @@ -1365,5 +1365,6 @@ extern struct blocking_notifier_head efivar_ops_nh;
> >
> >  void efivars_generic_ops_register(void);
> >  void efivars_generic_ops_unregister(void);
> > +void tee_stmm_restore_efivars_generic_ops(void);
> >
> >  #endif /* _LINUX_EFI_H */
> > --
> > 2.30.2
> >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
