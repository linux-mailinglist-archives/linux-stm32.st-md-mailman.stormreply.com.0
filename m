Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8A34B62A9
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Feb 2022 06:28:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA4D4C5F1F9;
	Tue, 15 Feb 2022 05:28:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FD11C5F1D7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Feb 2022 05:28:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 669D3613E9;
 Tue, 15 Feb 2022 05:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E205EC340EC;
 Tue, 15 Feb 2022 05:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644902894;
 bh=FMP6hhzenKGVJK2994yCbpnQWl6c4Hn3Cho4XmuGtLg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VmUjK3yeyIlNUAnLQNZRD4BmYj88GLKTrPRYzi1q1n3X2CM9UAtam+ujXLK168bBq
 WV+yhLVAL65D5U5mSlU/UAlJi8vTTS+5zW14xIJmZ3mE83h64x9vp0MH7Xk5FFdOIh
 rAfYUDr+eMx0cx8R8Qoe4irMM6tiIXmDwcUv9gStjN6JvIxr+jiMI+HPxZ1hDt/Or9
 MhzGCs5V/wZ8WQcIvHqu8JtAft9GowqpBuvKqxlmzJ6/fsmpDE7IJ2sQLrFpfLPhfn
 ZmbEMkXyycxNrY/5oHNoyF2aiG2mt8w8V20px/OTmVRnrfsPL8UHE5GHPWqMIrtM+S
 SteXdIzbkSMKg==
Date: Tue, 15 Feb 2022 10:58:10 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Miaoqian Lin <linmq006@gmail.com>
Message-ID: <Ygs56gKv4VDNjBnZ@matsya>
References: <20220108085336.11992-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220108085336.11992-1-linmq006@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: stm32-dmamux: Fix PM disable
 depth imbalance in stm32_dmamux_probe
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

On 08-01-22, 08:53, Miaoqian Lin wrote:
> The pm_runtime_enable will increase power disable depth.
> If the probe fails, we should use pm_runtime_disable() to balance
> pm_runtime_enable().

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
