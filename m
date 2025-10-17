Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE1EBE87C9
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Oct 2025 13:59:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51AFFC58D79;
	Fri, 17 Oct 2025 11:59:41 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23DB2C58D76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 11:59:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AFE674B012;
 Fri, 17 Oct 2025 11:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3037FC4CEE7;
 Fri, 17 Oct 2025 11:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1760702377;
 bh=38uFLiDTAO+A1PWpRP2bVJ1ijHpCWsegoKBcJwzF2PE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cSItTMlZ+xkWo77L3dJDjTz61eq44oatBXCgbcCC5ycxjVd62F5ZBD5t/I/P7IMAl
 lQe+zy+uvgq1Iphq58yIzjQNmbjsJLGcQk9xMD89Oyn29Qra+kKcuYPJON2XTLg6Wc
 Tx4/0gvLYtBA9RdvGnygRkoazMU/mLdzs1fx2bZA=
Date: Fri, 17 Oct 2025 13:59:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Eliav Farber <farbere@amazon.com>
Message-ID: <2025101708-obtuse-ellipse-e355@gregkh>
References: <20251017090519.46992-1-farbere@amazon.com>
 <20251017090519.46992-2-farbere@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251017090519.46992-2-farbere@amazon.com>
Cc: snitzer@redhat.com, dri-devel@lists.freedesktop.org, malattia@linux.it,
 Isabella Basso <isabbasso@riseup.net>,
 linux-stm32@st-md-mailman.stormreply.com, sashal@kernel.org,
 bvanassche@acm.org, kadlec@netfilter.org, linux-sparse@vger.kernel.org,
 joabreu@synopsys.com, linux@roeck-us.net, pmladek@suse.com, jdelvare@suse.com,
 intel-linux-scu@intel.com, sunpeng.li@amd.com, linux-um@lists.infradead.org,
 luto@kernel.org, tglx@linutronix.de, sean@poorly.run, qiuxu.zhuo@intel.com,
 ndesaulniers@google.com, linux-kernel@vger.kernel.org,
 netfilter-devel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 jack@suse.com, alexander.deucher@amd.com, akpm@linux-foundation.org,
 freedreno@lists.freedesktop.org, Sander Vanheule <sander@svanheule.net>,
 Jason@zx2c4.com, airlied@linux.ie, dave.hansen@linux.intel.com,
 dm-devel@redhat.com, mihail.atanassov@arm.com, agk@redhat.com,
 ruanjinjie@huawei.com, coreteam@netfilter.org, james.qian.wang@arm.com,
 linux-media@vger.kernel.org, alexandre.torgue@st.com,
 linux-arm-msm@vger.kernel.org, mripard@kernel.org, peppe.cavallaro@st.com,
 evan.quan@amd.com, linux-arm-kernel@lists.infradead.org, tony.luck@intel.com,
 tytso@mit.edu, fw@strlen.de, christian.koenig@amd.com, jmaloy@redhat.com,
 minchan@kernel.org, james.morse@arm.com, mcoquelin.stm32@gmail.com,
 brian.starkey@arm.com, herve.codina@bootlin.com, linux@rasmusvillemoes.dk,
 platform-driver-x86@vger.kernel.org, clm@fb.com, amd-gfx@lists.freedesktop.org,
 mgross@linux.intel.com, linux-staging@lists.linux.dev, willy@infradead.org,
 linux-input@vger.kernel.org, kuznet@ms2.inr.ac.ru, xiang@kernel.org,
 linux-ext4@vger.kernel.org, harry.wentland@amd.com, pablo@netfilter.org,
 rric@kernel.org, keescook@chromium.org, Arnd Bergmann <arnd@arndb.de>,
 jejb@linux.ibm.com, rostedt@goodmis.org, nathan@kernel.org, bp@alien8.de,
 kbusch@kernel.org, Dan Williams <dan.j.williams@intel.com>, mchehab@kernel.org,
 linux-hwmon@vger.kernel.org, fery@cypress.com, martin.petersen@oracle.com,
 dmitry.torokhov@gmail.com, Eric Dumazet <edumazet@google.com>,
 David.Laight@aculab.com, ngupta@vflare.org, sakari.ailus@linux.intel.com,
 ying.xue@windriver.com, linux-erofs@lists.ozlabs.org, davem@davemloft.net,
 peterz@infradead.org, liviu.dudau@arm.com, linux-mm@kvack.org,
 artur.paszkiewicz@intel.com, adilger.kernel@dilger.ca, hpa@zytor.com,
 anton.ivanov@cambridgegreys.com, Yury Norov <yury.norov@gmail.com>,
 linux-scsi@vger.kernel.org, richard@nod.at, x86@kernel.org,
 linux@armlinux.org.uk, mingo@redhat.com, kuba@kernel.org, jdike@addtoit.com,
 dushistov@mail.ru, daniel@ffwll.ch, chao@kernel.org,
 maarten.lankhorst@linux.intel.com, josef@toxicpanda.com, hdegoede@redhat.com,
 dsterba@suse.com, andriy.shevchenko@linux.intel.com,
 Josh Poimboeuf <jpoimboe@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 linux-edac@vger.kernel.org, yoshfuji@linux-ipv6.org, netdev@vger.kernel.org,
 stable@vger.kernel.org, sergey.senozhatsky@gmail.com, robdclark@gmail.com,
 tipc-discussion@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
 tzimmermann@suse.de, rajur@chelsio.com, luc.vanoostenryck@gmail.com
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

On Fri, Oct 17, 2025 at 09:04:53AM +0000, Eliav Farber wrote:
> From: Bart Van Assche <bvanassche@acm.org>
> 
> [ Upstream commit 92d23c6e94157739b997cacce151586a0d07bb8a ]

This isn't in 5.15.y, why is it needed in 5.10.y?

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
