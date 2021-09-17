Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C4240F306
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Sep 2021 09:19:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 798FBC597BE;
	Fri, 17 Sep 2021 07:19:05 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CC52C5719E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Sep 2021 07:19:02 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id t4so5639495plo.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Sep 2021 00:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=KKt5AWTLK0tIOKcdr0XGkLxMl+Fod9jsU5NOqvL/LwY=;
 b=OGNcv4U9n6ABRlqOjeyYxj2m2dLT+GdPU3h8J90Fo/RDGo4LKnf6Sw8Zschlp+zyd5
 8RwwSpbSUeQXDsZOaw4XlENYpT9wge5Ee0se75p3Ph/CODaSmXnWY9jlGaP8z87bTAum
 QsBe9jie20lsUrSZVSnSqXk5m7/TL1pwr2JXW3uCD0QSGY/thhd+h7eDqzPaebrgl43Z
 +Pu+gvepvhfM6tBXXZ44bEvuRgx0N7jz1AyYIxFy6jQc6mcZioxE5AMTuSAWV84IM/kV
 nE6GvoYICahyNUHrH8Nk85g7Hu0BHfQLOiNLpTJf9FKXL08Rz6g/73Yngdyh4gPbElou
 8Dwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
 :message-id:user-agent:mime-version;
 bh=KKt5AWTLK0tIOKcdr0XGkLxMl+Fod9jsU5NOqvL/LwY=;
 b=Xn1UI1JtUb8SMF390kb5ZRyo6MnyJ+n0Yt+AQ9yFpF5d2kOsGO4cAzDXXXnO+wX4gj
 IiUjUKF2wa2Hgtp8P0swH5ICBRvqipHJRci/4O5gBPKCPsWhRQkUTY1DhpfJbCjcQNxx
 Bjpx8ALFBWtNcAi7PEF8ez22aoI73oJsm+vNeMFR1RkqTMsHCOHEJJRXPlRpEH6Xwqkl
 ui0Ov85S4+1+o9v8Ye627fm5oCrPLQBHpG9MCV3/DA+rhsR6tjcj4vlEWnGx4e99nOab
 /SzGxpZYAv+HyBPOC0eUO18Kccn4k1Zi87e8yexB4lkHjWt6DGjLbSGYFGZnRWZBhyTZ
 Iihw==
X-Gm-Message-State: AOAM531PdijVXaHFKbJuZvOsKcSao/36wLz7W3d0oj8cBoIqvBo6lHlz
 1bIT5aDslXa2NRHG5w8zQ0o=
X-Google-Smtp-Source: ABdhPJzLTe/k8m8JKgJLdgpYaFvNkIQ7/arj27CdRiFqtG2lS8t+qLupw+ufAavOnpAYvnYjA2SITA==
X-Received: by 2002:a17:90b:1642:: with SMTP id
 il2mr10681860pjb.167.1631863140606; 
 Fri, 17 Sep 2021 00:19:00 -0700 (PDT)
Received: from localhost (122x211x248x161.ap122.ftth.ucom.ne.jp.
 [122.211.248.161])
 by smtp.gmail.com with ESMTPSA id u10sm4815419pjf.46.2021.09.17.00.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 00:18:59 -0700 (PDT)
From: Punit Agrawal <punitagrawal@gmail.com>
To: Qu Wenruo <wqu@suse.com>
References: <20210823143754.14294-1-michael.riesch@wolfvision.net>
 <CAGb2v67Duk_56fOKVwZsYn2HKJ99o8WJ+d4jetD2UjDsAt9BcA@mail.gmail.com>
 <568a0825-ed65-58d7-9c9c-cecb481cf9d9@wolfvision.net>
 <87czpvcaab.fsf@stealth>
 <aa905e4d-c5a7-e969-1171-3a90ecd9b9cc@wolfvision.net>
 <2424d7da-7022-0b38-46ba-b48f43cda23d@suse.com>
Date: Fri, 17 Sep 2021 16:18:57 +0900
In-Reply-To: <2424d7da-7022-0b38-46ba-b48f43cda23d@suse.com> (Qu Wenruo's
 message of "Fri, 17 Sep 2021 10:22:09 +0800")
