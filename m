Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5205866A39D
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jan 2023 20:47:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFF34C65E4C;
	Fri, 13 Jan 2023 19:47:33 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 557A4C65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jan 2023 19:47:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 20222622F4;
 Fri, 13 Jan 2023 19:47:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E834C433D2;
 Fri, 13 Jan 2023 19:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673639250;
 bh=trURWyxaGIWMItlm7vEr9MA2H7W42GYsbU5eJZfOv+I=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=Vi1q5cQe53U1qisWzw2QCE3TVQu3x1Pnp+CYvmhe5fg/p4CqjzkmweqqEZjx1RT0s
 xHjRIR460pZ7/fVG+g42/zrZmF1rg36U0XhdHI5VGWftkYKUXds7x1/qMG653sLG40
 Fv1SUUKCYTIeO18X50MVFfIbqVN+9fRqVbkM0dHRugU+EnQKOykVItQ7H6uwie91EQ
 wlOEYuaPfqEnph3JceeT79Z8Iiyv4x+v83O8DSnLBYhEoLEyu9sg/juMeUJGAffrSf
 wB8n4+yOCeGbHMiS0uSxjckIK+o9FdIjYMLd1/ahisAgg2vDZYNY7w21SYVd4wPt0m
 pGqOdSXIK51sA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 1D5525C06D0; Fri, 13 Jan 2023 11:47:30 -0800 (PST)
Date: Fri, 13 Jan 2023 11:47:30 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Message-ID: <20230113194730.GG4028633@paulmck-ThinkPad-P17-Gen-1>
References: <20230113001103.GA3374173@paulmck-ThinkPad-P17-Gen-1>
 <20230113001132.3375334-5-paulmck@kernel.org>
 <871qnysa7u.fsf@ubik.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871qnysa7u.fsf@ubik.fi.intel.com>
Cc: John Ogness <john.ogness@linutronix.de>, kernel-team@meta.com,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org, rcu@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH rcu v2 05/20] drivers/hwtracing/stm:
	Remove "select SRCU"
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
Reply-To: paulmck@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Fri, Jan 13, 2023 at 05:52:37PM +0200, Alexander Shishkin wrote:
> "Paul E. McKenney" <paulmck@kernel.org> writes:
> 
> > Now that the SRCU Kconfig option is unconditionally selected, there is
> > no longer any point in selecting it.  Therefore, remove the "select SRCU"
> > Kconfig statements.
> 
> Accidentally acked the previous version. This appears to be the same.

I somehow missed that ack, probably fat-fingered it.  :-/

> Acked-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>

Thank you!  I will apply this on my next rebase.

							Thanx, Paul
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
