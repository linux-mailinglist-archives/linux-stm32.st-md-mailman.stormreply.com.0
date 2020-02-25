Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEB716B941
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2020 06:45:23 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1B50C36B0B;
	Tue, 25 Feb 2020 05:45:23 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02BF5C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2020 05:45:20 +0000 (UTC)
Received: from localhost (unknown [122.167.120.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 421E2222C2;
 Tue, 25 Feb 2020 05:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582609519;
 bh=j47OslZ9784bwULG/PPlCt7joegvFmVDiWVpyxhkBOo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GMw66R3/uvqjEjYGCq2fhzTOA1W2l6ouvKd+EQSx4Zj472u9nMo+0nEKWCsAHdkWT
 7ccU6etf4Zy7O3d3E8Psqsc3YajJkmx2m9AP0PoRpYUCbJFybI2muZOQ2DhMBTu7np
 zr3YDDKZkWx2d9lbYmIt1G2f134h89TdhzXFIXsY=
Date: Tue, 25 Feb 2020 11:15:14 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20200225054514.GG2618@vkoul-mobl>
References: <20200129153628.29329-1-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129153628.29329-1-amelie.delaunay@st.com>
Cc: linux-kernel@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/8] STM32 DMA driver fixes and
	improvements
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

On 29-01-20, 16:36, Amelie Delaunay wrote:
> This series brings improvements to the STM32 DMA driver, with support of
> power management and descriptor reuse. Probe function gets a cleanup and
> properties like copy_align and max_segment_size are set.
> A "sleeping function called from invalid context" bug is also fixed. And
> to avoid a race with vchan_complete, driver now adopts
> vchan_terminate_vdesc().

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
