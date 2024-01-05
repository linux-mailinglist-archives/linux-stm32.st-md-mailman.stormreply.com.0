Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BF6824C6E
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jan 2024 02:18:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B650C6B476;
	Fri,  5 Jan 2024 01:18:06 +0000 (UTC)
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C30FFC65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jan 2024 01:18:04 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id C93FE2B003E7;
 Thu,  4 Jan 2024 20:17:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 04 Jan 2024 20:18:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm1; t=1704417477; x=1704424677; bh=52XpvHOHlL
 252gSJofKsvelo6vnSoD2F1sW3aqDiEc8=; b=CChYtD/qnwH77ERKCPSM4z8LRz
 +8OB5rRXpI1jXkdcTzfUhf1Z2sPC4AqY0+RERDIf2sl3Zpi9c1QF6Xiv/KgdqX0M
 2/4NQXFRVGnYbZiLpVrsXl7YmtORxrP/88PjCtbL6T6YwPu1rFfRMZeBFJWLG2FY
 WqrTwekcbM1qEtYsR+iYhMeQ6SvH1Rro+ZVTCRC0rYc7OoD8jn8kA1kt7GZMHNz3
 QDYkR0qxGQ1TjCzL9pTIyb8ctnFn5GhbX6W+WinGlhwZKeCHm4F2IYicjwD+MjgG
 zvvOvdT6yPMGipIjboVEExpht1uwx3I7yqe3ayjPzBhYF6C+y0HP6ZGs0fmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1704417477; x=1704424677; bh=52XpvHOHlL252gSJofKsvelo6vnS
 oD2F1sW3aqDiEc8=; b=1wh6oQWvPt1AjiN1FW4IOBsDfmPMjEe2uVSRt45VvcLx
 6arPsk+rG0ahJF5ZOshlyrLEVyGX8KMp7Oe0jXW3hf8kYMfIEnjsShlyx/u0CqK4
 737ZUsPlqRAPfLSZPFR9vykLMgc0cCtPNGLJDkVBN4vIYasROEgKueRRnco/dccH
 xJ3wmQ4Z0jvKgf7kgi05FaevaxEhaX0ZPaWDV83c6kcCj74FZxcDnE9ayu7Age81
 NRBDbIFKe2ZvYJ5r17sOZyZt2VlRQXK6IB3XbP45nFfhqRHWzoukfojoh+2pESAT
 qAGyQhz5LGqoFDDdmxrgGFDYL1DzCRCpCpvAmZsCgw==
X-ME-Sender: <xms:w1iXZQeEttVwQM-R3vZQ4HEjdhQF8hyO7f9OrnH9ps-4RUFAyFNadA>
 <xme:w1iXZSOdvgmukBfCLvnRq5Xg5haJd1OgRKXSfigHFW7s4Rw7ynpqk2gxpF6-KrfjS
 ijQztVtgADbulmSfA>
X-ME-Received: <xmr:w1iXZRiy-pRLAYn_AVW4HSknB1nhIhypI5MJiNwI9g-82JPkTCoc_GvA9XVRbCJHoWz-tgs2R5GiH5_QEG9l_V4ZF9c_AaalFlS01D0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdegkedgfeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdfstddt
 tddvnecuhfhrohhmpeffrghnihgvlhcuighuuceougiguhesugiguhhuuhdrgiihiieqne
 cuggftrfgrthhtvghrnhepvdefkeetuddufeeigedtheefffekuedukeehudffudfffffg
 geeitdetgfdvhfdvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepugiguhesugiguhhuuhdrgiihii
X-ME-Proxy: <xmx:w1iXZV_Qwu2WMv8EByq9LGS-5hmqZHx9ygDd2aljTvrIsaOKol8JfA>
 <xmx:w1iXZcvW__hoVurNrGi43dnwCeDE9JeyPI-BSJ2hLh8RkOSfceIVCg>
 <xmx:w1iXZcFy822a46qBXxBSbllHxXuD7J9sfzqyTvxU-Cd6wTNwSzBIdA>
 <xmx:xViXZcXkc8ccHN_ZxMaNCS-R59zdNxS6LVIE_-jcTZggLP8pSgMpknUwrXM>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Jan 2024 20:17:52 -0500 (EST)
Date: Thu, 4 Jan 2024 18:17:50 -0700
From: Daniel Xu <dxu@dxuuu.xyz>
To: Jiri Olsa <olsajiri@gmail.com>
Message-ID: <bix2uwya2mnk2vgno3vkdpg5kyusq763bmfj2ov6zwpbva6q4h@nqgm3vk4byh5>
References: <cover.1704324602.git.dxu@dxuuu.xyz>
 <68d5598e5708dfe3370406cd5c946565ca4b50f1.1704324602.git.dxu@dxuuu.xyz>
 <ZZaZf_8RuX2xqZGf@krava>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZZaZf_8RuX2xqZGf@krava>
