Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC130BA96A2
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Sep 2025 15:50:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E74A1C3F931;
	Mon, 29 Sep 2025 13:50:02 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DAE8C36B16
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Sep 2025 13:50:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 663D462505;
 Mon, 29 Sep 2025 13:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F31BC4CEF7;
 Mon, 29 Sep 2025 13:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1759153800;
 bh=ZP+96JhjkkrBnIK+mwXVIYMy7g62X4hPExrb6o1Qe/s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2IR/w1NhD6rO3VZzjaHsa/G5y5Y6EFTRaRCQoBFOIMmzFRk3gM0W0Mf+I/1sje/zM
 6eTkAuMiRzcWzHrNhmk6po9GpoWWRMGPau/mhN/FLC8qEKMftJ9tX/aLdXfc1Agx/E
 GgRNIXRtdpmNbgceNNbtDpd4ehAmTPd7HqANSrhw=
Date: Mon, 29 Sep 2025 15:49:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Eliav Farber <farbere@amazon.com>
Message-ID: <2025092923-stove-rule-a00f@gregkh>
References: <20250924202320.32333-1-farbere@amazon.com>
 <20250924202320.32333-8-farbere@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250924202320.32333-8-farbere@amazon.com>
Cc: quic_akhilpo@quicinc.com, linus.walleij@linaro.org,
 dri-devel@lists.freedesktop.org, malattia@linux.it, robdclark@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, sashal@kernel.org,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, samuel@sholland.org,
 kadlec@netfilter.org, linux-sparse@vger.kernel.org, joabreu@synopsys.com,
 linux-sunxi@lists.linux.dev, ngupta@vflare.org, pmladek@suse.com,
 shuah@kernel.org, jdelvare@suse.com, sunpeng.li@amd.com,
 linux-um@lists.infradead.org, luto@kernel.org, tglx@linutronix.de,
 sean@poorly.run, qiuxu.zhuo@intel.com, wad@chromium.org,
 linux-kernel@vger.kernel.org, senozhatsky@chromium.org,
 netfilter-devel@vger.kernel.org, mhiramat@kernel.org, jolsa@kernel.org,
 jack@suse.com, alexander.deucher@amd.com, akpm@linux-foundation.org,
 freedreno@lists.freedesktop.org, Xinhui.Pan@amd.com,
 dave.hansen@linux.intel.com, song@kernel.org, dm-devel@redhat.com,
 sdf@google.com, mihail.atanassov@arm.com, fei1.li@intel.com, agk@redhat.com,
 mykolal@fb.com, ruanjinjie@huawei.com, john.fastabend@gmail.com,
 andrii@kernel.org, coreteam@netfilter.org, james.qian.wang@arm.com, yhs@fb.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, snitzer@kernel.org,
 mripard@kernel.org, peppe.cavallaro@st.com, evan.quan@amd.com,
 linux-arm-kernel@lists.infradead.org, haoluo@google.com, tony.luck@intel.com,
 tytso@mit.edu, Linus Torvalds <torvalds@linux-foundation.org>, fw@strlen.de,
 christian.koenig@amd.com, jmaloy@redhat.com, minchan@kernel.org,
 james.morse@arm.com, mcoquelin.stm32@gmail.com, brian.starkey@arm.com,
 herve.codina@bootlin.com, linux@rasmusvillemoes.dk, ast@kernel.org,
 platform-driver-x86@vger.kernel.org, clm@fb.com, willy@infradead.org,
 linux-kselftest@vger.kernel.org, daniel@iogearbox.net,
 linux-staging@lists.linux.dev, jernej.skrabec@gmail.com, wens@csie.org,
 linux-input@vger.kernel.org, pabeni@redhat.com, harry.wentland@amd.com,
 pablo@netfilter.org, rric@kernel.org, keescook@chromium.org,
 jejb@linux.ibm.com, quic_abhinavk@quicinc.com, rostedt@goodmis.org,
 kpsingh@kernel.org, markgross@kernel.org, bp@alien8.de, mchehab@kernel.org,
 linux-hwmon@vger.kernel.org, linux-ext4@vger.kernel.org,
 martin.petersen@oracle.com, dmitry.torokhov@gmail.com, edumazet@google.com,
 David.Laight@aculab.com, linux@roeck-us.net, sakari.ailus@linux.intel.com,
 ying.xue@windriver.com, bpf@vger.kernel.org, davem@davemloft.net,
 peterz@infradead.org, liviu.dudau@arm.com, linux-mm@kvack.org,
 artur.paszkiewicz@intel.com, adilger.kernel@dilger.ca, hpa@zytor.com,
 airlied@gmail.com, anton.ivanov@cambridgegreys.com, maz@kernel.org,
 linux-scsi@vger.kernel.org, richard@nod.at, x86@kernel.org,
 Rodrigo.Siqueira@amd.com, linux@armlinux.org.uk, mingo@redhat.com,
 kuba@kernel.org, dushistov@mail.ru, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, josef@toxicpanda.com, hdegoede@redhat.com,
 dsterba@suse.com, andriy.shevchenko@linux.intel.com,
 linux-edac@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, dsahern@kernel.org,
 stable@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 tipc-discussion@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
 tzimmermann@suse.de, rajur@chelsio.com, dmitry.baryshkov@linaro.org,
 johannes@sipsolutions.net, martin.lau@linux.dev, luc.vanoostenryck@gmail.com
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

On Wed, Sep 24, 2025 at 08:23:08PM +0000, Eliav Farber wrote:
> From: Linus Torvalds <torvalds@linux-foundation.org>
> 
> [ Upstream commit 1a251f52cfdc417c84411a056bc142cbd77baef4 ]

<snip>

As this didn't go into 6.6.y yet, I'll stop here on this series for now.
Please fix up for newer kernels first and then resend these.

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
