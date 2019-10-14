Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E766D6366
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Oct 2019 15:08:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4087C36B0B;
	Mon, 14 Oct 2019 13:08:16 +0000 (UTC)
Received: from Galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C33D1C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 12:56:38 +0000 (UTC)
Received: from [5.158.153.52] (helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1iJztp-0008OM-0h; Mon, 14 Oct 2019 14:56:33 +0200
Date: Mon, 14 Oct 2019 14:56:32 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
In-Reply-To: <20191009160246.17898-1-benjamin.gaignard@st.com>
Message-ID: <alpine.DEB.2.21.1910141441350.2531@nanos.tec.linutronix.de>
References: <20191009160246.17898-1-benjamin.gaignard@st.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 14 Oct 2019 13:08:16 +0000
Cc: marc.zyngier@arm.com, fweisbec@gmail.com, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org, mingo@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] tick: check if broadcast device could
 really be stopped
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

On Wed, 9 Oct 2019, Benjamin Gaignard wrote:
> @@ -78,7 +78,7 @@ static bool tick_check_broadcast_device(struct clock_event_device *curdev,
>  {
>  	if ((newdev->features & CLOCK_EVT_FEAT_DUMMY) ||
>  	    (newdev->features & CLOCK_EVT_FEAT_PERCPU) ||
> -	    (newdev->features & CLOCK_EVT_FEAT_C3STOP))
> +	    tick_broadcast_could_stop(newdev))

No. This might be called _before_ a cpuidle driver is available and then
when that driver is loaded and goes deep, everything goes south.

Aside of that it definitely breaks everything which does not use the
cpuidle stuff, which includes all machines affected by X86_BUG_AMD_APIC_C1E
and everything which uses the INTEL_IDLE driver.

Pretty much the same problem for all other places you changed.

Thanks,

	tglx
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
