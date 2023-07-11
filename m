Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A6674E5BA
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jul 2023 06:14:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E4C0C6B457;
	Tue, 11 Jul 2023 04:14:40 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03F4AC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 04:14:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BE587612C9;
 Tue, 11 Jul 2023 04:14:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 518CAC433C8;
 Tue, 11 Jul 2023 04:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689048877;
 bh=/NT8j5dTImyDDiBcLBerEKRFvktbfWBQTuwILJurgBw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k0xb7wdHITbH1KagxXY1mBrMYPgJq56cnkg4HXbW0CUrZHkV5XYIv3hUqnD0YBEyz
 aKCRNr8QUZGt5oJxktjEmbt7E+5oitUhUgBlYPgV9l4GtsXLcG4zLtOAtdq6fnCZBl
 0ECV5QSqWAY6ZYuU3zuOiztQ0BbX7x8xagbdtqzHbei8JOh/orw9z6aXyGAg2+ywrb
 bfhq1lDYMHzpTObWkGwvewiElTMpF4KPWcitBtwgizYcG8Y/KiOe1cMsdLr/QNCLNT
 4TksycOHPTSJ5ghE16r6tvjJeEoTslpekyNRyfldKWHtcLDkL6lI0JI1FD01mmaclR
 fu8yC0RtYuvxA==
Date: Tue, 11 Jul 2023 09:44:32 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <ZKzXKCpoN0Zz4cCs@matsya>
References: <20230710195240.197047-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230710195240.197047-1-ahalaney@redhat.com>
Cc: andersson@kernel.org, bhupesh.sharma@linaro.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, kuba@kernel.org,
 pabeni@redhat.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] MAINTAINERS: Add another mailing
 list for QUALCOMM ETHQOS ETHERNET DRIVER
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

On 10-07-23, 14:50, Andrew Halaney wrote:
> linux-arm-msm is the list most people subscribe to in order to receive
> updates about Qualcomm related drivers. Make sure changes for the
> Qualcomm ethernet driver make it there.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
