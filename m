Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B897288CF
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Jun 2023 21:39:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0A72C65E70;
	Thu,  8 Jun 2023 19:39:34 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 852FCC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jun 2023 19:39:33 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-4f6370ddd27so1231252e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Jun 2023 12:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686253172; x=1688845172;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rRPRuQnm3+oJHVqcDvP4QLGvWW7hCToB0kEigLBi5Sw=;
 b=MqtfuwrwoXunFIgZ/c0qiydszJ0AunfmOWkPIYtoDzZbt1FvUCW8J8P8MWgWG+UvvY
 pq3YMyEm8LDbLx+Bdfb/WW4XHbSTlbhNF28HjkBjoN0WRwtccaQKcIG96BHYgXK9vS3J
 r3IzsK66JFIuwHM5y1stPv7X2q9w1t1xEMQmaSbagOeGl0bsTAZnmZstkRwwxRRy8ZEu
 /3Ygc/aPl4s+7MFsViqFVH2k30CsnTwjGVmFpSPFxjk8XHDkpzBFUPA5F+vaeFVA4zsd
 1MJ0pK839LaeX4CB4b6w2F2/AJ6GgaP4Pom0Es/PhcXeTaYN+6OSElfKBo3nK7/jn+Bc
 xMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686253172; x=1688845172;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rRPRuQnm3+oJHVqcDvP4QLGvWW7hCToB0kEigLBi5Sw=;
 b=ab7u6bEoNIDMUsPqRrxx9zGYU+wy9SwX1eNAFlN6MgavCUjgycL4Zbet0OIxJXkmIW
 MtwxU3oh7doQ7/7JwTys6nYdOymksRfyJPdbG/nNI59upgznBKmwNmJWOTG5WuIEIQSI
 Kt60QZkObgPx4HdujelKjhUh2mfcTGVnS6d0kcPYtSor0SOr412eWt+JLOQGpn25uwcB
 Gvn8vjodd/zCfoQG67/HsOkBgRsPX3dXBov7u+LsH9eS3pKKgna++HmSb0uu5dtJoLf+
 c922EqJc+nMng2Rlk1ZfoRXYQ0NUoFRfXsPyBeQmwcCJTLl0e9BRooIji5xBxa1acDQu
 5AWQ==
X-Gm-Message-State: AC+VfDy4x+Nw13sMPL3UQR1aPBQcCan+o2vXsIdMvCPDYTerxWTXgGnd
 QpiJtEWNOkXcrk9Ap5ek94mdinY2vW0mFiQy4VUFaQ==
X-Google-Smtp-Source: ACHHUZ6zEoO5efIpGi6tUy3VNo4VtAQpuLQUlVsYtKFXVwHywcjwevCv3ef4/qmukxsUrd93VbQyvfstDsBkDV+kR/4=
X-Received: by 2002:a2e:a408:0:b0:2b2:52:7eea with SMTP id
 p8-20020a2ea408000000b002b200527eeamr2350364ljn.48.1686253172550; 
 Thu, 08 Jun 2023 12:39:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230526010748.1222-1-masahisa.kojima@linaro.org>
 <20230526010748.1222-4-masahisa.kojima@linaro.org>
 <0d3e0370-eb76-010f-3d30-9acc9b59645c@siemens.com>
 <CAFA6WYPnWJNPvhT2JDkO-qXRUaJoxBGZEvSfhxcRynV7=VSdQA@mail.gmail.com>
 <CAMj1kXFM45PCTU--+CCed6Cq_N5XqDG6tTu6fnQTSCpW2BWA5A@mail.gmail.com>
 <4ff09002-e871-38b9-43ec-227a64bac731@siemens.com>
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
In-Reply-To: <CAMj1kXGbXdbDr6DbyuziSFuxMgAimjNnkhqy8C-S5AbxdnixuQ@mail.gmail.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Thu, 8 Jun 2023 22:38:56 +0300
Message-ID: <CAC_iWjJ0uw_p9=6C+U+q8BNQgnDBgbDpcu8s8c80oB25i9y77w@mail.gmail.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Sumit Garg <sumit.garg@linaro.org>, linux-efi@vger.kernel.org,
 Jan Kiszka <jan.kiszka@siemens.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
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

