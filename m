Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 929A65ACA71
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 08:21:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FA55C0D2B9;
	Mon,  5 Sep 2022 06:21:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 201C9C0AA15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 06:21:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E70236105C;
 Mon,  5 Sep 2022 06:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9DEDC433C1;
 Mon,  5 Sep 2022 06:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662358896;
 bh=TNEBXej6R4HHqPME+PDj0XbbBvp7eLyz70MrlYZp+3A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BR8qdVIR528CcfShi4QQ+GyEKrWei5bNy6DNa3TG2xaTpFUdzfbyadPKEYFMHuRY/
 FflO2Mh9+sTVFWgiF6J75U7GidHvnvhH0AThdq+bJNmnTQLJebWdgvG9+xTIskY9iD
 dsP6YhhIdHQoCrjHiMQ1ldSUNWyXSUBf6PlvQmoyUIUeTiPXgOpYZjFjO+yv3sqeH5
 W7Nd9m3KOTapAQyXcglLTHJaJF1EqIXLghVIkDviGWBPQ2pCHQhLr2y889GKIWFU7v
 rn17LNN5Qfue+/in2U77zdKjd7zTM3nWUJumYomc7v82jHJARUX6t7wSrh6YpoAO7n
 ANJ5D17LHUYBQ==
Date: Mon, 5 Sep 2022 11:51:32 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jason Wang <wangborong@cdjrlc.com>
Message-ID: <YxWVbHlow2zOCe4r@matsya>
References: <20220811120959.18752-1-wangborong@cdjrlc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220811120959.18752-1-wangborong@cdjrlc.com>
Cc: linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: stm32-dmamux: Fix comment typo
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

On 11-08-22, 20:09, Jason Wang wrote:
> The double `end' is duplicated in the comment, remove one.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
