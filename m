Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DF13C3543
	for <lists+linux-stm32@lfdr.de>; Sat, 10 Jul 2021 17:43:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78DB9C57B60;
	Sat, 10 Jul 2021 15:43:33 +0000 (UTC)
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97377C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Jul 2021 15:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MkQ/Slfts7ACEfWSN/fpQzxSSjabaiQStVowDOxpxEc=; b=z+zONT8Jj4Iy/OXEkcL3LY6jcM
 eRSGZXlyfS6KcTgQ8SnUBI17hNj7oee+zC2i4wlxfLlfi4HM5/DyLDDrsTSVJG859csv8B4zuy5+l
 c4sBVP1GFnYYhXHiPpB5A3sqJkte1gStaqRnZpQPUrVj6Xux27LU+nMVlOIu9qFVwCqyca/iWFiZC
 6yvBdcV22zxsJmTSKIDxLRiD1s53g9byv8i1OYhZZXiY+6lMVEXHkLZSI4pp+b6B5gvMT8FVFbyiF
 Z7tEn+7fjLw+XY7dLTIE5MhSZ8vvlqC3wimHuEt+BLkVdpZA0axXnxhp89t9pqmBVUtjBTQhXkNLo
 8KuWrxLg==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:45586 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <david@lechnology.com>)
 id 1m2F8J-00GUFW-Jv; Sat, 10 Jul 2021 11:43:26 -0400
To: William Breathitt Gray <vilhelm.gray@gmail.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>
References: <cover.1625471640.git.vilhelm.gray@gmail.com>
 <e298043c880b350a42bdc40452376a3708bf533b.1625471640.git.vilhelm.gray@gmail.com>
 <1a624011-0b43-ac42-be53-a42f81923e5a@linux.intel.com>
 <YOl1frCrophjhk7y@shinobu>
From: David Lechner <david@lechnology.com>
Message-ID: <fbf1ba4c-412b-fe22-0e79-76e968a00fb4@lechnology.com>
Date: Sat, 10 Jul 2021 10:43:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOl1frCrophjhk7y@shinobu>
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
 o.rempel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v12 15/17] counter: Implement
 events_queue_size sysfs attribute
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

On 7/10/21 5:25 AM, William Breathitt Gray wrote:
>> and after that
>>
>> [   16.564403] ================================================
>> [   16.570725] WARNING: lock held when returning to user space!
>> [   16.577044] 5.13.0-next-20210706+ #4 Not tainted
>> [   16.582198] ------------------------------------------------
>> [   16.588507] cat/331 is leaving the kernel with locks still held!
>> [   16.595214] 1 lock held by cat/331:
>> [   16.599103]  #0: ffff888102bb3630
>> (&counter->chrdev_lock){+.+.}-{3:3}, at: counter_chrdev_open+0x21/0x60
>> [counter]
>>
>> Jarkko
> I'm not sure how to resolve this warning. The purpose of this lock is to
> limit chrdev to a single open at a time. To accomplish this I grab this
> lock in counter_chrdev_open() and hold it until counter_chrdev_release()
> is called. Is there a better way to accomplish this?

How about using an atomic flag, e.g test_and_set_bit()?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
