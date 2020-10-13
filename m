Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7F528C62D
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Oct 2020 02:35:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C57CC3FAD5;
	Tue, 13 Oct 2020 00:35:20 +0000 (UTC)
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25845C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Oct 2020 00:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i3DN6BtJb3Jcv8rh81sTBY6UT+tAKn+rVAVT3o7iIs0=; b=LCWAFnRQ9KOZLwI3SDaZMqncKF
 f/DMPsIh8viZE5VxEU395L0jKfZ8dHRv62q3AUsfR32nPKPduHKBTAcODM2InG2K5L9el+tpax9lu
 RvXe2CekmCNzDQHRTFFJMNKSPaf4ROoDVJWaiGbGvnPxPnmCMpRLLGogchn7I6YAMjMssrq+eRPnh
 pUetcBTuhuR+6qCd1PI3sePSJ2uQYE8990YSxuSwWmq6uhcJriMzwMTZVCj3ybIcvJGvsjwZ3nE+j
 ENd2JhPRPtymm+u+khNB97+5AQe1/KRpoi59MZmIZJ9ksLZz80kd8T/J1WfaRNPWz3zqoX6/eTzow
 ebDqpVoQ==;
Received: from [2600:1700:4830:165f::19e] (port=56668)
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <david@lechnology.com>)
 id 1kS8HZ-0000vN-Pn; Mon, 12 Oct 2020 20:35:13 -0400
To: William Breathitt Gray <vilhelm.gray@gmail.com>, jic23@kernel.org
References: <cover.1601170670.git.vilhelm.gray@gmail.com>
From: David Lechner <david@lechnology.com>
Message-ID: <caeeb0b2-6b66-b623-98e3-acdc261ec20e@lechnology.com>
Date: Mon, 12 Oct 2020 19:35:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cover.1601170670.git.vilhelm.gray@gmail.com>
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
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 0/5] Introduce the Counter character
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

On 9/26/20 9:18 PM, William Breathitt Gray wrote:
> The following are some questions I have about this patchset:
> 
> 1. Should standard Counter component data types be defined as u8 or u32?
> 
>     Many standard Counter component types such COUNTER_COMP_SIGNAL_LEVEL
>     have standard values defined (e.g. COUNTER_SIGNAL_LEVEL_LOW and
>     COUNTER_SIGNAL_LEVEL_HIGH). These values are currently handled by the
>     Counter subsystem code as u8 data types.
> 
>     If u32 is used for these values instead, C enum structures could be
>     used by driver authors to implicit cast these values via the driver
>     callback parameters; userspace would still use u32 with no issue.
> 
>     In theory this can work because GCC will treat enums are having a
>     32-bit size; but I worry about the possibility of build targets that
>     have -fshort-enums enabled, resulting in enums having a size less
>     than 32 bits. Would this be a problem?

We shouldn't have to worry about userspace programs using -fshort-enums
since that would break all kernel interfaces that use enums, not just
these - so no one should be using that compiler flag.

So I am in favor of using strongly typed enums with u32 as the
"generic" enum member type.

> 
> 2. Should I have reserved members in the userspace structures?
> 
>     The structures in include/uapi/linux/counter.h are available to
>     userspace applications. Should I reserve space in these structures
>     for future additions and usage? Will endianess and packing be a
>     concern here?
> 
Since there doesn't seem to be a large number of counter devices
this probably isn't critical. Are there any aspects of counter
devices in general that couldn't be described with the proposed
structures? For example, could there be components more than two
levels deep (i.e. it would need id, parent id and grandparent id
to describe fully)?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
