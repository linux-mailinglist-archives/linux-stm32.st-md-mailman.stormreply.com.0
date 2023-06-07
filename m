Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B243972657D
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jun 2023 18:10:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F7BBC6A5E7;
	Wed,  7 Jun 2023 16:10:37 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27B74C65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jun 2023 16:10:35 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2b1bdfe51f8so9684761fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jun 2023 09:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686154234; x=1688746234;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mobcZ56EDAdsOHl632zWujZw9/4eeNxhULAqtWzwvkA=;
 b=Kv4edJf7c0QwvwcuX2ywFfhpmOSbNMc7rTrCCS5+0hjLRNCRxnz1zprOMxqDkw4oiq
 v1HJGMU3Dy6TS4VL6FyRm8HBChkmM6tq8fTvzyuK+vYL6SQcPAtxsJLfGTQvM8Wcbd11
 woGLdTbcAsUT+p49vl/Xp+M5Q/sblovZHdu2LHsYq09q+Ws6mfu5eVrejY7w/eJF9cGe
 KUor7Aw5bweVmImTUmgREkFoHFkDZiVMNIatQTxF0KyYb+A+Wd8ELeIRVZvdxwkR8v1M
 jvz1n4EWM8ZTfbDST/XuQU9DTWEZINYGv1GgWAEUpZMTnreu1pjctWFw5IzUBOTIWFsl
 nA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686154234; x=1688746234;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mobcZ56EDAdsOHl632zWujZw9/4eeNxhULAqtWzwvkA=;
 b=RisNP0wVs46qTnNK2UzSkSQnM7RufHaomzsmUTmIBKHnCrkwqgnDoAT+Pdrdk5bTLe
 AAc9jWhSfLBk5SM1b/lapT7Qpu5XBSAsTHEAKTzhBbnSKj+d+Qf88rQqOUuEwvLrt5BB
 /W5gb4iSDFQQ81aPhLOcZweVuYjPpqImfQAE8veJRPM37/aKJIe/9z4D/lbcn3YgvTmW
 dUvkQ42F1xIAvp11kP8WDcMI1oU9AoLDqTSIoKudg/eeI0Od4QFiAL+tZ43y+wW+g42p
 kxpB7VyvqYOZZCXKXDXjVWtQhgKbnGuOXdDNwbZBp/WdFbJAKeAeFt1mZ+kIfF4HltNr
 QCow==
X-Gm-Message-State: AC+VfDw/+RVRa0GQdfffpRUtIcAIocvj8mOBCbjz0RL2HzsrAMlRRGdW
 Y4a75SvzXfk7KwzTfUODcRiqesJ5hjEgRw3PWMZhFQ==
X-Google-Smtp-Source: ACHHUZ72xoObYskF04yUaFiFLbj75B6Hfbfnk9UARypsDOQvzmyprC1ItarwPmQDt1vrGJZTwM30Ap4H9U6dHq2ZMlk=
X-Received: by 2002:a2e:b5d3:0:b0:2a8:bd1d:bfb6 with SMTP id
 g19-20020a2eb5d3000000b002a8bd1dbfb6mr5293641ljn.13.1686154234191; Wed, 07
 Jun 2023 09:10:34 -0700 (PDT)
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
In-Reply-To: <cc6bd203-83ea-c247-0986-7fec6f327ee8@siemens.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Wed, 7 Jun 2023 19:09:58 +0300
Message-ID: <CAC_iWjKZNHJxq4VMFnV7oQngwBBCQveh=s34u1LZ59YUqViPbw@mail.gmail.com>
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
> >>> No I don't, this will work reliably without the need to remount the efivarfs.
> >>> As you point out you will still have this dependency if you end up
> >>> building them as modules and you manage to mount the efivarfs before
> >>> those get inserted.  Does anyone see a reasonable workaround?
> >>> Deceiving the kernel and making the bootloader set the RT property bit
> >>> to force the filesystem being mounted as rw is a nasty hack that we
> >>> should avoid.  Maybe adding a kernel command line parameter that says
> >>> "Ignore the RTPROP I know what I am doing"?  I don't particularly love
> >>> this either, but it's not unreasonable.
> >>
> >> In the context of https://github.com/OP-TEE/optee_os/issues/6094,
> >> basically this issue mapped on reboot/shutdown, I would really love to
> >> see the unhandy tee-supplicant daemon to be overcome.
> >
> > I have seen this error before and it has been on my todo list. So I
> > have tried to fix it here [1]. Feel free to test it and let me know if
> > you see any further issues.
> >
> > [1] https://lkml.org/lkml/2023/6/7/927
> >
>
> Ah, nice, will test ASAP!
>
> Meanwhile more food: I managed to build a firmware that was missing
> STMM. But the driver loaded, and I got this:

