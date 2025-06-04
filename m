Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D52ACDA4E
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Jun 2025 10:53:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21347C32E92;
	Wed,  4 Jun 2025 08:53:06 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0309C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Jun 2025 08:53:04 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-442ea341570so45716775e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Jun 2025 01:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749027184; x=1749631984;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GLM7LBm37WJqJap/lEtkbB8hYDWJRhXgHcZgsy5d+m4=;
 b=mGqWKLSx9DA0AC5B1+giVjsAU196qFoTSDP6hWylu0W7rzsSzlEY3loZ+R0tO7t1k8
 sNZjNX1lGJge7zHl6WnQ6CVMWPYFsehbBm+Gp7sSxsAsAM8sEYMuehVEiPRJXUCS0LM4
 p+LMT+htWGkcGQxmDHwPO3oeT8dtM1fYojESc2pfVix8HzkhbnbFr88lNGYRic2pqzVR
 g49yuv4cpXYmPshZBWo879SiweUW2tBwpP2vL5KUgp4x9dnMlHskce6uNE55pXkdSJsS
 Acvz7leh6pFINd0VpDR1pENErDpPVZtunE8a+zH08Qixz/YUc9OHdRwKDxH/v38wD1wn
 v/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749027184; x=1749631984;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GLM7LBm37WJqJap/lEtkbB8hYDWJRhXgHcZgsy5d+m4=;
 b=BL0M/u8xRy5Vve+YubNQdHsiyC7kb5uCwMpSyuer2f3vh8RdnceyAab2bZxQBisj0N
 WjgWzwdGuSFQAoA+sCqfSVoYQkBMMJCGlwXPubBOLxa5A+2AS2+xKc9NtH9Lu14B1VN7
 HuHgHgFwcfDoBdca5UMEGUQndt7fQpvO3T1RFgpb2EEiDrP015USTQsN2CBplmn9I+Ou
 kTRfVNwnK9yVfToZNUwaDz7Rq9oQ4nK9VjplZhgfHV9FSDQ/AO5vxDuDTF+M+iNcZTuo
 StVf1DWn1B5o3kol9pwDkUE8igp+mQ4JfXDtklkNwmTh4jMhYvscLHf1x1SIkl32zCiH
 a9bQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqKJNpu490+dnIHphzJlad0x+377CQ1WeDMbUyPtjf8c9EpPPW8hUuav54Lx4uEjSMb4M8EK5FsEgphQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxXZnMOn7t45J3+RUjV5W55ZOlg89+k1u97lWEmjlDBAf7qcKiy
 2E4ZN4ZZFJF3Wl4yZZL9y0CfIJcnzsamB/y6bnY5RvkH+EgJkJlgGwrE
X-Gm-Gg: ASbGnctfC+4cenrf0XTQbMZqvAui35qIfUAvTRjahNfm/rTq7fk+RghIZqQDnuvc8/9
 qdTYOXZdYSFEk670ICMKtm+s/ycFrZQdkvBR/3/Pwus0BWMv9ZpozKJ5QtLR7rnsWBVftVg5SAw
 uV8pl6dh6U6FiHX1Tb2hF+/dItrgOnN1YSKr04Ojvj6i7+dqN3gz5I/y6hj1DNjNYD98fi+o77q
 b5hkG0LbH0RocOz1PEtIxDn7zjGbfd5HW3N7g2OKfjFL0CBOfWyw6dCeHh2JII7acXOaBwsRkmO
 DGC/Srzd8PBZ5mjcOY6y3vZHyviQzIsuSos9a5M=
X-Google-Smtp-Source: AGHT+IEimdhpyVCbWCs8OZcEOw5A8tU+m2ddmRqylRHVPijI8dxrP/UOu9X8Wnc/BPaO81v0RDpm7w==
X-Received: by 2002:a05:600c:6749:b0:43c:f6c6:578c with SMTP id
 5b1f17b1804b1-451f0ab417fmr15621325e9.15.1749027183601; 
 Wed, 04 Jun 2025 01:53:03 -0700 (PDT)
Received: from krava ([176.74.159.170]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7fa2566sm186916685e9.13.2025.06.04.01.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 01:53:03 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 4 Jun 2025 10:53:00 +0200
To: Rong Tao <rtoax@foxmail.com>
Message-ID: <aEAJbBH00yL2iTgn@krava>
References: <tencent_A6502A28AF21A3CA88B106F3421159869708@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_A6502A28AF21A3CA88B106F3421159869708@qq.com>
Cc: Yonghong Song <yonghong.song@linux.dev>,
 Peter Zijlstra <peterz@infradead.org>,
 open list <linux-kernel@vger.kernel.org>, Song Liu <song@kernel.org>,
 rongtao@cestc.cn,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Juntong Deng <juntong.deng@outlook.com>, Mykola Lysenko <mykolal@fb.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, andrii@kernel.org,
 Stanislav Fomichev <sdf@fomichev.me>, Alexei Starovoitov <ast@kernel.org>,
 Amery Hung <ameryhung@gmail.com>, KP Singh <kpsingh@kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Hao Luo <haoluo@google.com>, Oleg Nesterov <oleg@redhat.com>,
 eddyz87@gmail.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "open list:BPF \[SELFTESTS\] \(Test Runners & Infrastructure\)"
 <bpf@vger.kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>
Subject: Re: [Linux-stm32] [PATCH bpf-next] selftests/bpf: Fix compile error
 of bin_attribute::read/write()
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

On Wed, Jun 04, 2025 at 01:53:22PM +0800, Rong Tao wrote:
> From: Rong Tao <rongtao@cestc.cn>
> 
> Since commit 97d06802d10a ("sysfs: constify bin_attribute argument of
> bin_attribute::read/write()"), make bin_attribute parameter of
> bin_attribute::read/write() const.

hi,
there's already fix for this in bpf/master

thanks,
jirka

> 
> Signed-off-by: Rong Tao <rongtao@cestc.cn>
> ---
>  tools/testing/selftests/bpf/test_kmods/bpf_testmod.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> index e6c248e3ae54..e9e918cdf31f 100644
> --- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> +++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> @@ -385,7 +385,7 @@ int bpf_testmod_fentry_ok;
>  
>  noinline ssize_t
>  bpf_testmod_test_read(struct file *file, struct kobject *kobj,
> -		      struct bin_attribute *bin_attr,
> +		      const struct bin_attribute *bin_attr,
>  		      char *buf, loff_t off, size_t len)
>  {
>  	struct bpf_testmod_test_read_ctx ctx = {
> @@ -465,7 +465,7 @@ ALLOW_ERROR_INJECTION(bpf_testmod_test_read, ERRNO);
>  
>  noinline ssize_t
>  bpf_testmod_test_write(struct file *file, struct kobject *kobj,
> -		      struct bin_attribute *bin_attr,
> +		      const struct bin_attribute *bin_attr,
>  		      char *buf, loff_t off, size_t len)
>  {
>  	struct bpf_testmod_test_write_ctx ctx = {
> @@ -567,7 +567,7 @@ static void testmod_unregister_uprobe(void)
>  
>  static ssize_t
>  bpf_testmod_uprobe_write(struct file *file, struct kobject *kobj,
> -			 struct bin_attribute *bin_attr,
> +			 const struct bin_attribute *bin_attr,
>  			 char *buf, loff_t off, size_t len)
>  {
>  	unsigned long offset = 0;
> -- 
> 2.49.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
