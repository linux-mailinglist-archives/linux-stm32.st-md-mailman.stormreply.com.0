Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2D12AEE0
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2019 08:43:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A333C58D6C
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2019 06:43:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69DA6C58D6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 May 2019 06:43:08 +0000 (UTC)
Received: from localhost (unknown [171.61.91.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2E4CD20717;
 Mon, 27 May 2019 06:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558939386;
 bh=gyLqhVIAkj4PBMbVcc0X9M/enzefZ96sSBNlv98yeks=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hg+sRuGc6Ky4Jl+fG2LhCGGpkoz0sQG/2vdODooT/gDAg+tYmXcbEwPO5RuYUPT9Y
 4dN6slql8O5VZEdQMtFRlAkUtM6eo4Hh//ZANQaiIvbXInxBwpse3F9IL7fFT1VAl6
 LodFA0Onl6KZtMwtohs+6ssdM6XCDAJ7D1EZ3akY=
Date: Mon, 27 May 2019 12:13:03 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Weitao Hou <houweitaoo@gmail.com>
Message-ID: <20190527064303.GG15118@vkoul-mobl>
References: <20190526071324.15307-1-houweitaoo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190526071324.15307-1-houweitaoo@gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 dmaengine@vger.kernel.org, dan.j.williams@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: use to_platform_device()
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

On 26-05-19, 15:13, Weitao Hou wrote:
> Use to_platform_device() instead of open-coding it.

Applied after adding stm32 driver tag, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
