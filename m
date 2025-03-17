Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D295A65BF3
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Mar 2025 19:09:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B348C78F62;
	Mon, 17 Mar 2025 18:09:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C57E6C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Mar 2025 18:09:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9974313D5;
 Mon, 17 Mar 2025 11:09:58 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60AA13F63F;
 Mon, 17 Mar 2025 11:09:49 -0700 (PDT)
Date: Mon, 17 Mar 2025 18:09:45 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Message-ID: <20250317180945.GK2487211@e132581.arm.com>
References: <20250211103945.967495-1-james.clark@linaro.org>
 <20250211103945.967495-6-james.clark@linaro.org>
 <20250313160409.GS9682@e132581.arm.com>
 <6be400e2-a464-4714-acf4-328dade883a9@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6be400e2-a464-4714-acf4-328dade883a9@linaro.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, lcherian@marvell.com,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 5/7] coresight: Clear self hosted claim
	tag on probe
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

On Mon, Mar 17, 2025 at 03:05:41PM +0000, James Clark wrote:

[...]

> > >   /*
> > > - * coresight_disclaim_device_unlocked : Clear the claim tag for the device.
> > > + * Clear the claim tag for the device.
> > > + * Returns an error if the device wasn't already claimed.
> > > + */
> > > +int coresight_reset_claim(struct csdev_access *csa)
> > > +{
> > > +       int ret;
> > > +
> > > +       CS_UNLOCK(csa->base);
> > > +       ret = coresight_reset_claim_unlocked(csa);
> > > +       CS_LOCK(csa->base);
> > > +       return ret;
> > > +}
> > > +EXPORT_SYMBOL_GPL(coresight_reset_claim);
> > 
> > Maybe my question is overlapping with Mike's comment.
> > 
> > Callers never check the return values from coresight_reset_claim(). I am
> 
> I can remove the return value if it's confusing. The thought process was
> probably that it could be useful somewhere in the future, and
> coresight_reset_claim_unlocked() returns something anyway so might as well
> pass it up.
> 
> > wandering if coresight_reset_claim() can directly call
> > coresight_clear_self_claim_tag() for _trying_ to clear self-host tag in
> > probe phase. Any self claim tag issues will be deferred to detect until
> > enable the component.
> > 
> 
> Maybe, the spec does a read before setting which I assumed should be done
> for clearing as well.

If you mean PSCI doc, the flow for claiming tag is a handshake between
self-host software and external debugger, this is why a read is
required.

For a cleaning up, it is not about syncing with external debugger.  And
writing bit 0 to TRCCLAIMCLR will not impact external debugger.  So I
don't think a read prior to cleaning self claim tag is needed.

> As in to not touch anything if it's in use externally.
> It doesn't specifically describe any clearing sequence, but if we assume
> it's ok to blindly clear self hosted flag even when it's in use then yes we
> can directly call coresight_clear_self_claim_tag().

As a result, directly calling coresight_clear_self_claim_tag() works
for me.

Thanks,
Leo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
