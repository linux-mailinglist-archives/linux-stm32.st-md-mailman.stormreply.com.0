Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9C0FEAD
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Apr 2019 19:19:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B60B1C36B3F
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Apr 2019 17:19:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CF36C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Apr 2019 17:19:07 +0000 (UTC)
Received: from localhost (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4EEF320651;
 Tue, 30 Apr 2019 17:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556644746;
 bh=Ak9XM+VjWlZMz6Xy1SwbxWJmWxB8F4HluG3X0ePJnYA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZxZx9D2Lv1r5COFomGHS9i012OKoXiF2uZkaqgsaPoW3iM7g+piKuSSJJkJGuDgoz
 fUZMRrKxDlAO8HmtU/OQqfSuagdNNvLW1ehGjCwxxgRgXfm2QVvKL1iL1D/agM7WgI
 2lwJbWsP5bS4YljgCgmccCO9z7rgh5qzTqXTgoEc=
Date: Tue, 30 Apr 2019 22:48:56 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <20190430171856.GW3845@vkoul-mobl.Dlink>
References: <1553689316-6231-1-git-send-email-arnaud.pouliquen@st.com>
 <20190426121751.GC28103@vkoul-mobl>
 <6894b54e-651f-1caf-d363-79d1ef0eee14@st.com>
 <20190429051310.GC3845@vkoul-mobl.Dlink>
 <26fa7710-76cb-e202-a367-c2e2408b6808@st.com>
 <20190430082255.GP3845@vkoul-mobl.Dlink>
 <f7f28d56-a3e4-38a3-8580-b241fe0dcb49@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f7f28d56-a3e4-38a3-8580-b241fe0dcb49@st.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: stm32-dma: fix residue
 calculation in stm32-dma
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

On 30-04-19, 16:58, Arnaud Pouliquen wrote:

> >> Hope that will help to clarify.
> > 
> > Yes that helps, maybe we should add these bits in code and changelog..
> > :)I will update the comments and commit message in a V2 in this way
> > 
> > And how does this impact non cyclic case where N descriptors maybe
> > issued. The driver seems to support non cyclic too...
> 
> Correct it supports SG as well, but double buffer mode is not used in
> such case. Hw is programmed under IT for every descriptors : no
> automatic register reloaded as in cyclic mode. We won't end up in the
> situation depicted below.

Okay sounds good then. Can you add a bit more of this in the code (this
was very helpful) not as a fix but documentation so that people (or you
down the line) will remember why this was done like this

Thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
