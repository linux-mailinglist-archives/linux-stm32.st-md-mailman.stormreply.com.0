Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AACCB8486BC
	for <lists+linux-stm32@lfdr.de>; Sat,  3 Feb 2024 15:40:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DC3DC6DD98;
	Sat,  3 Feb 2024 14:40:29 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA907C6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  3 Feb 2024 14:40:27 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a26ed1e05c7so433500666b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 03 Feb 2024 06:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706971227; x=1707576027;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DCI9UWtJp+usKJeSEd4tLIOfQSn4XLwL0p08Rua3AYo=;
 b=gSEIk0gsjWB2m/MiHAaCyONkLbyEsSQ6wsHEoTWSUYWK+0KrXb5pLlN/hUJ8neAvye
 0jTVlgMEBGggELR9QwF0YGjlFeGO+hJpXcdu6RGgcx4IAaOw5sFKTtByYogeAeqExxFB
 dVFfo8y3Q0OcUiItFoIgxuQATsbwGBZs1MoUIttlmZvhYrvLDmeCElNOMM2/kXJLrTYn
 6VXhXTmkwVrROAT851T/rCmZtjMfqtMyF4kE56GxgBtV5W8bK+DUGZn5K6MLiyecHK6o
 iA1jFvVGdvvJ+mxnz7jiikgT0KPnB1d8A9IXlstZRQRN/pthsgG1jeeYUK2CPIL0xTlx
 lItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706971227; x=1707576027;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DCI9UWtJp+usKJeSEd4tLIOfQSn4XLwL0p08Rua3AYo=;
 b=U4ZToZVNK0qSPVULfplad/X85a+YE4W9lMWvtNhHZ4lvPuyov5DjFKF4RzbDvWlltS
 zzXgTB1ZYDIG13rv/SYL/N6jsfbPByg7UujU+BOuPx6XAs5fUR9U9R5BKvRySAF61v17
 dWwnYB0PM6pxeU9TvtAr7TkrU4bhcSkgrzK3ZJmdL5zOh040rOKjQwCLQXAUCwyAoMiR
 ytoFszWVr5Olc7er3ZDsl4w4HQEEnBnQrkkHn9kOJ0rgETPH9eFybPTojmX4gi8QGoiU
 bQyTvt7L252CDprdgZgN2kU52OvIei5vlJQSkXGCItMIn8R42oR4/dXA7rZ6W+aQCqLO
 XlCA==
X-Gm-Message-State: AOJu0Yw1+fQroc1tnuk46lBVp6mzN02dAad+1ZNa4A1CuV7u74BhavjD
 YklnKf8c3WXiwEQy6QE983PPhEHo84J44M0skyR9UZVkvmFJsUBS
X-Google-Smtp-Source: AGHT+IEfOssooYznIaR2j16FsW2he+A402wuOVjq8GOI1Sazb6h644eVgsUtw+TPqcVbkCVfbhPGQA==
X-Received: by 2002:a17:906:354a:b0:a31:13ce:d64f with SMTP id
 s10-20020a170906354a00b00a3113ced64fmr5985082eja.55.1706971226841; 
 Sat, 03 Feb 2024 06:40:26 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCW7p53u42FKalV0Q8kOQDCNk7cTeLg/1cDc8Cl36yTh9GgvqcIr7fJ1NjvQ9ua0CqgYnxR364aNQxpFyOm6CIQ0gb9ekMkZLMnjtffuGBFh7/SwbH8A2V4Cto4Z9t7SqkmhNtnZmDkok1c2qd1RfFQDOV150RgiWxpx8rW8jY5HLX59sjRzhCf0WZbk8j3VHdC4Sk5wajn+aECyMMWAsCXsV0KXGT9nWKLpndPx21SX0bgrfqsTNDIPc/iWNxlXMe/DNTkkaJcZjDrROOhF8GBSmYltznkX/eFhz02CpOi/clBOZqQ2m7tq4HA+58OgX9RRJh+QxZkjkG1leXs9iMcJoOKpvzfAKZxDkrG3th72183EyPHJBq6CNncj849pVaX5+wJ93GXZQcSm5ct9Dek5rZgTh6Ss5o1FzRDuRwoi3fovr7rKMbJKbB327QFLO2b/nbpZPWDmDzvujZLA5i4ncjCgM6tUbMGXZl+68sXucayOr2hT4jmrSx53tV0CYc6As03CrbYkckRd85cXsKMzDz+dAJELylyLaMfykRuH8inh+RjSqtvUsHgRfElsOAJb14rOVfNvZsO0dGP79zCSO3eJlpMEb8wd1VKU3N6H4PiYLsoSqmFiRXTWbU+BuJlXrn6MnPpb5AI5MkVhkEx2ncNcJTGLK32JV16SYsg6cHrjz7ZucNA/U8hIVvKytd/DSE0QRQhZKktMiJbC2gVMDDLn0pVu1FPtuswFLZWasa+yhutDIWOpmg==