On Thu, 8 Jun 2023 at 16:52, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Thu, 8 Jun 2023 at 08:22, Ilias Apalodimas
> <ilias.apalodimas@linaro.org> wrote:
> >
> > Hi Jan
> >
> >
> > On Wed, 7 Jun 2023 at 22:46, Jan Kiszka <jan.kiszka@siemens.com> wrote:
> > >
> > > On 07.06.23 20:17, Ilias Apalodimas wrote:
> > > > On Wed, 7 Jun 2023 at 20:14, Jan Kiszka <jan.kiszka@siemens.com> wrote:
> > > >>
> > > >> On 07.06.23 18:59, Ilias Apalodimas wrote:
> > > >>> On Wed, 7 Jun 2023 at 19:09, Ilias Apalodimas
> > > >>> <ilias.apalodimas@linaro.org> wrote:
> > > >>>>
> > > >>>> Hi Jan,
> > > >>>>
> > > >>>> [...]
> > > >>>>>>>> No I don't, this will work reliably without the need to remount the efivarfs.
> > > >>>>>>>> As you point out you will still have this dependency if you end up
> > > >>>>>>>> building them as modules and you manage to mount the efivarfs before
> > > >>>>>>>> those get inserted.  Does anyone see a reasonable workaround?
> > > >>>>>>>> Deceiving the kernel and making the bootloader set the RT property bit
> > > >>>>>>>> to force the filesystem being mounted as rw is a nasty hack that we
> > > >>>>>>>> should avoid.  Maybe adding a kernel command line parameter that says
> > > >>>>>>>> "Ignore the RTPROP I know what I am doing"?  I don't particularly love
> > > >>>>>>>> this either, but it's not unreasonable.
> > > >>>>>>>
> > > >>>>>>> In the context of https://github.com/OP-TEE/optee_os/issues/6094,
> > > >>>>>>> basically this issue mapped on reboot/shutdown, I would really love to
> > > >>>>>>> see the unhandy tee-supplicant daemon to be overcome.
> > > >>>>>>
> > > >>>>>> I have seen this error before and it has been on my todo list. So I
> > > >>>>>> have tried to fix it here [1]. Feel free to test it and let me know if
> > > >>>>>> you see any further issues.
> > > >>>>>>
> > > >>>>>> [1] https://lkml.org/lkml/2023/6/7/927
> > > >>>>>>
> > > >>>>>
> > > >>>>> Ah, nice, will test ASAP!
> > > >>>>>
> > > >>>>> Meanwhile more food: I managed to build a firmware that was missing
> > > >>>>> STMM. But the driver loaded, and I got this:
> > > >>>>
> > > >>>> Thanks for the testing. I'll try to reproduce it locally and get back to you
> > > >>>
> > > >>> Can you provide a bit more info on how that was triggered btw? I would
> > > >>> be helpful to know
> > > >>>
> > > >>> - OP-TEE version
> > > >>
> > > >> Today's master, 145953d55.
> > > >>
> > > >>> - was it compiled as a module or built-in?
> > > >>
> > > >> Sorry, not sure anymore, switching back and forth right now. I think it
> > > >> was built-in.
> > > >>
> > > >>> - was the supplicant running?
> > > >>
> > > >> Yes.
> > > >>
> > > >
> > > > Ok thanks, that helps.  I guess this also means U-Boot was compiled to
> > > > store the variables in a file in the ESP instead of the RPMB right?
> > > > Otherwise, I can't see how the device booted in the first place.
> > >
> > > U-Boot was not configured to perform secure booting in this case. It had
> > > RPMB support enabled, just didn't have to use it.
> >
> > In your initial mail you said you managed to build a firmware without
> > StMM.  If U-boot isn't reconfigured accordingly -- iow skip the EFI
> > variable storage in an RPMB, the EFI subsystem will fail to start.
> >
> > In any case, I don't think the ooops you are seeing is not connected
> > to this patchset.  Looking at the kernel EFI stub we only set the
> > SetVariableRT if the RTPROP table is set accordingly by the firmware.
> > U-Boot never sets the EFI_RT_SUPPORTED_SET_VARIABLE property since it
> > can't support it.  What you are doing is remount the efivarfs as rw
> > and then trying to set a variable, but the callback for it is  NULL.
> > I think you'll be able to replicate the same behavior on the kernel
> > without even inserting the new module.
> >
>
> I have dropped this series from efi/next for now, given that it
> obviously has problems in its current state.
>
> The risk of merging this now and fixing it later is that it may cause
> regressions for early adopters that rely on the behavior we are
> introducing here. Better to get this in shape first.

