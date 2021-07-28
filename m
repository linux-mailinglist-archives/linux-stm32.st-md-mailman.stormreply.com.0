Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7634C3D87FA
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jul 2021 08:34:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 250D6C597AB;
	Wed, 28 Jul 2021 06:34:30 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC6C9CFAC5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jul 2021 06:34:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 48D86601FE;
 Wed, 28 Jul 2021 06:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627454067;
 bh=C0FNTOnyxUD0u4VKjgMCo4MT78njp9/ePeqMC0wr4aY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q0jaCs56hHgGNUyu1WhaGCiBvXaMWBZ3YaFFg5YXmsBg8UrD9jx0YHJOL8BJVOuGG
 oA2gNrVKGYIkHeE3XhNoUQBkTRGqi6vabH6YgZz2FO1Nmkvenz04RGMd9ccdA4w2BN
 2B8j33He8zRqDcjLBfctF0ChcJWD52ZviPqOxz1cpduLS0qAyCR6bBT39pc9aKHUOj
 yc3ofBVPEDJKq3vyfu9Qyx0XoptQeWXSwrKfQ4ERqhVl5WpfaYqnQFdeu16pcpBy0n
 KwpVXin36c2PjYt4oq5u/KJPQA6he/loqZszJ2uscwIFMA3NK8G97KFcM8gfyV9d7x
 3kRlBCBZqwi3Q==
Date: Wed, 28 Jul 2021 12:04:20 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Zhang Qilong <zhangqilong3@huawei.com>
Message-ID: <YQD6bADgB6KTfQ/R@matsya>
References: <20210607064640.121394-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210607064640.121394-1-zhangqilong3@huawei.com>
Cc: amelie.delaunay@st.com, alexandre.torgue@foss.st.com,
 pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH -next 0/3] Fix PM usage counter imblance
	and clear code
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

On 07-06-21, 14:46, Zhang Qilong wrote:
> The first two patches fix PM disable depth imbalance and
> the last clear pm_runtime_get_sync calls.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
