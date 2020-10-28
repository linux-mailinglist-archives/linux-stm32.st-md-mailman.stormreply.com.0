Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C9129CE4A
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Oct 2020 06:56:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7361BC36B37;
	Wed, 28 Oct 2020 05:56:49 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43EDCC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Oct 2020 05:56:47 +0000 (UTC)
Received: from localhost (unknown [122.171.163.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B757C2231B;
 Wed, 28 Oct 2020 05:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603864605;
 bh=XPg4SEeqKrCMXwqHCp6LcifvhrM3ld8XV/RL6baPbrg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=klApAEC0oKB+qer/j+opIGAlfrANR7UnFTZbrStUDvw5/vDWKWc46c1tpgOZz+b1a
 ogq1U35gUn+VEg9fpSAn5LCcOzrYMd7p35XBpFA4jGby1v1NG+63Dng3vUExRDJgrz
 aOxmXwc6EK46dOTK+Z8TrrXka3GBW5iVVaKAis28=
Date: Wed, 28 Oct 2020 11:26:41 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Message-ID: <20201028055641.GI3550@vkoul-mobl>
References: <20201008141828.GA20325@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201008141828.GA20325@embeddedor>
Cc: linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH][next] dmaengine: stm32-mdma: Use
 struct_size() in kzalloc()
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

On 08-10-20, 09:18, Gustavo A. R. Silva wrote:
> Make use of the new struct_size() helper instead of the offsetof() idiom.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
