Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6031BF0D9
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Apr 2020 09:10:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 548C3C36B13;
	Thu, 30 Apr 2020 07:10:34 +0000 (UTC)
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75C3FC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 20:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y8MYBDFCYPC4U8pxIx3v4pRrJy5sBdcHs+qbfFFaKhU=; b=HTOA934A6qy/XJhCXv7JieZkm9
 VDL/VwsXQXfZKMgebwhoX79DwCe1dEyeNLemwXBIk8tM5mFwdDDYFvPECAQCzz75BADr6511h+kZm
 b8xC6rq+M3ApF0SyHRlkvEHJekU7J0f4DZ8eUQvE4QuZoVDF0ga3EBnACXPC9HY9MiFJVOENmdDtj
 V6tmcJNN1od8LGMdW7BZHbnD6DX6UdWZuMsTjoiZDME+RGH4YX2Cz59VwIWX2x2edHepq3assRPm5
 7v+9TI4QaC6GTRJwyxxr7pBa0wkQ6YQmJFqwDC/WN7rMHSh9ev0BsCPqOzmnf/buNsVuHQbXNNHod
 d6QWNSXQ==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:40316 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <david@lechnology.com>)
 id 1jTtCd-0005BN-Mc; Wed, 29 Apr 2020 16:21:07 -0400
To: William Breathitt Gray <vilhelm.gray@gmail.com>, jic23@kernel.org
References: <cover.1588176662.git.vilhelm.gray@gmail.com>
From: David Lechner <david@lechnology.com>
Message-ID: <a6402ade-648d-6e49-85cd-a7fd7f58fd1d@lechnology.com>
Date: Wed, 29 Apr 2020 15:21:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <cover.1588176662.git.vilhelm.gray@gmail.com>
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
X-Mailman-Approved-At: Thu, 30 Apr 2020 07:10:31 +0000
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org,
 felipe.balbi@linux.intel.com, linux-iio@vger.kernel.org, syednwaris@gmail.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, patrick.havelange@essensium.com,
 fabrice.gasnier@st.com, fabien.lahoudere@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 4/29/20 1:11 PM, William Breathitt Gray wrote:
> Over the past couple years we have noticed some shortcomings with the
> Counter sysfs interface. Although useful in the majority of situations,
> there are certain use-cases where interacting through sysfs attributes
> can become cumbersome and inefficient. A desire to support more advanced
> functionality such as timestamps, multi-axis positioning tables, and
> other such latency-sensitive applications, has motivated a reevaluation
> of the Counter subsystem. I believe a character device interface will be
> helpful for this more niche area of counter device use.

Nice to see some progress being made. :-)

> 
> Interaction with Counter character devices occurs via ioctl commands.
> This allows userspace applications to access and set counter data using
> native C datatypes rather than working through string translations.

For most aspects of the counter subsystem, this is not an issue since
configuring a counter is not a time-sensitive operation. Instead of
ioctls, I was expecting to just be able to read the character device
and receive counter events or poll to wait for events similar to how
the input subsystem works or how buffers work in the iio subsystem.

I'm afraid I don't really see much use in having ioctls that do
exactly what sysfs already does. And my intuition tells me that the
extra work needed to maintain it will probably cost more than any
benefit gained. (Maybe other have a different experience that leads
to a different conclusion?)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
