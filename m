Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CBD131DCB
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2020 03:59:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5911C36B0B;
	Tue,  7 Jan 2020 02:59:41 +0000 (UTC)
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E85BC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2020 02:59:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
 [147.11.189.40])
 by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0072xPTi000318
 (version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
 Mon, 6 Jan 2020 18:59:25 -0800 (PST)
Received: from [128.224.162.195] (128.224.162.195) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
 Mon, 6 Jan 2020 18:59:24 -0800
To: David Miller <davem@davemloft.net>
References: <20200106023341.206459-1-jiping.ma2@windriver.com>
 <20200106.134557.2214546621758238890.davem@redhat.com>
 <15aedd71-e077-4c6c-e30c-9396d16eaeec@windriver.com>
 <20200106.182259.1907306689510314367.davem@davemloft.net>
From: Jiping Ma <Jiping.Ma2@windriver.com>
Message-ID: <99d183bc-7668-7749-54d6-3649c549dec8@windriver.com>
Date: Tue, 7 Jan 2020 10:59:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20200106.182259.1907306689510314367.davem@davemloft.net>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 01/07/2020 10:22 AM, David Miller wrote:
> From: Jiping Ma <Jiping.Ma2@windriver.com>
> Date: Tue, 7 Jan 2020 09:00:53 +0800
>
>>
>> On 01/07/2020 05:45 AM, David Miller wrote:
>>> From: Jiping Ma <jiping.ma2@windriver.com>
>>> Date: Mon, 6 Jan 2020 10:33:41 +0800
>>>
>>>> Add one notifier for udev changes net device name.
>>>>
>>>> Signed-off-by: Jiping Ma <jiping.ma2@windriver.com>
>>> This doesn't apply to 'net' and since this is a bug fix that is where
>>> you should target this change.
>> What's the next step that I can do?
> Respin your patch against the net GIT tree so that it applies clean.y
OK, I will generate the new patch based on the latest linux kernel code.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

Thanks,

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