Thanks for the testing. I'll try to reproduce it locally and get back to you

/Ilias
>
> root@iot2050-debian:~# efi-updatevar -f PK.auth PK
> [  243.407097] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> [  243.415959] Mem abort info:
> [  243.418801]   ESR = 0x86000004
> [  243.422099]   EC = 0x21: IABT (current EL), IL = 32 bits
> [  243.427529]   SET = 0, FnV = 0
> [  243.430755]   EA = 0, S1PTW = 0
> [  243.433931] user pgtable: 4k pages, 48-bit VAs, pgdp=000000008b74e000
> [  243.440438] [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
> [  243.447274] Internal error: Oops: 86000004 [#1] PREEMPT SMP
> [  243.452835] Modules linked in: ctr ccm mt7601u mac80211 cfg80211 rfkill libarc4 cp210x usbserial pci_endpoint_test ti_k3_r5_remoteproc optee_rng rng_core ti_cal ti_am335x_adc videobuf2_dma_contig kfifo_buf v4l2_fwnode videobuf2_memops videobuf2_v4l2 videobuf2_common irq_pruss_intc at24 fuse ip_tables x_tables ipv6 tpm_ftpm_tee icssg_prueth pru_rproc icss_iep ptp pps_core ti_am335x_tscadc pruss
> [  243.487733] CPU: 0 PID: 875 Comm: efi-updatevar Not tainted 5.10.162-cip24 #1
> [  243.494851] Hardware name: Unknown Unknown Product/Unknown Product, BIOS 2023.07-rc3-00018-g0afdaac6505 07/01/2023
> [  243.505180] pstate: 00000005 (nzcv daif -PAN -UAO -TCO BTYPE=--)
> [  243.511179] pc : 0x0
> [  243.513366] lr : efivar_entry_set_get_size+0xd4/0x1e0
> [  243.518404] sp : ffff8000127a3d00
> [  243.521708] x29: ffff8000127a3d00 x28: 0000000000000f87
> [  243.527012] x27: ffff000005bae400 x26: ffff800011254000
> [  243.532315] x25: ffff000005baf000 x24: ffff800011254aa0
> [  243.537618] x23: ffff8000127a3dab x22: ffff8000111d0268
> [  243.542921] x21: ffff8000127a3db0 x20: 0000000000000000
> [  243.548224] x19: ffff000005bae000 x18: 0000000000000000
> [  243.553527] x17: 0000000000000000 x16: 0000000000000000
> [  243.558829] x15: 0000aaab0876f264 x14: 35cd6a1025d11a20
> [  243.564132] x13: ac6f8dda3945638d x12: fb482642e3487f2d
> [  243.569435] x11: 0000000000000003 x10: ffff00000b792a80
> [  243.574738] x9 : a098e2bf989ff097 x8 : 0000000000000010
> [  243.580041] x7 : ffff800010e35c00 x6 : 4ddcbe2ecfc8fc79
> [  243.585345] x5 : 0000000000000000 x4 : ffff000005baf000
> [  243.590647] x3 : 0000000000000f87 x2 : 0000000000000027
> [  243.595950] x1 : ffff000005bae400 x0 : ffff000005bae000
> [  243.601254] Call trace:
> [  243.603695]  0x0
> [  243.605531]  efivarfs_file_write+0xa4/0x170
> [  243.609709]  vfs_write+0xf0/0x2a4
> [  243.613016]  ksys_write+0x68/0xf4
> [  243.616323]  __arm64_sys_write+0x1c/0x2c
> [  243.620241]  el0_svc_common.constprop.0+0x78/0x1c4
> [  243.625022]  do_el0_svc+0x24/0x8c
> [  243.628331]  el0_svc+0x14/0x20
> [  243.631378]  el0_sync_handler+0xb0/0xb4
> [  243.635206]  el0_sync+0x180/0x1c0
> [  243.638523] Code: bad PC value
> [  243.641573] ---[ end trace 369e4632cb003adc ]---
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
