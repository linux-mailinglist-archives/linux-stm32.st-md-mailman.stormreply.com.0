Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D994282CE54
	for <lists+linux-stm32@lfdr.de>; Sat, 13 Jan 2024 20:49:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 918DBC6B460;
	Sat, 13 Jan 2024 19:49:18 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9720EC6B457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Jan 2024 19:49:17 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-40e72a567c4so550165e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Jan 2024 11:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705175357; x=1705780157;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1HammmbmKVZr2MOKZbNt/I1t0w3fHw/pSzTd2SPHXwE=;
 b=OsvZ9j3nNM1s+LuDaHCDEBO+uM0e5Nh0h142qQKdCoP4uhA/qvpnZCkH7Rl7kWZoGT
 Igqfcm3qmvaH6NMvUklWub35/Flj10+1ZjxpS5L6zp+wCxCkgMDBHACaqyPnsI035w1A
 K9g/sKs+AG5LLYNKlWuWkHpy0s+fIyviHKxmBMpAR+80S/ayUS/OxbWF0oRDFshiObYe
 OL3djNVyHiNRpsAO74e9EpMVDjhY9LHqH7tRXnmbZBWsW4vLwQVR3QDwL8RL7om8lnbo
 i4hiiiENO/9103h/nqEkEN0QNIQXdw4tG86dHVpStCEQrkt7OwvNa06SG8rV4Qidi6BG
 4maw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705175357; x=1705780157;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1HammmbmKVZr2MOKZbNt/I1t0w3fHw/pSzTd2SPHXwE=;
 b=iVNF+4zF1I0/B1THLSXsmlORGSWVJ1Lw1h5x9HfXk5Xwfm8sLJHKboonSuhaeY5HN4
 riS5cjN/Fv/nnmLYaHfdCSFwxI21d/YV1ihD9jo6KHPBlS9Pwomq0/33hQO0a3DpGSVF
 +LLf9rmXzpD2nHMAF/xyXRFL+QNxuEEU1YN/BiTos3w7rObGgOQ6FOs+kNtyQ73i5wyv
 75g6hm/NvDkMJ5Dv+9o0jP1y6Jh3e03pqeA/Jk6djRjgmhBnephNO7XN9STYvqokxcDf
 OX8Ioohdkoucc4nv8XZPEAYdhVtfgW8qBeTe2u3qmoHEgaUabjm9FVNeKpee7uSzgOJm
 fReg==
X-Gm-Message-State: AOJu0Yz4zoon3QUJ0K1w6HkPpE8Q/IqLlc+T1oTD7SmmEdE9urNFH+TB
 womzG7bNX9mM25WQv2zhgEY=
X-Google-Smtp-Source: AGHT+IGB6b1STgkpJhSgj3KuApjLbo2cpOqH+Lo8IF+ZLe2NNqtVVUnWy/HbRsbdtahuuLtgdZIrFQ==
X-Received: by 2002:a1c:7510:0:b0:40e:50e9:9b0c with SMTP id
 o16-20020a1c7510000000b0040e50e99b0cmr1665802wmc.181.1705175356706; 
 Sat, 13 Jan 2024 11:49:16 -0800 (PST)
Received: from krava (ip-94-113-247-30.net.vodafone.cz. [94.113.247.30])
 by smtp.gmail.com with ESMTPSA id
 a22-20020a05600c349600b0040d83ab2ecdsm10412099wmq.21.2024.01.13.11.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jan 2024 11:49:16 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Sat, 13 Jan 2024 20:49:14 +0100
To: Daniel Xu <dxu@dxuuu.xyz>
Message-ID: <ZaLpOoi9qu1f-u5B@krava>
References: <cover.1704565248.git.dxu@dxuuu.xyz> <ZaFm13GyXUukcnkm@krava>
 <2dhmwvfnnqnlrui2qcr5fob54gdsuse5caievct42trvvia6qe@p24nymz3uttv>
 <ZaKW1AghwUnVz_c4@krava>
 <nhpt647n2djmthtdkqzrfbpeuqkhfy567rt7qyqtymxejncbgr@4tpiyxy2sbcm>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <nhpt647n2djmthtdkqzrfbpeuqkhfy567rt7qyqtymxejncbgr@4tpiyxy2sbcm>
Cc: fsverity@lists.linux.dev, alan.maguire@oracle.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, alexei.starovoitov@gmail.com, memxor@gmail.com,
 coreteam@netfilter.org, netfilter-devel@vger.kernel.org, quentin@isovalent.com,
 linux-kselftest@vger.kernel.org, linux-input@vger.kernel.org,
 cgroups@vger.kernel.org, bpf@vger.kernel.org, Jiri Olsa <olsajiri@gmail.com>,
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

On Sat, Jan 13, 2024 at 09:17:44AM -0700, Daniel Xu wrote:
> Hi Jiri,
> 
> On Sat, Jan 13, 2024 at 02:57:40PM +0100, Jiri Olsa wrote:
> > On Fri, Jan 12, 2024 at 01:03:59PM -0700, Daniel Xu wrote:
> > > On Fri, Jan 12, 2024 at 05:20:39PM +0100, Jiri Olsa wrote:
> > > > On Sat, Jan 06, 2024 at 11:24:07AM -0700, Daniel Xu wrote:
> > > > > === Description ===
> > > > > 
> > > > > This is a bpf-treewide change that annotates all kfuncs as such inside
> > > > > .BTF_ids. This annotation eventually allows us to automatically generate
> > > > > kfunc prototypes from bpftool.
> > > > > 
> > > > > We store this metadata inside a yet-unused flags field inside struct
> > > > > btf_id_set8 (thanks Kumar!). pahole will be taught where to look.
> > > > > 
> > > > > More details about the full chain of events are available in commit 3's
> > > > > description.
> > > > > 
> > > > > The accompanying pahole changes (still needs some cleanup) can be viewed
> > > > > here on this "frozen" branch [0].
> > > > 
> > > > so the plan is to have bpftool support to generate header file
> > > > with detected kfuncs?
> > > 
> > > Yep, that's the major use case. But I see other use cases as well like
> > 
> > ok, any chance you could already include it in the patchset?
> > would be a great way to test this.. maybe we could change
> > selftests to use that
> 
> I haven't start working on that code yet, but I can.
> 
> Here is my plan FWIW:
> 
> 1. Bump minimum required pahole version up. Or feature probe for
>    kfunc decl tag support. Whatever is the standard practice here.
> 
> 2. Teach bpftool to dump kfunc prototypes, guarded behind a flag.
> 
> 3. Flip bpftool flag on in selftest build and remove all manual kfunc
>    prototypes atomically in 1 commit.
> 
> I thought it'd be nicer to do it incrementally given all the moving
> pieces. But if we want to land it all at once that is ok by me too.

I think it'd be best to try the whole thing before we merge the change
to pahole.. I guess the tests changes can come later, but would be great
to try the kfunc dump and make sure it works as expected

jirka
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
