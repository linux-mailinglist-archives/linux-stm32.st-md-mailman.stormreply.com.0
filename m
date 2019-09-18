Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C03BB5EC9
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Sep 2019 10:11:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D915C35E01;
	Wed, 18 Sep 2019 08:11:44 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE7D8C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Sep 2019 08:11:42 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id q12so3846732pff.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Sep 2019 01:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1kt52piGCszTl70H4pa06OcEaxVvwVxHoVcQxPYlKbY=;
 b=anqx7V8EjerzzPAIp9aAxJkLeOTQxqJTZ0d9gLG2reGjLaMQvyQqygL0RPEj47FXMz
 fkv/QXlHtNt+9kjpapz35LOT7NvnIUVLADITnpUNJWyUDketSqpKPcbycqV6z6Bea01Z
 bmtuCa8BRhpP08Hp4ZWF+I0ARyrypcMTOVUAqlPjGOi+w3OjtmaWRl7umkE9DdGzkPVB
 feHR/vwRisEGMCfYlTBaBRKzk5esjs4wFGenxza2gvxs0Do6y9UtmSz6Z2mOvUiKu5ns
 rpUCp9P3uKIlESMBNG6cDeNTj3awCt8IfI/4XZ0lFzKZJPmMgP4R/0BJyKKvVNLryMH4
 qNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1kt52piGCszTl70H4pa06OcEaxVvwVxHoVcQxPYlKbY=;
 b=MpCSS3xEiBGzTazPeuzitaRkIMxHdE8pnAw8gtjPFBRU2suDnd1NQRkRcSKqFy5LYT
 Mjz95lOZI4kFLfV80ZemERiDz1Qeu/or0Kt6Wot9wdX2shvnCeFOsh4sUZbAsF0cqVTR
 9du2L2Zcu26vdNEuJI6+KzRuy/QVAlDL1PWGqXM3k4NCmgh3JADu/yp5YAbw3uz02jM3
 4DJCI5QbpotAbuvHKt4j0Fl5FG3KRRmaTEUH17xjCVzTkBkLLeGYCO1qqrMk0md2WRGa
 U+LPO0zCU7lm+cNiNKy1Xj3Yg6KS8GN24XuoDvgSliaVi6384oRjnyF9bvaCwLQR4cGb
 Ts9A==
X-Gm-Message-State: APjAAAWy+/pIYnFv/bNNaWWutjjtEEj/Ym6GDfwUV6Wbal9HBXrc2+Z0
 g/JLWa5uZKUYa5ImLpU4Ioo=
X-Google-Smtp-Source: APXvYqz077aU1JxIhBBSwQ3uyYJbJ20ubV9x7Vo718eJX19q9Dq7iVLPEGgZnDCOEboiA3hV3ColHw==
X-Received: by 2002:a65:6104:: with SMTP id z4mr2725357pgu.27.1568794301026;
 Wed, 18 Sep 2019 01:11:41 -0700 (PDT)
Received: from icarus ([2001:268:c147:d9df:f819:e399:825f:f2dc])
 by smtp.gmail.com with ESMTPSA id b5sm4755506pgb.68.2019.09.18.01.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 01:11:40 -0700 (PDT)
Date: Wed, 18 Sep 2019 17:11:21 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@jic23.retrosnub.co.uk
Message-ID: <20190918081121.GA7262@icarus>
References: <cover.1568792697.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1568792697.git.vilhelm.gray@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/7] counter: Simplify
 count_read/count_write/signal_read
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

On Wed, Sep 18, 2019 at 04:52:41PM +0900, William Breathitt Gray wrote:
> Changes in v2:
>  - Update the rest of the drivers under drivers/counter

Jonathan,

The TI eQEP driver also needs a patch for these changes if this patchset
is merged.

How would you like to handle the merge? We have an full cycle until the
5.5 merge window, so I can keep this patchset in my personal repository,
adding in the ChromeOS EC driver and Intel QEP driver when they are
ready, then send you a git pull request during the 5.5 merge window. Or
we can keep going as usual and merge this into your IIO repository, then
handle the TI eQEP driver when the time comes to merge.

William Breathitt Gray

> The changes in this patchset will not affect the userspace interface.
> Rather, these changes are intended to simplify the kernelspace Counter
> callbacks for counter device driver authors.
> 
> The following main changes are proposed:
> 
> * Retire the opaque counter_count_read_value/counter_count_write_value
>   structures and simply represent count data as an unsigned integer.
> 
> * Retire the opaque counter_signal_read_value structure and represent
>   Signal data as a counter_signal_value enum.
> 
> These changes should reduce some complexity and code in the use and
> implementation of the count_read, count_write, and signal_read
> callbacks.
> 
> The opaque structures for Count data and Signal data were introduced
> originally in anticipation of supporting various representations of
> counter data (e.g. arbitrary-precision tallies, floating-point spherical
> coordinate positions, etc). However, with the counter device drivers
> that have appeared, it's become apparent that utilizing opaque
> structures in kernelspace is not the best approach to take.
> 
> I believe it is best to let userspace applications decide how to
> interpret the count data they receive. There are a couple of reasons why
> it would be good to do so:
> 
> * Users use their devices in unexpected ways.
> 
>   For example, a quadrature encoder counter device is typically used to
>   keep track of the position of a motor, but a user could set the device
>   in a pulse-direction mode and instead use it to count sporadic rising
>   edges from an arbitrary signal line unrelated to positioning. Users
>   should have the freedom to decide what their data represents.
> 
> * Most counter devices represent data as unsigned integers anyway.
> 
>   For example, whether the device is a tally counter or position
>   counter, the count data is represented to the user as an unsigned
>   integer value. So specifying that one device is representing tallies
>   while the other specifies positions does not provide much utility from
>   an interface perspective.
> 
> For these reasons, the count_read and count_write callbacks have been
> redefined to pass count data directly as unsigned long instead of passed
> via opaque structures:
> 
>         count_read(struct counter_device *counter,
>                    struct counter_count *count, unsigned long *val);
>         count_write(struct counter_device *counter,
>                     struct counter_count *count, unsigned long val);
> 
> Similarly, the signal_read is redefined to pass Signal data directly as
> a counter_signal_value enum instead of via an opaque structure:
> 
>         signal_read(struct counter_device *counter,
>                     struct counter_signal *signal,
>                     enum counter_signal_value *val);
> 
> The counter_signal_value enum is simply the counter_signal_level enum
> redefined to remove the references to the Signal data "level" data type.
> 
> William Breathitt Gray (7):
>   counter: Simplify the count_read and count_write callbacks
>   counter: Simplify the signal_read callback
>   docs: driver-api: generic-counter: Update Count and Signal data types
>   counter: 104-quad-8: Update count_read/count_write/signal_read
>     callbacks
>   counter: ftm-quaddec: Update count_read and count_write callbacks
>   counter: stm32-lptimer-cnt: Update count_read callback
>   counter: stm32-timer-cnt: Update count_read and count_write callbacks
> 
>  Documentation/driver-api/generic-counter.rst |  22 ++--
>  drivers/counter/104-quad-8.c                 |  33 ++----
>  drivers/counter/counter.c                    | 101 +++----------------
>  drivers/counter/ftm-quaddec.c                |  14 +--
>  drivers/counter/stm32-lptimer-cnt.c          |   5 +-
>  drivers/counter/stm32-timer-cnt.c            |  17 +---
>  include/linux/counter.h                      |  74 ++------------
>  7 files changed, 53 insertions(+), 213 deletions(-)
> 
> -- 
> 2.23.0
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
