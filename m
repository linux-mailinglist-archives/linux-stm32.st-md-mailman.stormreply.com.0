Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38423B8E1C7
	for <lists+linux-stm32@lfdr.de>; Sun, 21 Sep 2025 19:28:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE6FBC349C3;
	Sun, 21 Sep 2025 17:28:50 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C7F8C35E3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Sep 2025 17:28:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 63B6D40468;
 Sun, 21 Sep 2025 17:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22692C4CEE7;
 Sun, 21 Sep 2025 17:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1758475727;
 bh=OhAKhAi+AnzI3Qc3qjl3chOvflGQ1Z6G7nQKCQgIA6k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oNji14LKsaN74d6/6VxXQLAaEWqiMK1odhhlWG54PmdesR086HbzOQPsvLp4l8W8h
 erd/geKCs7blyB1imhKlNfDZtIHl2vwbNw8z3TSYAfWxPI4STRspwkbfLQuyq+0pRc
 wfxpVS7OtRaNl868jtRKMkgfZDW20Ck1f7t2BQsw=
Date: Sun, 21 Sep 2025 19:28:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Eliav Farber <farbere@amazon.com>
Message-ID: <2025092136-unelected-skirt-d91d@gregkh>
References: <20250919101727.16152-1-farbere@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250919101727.16152-1-farbere@amazon.com>
Cc: snitzer@redhat.com, dri-devel@lists.freedesktop.org, malattia@linux.it,
 linux-stm32@st-md-mailman.stormreply.com, sashal@kernel.org,
 bvanassche@acm.org, kadlec@netfilter.org, linux-sparse@vger.kernel.org,
 joabreu@synopsys.com, linux@roeck-us.net, pmladek@suse.com, jdelvare@suse.com,
 intel-linux-scu@intel.com, sunpeng.li@amd.com, linux-um@lists.infradead.org,
 luto@kernel.org, tglx@linutronix.de, sean@poorly.run, qiuxu.zhuo@intel.com,
 linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org, jack@suse.com,
 alexander.deucher@amd.com, akpm@linux-foundation.org,
 freedreno@lists.freedesktop.org, Jason@zx2c4.com, airlied@linux.ie,
 dave.hansen@linux.intel.com, dm-devel@redhat.com, jonnyc@amazon.com,
 mihail.atanassov@arm.com, agk@redhat.com, ruanjinjie@huawei.com,
 coreteam@netfilter.org, james.qian.wang@arm.com, linux-media@vger.kernel.org,
 alexandre.torgue@st.com, linux-arm-msm@vger.kernel.org, mripard@kernel.org,
 peppe.cavallaro@st.com, evan.quan@amd.com,
 linux-arm-kernel@lists.infradead.org, tony.luck@intel.com, tytso@mit.edu,
 fw@strlen.de, christian.koenig@amd.com, jmaloy@redhat.com, minchan@kernel.org,
 james.morse@arm.com, mcoquelin.stm32@gmail.com, brian.starkey@arm.com,
 herve.codina@bootlin.com, linux@rasmusvillemoes.dk,
 platform-driver-x86@vger.kernel.org, clm@fb.com, amd-gfx@lists.freedesktop.org,
 mgross@linux.intel.com, linux-staging@lists.linux.dev, willy@infradead.org,
 linux-input@vger.kernel.org, kuznet@ms2.inr.ac.ru, linux-ext4@vger.kernel.org,
 harry.wentland@amd.com, pablo@netfilter.org, rric@kernel.org,
 keescook@chromium.org, jejb@linux.ibm.com, rostedt@goodmis.org, bp@alien8.de,
 mchehab@kernel.org, linux-hwmon@vger.kernel.org, fery@cypress.com,
 martin.petersen@oracle.com, dmitry.torokhov@gmail.com, David.Laight@aculab.com,
 ngupta@vflare.org, sakari.ailus@linux.intel.com, ying.xue@windriver.com,
 davem@davemloft.net, peterz@infradead.org, liviu.dudau@arm.com,
 linux-mm@kvack.org, artur.paszkiewicz@intel.com, adilger.kernel@dilger.ca,
 hpa@zytor.com, anton.ivanov@cambridgegreys.com, linux-scsi@vger.kernel.org,
 richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com,
 kuba@kernel.org, jdike@addtoit.com, dushistov@mail.ru, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, josef@toxicpanda.com, hdegoede@redhat.com,
 dsterba@suse.com, andriy.shevchenko@linux.intel.com,
 linux-edac@vger.kernel.org, yoshfuji@linux-ipv6.org, netdev@vger.kernel.org,
 stable@vger.kernel.org, sergey.senozhatsky@gmail.com, robdclark@gmail.com,
 tipc-discussion@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
 tzimmermann@suse.de, rajur@chelsio.com, luc.vanoostenryck@gmail.com
