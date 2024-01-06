Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01082826138
	for <lists+linux-stm32@lfdr.de>; Sat,  6 Jan 2024 20:10:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A2A3C6A5EA;
	Sat,  6 Jan 2024 19:10:28 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF034C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  6 Jan 2024 19:10:26 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-40d60c49ee7so7502855e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 06 Jan 2024 11:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704568226; x=1705173026;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XN11DcyrjCYH4UjdpvhQMOODqptexpORHaHrc+DxqLo=;
 b=NgDWfBEklFImPV4hqi+jSNTQQC1PDZDB1IVVV2ET4ZkPu5CBRsQKxsFgKqzYNCgmm9
 D+03SDCJJ7Rz38t7qvPXpVYYrFSBifokaj+jtCY6E5lpc6yzsDi1WwwiL75OQw8dfonm
 rgVYFIK+4FuZhLQgKRsMCoi9AAtXxb0tsynhQJi4eOajB5dQUSlLef3hI5ZzRe+TEe3s
 bYzeex0rymrEeW7g9kNlyPxVXFCwwCNOMuH5bjBAk+7IAzfY6K+jpBZ5h+DOMJs2otB5
 aBdddu7c8NDHYsaw5E4lHfxRdJdyBRV+8IjfCYZtyfY6hIHgyhNSk8F043nPZaCOFa4J
 cUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704568226; x=1705173026;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XN11DcyrjCYH4UjdpvhQMOODqptexpORHaHrc+DxqLo=;
 b=QiFDKZPEjgcDZZTSHrLh4YYPF63epEykmUJBn2rtAmRsjI5IPxha9u8JRJ79lBe5P4
 ZZUGz8HoUKTuq0mfckjuqoxZuZ/4Hv2HqLPDtBcunTqn4x4uL9B7HGvYV6/QDyuPXuio
 RwXpfqx8QPl3PKaowBDgASMi+BFOGSxL/2MeiMFlfz0GI/zkJiroS46C76mG1yCNK/Ma
 2F2HxLTySAZg732nXwPvWWdqsiB46x2MpMVbnYSPriTWze7IJb56GZQRQfi+IA1Nw/RP
 Bl9YGdkAxPP7aqFvyv9wjiUAK5qQ8wy0K0K0K5Sg2blH0OwHPqYOLJLl/e4JAmws2B8O
 xa1g==
X-Gm-Message-State: AOJu0YzMvzGhA1gURLfiBRJcAkRwgpdGYsRGvm3b8B1x8J2Z1n2f69mb
 c3S9HGrjh0H2M760M7pVNXA=
X-Google-Smtp-Source: AGHT+IESwPxvVB/8ipXpccypJwcC+FaZlc0B4G0s35S17F9bfUk+r34RM+hEvGsKxoK3mBTpdLR0ZQ==
X-Received: by 2002:a05:600c:1e01:b0:40d:871c:558d with SMTP id
 ay1-20020a05600c1e0100b0040d871c558dmr730414wmb.32.1704568225771; 
 Sat, 06 Jan 2024 11:10:25 -0800 (PST)
Received: from krava ([83.240.62.111]) by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c351100b0040d5f466deesm5459251wmq.38.2024.01.06.11.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jan 2024 11:10:25 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Sat, 6 Jan 2024 20:10:23 +0100
To: Daniel Xu <dxu@dxuuu.xyz>
Message-ID: <ZZmln7mwvLRjqqRo@krava>
References: <cover.1704422454.git.dxu@dxuuu.xyz>
 <a923e3809955bdfd2bc8d6a103c20e01f1636dbc.1704422454.git.dxu@dxuuu.xyz>
 <ZZgcJTdwMZHglPtr@krava>
 <4tsn6x45gh3vgdst3ozzmxori5gzylvpx6btxue6sbsmx7siok@6wajzdgwxfpa>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4tsn6x45gh3vgdst3ozzmxori5gzylvpx6btxue6sbsmx7siok@6wajzdgwxfpa>
