Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 350DA82CDB1
	for <lists+linux-stm32@lfdr.de>; Sat, 13 Jan 2024 17:17:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA7DDC6B460;
	Sat, 13 Jan 2024 16:17:49 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4EC7C6B457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Jan 2024 16:17:48 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id CD45E5C015C;
 Sat, 13 Jan 2024 11:17:47 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sat, 13 Jan 2024 11:17:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm1; t=1705162667; x=1705249067; bh=MEDYmM5cVk
 zuxdcLusRM8oPzUPvOS7c6CVBKYOnEpUQ=; b=Xnzpsfc1Nl63sjp7BTJAIuCmEp
 cUpfhwChKEfReR1Psw6r7mE2+aRXLGMYrTQdE7y8dEkJD1RhelN3XbuAPsPqdfwU
 8F9wkYxPexlfkc1FiyJhf61fKWJs59ruedYiDNd+fnK4FYZ56A/5Igw1X5eqztxu
 F+6yO/0WBk2kvx5W/xNl5M5lAuqmfRWOY1qi2TJASnqAGFoJd7DnVQ0kFh9ae1+G
 w4NiVKy1dL/Ofk8tkJHCR4gIm2jv6CHpPYKIH5fGBMxg0kdIVczBjKzuMlr8ML6Z
 547+2kg8keGGTxL8kJy+e45ajDM97oOFsCNJDUWtBZc5ZyG+75NZgo7H3RQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1705162667; x=1705249067; bh=MEDYmM5cVkzuxdcLusRM8oPzUPvO
 S7c6CVBKYOnEpUQ=; b=MJDYuIZnfcoNAXxq7SZfX0nbx40/W8OL/awF37AflUbi
 df1zwyv8Yl0LONbHxWUbygOojfYFXP5TJtIBeTAjdotnShknXgSdlNdYthgFaV+q
 gftOJqPQ6+6m2a8si7ANLuwB3j7JqGomuHRqamhB3P6aHp4W8eMmnehIXiLPdb4i
 z2+ZIwDbKnMdMEnqE5CwhgshtYKvcKP58Fpc77SVsEuYSBfnqlcTjHdQLmUbyYg9
 SReb9RXWbBnm/FrIYhIg4wT57iZeBbfkihA3LjBHvT7LA0ABEMr/9zJDfUN+zLfC
 Eshnw3CTKpJFJrglCgpOzqUtGf0scEsZOd298aLQfw==
X-ME-Sender: <xms:q7eiZfE9PCD0JsFpwiV5hPc6lGTqA2ie0NHxajGocSsQdOq4opPE8Q>
 <xme:q7eiZcUBbznI7dCLxsW2KDTobKkaHBPx5Qq-Ml14tVT1elIzkdHa4MnU43aY5who6
 PBec8mmp8LAYTgUgw>
X-ME-Received: <xmr:q7eiZRIX157GUhJVAVKWbpq3uXB55N784QI3W3BEBaXLBAsBIPdyPPk8EPmw7eZ3q4RS3tlCKwZWdfXM1co9Zy8pPtAchECDG327odo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdeijedgkeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdfstddt
 tddvnecuhfhrohhmpeffrghnihgvlhcuighuuceougiguhesugiguhhuuhdrgiihiieqne
 cuggftrfgrthhtvghrnhepvdefkeetuddufeeigedtheefffekuedukeehudffudfffffg
 geeitdetgfdvhfdvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepugiguhesugiguhhuuhdrgiihii
X-ME-Proxy: <xmx:q7eiZdFqygVlOL7uxMwlcPKPoIajAPuK7WbTdtobRaYi_yDn58e_HA>
 <xmx:q7eiZVUFF0bmdJN3bP5ZmS4mUUiCqL-E2moh1UehdxOumzPwYV5KQw>
 <xmx:q7eiZYM_2qc3jM-u9lz1HicL2Rd_26OJZSoZqxZzXLENSwSMg6ms4Q>
 <xmx:q7eiZWXaNdaK6K4jSsiKPbWYfVmvTPGIkjySaqH2L9UdU8-cyRAD2w>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 13 Jan 2024 11:17:45 -0500 (EST)
Date: Sat, 13 Jan 2024 09:17:44 -0700
From: Daniel Xu <dxu@dxuuu.xyz>
To: Jiri Olsa <olsajiri@gmail.com>
Message-ID: <nhpt647n2djmthtdkqzrfbpeuqkhfy567rt7qyqtymxejncbgr@4tpiyxy2sbcm>
References: <cover.1704565248.git.dxu@dxuuu.xyz> <ZaFm13GyXUukcnkm@krava>
 <2dhmwvfnnqnlrui2qcr5fob54gdsuse5caievct42trvvia6qe@p24nymz3uttv>
 <ZaKW1AghwUnVz_c4@krava>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZaKW1AghwUnVz_c4@krava>
Cc: fsverity@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, alexei.starovoitov@gmail.com, memxor@gmail.com,
 coreteam@netfilter.org, netfilter-devel@vger.kernel.org, quentin@isovalent.com,
 linux-kselftest@vger.kernel.org, linux-input@vger.kernel.org,
 cgroups@vger.kernel.org, bpf@vger.kernel.org, alan.maguire@oracle.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v3 0/3] Annotate kfuncs in
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

Hi Jiri,

On Sat, Jan 13, 2024 at 02:57:40PM +0100, Jiri Olsa wrote:
> On Fri, Jan 12, 2024 at 01:03:59PM -0700, Daniel Xu wrote:
> > On Fri, Jan 12, 2024 at 05:20:39PM +0100, Jiri Olsa wrote:
> > > On Sat, Jan 06, 2024 at 11:24:07AM -0700, Daniel Xu wrote:
> > > > === Description ===
> > > > 
> > > > This is a bpf-treewide change that annotates all kfuncs as such inside
> > > > .BTF_ids. This annotation eventually allows us to automatically generate
> > > > kfunc prototypes from bpftool.
> > > > 
> > > > We store this metadata inside a yet-unused flags field inside struct
> > > > btf_id_set8 (thanks Kumar!). pahole will be taught where to look.
> > > > 
> > > > More details about the full chain of events are available in commit 3's
> > > > description.
> > > > 
> > > > The accompanying pahole changes (still needs some cleanup) can be viewed
> > > > here on this "frozen" branch [0].
> > > 
> > > so the plan is to have bpftool support to generate header file
> > > with detected kfuncs?
> > 
> > Yep, that's the major use case. But I see other use cases as well like
> 
> ok, any chance you could already include it in the patchset?
> would be a great way to test this.. maybe we could change
> selftests to use that

I haven't start working on that code yet, but I can.

Here is my plan FWIW:

1. Bump minimum required pahole version up. Or feature probe for
   kfunc decl tag support. Whatever is the standard practice here.

2. Teach bpftool to dump kfunc prototypes, guarded behind a flag.

3. Flip bpftool flag on in selftest build and remove all manual kfunc
   prototypes atomically in 1 commit.

I thought it'd be nicer to do it incrementally given all the moving
pieces. But if we want to land it all at once that is ok by me too.

Thanks,
Daniel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
