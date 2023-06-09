Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C83E5728FFE
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Jun 2023 08:35:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 765D6C65E58;
	Fri,  9 Jun 2023 06:35:23 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F274BC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jun 2023 06:35:21 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-4f4b384c09fso1678156e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Jun 2023 23:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686292521; x=1688884521;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dWLk5AcoN1nlHpTB7u7FTqD5LcrlUnshiREnF2lH0hA=;
 b=SiyMbDstSJGUV5wBE0dpYExQgbaOi08fY3+NU4qvjtxBpyiifJ1mvtdFghvFrwEPAe
 7Blad1GIxr5oIeEa6wGg/T+V4udWMlwAV77766KSvC5H1HGYODPSQiv7Pq+uu/Hcmymv
 DUz/OjpR15fmetfDry4q5tdRTQ0Q7C0UCnYDwiPeqrDLyH53Frf0/YhKxROT4dFk3FaD
 6r/ltgKr0U4ZUdbnqOVKMWxxylbKjOBIcv8jrfjpuRn418OfY8XPonxRyKfaG748TaIl
 5YNcEi/4VpJci09XC9e6ZcSYBKNF0ps8LHeRnAT/oX8y6vmUuaVpOuZuFpSBAexLn4A8
 lF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686292521; x=1688884521;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dWLk5AcoN1nlHpTB7u7FTqD5LcrlUnshiREnF2lH0hA=;
 b=GgbL09JMzAIDvVgDCRaqOwZ+lBHak0507POh5p2n/2nZ1UkIYxiS3bDccqxjV3xgus
 gVwkzezuzZcZuugcQ88wmFGlKUzqJls432L2D6iofJoJJoXgUmwRItjMqBwgNDzXhptC
 3nqBmZlBr4EMMVI9OlO7ESmWh/SteBFFa6PbkNAH59aTJSzLY7As4epuO+ba49QFWDY0
 r1w56CAEErHu/O883vy4zZP7paL0j8dKd5BR/eEDcmUdp8GEoRDs4yNBc9Qs52NS70xg
 EnhEUmWauAU2iIrTQLflcifokNwLfWScrFmojaR7GuhTCyAjd3zwgJri55RG+UeQVOsI
 9azg==
X-Gm-Message-State: AC+VfDzSpJN8Hx+iYA/mrid6BP6LAYerhKc3/3yfILB6xEWeuIW5xfvs
 E59yqeGQB0skNCvwEkogTy/6iIIKzNvULPce8Lcmpw==
X-Google-Smtp-Source: ACHHUZ4p+rws/CPsQ3jx2AFOjwUCvIpAwSfanS70Dysxx2qLm3VsSeemyMFRzsDJsbFonBrMaSd/94BdvUxefkZW2bg=
X-Received: by 2002:a05:6512:457:b0:4dd:9fd8:3a36 with SMTP id
 y23-20020a056512045700b004dd9fd83a36mr222016lfk.1.1686292521182; Thu, 08 Jun
 2023 23:35:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230526010748.1222-1-masahisa.kojima@linaro.org>
 <CAC_iWjJJ5E9Q1or5yTiDynzv_WAYH-g+N24aRdu9rvcsbWqnrg@mail.gmail.com>
 <CAFA6WYNFYB1LiOFB_iwTsdD5PmnDdSbtDSH2J4FVFPx3uik8rQ@mail.gmail.com>
 <CAC_iWj+E7-XK6dCeSn4205K0O3EZCLxCaC+adu-14ST6sdudfA@mail.gmail.com>
 <76da826f-b608-6add-5401-6de818b180e3@siemens.com>
 <CAFA6WYPCDRjFzsUMU=SNzEt88nT7Fcm1eOFL8z4HiQO+=2JeVA@mail.gmail.com>
 <cc6bd203-83ea-c247-0986-7fec6f327ee8@siemens.com>
 <CAC_iWjKZNHJxq4VMFnV7oQngwBBCQveh=s34u1LZ59YUqViPbw@mail.gmail.com>
 <CAC_iWjJMv68yLC606SBhMmBYkR4wVC8SvUcPvNM=RX_qL=9Bvw@mail.gmail.com>
 <b9b8c1d3-fc8e-df94-d12b-a9e3debf3418@siemens.com>
 <CAC_iWj+cP4RfDNu_n-ZOp7A62W34drLpPszN_hrkqF_aPTLtMg@mail.gmail.com>
 <871ece13-7d6e-44d4-3bda-317658202f6f@siemens.com>
 <CAC_iWjKgCJWgKU8tC3Nfn-0CgwGhw89B3JpTgsjkjDDOcWZEdw@mail.gmail.com>
 <CAMj1kXGbXdbDr6DbyuziSFuxMgAimjNnkhqy8C-S5AbxdnixuQ@mail.gmail.com>
 <CAC_iWjJ0uw_p9=6C+U+q8BNQgnDBgbDpcu8s8c80oB25i9y77w@mail.gmail.com>
 <3eb9bf84-4cf0-6cfe-9ad3-f7eef7d775fb@siemens.com>
