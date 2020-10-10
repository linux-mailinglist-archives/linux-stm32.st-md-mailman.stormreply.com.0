Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A7628A07F
	for <lists+linux-stm32@lfdr.de>; Sat, 10 Oct 2020 15:08:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C305C3FAD5;
	Sat, 10 Oct 2020 13:08:23 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A28B3C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Oct 2020 13:08:21 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id c22so17035728ejx.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Oct 2020 06:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IRzgnkzL+y6KxGnUDl6KgaiE0a2YhOVgP91PfZHg4Jo=;
 b=byvw0Fy4HVNaP4n7smhkuDqjTWMOiaFJVMkeRiZ3ec2F2chtyzQnuMP0wAlP3i+Pn2
 phJpF74wVI6sccENkGwj9rueqnRXQ/jl4aTHLB+8wqpm/+L5yVgbAOa3pQSsp+cK1pG1
 ftZm36sv696d5/c/iL7qbsxcglHZpjm4AilrMRrZyo2QEDOjAtAJQ0tUnQKevwGXOPr+
 7n/19bs7ClEXbaWInlMsQfTLf5Dbur8Ls0TqTXNQ5KYqijuvicyoqKCr2d4FsV0nJDUt
 W7cJpFY6AQ0TfOMZ7CEX7witi82v0jv7tJE82bwVSWTbTQbyiLVnMhGgqTc2w0ltbBF6
 jZrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IRzgnkzL+y6KxGnUDl6KgaiE0a2YhOVgP91PfZHg4Jo=;
 b=reudZTJ/3Ua/tES6jkf5ektokugzwTvVrxH8ULkOauNjBIZkzj5dp8dSqUJw1Zh67F
 kRtoswueIu1XYU03Qd014ocK8Lw8p1cgGPVHqspAq/M4lfxH6z1ud8KD5nQEoPyM7/on
 ZuHImsHvXkja5tRBXZIjullI2r6cXuWSMKBXUAfaKPtYo96XypkXV17fJQZkRbMiw2OT
 WOsppTvSeB0axVRcFVxf9Kp7qdFkkByIxc+cf4x/aF2WQCWD928gt2dEkmKelBDbT8ma
 8EN2+E59rAdxdkeVQSQJ43ft+8lTjmaKO09aakkvEt4FgLyNypGGwA0utDTWxapyxBXj
 fNww==
X-Gm-Message-State: AOAM531RK/yN7R43Y6kNdhH+4ltkeCfjEzzwjNK2j+4ZvIX/wX0stOEw
 1T1n+VU6Q/Pm/GLtRg6FBOw=
X-Google-Smtp-Source: ABdhPJxzUGEzr8/XiZNnjXysIPZx6Ugs44w2gLiyH/uHXdxmPOdrI+o1ulKAbcwE/CaIuoc86J7qfw==
X-Received: by 2002:a17:906:39ce:: with SMTP id
 i14mr20143131eje.170.1602335301421; 
 Sat, 10 Oct 2020 06:08:21 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f00:6a00:14e2:2617:c2db:d1c8?
 (p200300ea8f006a0014e22617c2dbd1c8.dip0.t-ipconnect.de.
 [2003:ea:8f00:6a00:14e2:2617:c2db:d1c8])
 by smtp.googlemail.com with ESMTPSA id gv10sm7888810ejb.46.2020.10.10.06.08.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Oct 2020 06:08:20 -0700 (PDT)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
References: <20201008162749.860521-1-john@metanate.com>
 <8036d473-68bd-7ee7-e2e9-677ff4060bd3@gmail.com>
 <20201009085805.65f9877a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <725ba7ca-0818-074b-c380-15abaa5d037b@gmail.com>
Message-ID: <070b2b87-f38c-088d-4aaf-12045dbd92f7@gmail.com>
Date: Sat, 10 Oct 2020 15:08:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <725ba7ca-0818-074b-c380-15abaa5d037b@gmail.com>
Content-Language: en-US
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, John Keeping <john@metanate.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Don't call _irqoff() with
	hardirqs enabled
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

On 09.10.2020 18:06, Heiner Kallweit wrote:
> On 09.10.2020 17:58, Jakub Kicinski wrote:
>> On Fri, 9 Oct 2020 16:54:06 +0200 Heiner Kallweit wrote:
>>> I'm thinking about a __napi_schedule version that disables hard irq's
>>> conditionally, based on variable force_irqthreads, exported by the irq
>>> subsystem. This would allow to behave correctly with threadirqs set,
>>> whilst not loosing the _irqoff benefit with threadirqs unset.
>>> Let me come up with a proposal.
>>
>> I think you'd need to make napi_schedule_irqoff() behave like that,
>> right?  Are there any uses of napi_schedule_irqoff() that are disabling
>> irqs and not just running from an irq handler?
>>
> Right, the best approach depends on the answer to the latter question.
> I didn't check this yet, therefore I described the least intrusive approach.
> 

With some help from coccinelle I identified the following functions that
call napi_schedule_irqoff() or __napi_schedule_irqoff() and do not run
from an irq handler (at least not at the first glance).

dpaa2_caam_fqdan_cb
qede_simd_fp_handler
mlx4_en_rx_irq
mlx4_en_tx_irq
qeth_qdio_poll
netvsc_channel_cb
napi_watchdog
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
