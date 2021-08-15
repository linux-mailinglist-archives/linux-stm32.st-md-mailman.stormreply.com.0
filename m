Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 439153ECA4C
	for <lists+linux-stm32@lfdr.de>; Sun, 15 Aug 2021 18:48:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1487C57B7A;
	Sun, 15 Aug 2021 16:48:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF37DC57B5F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Aug 2021 16:48:09 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 47395604AC;
 Sun, 15 Aug 2021 16:48:04 +0000 (UTC)
Date: Sun, 15 Aug 2021 17:51:02 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20210815175102.4a10a28f@jic23-huawei>
In-Reply-To: <a6f7be32b8ff7cc1e8e416599820a30fa9aab9f5.1628511445.git.vilhelm.gray@gmail.com>
References: <cover.1628511445.git.vilhelm.gray@gmail.com>
 <a6f7be32b8ff7cc1e8e416599820a30fa9aab9f5.1628511445.git.vilhelm.gray@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v15 07/13] docs: counter: Document
 character device interface
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

On Mon,  9 Aug 2021 21:37:32 +0900
William Breathitt Gray <vilhelm.gray@gmail.com> wrote:

> This patch adds high-level documentation about the Counter subsystem
> character device interface.
> 
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Hi William,

Trivial probable typo inline.

I'm struggling somewhat with these interfaces because I simply don't know
enough about how people use counters to know whether they provide everything
people will want. They feel similar to the event handling type functions you
can set up in motor drives, so they may well make sense, but ideally
we need review from someone (other than yourself!) who actually uses this
stuff on a regular basis.

If we don't get any additional review I guess we go ahead anyway
next cycle.

Jonathan

> ---

> +
> +Counter events can be configured by users to report various Counter
> +data of interest. This can be conceptualized as a list of Counter
> +component read calls to perform. For example:
> +
> +        +-------------------------------------------------+
> +        | COUNTER_EVENT_OVERFLOW | COUNTER_EVENT_INDEX    |
> +        +========================+========================+
> +        | Channel 0              | Channel 0              |
> +        +------------------------+------------------------+
> +        | * Count 0              | * Signal 0             |
> +        | * Count 1              | * Signal 0 Extension 0 |
> +        | * Signal 3             | * Extension 4          |
> +        | * Count 4 Extension 2  +------------------------+
> +        | * Signal 5 Extension 0 | Channel 1              |
> +        |                        +------------------------+
> +        |                        | * Signal 4             |
> +        |                        | * Signal 4 Extension 0 |
> +        |                        | * Count 7              |
> +        +------------------------+------------------------+
> +
> +When ``counter_push_event(counter, COUNTER_EVENT_INDEX, 1)`` is called
> +for example, it will go down the list for the ``COUNTER_EVENT_INDEX``
> +event channel 1 and execute the read callbacks for Signal 4, Signal 4
> +Extension 0, and Count 4 -- the data returned for each is pushed to a

Count 7?

> +kfifo as a ``struct counter_event``, which userspace can retrieve via a
> +standard read operation on the respective character device node.
> +

>                                                                       Block for the entire subsystem

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
