Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A27B3C60B
	for <lists+linux-stm32@lfdr.de>; Sat, 30 Aug 2025 02:15:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74523C3F939;
	Sat, 30 Aug 2025 00:15:52 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C396DC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Aug 2025 00:15:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B04CF60142;
 Sat, 30 Aug 2025 00:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D69F4C4CEF0;
 Sat, 30 Aug 2025 00:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756512949;
 bh=HNjsx0i8x73tfae/eOHpgGMql3FZ9c4OcgiZIKPT95A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iZcIlotZnZmYfFdJ1Oc7Aza4lrGYWrNZzw/6UYGujc8KDIerJaO5eBS6aelA9SVTs
 F1Qd0OE53bMMH8UD7Zo+6xBzYE51rblRUFPngwx7Tx2ttc6T0E6BxmAlywblHOGk5P
 DFp3ugjyLE3dB6YoEs1jItpKh9Dkop1IZW3FzveZ15VAag0BKj5hsrogEjPZHHH6xF
 reqOMqsi76TkbVCuJ7JiBbZQhYUDls+OE7hDTaVfoL9FhUC5q6N8P7/Vzd3LZCF/AZ
 +kNp/ihIF/4CyQ2y2AfRmC18FgtNmpJ6NOePp9MR9ZIfDcrbqflq5ol6hB9696od81
 4fG97Zov1H3zw==
Date: Fri, 29 Aug 2025 17:15:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Message-ID: <20250829171548.68d7addd@kernel.org>
In-Reply-To: <57196414-5ab5-41b7-b2e3-ff6831589811@foss.st.com>
References: <20250827-relative_flex_pps-v3-0-673e77978ba2@foss.st.com>
 <20250827-relative_flex_pps-v3-1-673e77978ba2@foss.st.com>
 <20250827193105.47aaa17b@kernel.org>
 <57196414-5ab5-41b7-b2e3-ff6831589811@foss.st.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/2] drivers: net: stmmac:
 handle start time set in the past for flexible PPS
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

On Fri, 29 Aug 2025 12:51:40 +0200 Gatien CHEVALLIER wrote:
> On 8/28/25 04:31, Jakub Kicinski wrote:
> > On Wed, 27 Aug 2025 13:04:58 +0200 Gatien Chevallier wrote:  
> >> +		curr_time = ns_to_timespec64(ns);
> >> +		if (target_ns < ns + PTP_SAFE_TIME_OFFSET_NS) {
> >> +			cfg->start = timespec64_add_safe(cfg->start, curr_time);  
> > 
> > Is there a strong reason to use timespec64_add_safe()?
> > It's not exported to modules:
> > ERROR: modpost: "timespec64_add_safe" [drivers/net/ethernet/stmicro/stmmac/stmmac.ko] undefined!  
> 
> Hello Jakub,
> 
> you're absolutely right. I don't know how I did not encounter the build
> error while performing some tests, that I'm getting now as well.
> 
> The handling of overflows is already done in that function. Either
> I can make a patch to export the symbol or handle the computation in the
> driver. What do you think is best?

The odds of me being right about time related code are only slightly
better than 50/50, and I don't know what "flexible PPS" is :)
But in principle, if the reason you need to check for overflow is valid
-- add the export. The time maintainers will tell us if they don't
want it.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
