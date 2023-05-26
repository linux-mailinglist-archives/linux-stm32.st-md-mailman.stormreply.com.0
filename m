Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBAC7126C9
	for <lists+linux-stm32@lfdr.de>; Fri, 26 May 2023 14:38:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6E9CC6A615;
	Fri, 26 May 2023 12:38:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25017C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 May 2023 12:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=lNfxSHS1UMaBMZLwessrox7ClcoojfQo4u1G/gCVpRk=; b=F8i1N0MhDb2OY0IY6jpteaJjel
 J+wgVsNwzbjVDy7D+oUdf56HV2XHl1ftpFFdeSNi4anvtzKDqtEvTvhUyW0hht2K1BNkcIYn/RCOa
 pFuadvx3d8q7hjK1Wpnip457c4/5PzOodTRcehh57MNN8Dqtl4iBNPS2I4Wht4ZhXlhkypo21wOWL
 zLYK5HJBJglOPbpotAWAk12sisYMojHMPav90HJkeECpSTPMIXgtqMfzmL4duyRKQ8WJItqg0iGs3
 7Sh5BAZyWmVsPPZgz5Fx2pC7wch4F/7ZxuuxYr1IYLKgnQZMbmoQk5PDUunf4SO4R+IPyoSDN9j7w
 naClZciw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1q2Whg-002VDl-2Y; Fri, 26 May 2023 12:37:56 +0000
Date: Fri, 26 May 2023 05:37:56 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <ZHCoJEkVinvsB2lZ@infradead.org>
References: <20230523091350.292221-1-arnaud.pouliquen@foss.st.com>
 <20230523091350.292221-2-arnaud.pouliquen@foss.st.com>
 <ZG2yw0xZ6XGGp9E5@infradead.org>
 <18a8528d-7d9d-6ed0-0045-5ee47dd39fb2@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <18a8528d-7d9d-6ed0-0045-5ee47dd39fb2@foss.st.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Christoph Hellwig <hch@infradead.org>, op-tee@lists.trustedfirmware.org,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH 1/4] tee: Re-enable vmalloc page
 support for shared memory
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

On Wed, May 24, 2023 at 04:01:14PM +0200, Arnaud POULIQUEN wrote:
> > As per the discussion back then: don't just blindly do the same dumb
> > thing again and fix the interfae to actually pass in a page array,
> > or iov_iter or an actually useful container that fits.
> > 
> 
> I suppose your are speaking about this discussion:
> https://lore.kernel.org/all/20221002002326.946620-3-ira.weiny@intel.com/

Yes.

> 
> If I'm not mistaken, I should modify at tee_shm_register_kernel_buf API and
> register_shm_helper inernal function, right?
> 

> What about having equivalent of shm_get_kernel_pages in an external helper (to
> defined where to put it), could it be an alternative of the upadate of the
> tee_shm API?

I think the fundamentally right thing is to pass an iov_iter to
register_shm_helper, and then use the new as of 6.3
iov_iter_extract_pages helper to extract the pages from that.  For
the kernel users you can then simply pass down an ITER_BVEC iter
that you can fill with vmalloc pages if you want.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
