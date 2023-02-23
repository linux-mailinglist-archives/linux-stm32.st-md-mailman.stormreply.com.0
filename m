Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 417336A0AC2
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Feb 2023 14:38:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5324C65E73;
	Thu, 23 Feb 2023 13:38:49 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08991C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Feb 2023 13:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677159528; x=1708695528;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=xU9sIOXRu6td6YUJAIfvMlllIAPZQdGRDoQeJHcU1As=;
 b=fB/Mw28rE/5jVhALrPpWA4S991ShGUVWQqNKVFmpcvjMrbaEA6WGFlOG
 GCKrHZcPDninGVgkGmoTbm3CSUzMAiRPNeDNpGbyrmq8B35U0eLIX52sI
 bSxPS5FDw5Pa1hSQXkGN033JNCdoglKBCj65BKlFh8Hap9a4wcdQ8QdbZ
 7lLoDeZ6umr9f67xFwZF9v+cvskhZpaBL/a5YK4zMqr36f6Qy7O+0m/1o
 8T/tEXz157aEKqt/0AzgX9lC7lYRODwdAlPGBV1BZEc2cmJwqljiy41d8
 DT1YazjzApccELPuCkezSFCvuaU0/EnZzHsNqDiDW2W18dHjGktW52S+v Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="335417538"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; d="scan'208";a="335417538"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 05:38:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="917988849"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; d="scan'208";a="917988849"
Received: from ubik.fi.intel.com (HELO localhost) ([10.237.72.184])
 by fmsmga006.fm.intel.com with ESMTP; 23 Feb 2023 05:38:42 -0800
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Jinlong Mao <quic_jinlmao@quicinc.com>, Mike Leach
 <mike.leach@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <dad2f816-34b5-80d9-ad78-14d759ac45eb@quicinc.com>
References: <1dab6648-c177-17a7-0b36-821e21328753@quicinc.com>
 <bf14c6e2-71c4-2987-28c7-e8b51636a46f@arm.com>
 <CAJ9a7Vjyc-T+LjHtBBYO2MS15z1sVUYxQro_5YpZ9oGMiB0GZA@mail.gmail.com>
 <dad2f816-34b5-80d9-ad78-14d759ac45eb@quicinc.com>
Date: Thu, 23 Feb 2023 15:38:42 +0200
Message-ID: <87r0ugo61p.fsf@ubik.fi.intel.com>
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

> On PC tool, it can show the logs from ETR in real time.
>
> When one small packet send from STM to ETR, it can be stuck between STM 
> and ETR.
> When the packet stuck happens, it will be flushed to ETR only when some 
> other packets
> generated from STM source or CTI flush commands are sent. If the time is 
> too long to wait
> for next packets coming, user will consider that issue happens with 
> previous small packet.
> And user's requirement is that packet from STM can be flushed to ETR 
> automatically instead
> of sending commands manually.
>
> Is it appropriate to add a sysfs node for STM to generate the trigger 
> packet periodically for such case ?

There's stm_heartbeat that will send a string via STM on a timer. It
will come on its own channel, so your PC tool should be able to ignore
it. Would that help?

Regards,
--
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
