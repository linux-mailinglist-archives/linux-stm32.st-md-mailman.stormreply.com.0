Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A48FCA65C88
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Mar 2025 19:30:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54C9BC78F62;
	Mon, 17 Mar 2025 18:30:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28061CFAC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Mar 2025 18:30:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19E7D13D5;
 Mon, 17 Mar 2025 11:30:11 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D57943F63F;
 Mon, 17 Mar 2025 11:30:01 -0700 (PDT)
Date: Mon, 17 Mar 2025 18:29:57 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Message-ID: <20250317182957.GL2487211@e132581.arm.com>
References: <20250211103945.967495-1-james.clark@linaro.org>
 <20250211103945.967495-3-james.clark@linaro.org>
 <20250313145456.GR9682@e132581.arm.com>
 <c6a86373-64be-4101-a08a-74aa302bf64c@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c6a86373-64be-4101-a08a-74aa302bf64c@linaro.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, lcherian@marvell.com,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 2/7] coresight: Convert disclaim functions
 to take a struct cs_access
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

On Mon, Mar 17, 2025 at 11:36:40AM +0000, James Clark wrote:
> 
> 
> On 13/03/2025 2:54 pm, Leo Yan wrote:
> > On Tue, Feb 11, 2025 at 10:39:38AM +0000, James Clark wrote:
> > 
> > [...]
> > 
> > >   static inline bool coresight_is_claimed_any(struct coresight_device *csdev)
> > >   {
> > > -       return coresight_read_claim_tags(csdev) != 0;
> > > +       return coresight_read_claim_tags(&csdev->access) != 0;
> > >   }
> > 
> > Likewise other claim functions, can coresight_is_claimed_any() change its
> > argument type from struct coresight_device to struct csdev_access?
> 
> I only wanted to change the ones that I had to. I think we should prioritize
> passing csdev as much as possible in the coresight framework to make
> everything consistent. Otherwise it's extra churn for no benefit, and if we
> need something from csdev here in the future we'll have to change this one
> back again.

The function coresight_is_claimed_any() has been deleted in a later
patch.  So this is fine for me.

In theory, claim tags are low level operations and don't need a
CoreSight device context, I prefer we can keep them as simple as
possible.

With this series, we can see coresight_claim_device() and
coresight_disclaim_device() are inconsistent for their parameters:
one is using "struct coresight_device *" and another is
"struct csdev_access *".  Maybe we just proceed to use csdev_access
for all claim tag functions?

If later we need to use a CoreSight device context when operating
claim tags, it means we might have different scenarios and we can
handle that separately.

Thanks,
Leo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