Subject: Re: [Linux-stm32] [PATCH 00/27 5.10.y] Backport minmax.h updates
	from v6.17-rc6
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

On Fri, Sep 19, 2025 at 10:17:00AM +0000, Eliav Farber wrote:
> This series includes a total of 27 patches, to align minmax.h of
> v5.15.y with v6.17-rc6.
> 
> The set consists of 24 commits that directly update minmax.h:
> 1) 92d23c6e9415 ("overflow, tracing: Define the is_signed_type() macro
>    once")

But this isn't in 5.15.y, so how is this syncing things up?

I'm all for this, but I got confused here, at the first commit :)

> 2) 5efcecd9a3b1 ("minmax: sanity check constant bounds when clamping")



> 3) 2122e2a4efc2 ("minmax: clamp more efficiently by avoiding extra
>    comparison")
> 4) f9bff0e31881 ("minmax: add in_range() macro")
> 5) c952c748c7a9 ("minmax: Introduce {min,max}_array()")
> 6) 5e57418a2031 ("minmax: deduplicate __unconst_integer_typeof()")
> 7) f6e9d38f8eb0 ("minmax: fix header inclusions")
> 8) d03eba99f5bf ("minmax: allow min()/max()/clamp() if the arguments
>    have the same signedness.")
> 9) f4b84b2ff851 ("minmax: fix indentation of __cmp_once() and
>    __clamp_once()")
> 10) 4ead534fba42 ("minmax: allow comparisons of 'int' against 'unsigned
>     char/short'")
> 11) 867046cc7027 ("minmax: relax check to allow comparison between
>     unsigned arguments and signed constants")
> 12) 3a7e02c040b1 ("minmax: avoid overly complicated constant
>     expressions in VM code")
> 14) 017fa3e89187 ("minmax: simplify and clarify min_t()/max_t()
>     implementation")
> 15) 1a251f52cfdc ("minmax: make generic MIN() and MAX() macros
>     available everywhere")
> 18) dc1c8034e31b ("minmax: simplify min()/max()/clamp()
>     implementation")
> 19) 22f546873149 ("minmax: improve macro expansion and type
>     checking")
> 20) 21b136cc63d2 ("minmax: fix up min3() and max3() too")
> 21) 71ee9b16251e ("minmax.h: add whitespace around operators and after
>     commas")
> 22) 10666e992048 ("minmax.h: update some comments")
> 23) b280bb27a9f7 ("minmax.h: reduce the #define expansion of min(),
>     max() and clamp()")
> 24) a5743f32baec ("minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi
>     test in clamp()")
> 25) c3939872ee4a ("minmax.h: move all the clamp() definitions after the
>     min/max() ones")
> 26) 495bba17cdf9 ("minmax.h: simplify the variants of clamp()")
> 27) 2b97aaf74ed5 ("minmax.h: remove some #defines that are only
>     expanded once")

Some of these are also only in newer kernels, which, as you know, is
generally a bad thing (i.e. I can't take patches only for older
kernels.)

I want these changes, as they are great, but can you perhaps provide
patch series for newer kernels first so that I can then take these?

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