Message-ID: <877dff7jq6.fsf@stealth>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Cc: sashal@kernel.org, "David S . Miller" <davem@davemloft.net>,
 netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, "open list:ARM/Rockchip
 SoC..." <linux-rockchip@lists.infradead.org>, Jose Abreu <joabreu@synopsys.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, wens@kernel.org,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-rk: fix unbalanced
 pm_runtime_enable warnings
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

Hi Qu,

Qu Wenruo <wqu@suse.com> writes:

> On 2021/8/30 22:10, Michael Riesch wrote:
>> Hi Punit,
>> On 8/30/21 3:49 PM, Punit Agrawal wrote:
>>> Hi Michael,
>>>
>>> Michael Riesch <michael.riesch@wolfvision.net> writes:
>>>
>>>> Hi ChenYu,
>>>>
>>>> On 8/29/21 7:48 PM, Chen-Yu Tsai wrote:
>>>>> Hi,
>>>>>
>>>>> On Mon, Aug 23, 2021 at 10:39 PM Michael Riesch
>>>>> <michael.riesch@wolfvision.net> wrote:
>>>>>>
>>>>>> This reverts commit 2c896fb02e7f65299646f295a007bda043e0f382
>>>>>> "net: stmmac: dwmac-rk: add pd_gmac support for rk3399" and fixes
>>>>>> unbalanced pm_runtime_enable warnings.
>>>>>>
>>>>>> In the commit to be reverted, support for power management was
>>>>>> introduced to the Rockchip glue code. Later, power management support
>>>>>> was introduced to the stmmac core code, resulting in multiple
>>>>>> invocations of pm_runtime_{enable,disable,get_sync,put_sync}.
>>>>>>
>>>>>> The multiple invocations happen in rk_gmac_powerup and
>>>>>> stmmac_{dvr_probe, resume} as well as in rk_gmac_powerdown and
>>>>>> stmmac_{dvr_remove, suspend}, respectively, which are always called
>>>>>> in conjunction.
>>>>>>
>>>>>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
>>>>>
>>>>> I just found that Ethernet stopped working on my RK3399 devices,
>>>>> and I bisected it down to this patch.
>>>>
>>>> Oh dear. First patch in a kernel release for a while and I already break
>>>> things.
>>>
>>> I am seeing the same failure symptoms reported by ChenYu on my RockPro64
>>> with v5.14. Reverting the revert i.e., 2d26f6e39afb ("net: stmmac:
>>> dwmac-rk: fix unbalanced pm_runtime_enable warnings") brings back the
>>> network.
>>>
>>>> Cc: Sasha as this patch has just been applied to 5.13-stable.
>>>>
>>>>> The symptom I see is no DHCP responses, either because the request
>>>>> isn't getting sent over the wire, or the response isn't getting
>>>>> received. The PHY seems to be working correctly.
>>>>
>>>> Unfortunately I don't have any RK3399 hardware. Is this a custom
>>>> board/special hardware or something that is readily available in the
>>>> shops? Maybe this is a good reason to buy a RK3399 based single-board
>>>> computer :-)
>>>
>>> Not sure about the other RK3399 boards but RockPro64 is easily
>>> available.
>> I was thinking to get one of those anyway ;-)
>> 
>>>> I am working on the RK3568 EVB1 and have not encountered faulty
>>>> behavior. DHCP works fine and I can boot via NFS. Therefore, not sure
>>>> whether I can be much of help in this matter, but in case you want to
>>>> discuss this further please do not hesitate to contact me off-list.
>>>
>>> I tried to look for the differences between RK3568 and RK3399 but the
>>> upstream device tree doesn't seem to carry a gmac node in the device
>>> tree for EK3568 EVB1. Do you have a pointer for the dts you're using?
>> The gmac nodes have been added recently and should enter
>> 5.15-rc1. Until
>> then, you can check out the dts from linux-rockchip/for-next [0].
>
> Do you have the upstream commit?
>
> As I compiled v5.15-rc1 and still can't get the ethernet work.
>
> Not sure if it's my Uboot->systemd-boot->customer kernel setup not
> passing the device tree correctly or something else...

For the RK3568 device tree changes, I think the pull request got delayed
to the next cycle. So likely to land in v5.16.

In case you're after ethernet on RK3399, there's no solution
yet. Reverting 2d26f6e39afb ("net: stmmac: dwmac-rk: fix unbalanced
pm_runtime_enable warnings") gets you there in the meanwhile.

[...]

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
