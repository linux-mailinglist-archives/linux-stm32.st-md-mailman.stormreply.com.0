Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E717E6E1346
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Apr 2023 19:16:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95028C69063;
	Thu, 13 Apr 2023 17:16:01 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4516C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Apr 2023 17:16:00 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id m21so5956405qtg.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Apr 2023 10:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681406159; x=1683998159;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=if+eweMpKSPw4ABoMbVMDGxTF36ZdVsMnlzvEryPtKs=;
 b=qaKN/MLnxUQcthWApLlSBdpvdv19s0p1x5z3lzpzzTx39vs2YbBJuNZbeLJJNOyIBb
 nF08e0k6lCQdQxMo4kEO+mgaVZq/sB/9MRvuc/8Zf49lDZqb6W0YtcNZI4p+dL0wilVB
 oAsj09HuNSwVfIkNtNn+wE4mruVGQB3YeAlIs/vO1/1ZRLLLj/EFIP1IlI4btLXQT8P8
 cZxEJ1tjQ4+BXgJoufO10gwKWBi8R77KYbhZ3pnwnzNUyn8c4xMFMAKhiOlC/JJNnCcq
 XdnNVdemEije4GM33zv9zZiwPaNC2r2laF6ICKWlRutbXfzah5Uh5nVnj5npEaNZ0oF2
 cscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681406159; x=1683998159;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=if+eweMpKSPw4ABoMbVMDGxTF36ZdVsMnlzvEryPtKs=;
 b=ao1QaSrsB/1vWgd5rNzSCOe1l2aKs7dlm5UZstlsEojslarigc1YMRjtg6x1nV3R4z
 B7LQKxbYe7AS+kzHn8wWCTGhPEb4eB52EjgSZ64wyZvuPjdaUTS5/7fPZz304AVFuwCp
 LGd5BGjtNblxmaiRMd7DFyIMZxJyyK6xY2Z8ka+JpFI7uEbUjLtW0PaEinQ0jPy9rSfN
 oEOheOm0JbhcphQ4UfnwMIAhLAM3TJb04QtueNS0xpkJANKHNv99RuWbl9tP7REubmaj
 kbIBQi0ft3oY2tPeeAxqCcPMgZrNQaLbKfyzuDEkxm5X8WL2yfzvBtYQoNLnzSo0Vmg5
 /SNw==
X-Gm-Message-State: AAQBX9etF+dLQ0VBnoY2nqXIB+ZLScE093RqW//OG1ehs7z+MGwUZz+P
 k8+iYZ7AHNyzBQKJlWz5MW4=
X-Google-Smtp-Source: AKy350bF7+ZZYGyT4ws/zJC4Ya+Onaht9i9MWm9l0F72FmoZ0P+iN43eXwa0ekkd9ppUWtfl+4zK/Q==
X-Received: by 2002:a05:622a:120c:b0:3e4:e9c9:df70 with SMTP id
 y12-20020a05622a120c00b003e4e9c9df70mr3529740qtx.10.1681406159380; 
 Thu, 13 Apr 2023 10:15:59 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 bk37-20020a05620a1a2500b0074add69317bsm109446qkb.121.2023.04.13.10.15.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 10:15:58 -0700 (PDT)
Message-ID: <298c045a-5438-6761-46d8-c46c57989812@gmail.com>
Date: Thu, 13 Apr 2023 10:15:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Jacob Keller <jacob.e.keller@intel.com>, Yan Wang <rk.code@outlook.com>,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 kuba@kernel.org, mcoquelin.stm32@gmail.com
References: <KL1PR01MB5448C7BF5A7AAC1CBCD5C36AE6989@KL1PR01MB5448.apcprd01.prod.exchangelabs.com>
 <01ef9d4f-d2dc-d584-4733-798cffda49a1@intel.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <01ef9d4f-d2dc-d584-4733-798cffda49a1@intel.com>
Cc: "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next v4] net: stmmac:fix system hang
 when setting up tag_8021q VLAN for DSA ports
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

On 4/13/23 10:07, Jacob Keller wrote:
> 
> 
> On 4/13/2023 8:06 AM, Yan Wang wrote:
>> The system hang because of dsa_tag_8021q_port_setup()->
>> 				stmmac_vlan_rx_add_vid().
>>
>> I found in stmmac_drv_probe() that cailing pm_runtime_put()
>> disabled the clock.
>>
>> First, when the kernel is compiled with CONFIG_PM=y,The stmmac's
>> resume/suspend is active.
>>
>> Secondly,stmmac as DSA master,the dsa_tag_8021q_port_setup() function
>> will callback stmmac_vlan_rx_add_vid when DSA dirver starts. However,
>> The system is hanged for the stmmac_vlan_rx_add_vid() accesses its
>> registers after stmmac's clock is closed.
>>
>> I would suggest adding the pm_runtime_resume_and_get() to the
>> stmmac_vlan_rx_add_vid().This guarantees that resuming clock output
>> while in use.
>>
>> Signed-off-by: Yan Wang <rk.code@outlook.com>
> 
> This looks identical to the net fix you posted at [1]. I don't think we
> need both?
> 
> [1]:
> https://lore.kernel.org/netdev/KL1PR01MB5448020DE191340AE64530B0E6989@KL1PR01MB5448.apcprd01.prod.exchangelabs.com/

Unfortunately both still lack a proper Fixes: tag, and this is bug fix.
-- 
Florian

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
