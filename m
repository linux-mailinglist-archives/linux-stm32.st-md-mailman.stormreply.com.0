Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B19BE8CB1
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Oct 2025 15:21:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7524C59790;
	Fri, 17 Oct 2025 13:21:25 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1934CC5978E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 13:21:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A1A76412EF;
 Fri, 17 Oct 2025 13:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD3EC4CEE7;
 Fri, 17 Oct 2025 13:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1760707282;
 bh=TsK5Tt2ouVurdxip4F9N9xRTQrAAUe+nydbZDh4kkR4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WO0rcs1LB08EtrlI4UYOZp3vA2LU4PF6GUqMUMIpmEXqmoXG3Qcm749CWSEMtRx21
 yd1cGcnjGwOdTi+mZWhyxu/7KjiFh8ulKGdwL02YJnjsySVFFQu9HMse0CT5qdfDbQ
 MZ11xTjtf2Wz3cpg9lhgccKHoyKXK7QAQW5csdhc=
Date: Fri, 17 Oct 2025 15:21:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Farber, Eliav" <farbere@amazon.com>
Message-ID: <2025101740-scion-flavoring-3a21@gregkh>
References: <20251017090519.46992-1-farbere@amazon.com>
 <20251017090519.46992-2-farbere@amazon.com>
 <2025101708-obtuse-ellipse-e355@gregkh>
 <CH0PR18MB54337BD648C23CBE40C1060CC6F6A@CH0PR18MB5433.namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CH0PR18MB54337BD648C23CBE40C1060CC6F6A@CH0PR18MB5433.namprd18.prod.outlook.com>
Cc: "snitzer@redhat.com" <snitzer@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "malattia@linux.it" <malattia@linux.it>, Isabella Basso <isabbasso@riseup.net>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "sashal@kernel.org" <sashal@kernel.org>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "kadlec@netfilter.org" <kadlec@netfilter.org>,
 "linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "pmladek@suse.com" <pmladek@suse.com>, "jdelvare@suse.com" <jdelvare@suse.com>,
 "intel-linux-scu@intel.com" <intel-linux-scu@intel.com>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "luto@kernel.org" <luto@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
 "sean@poorly.run" <sean@poorly.run>,
 "qiuxu.zhuo@intel.com" <qiuxu.zhuo@intel.com>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netfilter-devel@vger.kernel.org" <netfilter-devel@vger.kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, "jack@suse.com" <jack@suse.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 Sander Vanheule <sander@svanheule.net>, "Jason@zx2c4.com" <Jason@zx2c4.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "mihail.atanassov@arm.com" <mihail.atanassov@arm.com>,
 "agk@redhat.com" <agk@redhat.com>,
 "ruanjinjie@huawei.com" <ruanjinjie@huawei.com>,
 "coreteam@netfilter.org" <coreteam@netfilter.org>,
 "james.qian.wang@arm.com" <james.qian.wang@arm.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "alexandre.torgue@st.com" <alexandre.torgue@st.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "evan.quan@amd.com" <evan.quan@amd.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "tony.luck@intel.com" <tony.luck@intel.com>, "tytso@mit.edu" <tytso@mit.edu>,
 "fw@strlen.de" <fw@strlen.de>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "jmaloy@redhat.com" <jmaloy@redhat.com>,
 "minchan@kernel.org" <minchan@kernel.org>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "brian.starkey@arm.com" <brian.starkey@arm.com>,
 "herve.codina@bootlin.com" <herve.codina@bootlin.com>,
 "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "clm@fb.com" <clm@fb.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "mgross@linux.intel.com" <mgross@linux.intel.com>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "willy@infradead.org" <willy@infradead.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "kuznet@ms2.inr.ac.ru" <kuznet@ms2.inr.ac.ru>,
 "xiang@kernel.org" <xiang@kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "pablo@netfilter.org" <pablo@netfilter.org>,
 "rric@kernel.org" <rric@kernel.org>,
 "keescook@chromium.org" <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "nathan@kernel.org" <nathan@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "kbusch@kernel.org" <kbusch@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "fery@cypress.com" <fery@cypress.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
 Eric Dumazet <edumazet@google.com>,
 "David.Laight@aculab.com" <David.Laight@aculab.com>,
 "ngupta@vflare.org" <ngupta@vflare.org>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "ying.xue@windriver.com" <ying.xue@windriver.com>,
 "linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "liviu.dudau@arm.com" <liviu.dudau@arm.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "artur.paszkiewicz@intel.com" <artur.paszkiewicz@intel.com>,
 "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "anton.ivanov@cambridgegreys.com" <anton.ivanov@cambridgegreys.com>,
 Yury Norov <yury.norov@gmail.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "richard@nod.at" <richard@nod.at>, "x86@kernel.org" <x86@kernel.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "mingo@redhat.com" <mingo@redhat.com>, "kuba@kernel.org" <kuba@kernel.org>,
 "jdike@addtoit.com" <jdike@addtoit.com>,
 "dushistov@mail.ru" <dushistov@mail.ru>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "chao@kernel.org" <chao@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "josef@toxicpanda.com" <josef@toxicpanda.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "dsterba@suse.com" <dsterba@suse.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
 "yoshfuji@linux-ipv6.org" <yoshfuji@linux-ipv6.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "sergey.senozhatsky@gmail.com" <sergey.senozhatsky@gmail.com>,
 "robdclark@gmail.com" <robdclark@gmail.com>,
 "tipc-discussion@lists.sourceforge.net"
 <tipc-discussion@lists.sourceforge.net>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "rajur@chelsio.com" <rajur@chelsio.com>,
 "luc.vanoostenryck@gmail.com" <luc.vanoostenryck@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 01/27 5.10.y] overflow,
 tracing: Define the is_signed_type() macro once
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

On Fri, Oct 17, 2025 at 12:16:27PM +0000, Farber, Eliav wrote:
> > On Fri, Oct 17, 2025 at 09:04:53AM +0000, Eliav Farber wrote:
> > > From: Bart Van Assche <bvanassche@acm.org>
> > >
> > > [ Upstream commit 92d23c6e94157739b997cacce151586a0d07bb8a ]
> >
> > This isn't in 5.15.y, why is it needed in 5.10.y?
> 
> This is the mainline commit:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/include/linux/overflow.h?h=v6.18-rc1&id=92d23c6e94157739b997cacce151586a0d07bb8a
> 
> The commit hash is 92d23c6e94157739b997cacce151586a0d07bb8a, which is
> the one I used for the backport.
> 
> And here is the corresponding commit in the 5.15.y branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/include/linux/overflow.h?h=v5.15.194&id=ed6e37e30826b12572636c6bbfe6319233690c90
> However, the commit message there references a different hash:
> a49a64b5bf195381c09202c524f0f84b5f3e816f.

Ugh, that hash is invalid, I missed that :(

Thanks for the info, I'll go work on queueing these up.

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
