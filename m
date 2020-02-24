Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 136F716AC22
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Feb 2020 17:50:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4D75C36B0B;
	Mon, 24 Feb 2020 16:50:18 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3CEFC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Feb 2020 16:50:17 +0000 (UTC)
Received: from localhost (unknown [122.182.199.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 74E0F20637;
 Mon, 24 Feb 2020 16:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582563016;
 bh=GUn4MNd/CYw0+WpEjK/beMt3O/nBhBrB0RzoGtzcI8E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JF4umC8CRxfeuYkpdniHpcft7/Jjj5SFyBNEyJJI0OQX2Vtn6yqOvqNnG1KebGkyu
 UwBybDebLapoJuPaZ5eh9raqocKdq8+ey1hVmwZQdZneolm3YIGA8FLPGBtEfrtdDk
 Rrfh/v71QseZ5QGSxWrsF3XHXXjWedXhOm7hbA8A=
Date: Mon, 24 Feb 2020 22:20:12 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20200224165012.GB2618@vkoul-mobl>
References: <20200127085334.13163-1-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200127085334.13163-1-amelie.delaunay@st.com>
Cc: linux-kernel@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/6] STM32 MDMA driver fixes and
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

On 27-01-20, 09:53, Amelie Delaunay wrote:
> This series brings improvements to the MDMA driver, with support of power
> management and descriptor reuse. Probe function gets a cleanup and to avoid
> a race with vchan_complete, driver now adopts vchan_terminate_vdesc().

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