Cc: yonghong.song@linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 ast@kernel.org, song@kernel.org, edumazet@google.com,
 benjamin.tissoires@redhat.com, sdf@google.com, lizefan.x@bytedance.com,
 netdev@vger.kernel.org, shuah@kernel.org, alexei.starovoitov@gmail.com,
 steffen.klassert@secunet.com, mykolal@fb.com,
 Herbert Xu <herbert@gondor.apana.org.au>, daniel@iogearbox.net,
 john.fastabend@gmail.com, andrii@kernel.org, kadlec@netfilter.org,
 ebiggers@kernel.org, quentin@isovalent.com, linux-input@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, pablo@netfilter.org,
 linux-trace-kernel@vger.kernel.org, coreteam@netfilter.org, hawk@kernel.org,
 jikos@kernel.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
 memxor@gmail.com, kpsingh@kernel.org, cgroups@vger.kernel.org,
 Jiri Olsa <olsajiri@gmail.com>, linux-arm-kernel@lists.infradead.org,
 fsverity@lists.linux.dev, haoluo@google.com, linux-kselftest@vger.kernel.org,
 tytso@mit.edu, alan.maguire@oracle.com, dsahern@kernel.org, fw@strlen.de,
 linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 mhiramat@kernel.org, mcoquelin.stm32@gmail.com, hannes@cmpxchg.org,
 tj@kernel.org, bpf@vger.kernel.org, martin.lau@linux.dev, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH bpf-next v2 3/3] bpf: treewide: Annotate
	BPF kfuncs in BTF
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

On Fri, Jan 05, 2024 at 09:55:43AM -0700, Daniel Xu wrote:
> On Fri, Jan 05, 2024 at 04:11:33PM +0100, Jiri Olsa wrote:
> > On Thu, Jan 04, 2024 at 07:45:49PM -0700, Daniel Xu wrote:
> > 
> > SNIP
> > 
> > > diff --git a/fs/verity/measure.c b/fs/verity/measure.c
> > > index bf7a5f4cccaf..3969d54158d1 100644
> > > --- a/fs/verity/measure.c
> > > +++ b/fs/verity/measure.c
> > > @@ -159,9 +159,9 @@ __bpf_kfunc int bpf_get_fsverity_digest(struct file *file, struct bpf_dynptr_ker
> > >  
> > >  __bpf_kfunc_end_defs();
> > >  
> > > -BTF_SET8_START(fsverity_set_ids)
> > > +BTF_KFUNCS_START(fsverity_set_ids)
> > >  BTF_ID_FLAGS(func, bpf_get_fsverity_digest, KF_TRUSTED_ARGS)
> > > -BTF_SET8_END(fsverity_set_ids)
> > > +BTF_KFUNCS_END(fsverity_set_ids)
> > >  
> > >  static int bpf_get_fsverity_digest_filter(const struct bpf_prog *prog, u32 kfunc_id)
> > >  {
> > > diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
> > > index 51e8b4bee0c8..8cc718f37a9d 100644
> > > --- a/kernel/bpf/btf.c
> > > +++ b/kernel/bpf/btf.c
> > > @@ -7802,6 +7802,10 @@ int register_btf_kfunc_id_set(enum bpf_prog_type prog_type,
> > >  {
> > >  	enum btf_kfunc_hook hook;
> > >  
> > > +	/* All kfuncs need to be tagged as such in BTF */
> > > +	if (WARN_ON(!(kset->set->flags & BTF_SET8_KFUNCS)))
> > > +		return -EINVAL;
> > 
> > having the warning for module with wrong set8 flags seems wrong to me,
> > I think we should trigger the warn only for kernel calls.. by adding
> > kset->owner check in the condition above
> 
> Just checking:
> 
> The reasoning is that =m and out-of-tree modules can and should check
> return code, right?
> 
> And =y modules or vmlinux-based registrations do not check return code,
> so WARN() is necessary?
> 
> If so, I'd agree.

right, I was also concerned we could flood console with loading module
that just uses wrong set8.. perhaps we could just use WARN_ON_ONCE with
no additional checks

jirka
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
