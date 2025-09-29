Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A73BA9AD0
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Sep 2025 16:47:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94A67C3F93C;
	Mon, 29 Sep 2025 14:47:38 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E8CBC3F933
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Sep 2025 14:47:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 368E144E5D;
 Mon, 29 Sep 2025 14:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C51EEC4CEF4;
 Mon, 29 Sep 2025 14:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1759157255;
 bh=8W8Q+OA2dF6Ur3uVnm6arrgUauWJ5keNKgi5Rakv08M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ixd7lGKjU8rPs4OWaLyHTILBe27JWFNUeW7ErLrq5kAqdgQvDcohTydA9pilDkaVH
 z52PdLZ/6lQF/TxWojd21t/6vwpwNY0xwdJgToPIfkLHWKKVz+QIaSh4krNdfG/Qsg
 H3crXkWEyIu0mULyxpLF7vZzJx+xJCpRFqbsU2Dk=
Date: Mon, 29 Sep 2025 16:47:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Farber, Eliav" <farbere@amazon.com>
Message-ID: <2025092955-module-landfall-ed45@gregkh>
References: <20250924202320.32333-1-farbere@amazon.com>
 <20250924202320.32333-8-farbere@amazon.com>
 <2025092923-stove-rule-a00f@gregkh>
 <85a995bb59474300aa3d5f973d279a13@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <85a995bb59474300aa3d5f973d279a13@amazon.com>
Cc: "quic_akhilpo@quicinc.com" <quic_akhilpo@quicinc.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "malattia@linux.it" <malattia@linux.it>,
 "robdclark@gmail.com" <robdclark@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "sashal@kernel.org" <sashal@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "samuel@sholland.org" <samuel@sholland.org>,
 "kadlec@netfilter.org" <kadlec@netfilter.org>,
 "linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 "ngupta@vflare.org" <ngupta@vflare.org>, "pmladek@suse.com" <pmladek@suse.com>,
 "shuah@kernel.org" <shuah@kernel.org>, "jdelvare@suse.com" <jdelvare@suse.com>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "luto@kernel.org" <luto@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
 "sean@poorly.run" <sean@poorly.run>,
 "qiuxu.zhuo@intel.com" <qiuxu.zhuo@intel.com>,
 "wad@chromium.org" <wad@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
 "netfilter-devel@vger.kernel.org" <netfilter-devel@vger.kernel.org>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>,
 "jolsa@kernel.org" <jolsa@kernel.org>, "jack@suse.com" <jack@suse.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "Xinhui.Pan@amd.com" <Xinhui.Pan@amd.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "song@kernel.org" <song@kernel.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>, "sdf@google.com" <sdf@google.com>,
 "mihail.atanassov@arm.com" <mihail.atanassov@arm.com>,
 "fei1.li@intel.com" <fei1.li@intel.com>, "agk@redhat.com" <agk@redhat.com>,
 "mykolal@fb.com" <mykolal@fb.com>,
 "ruanjinjie@huawei.com" <ruanjinjie@huawei.com>,
 "john.fastabend@gmail.com" <john.fastabend@gmail.com>,
 "andrii@kernel.org" <andrii@kernel.org>,
 "coreteam@netfilter.org" <coreteam@netfilter.org>,
 "james.qian.wang@arm.com" <james.qian.wang@arm.com>, "yhs@fb.com" <yhs@fb.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "snitzer@kernel.org" <snitzer@kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "evan.quan@amd.com" <evan.quan@amd.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "haoluo@google.com" <haoluo@google.com>,
 "tony.luck@intel.com" <tony.luck@intel.com>, "tytso@mit.edu" <tytso@mit.edu>,
 Linus Torvalds <torvalds@linux-foundation.org>, "fw@strlen.de" <fw@strlen.de>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "jmaloy@redhat.com" <jmaloy@redhat.com>,
 "minchan@kernel.org" <minchan@kernel.org>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "brian.starkey@arm.com" <brian.starkey@arm.com>,
 "herve.codina@bootlin.com" <herve.codina@bootlin.com>,
 "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
 "ast@kernel.org" <ast@kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "clm@fb.com" <clm@fb.com>, "willy@infradead.org" <willy@infradead.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "daniel@iogearbox.net" <daniel@iogearbox.net>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "wens@csie.org" <wens@csie.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "pabeni@redhat.com" <pabeni@redhat.com>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "pablo@netfilter.org" <pablo@netfilter.org>,
 "rric@kernel.org" <rric@kernel.org>,
 "keescook@chromium.org" <keescook@chromium.org>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "kpsingh@kernel.org" <kpsingh@kernel.org>,
 "markgross@kernel.org" <markgross@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
 "edumazet@google.com" <edumazet@google.com>,
 "David.Laight@aculab.com" <David.Laight@aculab.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "ying.xue@windriver.com" <ying.xue@windriver.com>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "liviu.dudau@arm.com" <liviu.dudau@arm.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "artur.paszkiewicz@intel.com" <artur.paszkiewicz@intel.com>,
 "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
 "hpa@zytor.com" <hpa@zytor.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "anton.ivanov@cambridgegreys.com" <anton.ivanov@cambridgegreys.com>,
 "maz@kernel.org" <maz@kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "richard@nod.at" <richard@nod.at>, "x86@kernel.org" <x86@kernel.org>,
 "Rodrigo.Siqueira@amd.com" <Rodrigo.Siqueira@amd.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "mingo@redhat.com" <mingo@redhat.com>, "kuba@kernel.org" <kuba@kernel.org>,
 "dushistov@mail.ru" <dushistov@mail.ru>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "josef@toxicpanda.com" <josef@toxicpanda.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "dsterba@suse.com" <dsterba@suse.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "yoshfuji@linux-ipv6.org" <yoshfuji@linux-ipv6.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dsahern@kernel.org" <dsahern@kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "tipc-discussion@lists.sourceforge.net"
 <tipc-discussion@lists.sourceforge.net>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "rajur@chelsio.com" <rajur@chelsio.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
 "martin.lau@linux.dev" <martin.lau@linux.dev>,
 "luc.vanoostenryck@gmail.com" <luc.vanoostenryck@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 07/19 v6.1.y] minmax: make generic MIN()
 and MAX() macros available everywhere
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

On Mon, Sep 29, 2025 at 02:39:26PM +0000, Farber, Eliav wrote:
> > On Wed, Sep 24, 2025 at 08:23:08PM +0000, Eliav Farber wrote:
> > > From: Linus Torvalds <torvalds@linux-foundation.org>
> > >
> > > [ Upstream commit 1a251f52cfdc417c84411a056bc142cbd77baef4 ]
> >
> > <snip>
> >
> > As this didn't go into 6.6.y yet, I'll stop here on this series for now.
> > Please fix up for newer kernels first and then resend these.
> 
> For 6.6.y I backported 15 commits:
> https://lore.kernel.org/stable/20250922103241.16213-1-farbere@amazon.com/T/#t
> 
> Why weren't all of them picked?

Because one of them broke the build, as I wrote a week ago here:
	https://lore.kernel.org/all/2025092209-owl-whisking-03e3@gregkh/

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
