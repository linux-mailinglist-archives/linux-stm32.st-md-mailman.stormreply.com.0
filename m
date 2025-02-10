Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1DBA2F508
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Feb 2025 18:21:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA8ACC78F94;
	Mon, 10 Feb 2025 17:21:00 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21C50C78F85
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2025 17:20:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 75005A41C25;
 Mon, 10 Feb 2025 17:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5060EC4CED1;
 Mon, 10 Feb 2025 17:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739208051;
 bh=AqAuO64KrFmIEpmbIChBp1sariAYqOYuraT4EbNk9HM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=iBmnjxe0jaqoN9l3oxXx6Nfl2tOwdVaBn7nL2unL9ImA0UQW4IQDVvt0KdQX3SsVm
 jSf6/pQz0jvoj7MvMlcDmobv63lXKpMcnlMCRysGHb2x1+4cNojVMfSUue7d0kf8ZR
 5K6KdAaJs8UVumN/xToAOrARvz6ICg0E1g8IkO3VZZWAx9RiN2IZrErcBJipYTmgQG
 /7oLusu/0xdSxkc8fb4PkfOI51bqSFZCcs0pdynYZHoHme+fXQ4f16fer1je46X2Hm
 O6SIL0qo6+rYHM0VW6brAI2jVAWISa41wtfsmmqsGISpfWn+6N/HQ61QcDdiAXqCd+
 DvuqllMtvdYXQ==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, mcoquelin.stm32@gmail.com, 
 alexandre.torgue@foss.st.com, Christian Bruel <christian.bruel@foss.st.com>
In-Reply-To: <20250210103515.2598377-1-christian.bruel@foss.st.com>
References: <20250210103515.2598377-1-christian.bruel@foss.st.com>
Message-Id: <173920804896.103688.2205901158085066356.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 22:50:48 +0530
MIME-Version: 1.0
X-Mailer: b4 0.14.2
Cc: linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 arnd@arndb.de, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 RESEND] phy: stm32: Fix constant-value
 overflow assertion
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


On Mon, 10 Feb 2025 11:35:15 +0100, Christian Bruel wrote:
> Rework the workaround as the lookup tables always fits into the bitfield,
> and the default values are defined by the hardware and cannot be 0:
> 
> Guard against false positive with a WARN_ON check to make the compiler
> happy: The offset range is pre-checked against the sorted imp_lookup_table
> values and overflow should not happen and would be caught by a warning and
> return in error.
> 
> [...]

Applied, thanks!

[1/1] phy: stm32: Fix constant-value overflow assertion
      commit: fd75f371f3a1b04a33d2e750363d6ad76abf734e

Best regards,
-- 
~Vinod


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
