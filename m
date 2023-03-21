Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA776C3999
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Mar 2023 19:55:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 552E7C6A5EF;
	Tue, 21 Mar 2023 18:55:30 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37E3CC65049
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Mar 2023 18:55:28 +0000 (UTC)
Received: from maxwell ([109.42.112.2]) by mrelayeu.kundenserver.de (mreue107
 [213.165.67.113]) with ESMTPSA (Nemesis) id 1McHQA-1qCdqL3pO8-00ck85; Tue, 21
 Mar 2023 19:55:02 +0100
References: <20230316075940.695583-1-jh@henneberg-systemdesign.com>
 <20230316075940.695583-2-jh@henneberg-systemdesign.com>
 <20230317222117.3520d4cf@kernel.org>
 <87sfe2gwd2.fsf@henneberg-systemdesign.com>
 <20230318190125.175b0fea@kernel.org>
 <87r0tj23eh.fsf@henneberg-systemdesign.com>
 <20230320113643.53bbf52d@kernel.org>
User-agent: mu4e 1.8.14; emacs 28.2
From: Jochen Henneberg <jh@henneberg-systemdesign.com>
To: Jakub Kicinski <kuba@kernel.org>
Date: Tue, 21 Mar 2023 19:53:50 +0100
In-reply-to: <20230320113643.53bbf52d@kernel.org>
Message-ID: <871qli0wap.fsf@henneberg-systemdesign.com>
MIME-Version: 1.0
X-Provags-ID: V03:K1:KdbgHBcFP7ENYOGj4j5tDpIgCjXXqUk+EwngGihK4vkttv+cp0R
 qSqDvDOQvhSuZhs84ECOySyI61dgSyHppBzIELI0Gw8FkrUxoYnYbNmsbvXnIMFhRiMkvE9
 5MHgIhJ0o/noyhmrd/LSCccOE8m5C80MDnvIx1LdYHpENXL0pc5exq7DT4Ac/sCqGT7eUc3
 VDToeJG6O8laZxcN4JHNA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3Ex7bFj/Tfg=;d5A5dUmXhInR5VVZ29OjL3ZGHiu
 deOrKtD1SC1udStfgXdttdrq8l/bJUAPPWYRO5Ul3OZerTk+3UQc3SXrIq4beN7mEq810XPFA
 8PuhidDtNDUnBND1N/yEzzFWD/bmt+hvqxmNUyoz75vDVTf2SzQg7FAEWIgro+Xg57fAGiz8b
 Nd8LnmxoSPbreZbIVBH8TI6z5GYajfNi4RxrZgadUyNV5kyl5FT5vHwJUsHViFQ+A/9lnr95c
 OCFgPoS4bKUCwqVUyAiGK9T7PhmtmhXs6cVtQ5iWjLPUSSPylu7lL8YaFf49yhvlvyrd7pOBd
 6zBlPhfBvjOdmQew456q1Yg46APkeZidREPR5RRqDjeikSh8KTkikIjemecsTdRM0RLormCGt
 /U6r8GF/2qmXV/rcQhM73pbip0hnHjMI9GLitKgNd/YzofkiI2IVzoQCKQSlyuIYLv6uNVs2y
 d7F3wtFjn6nAfe0WgIBLHFgIRHbum4IVUnLuFaWU/SwvKuM7KLOOK8NXfcIlO169HMRX60N8K
 CcvUXOl5zSBZoJ0Us0K5aQ6n8BzduFDG0Xqp0w4rCdyEybI7DVFJCcZte8l57k/Jw6PlKagCz
 oPyr6g9vMEgBwJfFSFEOiG5SlnawA0j1NWN1lnLaFgiJfPMDKssioMI71OLCgqygWxxdEAx+I
 YlnwK1ZiE2e3we/tuuYDVv+SzQa4KIoWoI+DtkVF2g==
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net V2 1/2] net: stmmac: Premature loop
 termination check was ignored on rx
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


Jakub Kicinski <kuba@kernel.org> writes:

> On Mon, 20 Mar 2023 10:04:54 +0100 Jochen Henneberg wrote:
>> For the ST and Synopsys people:
>> I could imagine that you would be able to fix this much faster than
>> I can, so if they want to work on this please let me know so I don't
>> waste my time on doing double work.
>
> Don't hold your breath, we haven't heard from any of the maintainers 
> in 2 years :( 
>
> The drivers for CoTS IPs are really not great in general, I'm guessing
> delivering solid code is both difficult for them (given customer
> parametrization of each instance) and hard to fit into their business
> process :(

Thanks for your response. I will try to figure out the issue and work on
them, however, be patient as I can only limited time on this.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
