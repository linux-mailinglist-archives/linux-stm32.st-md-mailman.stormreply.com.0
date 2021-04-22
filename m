Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 523C7367A01
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Apr 2021 08:35:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09674C58D5C;
	Thu, 22 Apr 2021 06:35:04 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A287C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Apr 2021 06:35:00 +0000 (UTC)
IronPort-SDR: S5YL2MNF3ZuQBFnJpwh7G7nQIuLdRzXQHDhJS++GOfTN0ytLmcKdyx3sZ9M2FNw2IS0ykT9RqK
 D4B5XbntiF9Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="195392201"
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; d="scan'208";a="195392201"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 23:34:58 -0700
IronPort-SDR: N/VdHPgKMmnCktx4S1kk0xv2cVIku/kjvc542q4RO5SjiE13e4jhIuMmjIFzPAycFgCO8IQ/Tx
 lru/cqQLORNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; d="scan'208";a="453172193"
Received: from um.fi.intel.com (HELO um) ([10.237.72.62])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Apr 2021 23:34:56 -0700
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Yu Kuai <yukuai3@huawei.com>, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
In-Reply-To: <20210407125358.4135345-1-yukuai3@huawei.com>
References: <20210407125358.4135345-1-yukuai3@huawei.com>
Date: Thu, 22 Apr 2021 09:34:55 +0300
Message-ID: <87o8e6esj4.fsf@ashishki-desk.ger.corp.intel.com>
MIME-Version: 1.0
Cc: yi.zhang@huawei.com, alexander.shishkin@linux.intel.com,
 linux-kernel@vger.kernel.org, yukuai3@huawei.com, zhangxiaoxu5@huawei.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stm class: initialize static variable in
	declaration
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

Yu Kuai <yukuai3@huawei.com> writes:

> mutex lock can be initialized automatically with DEFINE_MUTEX()
> rather than explicitly calling mutex_init().
>
> list head can be initialized automatically with LIST_HEAD() rather
> than explicitly calling INIT_LIST_HEAD().
>
> srcu_struct can be initialized automatically with DEFINE_STATIC_SRCU()
> rather than explicitly calling init_srcu_struct().

What's missing is the "why". We can do these or we can keep them as they
are. Each choice has impact on .text/.data, for instance. Why is one
preferred over the other?

Each patch should contain some form of analysis that shows that the
author thought about why they made the patch in the first
place.

And please learn not to spam the STMicro people with patches for System
Trace Module. Sometimes the same acronym can mean multiple different
things. This is another sign that the patch author spent zero time
getting to know the code that they are patching.

Regards,
--
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
