Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FF61C0790
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Apr 2020 22:13:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56475C36B0E;
	Thu, 30 Apr 2020 20:13:49 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74F9EC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 20:13:47 +0000 (UTC)
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr
 [86.202.105.35])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 9F8B7FF80A;
 Thu, 30 Apr 2020 20:13:45 +0000 (UTC)
Date: Thu, 30 Apr 2020 22:13:45 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20200430201345.GX51277@piout.net>
References: <cover.1588176662.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1588176662.git.vilhelm.gray@gmail.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 felipe.balbi@linux.intel.com, linux-iio@vger.kernel.org, syednwaris@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, patrick.havelange@essensium.com,
 fabrice.gasnier@st.com, fabien.lahoudere@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/4] Introduce the Counter character
	device interface
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

Hi,

On 29/04/2020 14:11:34-0400, William Breathitt Gray wrote:
> Over the past couple years we have noticed some shortcomings with the
> Counter sysfs interface. Although useful in the majority of situations,
> there are certain use-cases where interacting through sysfs attributes
> can become cumbersome and inefficient. A desire to support more advanced
> functionality such as timestamps, multi-axis positioning tables, and
> other such latency-sensitive applications, has motivated a reevaluation
> of the Counter subsystem. I believe a character device interface will be
> helpful for this more niche area of counter device use.
> 
> To quell any concerns from the offset: this patchset makes no changes to
> the existing Counter sysfs userspace interface -- existing userspace
> applications will continue to work with no modifications necessary. I
> request that driver maintainers please test their applications to verify
> that this is true, and report any discrepancies if they arise.
> 

On that topic, I'm wondering why the counter subsystem uses /sys/bus
instead of /sys/class that would be more natural for a class of devices.
I can't see how counters would be considered busses. I think you should
consider moving it over to /sys/class (even if deprecating
/sys/bus/counter will be long).

> Interaction with Counter character devices occurs via ioctl commands.
> This allows userspace applications to access and set counter data using
> native C datatypes rather than working through string translations.
> 

I agree with David that you should consider using read to retrieve the
counter data as this will simplify interrupt handling/polling and
blocking/non-blocking reads can be used by an application. ABI wise,
this can also be a good move as you could always consider having an
ioctl requesting a specific format when reading the device so you are
not stuck with the initial format you are going to choose.

> 2. Should device driver callbacks return int or long? I sometimes see
>    error values returned as long (e.g. PTR_ERR(), the file_operations
>    structure's ioctl callbacks, etc.); when is it necessary to return
>    long as opposed to int?
> 

You should use a long if you ever have to return a point as it is
guaranteed to have the correct size. Else, just stick to an int if you
are not going to overflow it.

> 3. I only implemented the unlocked_ioctl callback. Should I implement a
>    compat_ioctl callback as well?
> 

The compat_ioctl is to handle 32bit userspace running on a 64bit kernel.
If your structures have the same size in both cases, then you don't have
to implement compat_ioctl.

Have a look at Documentation/driver-api/ioctl.rst


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