The ooops Jan was seeing is reproducible in the current code with
$ sudo mount -o remount,rw /sys/firmware/efi/efivars
$ sudo efi-updatevar -f PK.auth PK

So the only real problem we are discussing here is users having to
remount the efivarfs once the module is inserted and the supplicant is
running right?  We could do something along the lines of the patch
below. That would solve both of the problems.

However, the patch changes the way efivarfs is mounted -- it's now
always mounted as RW.  What I am worried about is userspace tools that
rely on this.  I know fwupd uses it and looks for a RO mounted
efivarfs on it's initial checking, but since userspace apps are
already dealing with firmware that exposes SetVariableRT but always
returns EFI_UNSUPPORTED this should be safe ?(famous last words)

Jan can you please apply this and see if it solves your problem?

diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
index 4cc8d0e7d0fd..37accd9e885c 100644
--- a/drivers/firmware/efi/efi.c
+++ b/drivers/firmware/efi/efi.c
@@ -206,6 +206,13 @@ static bool generic_ops_supported(void)
        return true;
 }

+efi_status_t set_variable_int(efi_char16_t *name, efi_guid_t *vendor,
+                             u32 attributes, unsigned long data_size,
+                             void *data)
+{
+       return EFI_UNSUPPORTED;
+}
+
 static int generic_ops_register(void)
 {
        if (!generic_ops_supported())
@@ -219,6 +226,9 @@ static int generic_ops_register(void)
        if (efi_rt_services_supported(EFI_RT_SUPPORTED_SET_VARIABLE)) {
                generic_ops.set_variable = efi.set_variable;
                generic_ops.set_variable_nonblocking =
efi.set_variable_nonblocking;
+       } else {
+               generic_ops.set_variable = set_variable_int;
+               generic_ops.set_variable_nonblocking = set_variable_int;
        }
        return efivars_register(&generic_efivars, &generic_ops);
 }
diff --git a/drivers/firmware/efi/vars.c b/drivers/firmware/efi/vars.c
index e9dc7116daf1..c75eff3f409d 100644
--- a/drivers/firmware/efi/vars.c
+++ b/drivers/firmware/efi/vars.c
@@ -123,7 +123,7 @@ EXPORT_SYMBOL_GPL(efivars_unregister);

 bool efivar_supports_writes(void)
 {
-       return __efivars && __efivars->ops->set_variable;
+       return __efivars && __efivars->ops->set_variable != set_variable_int;
 }
 EXPORT_SYMBOL_GPL(efivar_supports_writes);

diff --git a/fs/efivarfs/super.c b/fs/efivarfs/super.c
index e028fafa04f3..e40b5c4c5106 100644
--- a/fs/efivarfs/super.c
+++ b/fs/efivarfs/super.c
@@ -242,9 +242,6 @@ static int efivarfs_fill_super(struct super_block
*sb, struct fs_context *fc)
        sb->s_d_op              = &efivarfs_d_ops;
        sb->s_time_gran         = 1;

