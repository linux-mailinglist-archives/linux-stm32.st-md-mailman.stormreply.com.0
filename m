Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F00CD3AF6D
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jan 2026 16:46:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9EA4C35E3C;
	Mon, 19 Jan 2026 15:46:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33318C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 15:46:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C6DDFEC;
 Mon, 19 Jan 2026 07:46:02 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B89EF3F694;
 Mon, 19 Jan 2026 07:46:08 -0800 (PST)
Date: Mon, 19 Jan 2026 15:46:06 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Message-ID: <20260119154606.GE2732125@e132581.arm.com>
References: <20251217-fix_stm_kconfig-v1-1-531fb3674549@arm.com>
 <8d48dd55-d78d-4cbf-88b0-5427a731ba7d@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8d48dd55-d78d-4cbf-88b0-5427a731ba7d@linaro.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stm class: Fix Kconfig symbols
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

On Mon, Jan 19, 2026 at 12:35:23PM +0000, James Clark wrote:

[...]

> > @@ -28,7 +28,7 @@ config STM_PROTO_BASIC
> >   config STM_PROTO_SYS_T
> >   	tristate "MIPI SyS-T STM framing protocol driver"
> > -	default CONFIG_STM
> > +	default STM
> 
> The help below here says "If you don't know what this is, say N." which
> makes me wonder if this should be on by default or not?

STM_PROTO_BASIC is a must have config when enabling STM.  While
STM_PROTO_SYS_T is not mandatory, but it is useful to build it so that
users can select the protocol dynamically at runtime.

> Also everything is in an "if STM" block, so "default STM" is a bit
> redundant. It's not that obvious what the intention was.

They are two different things.

"if STM" expresses a dependency (the module depends on STM), while
"default STM" means the module will be selected by default if STM is
enabled.

Thanks,
Leo

P.s. I also tried using the "select" and "imply" syntax to enable the
protocol configurations.  Based on testing, I did not observe any
difference compared to using the "default" syntax.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