Received: from krava ([83.240.62.96]) by smtp.gmail.com with ESMTPSA id
 ty5-20020a170907c70500b00a3628e91119sm2039491ejc.180.2024.02.03.06.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 06:40:26 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Sat, 3 Feb 2024 15:40:24 +0100
To: Manu Bretelle <chantr4@gmail.com>, vmalik@redhat.com
Message-ID: <Zb5QWCw3Tg26_MDa@krava>
References: <cover.1706491398.git.dxu@dxuuu.xyz>
 <Zb12EZt0BAKOPBk/@surya>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zb12EZt0BAKOPBk/@surya>
Cc: fsverity@lists.linux.dev, alan.maguire@oracle.com,
 linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, alexei.starovoitov@gmail.com,
 netfilter-devel@vger.kernel.org, memxor@gmail.com, coreteam@netfilter.org,
 Daniel Xu <dxu@dxuuu.xyz>, quentin@isovalent.com,
 linux-kselftest@vger.kernel.org, linux-input@vger.kernel.org,
 cgroups@vger.kernel.org, bpf@vger.kernel.org, olsajiri@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v4 0/3] Annotate kfuncs in
	.BTF_ids section
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

On Fri, Feb 02, 2024 at 03:09:05PM -0800, Manu Bretelle wrote:
> On Sun, Jan 28, 2024 at 06:24:05PM -0700, Daniel Xu wrote:
> > === Description ===
> > 
> > This is a bpf-treewide change that annotates all kfuncs as such inside
> > .BTF_ids. This annotation eventually allows us to automatically generate
> > kfunc prototypes from bpftool.
> > 
> > We store this metadata inside a yet-unused flags field inside struct
> > btf_id_set8 (thanks Kumar!). pahole will be taught where to look.
> > 
> > More details about the full chain of events are available in commit 3's
> > description.
> > 
> > The accompanying pahole and bpftool changes can be viewed
> > here on these "frozen" branches [0][1].
> > 
> > [0]: https://github.com/danobi/pahole/tree/kfunc_btf-v3-mailed
> > [1]: https://github.com/danobi/linux/tree/kfunc_bpftool-mailed
> 
> 
> I hit a similar issue to [0] on master
> 943b043aeecc ("selftests/bpf: Fix bench runner SIGSEGV")
>  when cross-compiling on x86_64 (LE) to s390x (BE).
> I do have CONFIG_DEBUG_INFO_BTF enable and the issue would not trigger if
> I disabled CONFIG_DEBUG_INFO_BTF (and with the fix mentioned in [0]).
> 
> What seems to happen is that `tools/resolve_btfids` is ran in the context of the
> host endianess and if I printk before the WARN_ON:
> diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
> index ef380e546952..a9ed7a1a4936 100644
>   --- a/kernel/bpf/btf.c
>   +++ b/kernel/bpf/btf.c
>   @@ -8128,6 +8128,7 @@ int register_btf_kfunc_id_set(enum bpf_prog_type prog_type,
>            * WARN() for initcall registrations that do not check errors.
>            */
>           if (!(kset->set->flags & BTF_SET8_KFUNCS)) {
>   +        printk("Flag 0x%08X, expected 0x%08X\n", kset->set->flags, BTF_SET8_KFUNCS);
>                   WARN_ON(!kset->owner);
>                   return -EINVAL;
>           }
> 
> the boot logs would show:
>   Flag 0x01000000, expected 0x00000001
> 
> The issue did not happen prior to
> 6f3189f38a3e ("bpf: treewide: Annotate BPF kfuncs in BTF")
> has only 0 was written before.
> 
> It seems [1] will be addressing cross-compilation, but it did not fix it as is
> by just applying on top of master, so probably some of the changes will also need
> to be ported to `tools/include/linux/btf_ids.h`?

the fix in [1] is fixing flags in set8's pairs, but not the global flags

it looks like Viktor's fix should now also swap that as well? like in the
change below on top of Viktor's changes (untested)

jirka


---
diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btfids/main.c
index d01603ef6283..c44d57fec390 100644
--- a/tools/bpf/resolve_btfids/main.c
+++ b/tools/bpf/resolve_btfids/main.c
@@ -706,6 +706,8 @@ static int sets_patch(struct object *obj)
 			 * correctly translate everything.
 			 */
 			if (need_bswap) {
+				set8->flags = bswap_32(set8->flags);
+
 				for (i = 0; i < cnt; i++) {
 					set8->pairs[i].flags =
 						bswap_32(set8->pairs[i].flags);

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
