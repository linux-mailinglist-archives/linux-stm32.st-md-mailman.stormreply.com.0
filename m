Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB6733AF56
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Mar 2021 10:57:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B898C57B77;
	Mon, 15 Mar 2021 09:57:29 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1668DC57B55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 09:57:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B8BB864E90;
 Mon, 15 Mar 2021 09:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615802246;
 bh=FIJka7xF+QteK9T+Iqp7GBjyzzP3ufqgREOJRod/2IY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lMJnUVEhBjC4sRlDPMG+Bqm5/d9gUMRp+IG8WbAzntGjOvWvlvcsWnuXRTzTXcJGz
 xihSeMK9iUNOuX15THnVLoCehi1Sbj98my4vTm+qqXl9rnt347/e28vWZlR2TDaPSh
 SmE7J1zAlagCWpHnDYVpiACRvKPLoeCKL9tio6QAZlRCI2Dfe7sHWk6IaoAFJe+I0Q
 GfTQOOvkY/Q970c09h9x3ekZyId3WDDHOyHK7GvJ2smjH0rjEwysaXsWvGOvFvGA7I
 wJNZX8KNOdzKZvmXmHctMncaNbDaiZa08lOP/v+pFQUVvPfysMxsw14Fg2zMUOxDOl
 4lJz1+FhFwq0Q==
Date: Mon, 15 Mar 2021 15:27:22 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <YE8vgizAd97I3EeC@vkoul-mobl>
References: <20210304160440.27612-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210304160440.27612-1-amelie.delaunay@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND PATCH v3 0/2] STM32 USBPHYC ck_usbo_48m
	clock provider
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

On 04-03-21, 17:04, Amelie Delaunay wrote:
> STM32 USBPHYC provides clocks to STM32 RCC pour STM32 USB controllers.
> Specifically, ck_usbo_48m is a possible clock parent for USB OTG clock,
> during OTG Full-Speed operation.
> 
> This series registers the usbphyc as clock provider of this ck_usbo_48m clock.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
