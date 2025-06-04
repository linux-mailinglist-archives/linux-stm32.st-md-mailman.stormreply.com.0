Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DCFACDA9F
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Jun 2025 11:12:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F1A9C32E92;
	Wed,  4 Jun 2025 09:12:27 +0000 (UTC)
Received: from out203-205-221-191.mail.qq.com (out203-205-221-191.mail.qq.com
 [203.205.221.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9147EC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Jun 2025 09:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1749028327;
 bh=RIYky3gjpTsCWWoJfEf+lc/dCW5mVapm/m/j24bH0IQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=RvfJeaOjVTb7Of+8+ew2DkSYNg+7b58Vk8r8FKbC4BXsnQArGCmWRipHe7pGwqHno
 lT3sv9Qj1BF4uH+DCmxF2iGQPr1DxyQldOAGHj1GcoFxKaJ6ag0OAcqSC3MWW4I76E
 CQn6KrV2Ph1d4Ljzeqwrpn3RIW5YL2CxtoZaaK94=
Received: from [10.56.52.9] ([39.156.73.10])
 by newxmesmtplogicsvrszc16-0.qq.com (NewEsmtp) with SMTP
 id 30098838; Wed, 04 Jun 2025 17:12:00 +0800
X-QQ-mid: xmsmtpt1749028320tno68hupx
Message-ID: <tencent_CC0310590D7085E8B3EC2E1955E45E4B4709@qq.com>
X-QQ-XMAILINFO: NvKPbWBbh1DVYUNrtUaO4h9Jj+nOhO0LDaL7Td6QvGV4lWUff2j/vEKUwNnLFs
 OLHiU8HjtO7X0BTo/mZpmoEGAb9JuMxziyE13yu5EmANI/1w0vmju9epZ/bZzbSXA1flXKOlJCZZ
 0xdvAOAB8VyNKr2QluATxTOYVEe1IAEr29eygOc9y2gqvHEs7zbaNV8svwb2YcQomlJh10O1DWLo
 PXJrtg35/w2KjVub9G4hXlaaODVaIv5HxLJLIeGw8haZVbKol3pxT1UVrVP9PIE6iW6oGW1DASKk
 JglRxN8iFlXFrH408POil0NYTrv4Qls947B0al8UFnJ6xeYWFPfvmK+l6mw3Cl/4BLpWgDOMRt+k
 UrYDh0qAZTVf2FDZg6dIj2VABZbbalypmmpKQdY8zk4jeja07vCJfEocQCBNTybGixtgoKvRvcd0
 dSUcqfu9AgFxz8oM4ks2OZfJVc/+1YSKiZdZ5oWg4JzNvrD9IgDKripzGOCf2gfOXHhj67JKwtdc
 Xvt5qdrp6RIu3qv8q79nDMT9pBldnw+GpvGZd/GLfkykzwt4ZRmcEt2ADl0Bj/tfDN1XajAgi+NF
 AsgwcY3cJtX3K3Gh0WXK45o4Zof4kxKsygFeKzZU7NXl28+E4sH5vCLV4aIsOknG4m5D4CDUYdkm
 ac+ZcB+WCWf2D8wX5w4fMtWUtYNjW7X5EOQolpYsuNItcckXyWQP4hfCMgfdHYjzdbYS0UlIiByU
 buyWQSQCSzDpvNini1IwsOxoHQ0QcHWYCf9zveyqN85O1YLWoGw3uO39Vd/oSSS+IDCnTmE0vPoY
 owrNAXU/M0Msa9kRe2HGy9sJT5ME7CAy1QM/JX+1nQtOq0ShztSqPRXhjEkQ1Q9NeYf8YE416HyZ
 z06m9cTiKe6VUYzTY0knFb75smemeGwBRoXSxAC2fADTT93GciJy/QFtVo0WJYjvAQga58hOqboM
 8qdx5zDNtzNRgK0zCw8mhNrpqwX8kASut9RkRk/ypcFd0xG05u1ALrQq/VzpXCpTMwV84eDOcSsO
 PVaspGNOPthDgcgF8X
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-OQ-MSGID: <365843f4-d33d-490d-b567-fe9250577725@foxmail.com>
Date: Wed, 4 Jun 2025 17:12:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jiri Olsa <olsajiri@gmail.com>
References: <tencent_A6502A28AF21A3CA88B106F3421159869708@qq.com>
 <aEAJbBH00yL2iTgn@krava>
Content-Language: en-US
From: Rong Tao <rtoax@foxmail.com>
In-Reply-To: <aEAJbBH00yL2iTgn@krava>
Cc: Yonghong Song <yonghong.song@linux.dev>,
 Peter Zijlstra <peterz@infradead.org>,
 open list <linux-kernel@vger.kernel.org>, Song Liu <song@kernel.org>,
 rongtao@cestc.cn,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Juntong Deng <juntong.deng@outlook.com>, Mykola Lysenko <mykolal@fb.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, andrii@kernel.org,
 Stanislav Fomichev <sdf@fomichev.me>, Alexei Starovoitov <ast@kernel.org>,
 Amery Hung <ameryhung@gmail.com>, KP Singh <kpsingh@kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Hao Luo <haoluo@google.com>, Oleg Nesterov <oleg@redhat.com>,
 eddyz87@gmail.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "open list:BPF \[SELFTESTS\] \(Test Runners & Infrastructure\)"
 <bpf@vger.kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>
Subject: Re: [Linux-stm32] [PATCH bpf-next] selftests/bpf: Fix compile error
 of bin_attribute::read/write()
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


On 6/4/25 16:53, Jiri Olsa wrote:
> On Wed, Jun 04, 2025 at 01:53:22PM +0800, Rong Tao wrote:
>> From: Rong Tao <rongtao@cestc.cn>
>>
>> Since commit 97d06802d10a ("sysfs: constify bin_attribute argument of
>> bin_attribute::read/write()"), make bin_attribute parameter of
>> bin_attribute::read/write() const.
> hi,
> there's already fix for this in bpf/master
>
> thanks,
> jirka
I am confused, when should I use bpf/master[2] and when should I use
bpf-next/master[1]? thank you :)

[1] https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
