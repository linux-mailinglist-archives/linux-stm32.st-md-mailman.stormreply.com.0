Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0225131D8C
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2020 03:23:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7286FC36B0B;
	Tue,  7 Jan 2020 02:23:05 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 848DFC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2020 02:23:04 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:1c3::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 06F32159E228D;
 Mon,  6 Jan 2020 18:23:01 -0800 (PST)
Date: Mon, 06 Jan 2020 18:22:59 -0800 (PST)
Message-Id: <20200106.182259.1907306689510314367.davem@davemloft.net>
To: Jiping.Ma2@windriver.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <15aedd71-e077-4c6c-e30c-9396d16eaeec@windriver.com>
References: <20200106023341.206459-1-jiping.ma2@windriver.com>
 <20200106.134557.2214546621758238890.davem@redhat.com>
 <15aedd71-e077-4c6c-e30c-9396d16eaeec@windriver.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 06 Jan 2020 18:23:02 -0800 (PST)
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stmmac: debugfs entry name is not be
 changed when udev rename device name.
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

From: Jiping Ma <Jiping.Ma2@windriver.com>
Date: Tue, 7 Jan 2020 09:00:53 +0800

> 
> 
> On 01/07/2020 05:45 AM, David Miller wrote:
>> From: Jiping Ma <jiping.ma2@windriver.com>
>> Date: Mon, 6 Jan 2020 10:33:41 +0800
>>
>>> Add one notifier for udev changes net device name.
>>>
>>> Signed-off-by: Jiping Ma <jiping.ma2@windriver.com>
>> This doesn't apply to 'net' and since this is a bug fix that is where
>> you should target this change.
> What's the next step that I can do?

Respin your patch against the net GIT tree so that it applies clean.y
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
