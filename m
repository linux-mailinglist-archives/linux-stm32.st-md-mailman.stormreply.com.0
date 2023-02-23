Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E436A0E43
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Feb 2023 17:56:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 314A2C65E73;
	Thu, 23 Feb 2023 16:56:38 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 399BCC65E59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Feb 2023 16:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677171396; x=1708707396;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=oH2BZxXZCejYy11Mr+TIFwxSKHGVT1k6IMl/AyNGQfA=;
 b=Ra7wsQSwl4k+xOkvhIW393OkGEeVWQNR38oMyiDVVMn3ue7Up9DIWzys
 uYRFpA5XQC9UUdTZ25Tt2OzvWiBslClMMTNJSRkBOO73e9meta/9wGpV/
 MVFUlZgoc2pO2VUuU3oSyqOcN7OqlVFfIBekFgH2sYvBog+jfNeeSoL6/
 QEKjiwFOt4Yw16XVWDNU/vrTm9j4ddumGFrEu8vGdQxFWWZwVMCS7Tgl0
 R5J+Rn9VTcrRiQ+zZsPB/eV84rPj3b7SRsVl/lHgBIYhw9zCN58TKbPMW
 IXBKV0UFVI1czvbTk9JfBFGbjnLpXjFnLwjfhKW87ZHZWBJ+wd6oAYnZQ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="334660996"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="334660996"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 08:56:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="796375753"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="796375753"
Received: from ubik.fi.intel.com (HELO localhost) ([10.237.72.184])
 by orsmga004.jf.intel.com with ESMTP; 23 Feb 2023 08:56:14 -0800
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Jinlong Mao <quic_jinlmao@quicinc.com>, Mike Leach
 <mike.leach@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <465477c5-98f2-ded7-cd1c-a946f7b3d260@quicinc.com>
References: <1dab6648-c177-17a7-0b36-821e21328753@quicinc.com>
 <bf14c6e2-71c4-2987-28c7-e8b51636a46f@arm.com>
 <CAJ9a7Vjyc-T+LjHtBBYO2MS15z1sVUYxQro_5YpZ9oGMiB0GZA@mail.gmail.com>
 <dad2f816-34b5-80d9-ad78-14d759ac45eb@quicinc.com>
 <87r0ugo61p.fsf@ubik.fi.intel.com>
 <465477c5-98f2-ded7-cd1c-a946f7b3d260@quicinc.com>
Date: Thu, 23 Feb 2023 18:56:14 +0200
Message-ID: <87o7pknwwh.fsf@ubik.fi.intel.com>
MIME-Version: 1.0
Cc: alexander.shishkin@linux.intel.com,
 Coresight ML <coresight@lists.linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>
Subject: Re: [Linux-stm32] [RFC] Add trig_ts function in STM to generate
 TRIG_TS packet periodically
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

Jinlong Mao <quic_jinlmao@quicinc.com> writes:

> On 2/23/2023 9:38 PM, Alexander Shishkin wrote:
>
>> There's stm_heartbeat that will send a string via STM on a timer. It
>> will come on its own channel, so your PC tool should be able to ignore
>> it. Would that help?
>
> Hi Alex,
>
> It helps with my case.
> How to implement it ?

It's already there, just enable CONFIG_STM_SOURCE_HEARTBEAT, load the
stm_heartbeat module and configure it in sysfs.

Regards,
--
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
