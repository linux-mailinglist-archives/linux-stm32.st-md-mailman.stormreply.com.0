Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48204824D07
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jan 2024 03:38:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0368C6B476;
	Fri,  5 Jan 2024 02:38:13 +0000 (UTC)
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9AE1C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jan 2024 02:38:12 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 4A5472B00474;
 Thu,  4 Jan 2024 21:38:06 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 04 Jan 2024 21:38:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm1; t=1704422285; x=1704429485; bh=hhJPu3tNnq
 xckGttQAIaSboNHKCsm1A0qRCYF/TLTLQ=; b=VXwCp7hqAkbSThJHwvaHtcMONK
 k7Zbx7LQStUYGpDYxVIB7DZziK1R9H6eFLqamhAL6NMmIB5rjxStP+zT1uOEtTtm
 lmO+B5RHcvSzLAitr6mr5EhvAJywcsfelYp2Qr6K4D5wFRk/ytVbNEnOVrl9zgvS
 ui/sPUhKvEY1QlqoOGMeyBz3tuGHLgCQXDRk64IxQ8Vn4/KAawqNmMJHJ2luEhIy
 5JswRkn6uaLha9Op5HoMyrdCUnk6FzVvOCkgFY0d6FnZlVz3Ebuoo//NqYeRiVlA
 h1vxMqOpxe2CKRoSMm1YUyko8tBwsegNiNcR7c4ujYDom3eBhbbyiVf2Sd+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1704422285; x=1704429485; bh=hhJPu3tNnqxckGttQAIaSboNHKCs
 m1A0qRCYF/TLTLQ=; b=87Glr2LldJEIX+FphDwBcyLF9pjPSXtkxx2DELFxgZ9h
 Kv+Yan/y1ssDandSsWJhDewJg36Xk4MsIpgLXd08Jm6JnCQyzHTx88OUL3zSOLz/
 LmNlJP/2ZqfNmMghYmQuW4tNgvEBjovd5KBdzBbZFPwiEEAAj+j/EkwXtyYyWzC9
 tmdrcl9bxFK3+sCI4dplPF23HP5T0QT7ZgRmlLVj5s4Iwnepo9rIolQ83zx7zvUE
 ptVABJbSyD+Br1QWQGQ9m3ztgWnpIpodF1T8TUBya+GhYMIGAJ8WmWmqxNrteng1
 WuAKri1h6nqVKWdvw7Ma0M4j0bH4ZfwZnNu8kDKH7w==
X-ME-Sender: <xms:i2uXZQGRqmDUp5xjuBcrMlr4pnlYSVV6jRx37GkJ1Fn4F0KXQXIIcg>
 <xme:i2uXZZW_yDlVJwqUvAueDKMdSYO3ODzWJmdtp2wCiVwSmHf-RuklamuE6KSilR-kM
 nWYJ5VEtwjr2XVyZA>
X-ME-Received: <xmr:i2uXZaLIVcHJYxsG-JJ9HTTQwKGNJvaVHF2HF-0dHSP1AwmhQlQV9kzSMNrO1I1Iq5-xOnt4rENH_83giA-xVGLzvXAUXRZ6nQ8VFZU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdegkedggeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdfstddt
 tddvnecuhfhrohhmpeffrghnihgvlhcuighuuceougiguhesugiguhhuuhdrgiihiieqne
 cuggftrfgrthhtvghrnhepvdefkeetuddufeeigedtheefffekuedukeehudffudfffffg
 geeitdetgfdvhfdvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepugiguhesugiguhhuuhdrgiihii
X-ME-Proxy: <xmx:i2uXZSFlAxpevVOLGhgMtHzxLXFOOUvIH8Mmq-SLR2_Jbs6qBiUvAg>
 <xmx:i2uXZWV5_TQEuLzdkEq6lGBqjqe6rs979NfZ5R4AQZ_nj9z0j2ocxw>
 <xmx:i2uXZVMKAEvxYx8O1pdzsLA1g6wyYTZXAzmuoGkiX6AjVoXnq4DVOA>
 <xmx:jWuXZR9gwCbaAGWYBSuJd5u7AFKUS3CCeYfxty9rRcyPhRDYua0qfJuNwnA>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Jan 2024 21:38:00 -0500 (EST)
Date: Thu, 4 Jan 2024 19:37:58 -0700
From: Daniel Xu <dxu@dxuuu.xyz>
To: Jiri Olsa <olsajiri@gmail.com>
Message-ID: <kblwkuzcblwogxqjv6vgkwat3wuwpopdmk25smlbz3nho7qhes@2dfdponsqxwo>
References: <cover.1704324602.git.dxu@dxuuu.xyz>
 <68d5598e5708dfe3370406cd5c946565ca4b50f1.1704324602.git.dxu@dxuuu.xyz>
 <ZZaZf_8RuX2xqZGf@krava>
 <bix2uwya2mnk2vgno3vkdpg5kyusq763bmfj2ov6zwpbva6q4h@nqgm3vk4byh5>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bix2uwya2mnk2vgno3vkdpg5kyusq763bmfj2ov6zwpbva6q4h@nqgm3vk4byh5>
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

On Thu, Jan 04, 2024 at 06:17:50PM -0700, Daniel Xu wrote:
[...]
> > 
> > also given that we can have modules calling register_btf_kfunc_id_set,
> > should we just return error instead of the warn?
> 
> It looks like quite a few registrations go through late_initcall(),
> in which error codes are thrown away. I'm looking at
> init/main.c:do_initcall_level:
> 
>         for (fn = initcall_levels[level]; fn < initcall_levels[level+1]; fn++)
>                 do_one_initcall(initcall_from_entry(fn));
> 
> Higher level question: if out of tree module does not follow convention,
> it would still make sense to WARN(), right?

Ah, I got what you meant now. I'd say returning error makes sense but
WARN() is also useful. I'll send v2 with both.

[...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
