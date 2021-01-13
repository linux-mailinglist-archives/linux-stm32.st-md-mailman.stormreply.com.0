Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5832D2F5544
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Jan 2021 00:50:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD36EC5660F;
	Wed, 13 Jan 2021 23:50:28 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B958C32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jan 2021 23:50:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 050EC2250E;
 Wed, 13 Jan 2021 23:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610581824;
 bh=n7YXgMJK4exfAdhH0ZlRuWIleZ/O3yTamEthjIUsP5c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qTZvVGHO5xkgxLTNWBficKuvKvJ2AJvrzQz3PZkBU4r6hmI/HI9b8x9wDGzlGBBcY
 DYN7ivH/SZg/kSHslr0oEgV0ZiCU/ZPkkaDwh9eiViCOLJj65ZV0GDOdlbYV6J6mC0
 V6Rwbi4vhK4PRxVWG2qBiNhH6nbIR2mZbiApCpvefyt651eGs7DZSWviACy9e3O9jU
 p9Q5hdBMbliTrUe0y4CYPa/YMIze5rGBVLfIkSphLCz0JOx3sWxv+N8SX8htJTjsuj
 kCBQPZ2Ch4brgC0WfehQ8zKr1JPivxVSYqwcWvcX7riCaq3DTuOgANvCAY77mSowcI
 lilxyC/d9qzPw==
Date: Wed, 13 Jan 2021 15:50:23 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Sebastien Laveze <sebastien.laveze@oss.nxp.com>
Message-ID: <20210113155023.1f52ee4f@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210112140121.1487619-1-sebastien.laveze@oss.nxp.com>
References: <20210112140121.1487619-1-sebastien.laveze@oss.nxp.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S .
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 linux-rt-users@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: use __napi_schedule()
	for PREEMPT_RT
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

On Tue, 12 Jan 2021 15:01:22 +0100 Sebastien Laveze wrote:
> From: Seb Laveze <sebastien.laveze@nxp.com>
> 
> Use of __napi_schedule_irqoff() is not safe with PREEMPT_RT in which
> hard interrupts are not disabled while running the threaded interrupt.
> 
> Using __napi_schedule() works for both PREEMPT_RT and mainline Linux,
> just at the cost of an additional check if interrupts are disabled for
> mainline (since they are already disabled).
> 
> Similar to the fix done for enetc:
> 215602a8d212 ("enetc: use napi_schedule to be compatible with PREEMPT_RT")
> 
> Signed-off-by: Seb Laveze <sebastien.laveze@nxp.com>

Fixed up the commit message to appease checkpatch and applied, thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
