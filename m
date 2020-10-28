Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB0D29CE8C
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Oct 2020 08:50:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3D87C36B37;
	Wed, 28 Oct 2020 07:50:18 +0000 (UTC)
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
 [98.124.60.144])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 584F5C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Oct 2020 03:26:25 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id A654929A58;
 Tue, 27 Oct 2020 23:26:19 -0400 (EDT)
Date: Wed, 28 Oct 2020 14:26:12 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: Tom Rix <trix@redhat.com>
In-Reply-To: <20201027164255.1573301-1-trix@redhat.com>
Message-ID: <alpine.LNX.2.23.453.2010281344120.31@nippy.intranet>
References: <20201027164255.1573301-1-trix@redhat.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 28 Oct 2020 07:50:15 +0000
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rtc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-rdma@vger.kernel.org, qat-linux@intel.com, amd-gfx@lists.freedesktop.org,
 clang-built-linux@googlegroups.com, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, linux-btrfs@vger.kernel.org
Subject: Re: [Linux-stm32] [RFC] clang tooling cleanups
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


On Tue, 27 Oct 2020, trix@redhat.com wrote:

> This rfc will describe
> An upcoming treewide cleanup.
> How clang tooling was used to programatically do the clean up.
> Solicit opinions on how to generally use clang tooling.
> 

This tooling is very impressive. It makes possible an idea that I had a 
while ago, to help make code review more efficient. It works like this. 

Suppose a patch, p, is the difference between the new tree, n, and the old 
tree, o. That is, p = n - o.

Now let clang-tidy be the transformation 't'. This gets you a much more 
readable patch submission, P = t(n) - t(o).

The only difficulty is that, if I submit P intead of p then 'git am' will 
probably reject it. This is solved by a little tooling around git, such 
that, should a patch P fail to apply, the relevant files are automatically 
reformatted with the officially endorsed transformation t, to generate a 
minimal cleanup patch, such that P can be automatically applied on top.

If the patch submission process required* that every patch submission was 
generated like P and not like p, it would immediately eliminate all 
clean-up patches from the workload of all reviewers, and also make the 
reviewers' job easier because all submissions are now formatted correctly, 
and also avoid time lost to round-trips, such as, "you can have a 
reviewed-by if you respin to fix some minor style issues".

* Enforcing this, e.g. with checkpatch, is slightly more complicated, but 
it works the same way: generate a minimal cleanup patch for the relevant 
files, apply the patch-to-be-submitted, and finally confirm that the 
modified files are unchanged under t.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
