Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 664C876C313
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Aug 2023 04:50:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1213AC6A5F2;
	Wed,  2 Aug 2023 02:50:36 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03779C65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Aug 2023 02:50:34 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-26826f93a1fso4379936a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 01 Aug 2023 19:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690944633; x=1691549433;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mEciU1Z6QKvhxwGm0gWIaghrQDHodEupjalaHi7C4ek=;
 b=sw00dMomp4qoKUJKvQWZ8U7BwpH8nuA1hdHmpgpt9RwYi4sKYaf0YyJFCKdkljd+aI
 RdPmRAthF/D/TZQ3L5BRlkqzFpACa4cTugXbIWait5MP+MUqkIDU7qRcCxAAL49KOYgd
 l0zajU2VVCuxEX/6z7FJeMclkxAv5VkLGoZFoWxzPOR4z6LF7ohCRJiQBbrwFNJ8HWfj
 tD2muoJGdEun1lmGp3D3PJt9DrtWVpQ9+6nmaUqv5zkfxYp4JZg8veCTjwspXGah7GXg
 qI3JEcVDTX4erseoCaBxYfj3e/EWM22pKJ6F7EIox+VlsKdSn5/Y13I65vgk0Sx6Bv3A
 KRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690944633; x=1691549433;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mEciU1Z6QKvhxwGm0gWIaghrQDHodEupjalaHi7C4ek=;
 b=SG49A3oOi8DIkXG0G/ElgSaINqS0loIftbGuedgiyH6R+igTkB9CS53vRw1Mm3b0wM
 2ZKTtzlxhrjuAUbSOgWWiq/CLIACadopi5Z6sgETsem1xkZFuD2ROvlUazH7Ac/M3eOF
 X5egBh6c29zx1K4SR4oYNPem3W/zTMkZCHtejpBhChvyZ+2HEvGzR3tXONApQ93PnkKJ
 pfU99J+UGtnmK1uIw9JTPxXZikVfSKrwQgHV2BqlsskwgX1++h6edU6PumoY3o/0Ko0P
 AXSPrbLi2sdHsnv2Z54zVZINlePQZeMXgw6RMvlvXa9vHM2UA83jz8NkqGUJg3cl8KJi
 MoDw==
X-Gm-Message-State: ABy/qLapNaeHAxp+dZJantikcnYaiyq6AsgvAY7gHhXrvNshXnDZsG2k
 yi5mtBWXEzDWAEGHljJa75btF1zVMv4K7/diOC7TvQ==
X-Google-Smtp-Source: APBJJlFE7aed1xYMU4PfC57Dmdh/QB/JAqb36jqJoBarsI5/0tnpl7QlbRPHXlGgVLBoc+KXTKRNlsXgpM9WzYpK66A=
X-Received: by 2002:a17:90a:1b6c:b0:268:3d4:24bb with SMTP id
 q99-20020a17090a1b6c00b0026803d424bbmr14844027pjq.1.1690944633503; Tue, 01
 Aug 2023 19:50:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230731065041.1447-1-masahisa.kojima@linaro.org>
 <20230731065041.1447-4-masahisa.kojima@linaro.org>
 <a6d9857c-fcbd-74d0-bc97-fc86a8c1b820@infradead.org>
In-Reply-To: <a6d9857c-fcbd-74d0-bc97-fc86a8c1b820@infradead.org>
From: Masahisa Kojima <masahisa.kojima@linaro.org>
Date: Wed, 2 Aug 2023 11:50:22 +0900
Message-ID: <CADQ0-X91QS8F1UA4Yzj8skk-q+F_5XaU=jQiew_TBpxV7=X5PA@mail.gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Sumit Garg <sumit.garg@linaro.org>, linux-efi@vger.kernel.org,
 Jan Kiszka <jan.kiszka@siemens.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>, op-tee@lists.trustedfirmware.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
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

On Tue, 1 Aug 2023 at 00:05, Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
>
> On 7/30/23 23:50, Masahisa Kojima wrote:
> > diff --git a/drivers/firmware/efi/Kconfig b/drivers/firmware/efi/Kconfig
> > index 043ca31c114e..aa38089d1e4a 100644
> > --- a/drivers/firmware/efi/Kconfig
> > +++ b/drivers/firmware/efi/Kconfig
> > @@ -287,3 +287,18 @@ config UEFI_CPER_X86
> >       bool
> >       depends on UEFI_CPER && X86
> >       default y
> > +
> > +config TEE_STMM_EFI
> > +     tristate "TEE based EFI runtime variable service driver"
>
>                   TEE-based
OK.

>
> > +     depends on EFI && OPTEE && !EFI_VARS_PSTORE
> > +     help
> > +       Select this config option if TEE is compiled to include StandAloneMM
> > +       as a separate secure partition it has the ability to check and store
>
>                                partition. It has the ability
OK.

Thank you for your review.

Regards,
Masahisa Kojima

>
> > +       EFI variables on an RPMB or any other non-volatile medium used by
> > +       StandAloneMM.
> > +
> > +       Enabling this will change the EFI runtime services from the firmware
> > +       provided functions to TEE calls.
> > +
> > +       To compile this driver as a module, choose M here: the module
> > +       will be called tee_stmm_efi.
>
> --
> ~Randy
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
