Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDC78258B3
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jan 2024 17:55:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84931C6C83C;
	Fri,  5 Jan 2024 16:55:58 +0000 (UTC)
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8140C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jan 2024 16:55:56 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 643F82B002FE;
 Fri,  5 Jan 2024 11:55:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 05 Jan 2024 11:55:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm1; t=1704473749; x=1704480949; bh=QW7jt9Lu7f
 ke8mG4lP5bYmPmDvOXPBpGzIUDBHIekTk=; b=Acz4kIcq6y/rMD3GdA7cQZFH/X
 t+UCDk8kiRTwuEzv4ajq3EDfufkIZkO8rGAkbX3sbhxHt16W2NOVO6gW2gQHxnZr
 G4znBN6j8ey0yPSzv+AlK6ZSJwteCnfW3d+5qDl/eg2aJTqU9Tgdw3YjZEKbWiiA
 xDjCkNbH8TatuNfFUavrE+ffldAtLl1v9baWSzFGVpUeiYCRlCeZGSoqIOyzPHvn
 QzvCgTBrCyaLUW/MlTUJL8Udfek55UMpp0KfgTZyqMYearp0x1HoJW30AG1RainQ
 7jUdJb7RD7OtoMFP4EUhEya/MWTwpfUkkKqXxvWzEKPyF0P6ySZ4aWmCm73g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1704473749; x=1704480949; bh=QW7jt9Lu7fke8mG4lP5bYmPmDvOX
 PBpGzIUDBHIekTk=; b=K9BYb8iThvNsRc3uDbU2A4HF+NqmpozLE145a0RZM6s+
 HlSs93vsFRPOZ4j+D7yanP8AH1MORLgVIUDI/smsj0tgQHb1QcdzskIXumAkTdaI
 aYWKtH9GM5E2idjjTXJdHaRlRm+zABDB8nY9iGIO+T3ni/GGWRr3B/rAtlNxTMAa
 442AnTkTIKtZDG71QbRbhfRDzlUBII9A+3MGR239UuUry3gcSCza/5J8eBt8YfDp
 qSaUg0ncHYhXvJ5JLZQ2x+uSxOHpqddfG6B+3/DQ4dtJ8Bvy8Eo4uJ9FwtXpOXbS
 lAKesJFuhuTY1UEqKamWKqMwsebhP2LexY2pyWEAjQ==
X-ME-Sender: <xms:kzSYZaaAy3dR9G7HtiXxWg4Zxmeum0A9kFX20liLaKbR07SHFcyxcg>
 <xme:kzSYZdYGOayfCataHnEAMMKquFtux6p39JzrR3A07WSDo0A-s4okO5JaDREMOkZsI
 mghom6qS61yd_6_bg>
X-ME-Received: <xmr:kzSYZU-FFGlFxqtZW9JrU1DfOghSBraArHdWeqKl_bYBn4B9XbhJJcaTjNPSd7Gh34QiYd3oUUZRytJdmx23CPk7Jxq8EIEzMnNLQ-s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdegledgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdfstddt
 tddvnecuhfhrohhmpeffrghnihgvlhcuighuuceougiguhesugiguhhuuhdrgiihiieqne
 cuggftrfgrthhtvghrnhepvdefkeetuddufeeigedtheefffekuedukeehudffudfffffg
 geeitdetgfdvhfdvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepugiguhesugiguhhuuhdrgiihii
X-ME-Proxy: <xmx:kzSYZcooOdkX-X1KqvlBh60yFjwUF6ho3KRoF4sCW1I-TfmvCqZcQA>
 <xmx:kzSYZVqed9r_UIcFbBgVtpyedquDrgSmBEtX74gK0NVzOv-CO9t0Wg>
 <xmx:kzSYZaTkEQUWNf-X1GtvBv5FK6CVlonQJvKyRbPer6PmkJB9Vt_cTA>
 <xmx:lTSYZXSsnZAjmPDbBJ3T6sdwqsgrrVfZBsEsu-lv1wIgRfR5oMP26phlS_0>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Jan 2024 11:55:44 -0500 (EST)
Date: Fri, 5 Jan 2024 09:55:43 -0700
From: Daniel Xu <dxu@dxuuu.xyz>
To: Jiri Olsa <olsajiri@gmail.com>
Message-ID: <4tsn6x45gh3vgdst3ozzmxori5gzylvpx6btxue6sbsmx7siok@6wajzdgwxfpa>
References: <cover.1704422454.git.dxu@dxuuu.xyz>
 <a923e3809955bdfd2bc8d6a103c20e01f1636dbc.1704422454.git.dxu@dxuuu.xyz>
 <ZZgcJTdwMZHglPtr@krava>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZZgcJTdwMZHglPtr@krava>
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

On Fri, Jan 05, 2024 at 04:11:33PM +0100, Jiri Olsa wrote:
> On Thu, Jan 04, 2024 at 07:45:49PM -0700, Daniel Xu wrote:
> 
> SNIP
> 
> > diff --git a/fs/verity/measure.c b/fs/verity/measure.c
> > index bf7a5f4cccaf..3969d54158d1 100644
> > --- a/fs/verity/measure.c
> > +++ b/fs/verity/measure.c
> > @@ -159,9 +159,9 @@ __bpf_kfunc int bpf_get_fsverity_digest(struct file *file, struct bpf_dynptr_ker
> >  
> >  __bpf_kfunc_end_defs();
> >  
> > -BTF_SET8_START(fsverity_set_ids)
> > +BTF_KFUNCS_START(fsverity_set_ids)
> >  BTF_ID_FLAGS(func, bpf_get_fsverity_digest, KF_TRUSTED_ARGS)
> > -BTF_SET8_END(fsverity_set_ids)
> > +BTF_KFUNCS_END(fsverity_set_ids)
> >  
> >  static int bpf_get_fsverity_digest_filter(const struct bpf_prog *prog, u32 kfunc_id)
> >  {
> > diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
> > index 51e8b4bee0c8..8cc718f37a9d 100644
> > --- a/kernel/bpf/btf.c
> > +++ b/kernel/bpf/btf.c
> > @@ -7802,6 +7802,10 @@ int register_btf_kfunc_id_set(enum bpf_prog_type prog_type,
> >  {
> >  	enum btf_kfunc_hook hook;
> >  
> > +	/* All kfuncs need to be tagged as such in BTF */
> > +	if (WARN_ON(!(kset->set->flags & BTF_SET8_KFUNCS)))
> > +		return -EINVAL;
> 
> having the warning for module with wrong set8 flags seems wrong to me,
> I think we should trigger the warn only for kernel calls.. by adding
> kset->owner check in the condition above

Just checking:

The reasoning is that =m and out-of-tree modules can and should check
return code, right?

And =y modules or vmlinux-based registrations do not check return code,
so WARN() is necessary?

If so, I'd agree.

[..]

Thanks,
Daniel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
