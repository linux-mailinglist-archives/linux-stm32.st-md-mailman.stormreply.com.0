Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB2872684A
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jun 2023 20:18:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C5EAC6905A;
	Wed,  7 Jun 2023 18:18:31 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE184C65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jun 2023 18:18:29 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2af2db78b38so90742211fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jun 2023 11:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686161909; x=1688753909;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZZ/p0iLnlO9hRGL6F3e88TDXKCDJ3Ln5sjh3/Y6FySE=;
 b=zDSxFnUbIcCjqY5ly3/D4UTfuVwXpVyLZrw7RvR1qPR5BIGmN9aat/Y68xabimzaUY
 3M7aOc5RUo5y8Jorgp9FtZqmAtFvfWhXe2Q9IJjp6+zyUVw1/P4SNfGWSp6YcY2v+Gly
 ymQRaIWlAjqyFEWHYtETDUE9a6OIjVSvcK1cHjd+B1qDDYmCL4R6qUDjysbpZ20d6g2U
 latCjJ4S/Dfy2SaE1Zc3YjHUkDC+TXDYzJSYiBMDCqdCcxY2xYnnWQF0oIdl38qA5YLT
 U6By/Jq4Dny7Zfxr8PSW958EUNkW3uxA3U8YKQ6SGY+lA5T9LjuA7zJ+2qYCsWSHx6cb
 jfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686161909; x=1688753909;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZZ/p0iLnlO9hRGL6F3e88TDXKCDJ3Ln5sjh3/Y6FySE=;
 b=LlBHZjKCEp+PHrqmybvSPmXGoi33Y6VyB2nAXtcOaI1g9nE1mcUxiZoeCz7hvkDvEG
 68KRJ5NkjT9WreVBN1e3uPnzTRjloyiPXUR+XtuQi8yvMjdIBoEEspaq4xpJSiJSeuMG
 vrEa2MdQ6Y6mIGYFwTu8SToMOisKZYHTzNdW0aThSP8vkpeGTzQpJNcDNgSmhEkD71wH
 SpzaZ0FECR52jTFvWLf+iGrIC6ttALvXqXFEB3B+xXjxizDo5NHk+tW0HDpgWxLQp/aD
 /5bHu7gur09XgmfOQa7glqG36fgZNlZbKToWHa/dEQtpYcFhE0Udw1RAS+ynvKLDl87g
 kKEw==
X-Gm-Message-State: AC+VfDzdGg+zQKlIu7BceNk19eqXI6EeEGmHldLqjTKaGWjescD5L7EP
 Y5XSUP7RdnRPcp52K08IOV7VqFAOSuLb34clHoXJYQ==
X-Google-Smtp-Source: ACHHUZ7O/DzwvluFFUAPOsziiJROquhW9PuTOb0JgHUU4X3wehygZbwll0mktA0KGDG2rx48BQYxIaF9Qy7l5t/4fx4=
X-Received: by 2002:a2e:730c:0:b0:2b1:ed29:7c47 with SMTP id
 o12-20020a2e730c000000b002b1ed297c47mr2455880ljc.8.1686161909028; Wed, 07 Jun
 2023 11:18:29 -0700 (PDT)
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
In-Reply-To: <b9b8c1d3-fc8e-df94-d12b-a9e3debf3418@siemens.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Wed, 7 Jun 2023 21:17:52 +0300
Message-ID: <CAC_iWj+cP4RfDNu_n-ZOp7A62W34drLpPszN_hrkqF_aPTLtMg@mail.gmail.com>
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

On Wed, 7 Jun 2023 at 20:14, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 07.06.23 18:59, Ilias Apalodimas wrote:
> > On Wed, 7 Jun 2023 at 19:09, Ilias Apalodimas
> > <ilias.apalodimas@linaro.org> wrote:
> >>
> >> Hi Jan,
> >>
> >> [...]
> >>>>>> No I don't, this will work reliably without the need to remount the efivarfs.
> >>>>>> As you point out you will still have this dependency if you end up
> >>>>>> building them as modules and you manage to mount the efivarfs before
> >>>>>> those get inserted.  Does anyone see a reasonable workaround?
> >>>>>> Deceiving the kernel and making the bootloader set the RT property bit
> >>>>>> to force the filesystem being mounted as rw is a nasty hack that we
> >>>>>> should avoid.  Maybe adding a kernel command line parameter that says
> >>>>>> "Ignore the RTPROP I know what I am doing"?  I don't particularly love
> >>>>>> this either, but it's not unreasonable.
> >>>>>
> >>>>> In the context of https://github.com/OP-TEE/optee_os/issues/6094,
> >>>>> basically this issue mapped on reboot/shutdown, I would really love to
> >>>>> see the unhandy tee-supplicant daemon to be overcome.
> >>>>
> >>>> I have seen this error before and it has been on my todo list. So I
> >>>> have tried to fix it here [1]. Feel free to test it and let me know if
> >>>> you see any further issues.
> >>>>
> >>>> [1] https://lkml.org/lkml/2023/6/7/927
> >>>>
> >>>
> >>> Ah, nice, will test ASAP!
> >>>
> >>> Meanwhile more food: I managed to build a firmware that was missing
> >>> STMM. But the driver loaded, and I got this:
> >>
> >> Thanks for the testing. I'll try to reproduce it locally and get back to you
> >
> > Can you provide a bit more info on how that was triggered btw? I would
> > be helpful to know
> >
> > - OP-TEE version
>
> Today's master, 145953d55.
>
> > - was it compiled as a module or built-in?
>
> Sorry, not sure anymore, switching back and forth right now. I think it
> was built-in.
>
> > - was the supplicant running?
>
> Yes.
>

Ok thanks, that helps.  I guess this also means U-Boot was compiled to
store the variables in a file in the ESP instead of the RPMB right?
Otherwise, I can't see how the device booted in the first place.

Thanks
/Ilias


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
