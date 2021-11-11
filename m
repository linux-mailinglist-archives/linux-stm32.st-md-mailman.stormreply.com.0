Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E14044D7DE
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Nov 2021 15:09:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4741CC5EC72;
	Thu, 11 Nov 2021 14:09:32 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58140C5EC70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Nov 2021 14:09:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 58C1A6112F;
 Thu, 11 Nov 2021 14:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636639769;
 bh=INsr49FrzcAlX2qg8VY1JXPInfTECovEwdq1XERk4J4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DkBsgkyzCfeJ2oZuICgrZBz1HLI/zUQkqhlF3m90v9krliSeGkzlUMTeoWkjiInnU
 ywnyt8BCfPmE8Rx2xmo7YqqiTf9VcdU/ZO4gVlwWQGdyPN43q/W62yWApqN3P9Upe6
 obzQk3c7+qyT78IyeIRBssfu1ukW783VaIFD9bRiC/6zkMv/gr9xIT+qOkQWaqEHEs
 DcuN98IGPEsoqxgftWCCSP/c14zfCe08VObUGGGx48D+Y3eCUHYGbfapRKWRYlfgO3
 lRc9Ez52peqY/e7c/7T1F+jykc1pkvuvW5W/Lpw8JiVlq8h2WJXg3svuYDx104AH3E
 GFM7xFH7KifyA==
Date: Thu, 11 Nov 2021 06:09:28 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Meng Li <Meng.Li@windriver.com>
Message-ID: <20211111060928.666f00e1@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211111135630.24996-1-Meng.Li@windriver.com>
References: <20211111135630.24996-1-Meng.Li@windriver.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: socfpga: add runtime
 suspend/resume callback for stratix10 platform
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

On Thu, 11 Nov 2021 21:56:30 +0800 Meng Li wrote:
> +const struct dev_pm_ops socfpga_dwmac_pm_ops = {

static
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