In-Reply-To: <3eb9bf84-4cf0-6cfe-9ad3-f7eef7d775fb@siemens.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Fri, 9 Jun 2023 09:34:45 +0300
Message-ID: <CAC_iWjLdmmQ4+BVt_mOP5Ht9jDHQqoVV+-ATR-nDrmG37raGjQ@mail.gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Sumit Garg <sumit.garg@linaro.org>, linux-efi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, op-tee@lists.trustedfirmware.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Su,
 Bao Cheng \(RC-CN DF FA R&D\)" <baocheng.su@siemens.com>,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v5 3/3] efi: Add tee-based EFI variable
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

Hi Jan,

[...]

> > --- a/drivers/firmware/efi/vars.c
> > +++ b/drivers/firmware/efi/vars.c
> > @@ -123,7 +123,7 @@ EXPORT_SYMBOL_GPL(efivars_unregister);
> >
> >  bool efivar_supports_writes(void)
> >  {
> > -       return __efivars && __efivars->ops->set_variable;
> > +       return __efivars && __efivars->ops->set_variable != set_variable_int;
> >  }
> >  EXPORT_SYMBOL_GPL(efivar_supports_writes);
> >
> > diff --git a/fs/efivarfs/super.c b/fs/efivarfs/super.c
> > index e028fafa04f3..e40b5c4c5106 100644
> > --- a/fs/efivarfs/super.c
> > +++ b/fs/efivarfs/super.c
> > @@ -242,9 +242,6 @@ static int efivarfs_fill_super(struct super_block
> > *sb, struct fs_context *fc)
> >         sb->s_d_op              = &efivarfs_d_ops;
> >         sb->s_time_gran         = 1;
> >
> > -       if (!efivar_supports_writes())
> > -               sb->s_flags |= SB_RDONLY;
> > -
> >         inode = efivarfs_get_inode(sb, NULL, S_IFDIR | 0755, 0, true);
> >         if (!inode)
> >                 return -ENOMEM;
> > diff --git a/include/linux/efi.h b/include/linux/efi.h
> > index 58d1c271d3b0..ec0ac6ef50a3 100644
> > --- a/include/linux/efi.h
> > +++ b/include/linux/efi.h
> > @@ -1084,6 +1084,10 @@ int efivars_register(struct efivars *efivars,
> >                      const struct efivar_operations *ops);
> >  int efivars_unregister(struct efivars *efivars);
> >
> > +efi_status_t set_variable_int(efi_char16_t *name, efi_guid_t *vendor,
> > +                             u32 attributes, unsigned long data_size,
> > +                             void *data);
> > +
> >  void efivars_generic_ops_register(void);
> >  void efivars_generic_ops_unregister(void);
> >
> > Thanks
> > /Ilias
>
> As just written in my other reply: The root cause is the dependency on
> tee-supplicant daemon. That needs to be resolved, and then also r/w
> mounting will just work.

That's partially true.  If we solve the dependency your problem will
go away only if everything gets compiled as built in.  But if you have
them as modules there's still a chance you mount the efivarfs before
installing all the modules.  In that case, you'll end up with the same
problem no?

That's why I think this patch (or a variation of it) is useful.  It
solves the kernel panic you are seeing if you remount the efivarfs as
RW and It unifies the way the kernel responds to userspace no matter
what the firmware does with its setvariableRT service.

Thanks
/Ilias
>
> Jan
>
> --
> Siemens AG, Technology
> Competence Center Embedded Linux
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
