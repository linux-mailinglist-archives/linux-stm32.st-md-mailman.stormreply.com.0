Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7647476C613
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Aug 2023 09:04:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22B37C6A5FA;
	Wed,  2 Aug 2023 07:04:47 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F15CAC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Aug 2023 07:04:45 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-4fe216edaf7so736066e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 02 Aug 2023 00:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690959885; x=1691564685;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=l2sfaru8OmVAEwVJ+R5RxlQAJhktlVz8IstV6follvw=;
 b=t0vr7GihQGBrwc1YJ3g1AAGYXD1jGvcpgN6iJPKD5xMRd3D2qdP95+65hD6xjI47pn
 kIWOuYLdSGmHKai2A5knurHHQEORLXj75JtpwB1ZU7vS0VgUmxbknWAUZzsgFblUWzKS
 aT3HYRNov0I3Xr8f/zcWSnH16/BsAG/VDPYFRoR32RQ3fnySxvEHSNKU+QtkRn/zH/fX
 rPieoZuPJ/0ljTNhj5e+j/+RkSTyoU3yUcSDFPpsQZ/DeflKsTO+UNjJq1RcLE1by5FN
 AOIfoco74tbL3wVNC8VSOvlFVPcpWoj3KViiZNjNaHsDEryuy7dEmJ2awpyYFK0tXAJf
 Xj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690959885; x=1691564685;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l2sfaru8OmVAEwVJ+R5RxlQAJhktlVz8IstV6follvw=;
 b=ULDUQhOOXVsAlkC0kjbbkkaTA6h60qtHqRomhFb+GpevetnfLxuMA1ZaypNkKLCqcG
 pa87py7xvTXH4t3z24qSJpM180lWtCYj4OlcFrzqUNfyrY+HrKveJZs/A4eHl++/r5A+
 8ovNr0eYeEhWzEDQnQOzTn3sqcXKjq/mFX+fLpp8SQD3AKbcllGdceEUx31XhPeZiUkF
 PwaBARce8vpu/8V/UQ5UvNNasbDM1Rbvz5f8nC7N+UQXhcQT8HNqYnqWiok4t+YNEfd3
 RqLTn3tFJxoSlZDhh4gEkVesp9PasBHDNYfGhAKnt+BN/22AYpGP9OaVQxnmYy3xYNaN
 XgFA==
X-Gm-Message-State: ABy/qLbQ1xTY6JNQIp9ipFvnUwDd1vKLw+hPaqjBBUKw9jAOF3g9hQr1
 ArDrNBjEfvU/fL8pgPNQ6w0NFHMzYVwMj6IeCEZsdw==
X-Google-Smtp-Source: APBJJlEFs33+TYBvFeAhLwS/9cMe6ZvbN5xrDHcMO8IGg8h5hW0KncTIehYj+kKXFczrThbpIoNGezoyA4hMlAxDpQA=
X-Received: by 2002:a19:2d5b:0:b0:4f9:dac6:2f3d with SMTP id
 t27-20020a192d5b000000b004f9dac62f3dmr1638816lft.13.1690959885075; Wed, 02
 Aug 2023 00:04:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230731065041.1447-1-masahisa.kojima@linaro.org>
 <20230731065041.1447-4-masahisa.kojima@linaro.org>
 <e1e9a9c1-db6f-c2f6-1ac0-fd368f79aec6@canonical.com>
In-Reply-To: <e1e9a9c1-db6f-c2f6-1ac0-fd368f79aec6@canonical.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Wed, 2 Aug 2023 10:04:08 +0300
Message-ID: <CAC_iWjLo=RbFCs5i1jdMXRbx0r-ximrSb5fWFad+98R5r_gpXQ@mail.gmail.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Sumit Garg <sumit.garg@linaro.org>, linux-efi@vger.kernel.org,
 Jan Kiszka <jan.kiszka@siemens.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Jens Wiklander <jens.wiklander@linaro.org>,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Masahisa Kojima <masahisa.kojima@linaro.org>, Ard Biesheuvel <ardb@kernel.org>,
 Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v7 3/5] efi: Add tee-based EFI variable
	driver
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

Hi Heinrich

[...]

> > +static struct tee_client_driver tee_stmm_efi_driver = {
> > +     .id_table       = tee_stmm_efi_id_table,
> > +     .driver         = {
> > +             .name           = "tee-stmm-efi",
> > +             .bus            = &tee_bus_type,
> > +             .probe          = tee_stmm_efi_probe,
> > +             .remove         = tee_stmm_efi_remove,
> > +     },
> > +};
> > +
> > +static int __init tee_stmm_efi_mod_init(void)
> > +{
> > +     return driver_register(&tee_stmm_efi_driver.driver);
>
> Assuming that multiple drivers supplying EFI runtime services may be
> available in future, e.g.
>
> * generic, using EFI runtime function supplied by UEFI firmware
> * TEE-STMM
> * Qualcomm driver as needed for Lenovo X13s
> * ubootefi.var file in ESP
>
> further assuming that multiple driver probe functions succeed:
>
> How do you identify which driver to activate?

This is really a firmware issue.  Whoever assembles that needs to make
sure there's a single entity that should manage the EFI variables.

As far as the current situation
- Qualcomm doesn't run OP-TEE and IIRC uses a DT-entry to enable that code
- OP-TEE will swap the runtime variables calls if StMM is compiled
along and the userspace supplicant is running
- We got no support for ubootefi.var.  If we ever add that the only
clash I can see is u-boot compiled with StMM support and someone
touches the ubootefi.var on ESP.

I'd really prefer to have the feature be autodetected, but if we can't
do that, perhaps we could agree on an EFI config table that the kernel
could read and interpret on what to activate on priority, or
alternatively re-purpose Qualcomms DT entry?

Regards
/Ilias

>
> Best regards
>
> Heinrich
>
> > +}
> > +
> > +static void __exit tee_stmm_efi_mod_exit(void)
> > +{
> > +     driver_unregister(&tee_stmm_efi_driver.driver);
> > +}
> > +
> > +module_init(tee_stmm_efi_mod_init);
> > +module_exit(tee_stmm_efi_mod_exit);
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("Ilias Apalodimas <ilias.apalodimas@linaro.org>");
> > +MODULE_AUTHOR("Masahisa Kojima <masahisa.kojima@linaro.org>");
> > +MODULE_DESCRIPTION("TEE based EFI runtime variable service driver");
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