-       if (!efivar_supports_writes())
-               sb->s_flags |= SB_RDONLY;
-
        inode = efivarfs_get_inode(sb, NULL, S_IFDIR | 0755, 0, true);
        if (!inode)
                return -ENOMEM;
diff --git a/include/linux/efi.h b/include/linux/efi.h
index 58d1c271d3b0..ec0ac6ef50a3 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -1084,6 +1084,10 @@ int efivars_register(struct efivars *efivars,
                     const struct efivar_operations *ops);
 int efivars_unregister(struct efivars *efivars);

+efi_status_t set_variable_int(efi_char16_t *name, efi_guid_t *vendor,
+                             u32 attributes, unsigned long data_size,
+                             void *data);
+
 void efivars_generic_ops_register(void);
 void efivars_generic_ops_unregister(void);

apalos@hades:~/work/linux-next>;
apalos@hades:~/work/linux-next>git diff
diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
index 4cc8d0e7d0fd..37accd9e885c 100644
--- a/drivers/firmware/efi/efi.c
+++ b/drivers/firmware/efi/efi.c
@@ -206,6 +206,13 @@ static bool generic_ops_supported(void)
        return true;
 }

+efi_status_t set_variable_int(efi_char16_t *name, efi_guid_t *vendor,
+                             u32 attributes, unsigned long data_size,
+                             void *data)
+{
+       return EFI_UNSUPPORTED;
+}
+
 static int generic_ops_register(void)
 {
        if (!generic_ops_supported())
@@ -219,6 +226,9 @@ static int generic_ops_register(void)
        if (efi_rt_services_supported(EFI_RT_SUPPORTED_SET_VARIABLE)) {
                generic_ops.set_variable = efi.set_variable;
                generic_ops.set_variable_nonblocking =
efi.set_variable_nonblocking;
+       } else {
+               generic_ops.set_variable = set_variable_int;
+               generic_ops.set_variable_nonblocking = set_variable_int;
        }
        return efivars_register(&generic_efivars, &generic_ops);
 }
diff --git a/drivers/firmware/efi/vars.c b/drivers/firmware/efi/vars.c
index e9dc7116daf1..c75eff3f409d 100644
--- a/drivers/firmware/efi/vars.c
+++ b/drivers/firmware/efi/vars.c
@@ -123,7 +123,7 @@ EXPORT_SYMBOL_GPL(efivars_unregister);

 bool efivar_supports_writes(void)
 {
-       return __efivars && __efivars->ops->set_variable;
+       return __efivars && __efivars->ops->set_variable != set_variable_int;
 }
 EXPORT_SYMBOL_GPL(efivar_supports_writes);

diff --git a/fs/efivarfs/super.c b/fs/efivarfs/super.c
index e028fafa04f3..e40b5c4c5106 100644
--- a/fs/efivarfs/super.c
+++ b/fs/efivarfs/super.c
@@ -242,9 +242,6 @@ static int efivarfs_fill_super(struct super_block
*sb, struct fs_context *fc)
        sb->s_d_op              = &efivarfs_d_ops;
        sb->s_time_gran         = 1;

-       if (!efivar_supports_writes())
-               sb->s_flags |= SB_RDONLY;
-
        inode = efivarfs_get_inode(sb, NULL, S_IFDIR | 0755, 0, true);
        if (!inode)
                return -ENOMEM;
diff --git a/include/linux/efi.h b/include/linux/efi.h
index 58d1c271d3b0..ec0ac6ef50a3 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -1084,6 +1084,10 @@ int efivars_register(struct efivars *efivars,
                     const struct efivar_operations *ops);
 int efivars_unregister(struct efivars *efivars);

+efi_status_t set_variable_int(efi_char16_t *name, efi_guid_t *vendor,
+                             u32 attributes, unsigned long data_size,
+                             void *data);
+
 void efivars_generic_ops_register(void);
 void efivars_generic_ops_unregister(void);

Thanks
/Ilias
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
