Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF308CF9DD0
	for <lists+linux-stm32@lfdr.de>; Tue, 06 Jan 2026 18:52:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5E13C8F279;
	Tue,  6 Jan 2026 17:52:58 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9171C8F277
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jan 2026 17:52:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 01AD660144;
 Tue,  6 Jan 2026 17:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4AC9C16AAE;
 Tue,  6 Jan 2026 17:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767721975;
 bh=TYr/HLKbtkL4zdI4yZFxob2Bqal5LW2iewldEZo+O3k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ACj6FdzmPV5d3pS2XzGgLCdA8tk56faq5zPfmA2AGWNss0ICYax5cRRKBa1oDl3lk
 AMO4r/eoRBePrITT5ilyQihSuRgL/et0sL4bHliiNu6HcnnBvKOQoWrtDPtbv/wckN
 M5hIh7TYyT4EjctKYd05ORPYSzp1ViDVuwno9LRb1V9O5h9Ym+BRmwzTARfRar3lR7
 Ebq1BWBk7/zIbJjSvzGvO0D2XrIOehGoO8MItSV04VqtG9enuwuMQecTe5alC3CJDE
 yINEq/9IzAV+wlz/lHLPYT9cl/mzMsH2vnbzdEiqtqHTYHK0QHW/exhsgRVlf6j8kx
 Dzy12JBLaSctA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue,  6 Jan 2026 11:52:50 -0600
Message-ID: <176772196925.3106040.16051762780281428458.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [Linux-stm32] (subset) [PATCH v2 1/3] bus: qcom-ebi2: Simplify
	with scoped for each OF child loop
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


On Mon, 05 Jan 2026 15:36:58 +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> 

Applied, thanks!

[1/3] bus: qcom-ebi2: Simplify with scoped for each OF child loop
      commit: 9c252f3c8f390fae4ca09de36c9262a35ae88ace

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
