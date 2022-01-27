Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED23349DA42
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jan 2022 06:34:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97A48C5F1E1;
	Thu, 27 Jan 2022 05:34:55 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40BD0C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jan 2022 05:34:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 74403B8210C;
 Thu, 27 Jan 2022 05:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5910FC340E4;
 Thu, 27 Jan 2022 05:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643261692;
 bh=5S9wWt15TRVrJ6Yz4hj/m81O+1PNXTybGgjTNNXdhLM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jc3bvfoBF2XboC0ign5S4JZO6wKpsCTDkYPjC4+VK+aMfXtA/HizbWmoh5/ca26kA
 L6KkgQ4ZyR5oWOMQiwjoslod79EF+928mYSjO1jVF3Nb0JB8/zNvgo9WbZSXjjR1B4
 mWmjeB8vJttQC4TQ2yJGdjijyMD3YtXvOuGu6siaIDRL9prjSXiNJqIUvUsnMy2OkR
 DZ8o/VfBDZB73m9u/nXihQZeVngJc3pAFUHtJJngtopQz4y51fGOskhQu/hVAAuvag
 LK4YXQ5ieOj6pMkRX07yWfy9ayJsoDoNG8OapcmoyG9PKnd6MNtjsTij5dvPbTzZ6u
 KJfS+ZhaaNIGw==
Date: Thu, 27 Jan 2022 11:04:48 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <YfIu+PYohxp6+VYe@matsya>
References: <20220112111724.GB3019@kili>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220112111724.GB3019@kili>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, kernel-janitors@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-phy@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] phy: stm32: fix a refcount leak in
 stm32_usbphyc_pll_enable()
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

On 12-01-22, 14:17, Dan Carpenter wrote:
> This error path needs to decrement "usbphyc->n_pll_cons.counter" before
> returning.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
