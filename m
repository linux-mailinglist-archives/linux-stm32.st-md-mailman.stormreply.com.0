Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA6341ECAA
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Oct 2021 13:58:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F8ADC5A4D2;
	Fri,  1 Oct 2021 11:58:00 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D5E4C5719E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Oct 2021 11:57:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 868EF61A6F;
 Fri,  1 Oct 2021 11:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633089476;
 bh=Vjg+dy9vAItiQLb0Oo9y0H4LZgIlPk1bRan5HVpoMuk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IitrVAZnOU4Uo+Ex9E30ZIidfe6/9XfmwIeYentyjgXVa+pusXNob5qilym+i5fLk
 zD1180QRkSemZpWEZhOYzBb8PCF4fNtCKV3MMqLi+GHgTwgAkD2Ycn1ClslVu58M88
 +oo5JaY1742r8E8UzGME4tL+D/44FzeBPufS4veMDHGDGPiVZQOpKTHIBwjKcKSFqq
 ZPDWQE1IPkWlSyiLa7vJBHy+FO4Mf3yaR3KXVQMiVwcse96GLsh2f+5WSQZWlWqZdR
 zUESFd8AYy9cq+gu2SjE25hFJI+PAdxNCKRMOL8wZEqlPnUXh4H5BIOEvQV3qrD5E6
 0iIApfM2vAZGA==
Date: Fri, 1 Oct 2021 17:27:52 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Message-ID: <YVb3wADDQuoynu1W@matsya>
References: <20210929222922.GA357509@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210929222922.GA357509@embeddedor>
Cc: linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-hardening@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH][next] dmaengine: stm32-mdma: Use
 struct_size() helper in devm_kzalloc()
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

On 29-09-21, 17:29, Gustavo A. R. Silva wrote:
> Make use of the struct_size() helper instead of an open-coded version,
> in order to avoid any potential type mistakes or integer overflows that,
> in the worse scenario, could lead to heap overflows.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