Cc: yonghong.song@linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 song@kernel.org, edumazet@google.com, benjamin.tissoires@redhat.com,
 sdf@google.com, lizefan.x@bytedance.com, netdev@vger.kernel.org,
 shuah@kernel.org, alexei.starovoitov@gmail.com, steffen.klassert@secunet.com,
 mykolal@fb.com, Herbert Xu <herbert@gondor.apana.org.au>, daniel@iogearbox.net,
 john.fastabend@gmail.com, andrii@kernel.org, kadlec@netfilter.org,
 ebiggers@kernel.org, quentin@isovalent.com, linux-input@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, pablo@netfilter.org,
 linux-trace-kernel@vger.kernel.org, coreteam@netfilter.org, hawk@kernel.org,
 jikos@kernel.org, rostedt@goodmis.org, ast@kernel.org,
 mathieu.desnoyers@efficios.com, memxor@gmail.com, kpsingh@kernel.org,
 cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 fsverity@lists.linux.dev, haoluo@google.com, linux-kselftest@vger.kernel.org,
 tytso@mit.edu, alan.maguire@oracle.com, dsahern@kernel.org, fw@strlen.de,
 linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 mhiramat@kernel.org, mcoquelin.stm32@gmail.com, hannes@cmpxchg.org,
 tj@kernel.org, bpf@vger.kernel.org, martin.lau@linux.dev, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH bpf-next 2/2] bpf: treewide: Annotate BPF
	kfuncs in BTF
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

Hi Jiri, 

On Thu, Jan 04, 2024 at 12:41:51PM +0100, Jiri Olsa wrote:
> On Wed, Jan 03, 2024 at 04:31:56PM -0700, Daniel Xu wrote:
> 
> SNIP
> 
> > diff --git a/include/linux/btf_ids.h b/include/linux/btf_ids.h
> > index 88f914579fa1..771e29762a2d 100644
> > --- a/include/linux/btf_ids.h
> > +++ b/include/linux/btf_ids.h
> > @@ -8,6 +8,9 @@ struct btf_id_set {
> >  	u32 ids[];
> >  };
> >  
> > +/* This flag implies BTF_SET8 holds kfunc(s) */
> > +#define BTF_SET8_KFUNC		(1 << 0)
> > +
> >  struct btf_id_set8 {
> >  	u32 cnt;
> >  	u32 flags;
> > diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
> > index 51e8b4bee0c8..b8ba00a4179f 100644
> > --- a/kernel/bpf/btf.c
> > +++ b/kernel/bpf/btf.c
> > @@ -7769,6 +7769,9 @@ static int __register_btf_kfunc_id_set(enum btf_kfunc_hook hook,
> >  	struct btf *btf;
> >  	int ret, i;
> >  
> > +	/* All kfuncs need to be tagged as such in BTF */
> > +	WARN_ON(!(kset->set->flags & BTF_SET8_KFUNC));
> 
> __register_btf_kfunc_id_set gets called also from the 'hooks' path:
> 
>   bpf_mptcp_kfunc_init
>     register_btf_fmodret_id_set
>       __register_btf_kfunc_id_set
> 
> so it will hit the warn.. it should be probably in the register_btf_kfunc_id_set ?

Yeah, good catch.

> 
> also given that we can have modules calling register_btf_kfunc_id_set,
> should we just return error instead of the warn?

It looks like quite a few registrations go through late_initcall(),
in which error codes are thrown away. I'm looking at
init/main.c:do_initcall_level:

        for (fn = initcall_levels[level]; fn < initcall_levels[level+1]; fn++)
                do_one_initcall(initcall_from_entry(fn));

Higher level question: if out of tree module does not follow convention,
it would still make sense to WARN(), right?

> 
> SNIP
> 
> > diff --git a/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c b/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c
> > index 91907b321f91..32972334cd50 100644
> > --- a/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c
> > +++ b/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c
> > @@ -341,7 +341,7 @@ static struct bin_attribute bin_attr_bpf_testmod_file __ro_after_init = {
> >  	.write = bpf_testmod_test_write,
> >  };
> >  
> > -BTF_SET8_START(bpf_testmod_common_kfunc_ids)
> > +BTF_SET8_START(bpf_testmod_common_kfunc_ids, BTF_SET8_KFUNC)
> >  BTF_ID_FLAGS(func, bpf_iter_testmod_seq_new, KF_ITER_NEW)
> >  BTF_ID_FLAGS(func, bpf_iter_testmod_seq_next, KF_ITER_NEXT | KF_RET_NULL)
> >  BTF_ID_FLAGS(func, bpf_iter_testmod_seq_destroy, KF_ITER_DESTROY)
> 
> we need to change also bpf_testmod_check_kfunc_ids set

Good catch, thanks.

Daniel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
