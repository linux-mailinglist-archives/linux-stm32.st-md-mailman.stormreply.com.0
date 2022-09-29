Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B31335EF356
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Sep 2022 12:21:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4406DC64100;
	Thu, 29 Sep 2022 10:21:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23075C640FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Sep 2022 10:21:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD5C22309;
 Thu, 29 Sep 2022 03:21:21 -0700 (PDT)
Received: from [10.57.66.102] (unknown [10.57.66.102])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F403D3F73B;
 Thu, 29 Sep 2022 03:21:12 -0700 (PDT)
Message-ID: <0007218f-96f0-c348-0dfb-7cb54f014b1c@arm.com>
Date: Thu, 29 Sep 2022 11:21:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
To: James Clark <james.clark@arm.com>, zhangsongyi.cgel@gmail.com
References: <20220927115136.259926-1-zhang.songyi@zte.com.cn>
 <b8ad73ea-a20e-0e74-766e-eeb4cdeb1890@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <b8ad73ea-a20e-0e74-766e-eeb4cdeb1890@arm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
 Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, leo.yan@linaro.org,
 zhang songyi <zhang.songyi@zte.com.cn>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 mike.leach@linaro.org
Subject: Re: [Linux-stm32] [PATCH linux-next] coresight: use sysfs_emit() to
 instead of scnprintf()
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

On 28/09/2022 15:56, James Clark wrote:
> 
> 
> On 27/09/2022 12:51, zhangsongyi.cgel@gmail.com wrote:
>> From: zhang songyi <zhang.songyi@zte.com.cn>
>>
>> Follow the advice of the Documentation/filesystems/sysfs.rst and show()
>> should only use sysfs_emit() or sysfs_emit_at() when formatting the value
>> to be returned to user space.
>>
>> Reported-by: Zeal Robot <zealci@zte.com.cn>
>> Signed-off-by: zhang songyi <zhang.songyi@zte.com.cn>


>> ---
>>   drivers/hwtracing/coresight/coresight-stm.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
> 
> Reviewed-by: James Clark <james.clark@arm.com>


I have queued this locally for now, will push it once the next
cycle is out.

Suzuki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
