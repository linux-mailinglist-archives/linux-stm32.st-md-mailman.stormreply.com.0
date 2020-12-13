Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C662D9120
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Dec 2020 00:15:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88CA2C3FAD5;
	Sun, 13 Dec 2020 23:15:20 +0000 (UTC)
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB3A2C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Dec 2020 23:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zyX8hLy2iIEuQf2PAeLxUnbs+rlbHoQgAw1c0qZ61gU=; b=CPGnz8S9nYyg8v5NuWAmTtJEur
 YQCJPYgVhwHp54+Gzr2+NpvVK3uyzUP4SHUFv8ZcXZuI8TaKLOu2DTRKbbyQqctBa24P/3QTR+Fkv
 PNuZZlJ8OwMKtlvxAKjl47/xc5OJEHkDR3yFqcQzwk4ETFjsHLsNMmadv0Q2uO5pmi114ZFkcr+HE
 Fhlq/ld2MySrlodCtsEsRxwEB3FFNEZc9M0ezHrKMH5fGLlarhf1q74ZgCcsQ+AWe05I3u6hTWMr3
 uzSOMK2rcAF5+6gsHFqyuHYsCmsbJtJ7AvXt11zNkgD1ibtqqm1NfGqx1uYK02F3xfglu4+vWGKf9
 efsKoClg==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:38102 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <david@lechnology.com>)
 id 1koaaB-0008Rk-QQ; Sun, 13 Dec 2020 18:15:15 -0500
To: William Breathitt Gray <vilhelm.gray@gmail.com>, jic23@kernel.org
References: <cover.1606075915.git.vilhelm.gray@gmail.com>
From: David Lechner <david@lechnology.com>
Message-ID: <6f0d78ae-9724-f67f-f133-a1148a5f1688@lechnology.com>
Date: Sun, 13 Dec 2020 17:15:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cover.1606075915.git.vilhelm.gray@gmail.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - st-md-mailman.stormreply.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, mcoquelin.stm32@gmail.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 0/5] Introduce the Counter character
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 11/22/20 2:29 PM, William Breathitt Gray wrote:
> 
> 1. Should standard Counter component data types be defined as u8 or u32?
> 
>     Many standard Counter component types such COUNTER_COMP_SIGNAL_LEVEL
>     have standard values defined (e.g. COUNTER_SIGNAL_LEVEL_LOW and
>     COUNTER_SIGNAL_LEVEL_HIGH). These values are currently handled by the
>     Counter subsystem code as u8 data types.
> 
>     If u32 is used for these values instead, C enum structures could be
>     used by driver authors to implicitly cast these values via the driver
>     callback parameters.
> 
>     This question is primarily addressed to David Lechner. I'm somewhat
>     confused about how this setup would look in device drivers. I've gone
>     ahead and refactored the code to support u32 enums, and pushed it to
>     a separate branch on my repository called counter_chrdev_v6_u32_enum:
>     https://gitlab.com/vilhelmgray/iio/-/tree/counter_chrdev_v6_u32_enum
> 
>     Please check it out and let me know what you think. Is this the
>     support you had in mind? I'm curious to see an example of how would
>     your driver callback functions would look in this case. If everything
>     works out fine, then I'll submit this branch as v7 of this patchset.

I haven't had time to look at this in depth, but just superficially looking
at it, it is mostly there. The driver callback would just use the enum type
in place of u32. For example:

static int ti_eqep_function_write(struct counter_device *counter,
				  struct counter_count *count,
				  enum counter_function function)

and the COUNTER_FUNCTION_* constants would be defined as:

enum counter_function {
	COUNTER_FUNCTION_INCREASE,
	...
};

instead of using #define macros.

One advantage I see to using u8, at least in the user API data structures,
is that it increases the number of events that fit in the kfifo buffer by
a significant factor.

And that is not to say that we couldn't do both: have the user API structs
use u8 for enum values and still use u32/strong enum types internally in
the callback functions.



> 
> 2. How should we handle "raw" timestamps?
> 
>     Ahmad Fatoum brought up the possibility of returning "raw" timestamps
>     similar to what the network stack offers (see the network stack
>     SOF_TIMESTAMPING_{RAW,SYS}_HARDWARE support).
> 
>     I'm not very familiar with the networking stack code, but if I
>     understand correctly the SOF_TIMESTAMPING_RAW_HARDWARE timestamps are
>     values returned from the device. If so, I suspect we would be able to
>     support these "raw" timestamps by defining them as Counter Extensions
>     and returning them in struct counter_event elements similar to the
>     other Extension values.

Is nanosecond resolution good enough? In the TI eQEP driver I considered
returning the raw timer value, but quickly realized that it would not be
very nice to expect the user code to know the clock rate of the timer. It
was very easy to get the clock rate in the kernel and just convert the
timer value to nanoseconds before returning it to userspace.

So if there is some specialized case where it can be solved no other way
besides using raw timestamps, then sure, include it. Otherwise I think we
should stick with nanoseconds for time values when possible.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
