Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D0DAEA9F1
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Jun 2025 00:48:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC599C36B2C;
	Thu, 26 Jun 2025 22:48:11 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00906C36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Jun 2025 22:48:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 106646000A;
 Thu, 26 Jun 2025 22:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DACEC4CEEF;
 Thu, 26 Jun 2025 22:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750978089;
 bh=fCvhvhbFhOlfeOSp3pz3JSwPF/zNpq8GnnnbKYprUD0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=p8ro6kuHVP4rjmVN4MF+SX3pruihvHxk7qjD4XJHiiggv6p482O/uBd3JSRvtfTWx
 5oFtEgl9QnCM+fCcxIJgeVuQcMNF0Etva2SaPsL51fGw9dGqI8ueYPuuI4j+DUOVQD
 Plx45huqWvqeo2rp1+runItb0a5oUJFRk7pUTCufsNkIriFZ3pYpz2vgpO/uaRtIu4
 qrKW4LlNTM0xlldnf74et4wYXoIZYWBU+Xv+5Am5+B0CDG6HhtmOlXlHUZ5Y+l2CSe
 xoeOabeVqwCJ1ROiSvuE87brMa+aG24IYJ2oElOJ7UPEQI/5CggGyXp/qHoqI/yKLl
 0KNSAmkOvAhQw==
From: Vinod Koul <vkoul@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20250624-stm32_dma_dbm_fix-v1-1-337c40d6c93e@foss.st.com>
References: <20250624-stm32_dma_dbm_fix-v1-1-337c40d6c93e@foss.st.com>
Message-Id: <175097808959.79884.12989914478900786264.b4-ty@kernel.org>
Date: Thu, 26 Jun 2025 15:48:09 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13.0
Cc: dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH RESEND] dmaengine: stm32-dma: configure
 next sg only if there are more than 2 sgs
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


On Tue, 24 Jun 2025 09:31:37 +0200, Amelie Delaunay wrote:
> DMA operates in Double Buffer Mode (DBM) when the transfer is cyclic and
> there are at least two periods.
> When DBM is enabled, the DMA toggles between two memory targets (SxM0AR and
> SxM1AR), indicated by the SxSCR.CT bit (Current Target).
> There is no need to update the next memory address if two periods are
> configured, as SxM0AR and SxM1AR are already properly set up before the
> transfer begins in the stm32_dma_start_transfer() function.
> This avoids unnecessary updates to SxM0AR/SxM1AR, thereby preventing
> potential Transfer Errors. Specifically, when the channel is enabled,
> SxM0AR and SxM1AR can only be written if SxSCR.CT=1 and SxSCR.CT=0,
> respectively. Otherwise, a Transfer Error interrupt is triggered, and the
> stream is automatically disabled.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: stm32-dma: configure next sg only if there are more than 2 sgs
      commit: e19bdbaa31082b43dab1d936e20efcebc30aa73d

Best regards,
-- 
~Vinod


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
