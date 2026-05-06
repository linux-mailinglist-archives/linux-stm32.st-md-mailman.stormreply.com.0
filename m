Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPdeC4Fg+2kuaQMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 17:38:41 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A345D4DD66A
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 17:38:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 469ECC8F289;
	Wed,  6 May 2026 15:38:40 +0000 (UTC)
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12E63C8F283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2026 15:38:36 +0000 (UTC)
X-QQ-mid: esmtpsz20t1778081905t5dc8af55
X-QQ-Originating-IP: 66bIYIjIjPtDUf7ZMQLWTQPiTh7x0N6Cl1Fw8/bZasU=
Received: from [127.0.0.1] ( [116.234.74.217]) by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 06 May 2026 23:38:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4295684557063516514
Message-ID: <859776B5671B36B9+577c19e4-3e66-4036-b26f-fe20287a1d43@radxa.com>
Date: Wed, 6 May 2026 23:38:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
 <224E233C593EF171+8c8a43dd-5061-40f8-9eb7-f360eabf2ecc@radxa.com>
 <4015f47a-af62-441d-b1b8-a8598f963970@lunn.ch>
 <4C0D95BC59F1A4ED+53f3be85-2cdd-4058-8950-57970027d481@radxa.com>
 <2af0fee3-d3d6-4434-847f-3fd2fbb841d3@lunn.ch>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <2af0fee3-d3d6-4434-847f-3fd2fbb841d3@lunn.ch>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NMth3b25qZ/y3GsZOZbTcTtn7ivxtNnfDwhten1J2cIhmuHszCIWDEp5
 62vFagLVkDtj/ihAfFxqCDAkwPknNTQ8rt2JdPO3DntsuJvxTDZwhwn6v9Q2Zr3fexxrdav
 Z8tOqhADpYyVy9j/gfNlM6y7qT+IPNVQIh9ISw9xH2humwR+0QuQgfl/S6YVNPcViexfzng
 Tu0rFdlhN+wyFpLgg5vpKp26j9ufuc6yKDetrb4Ryuw7818jy3rdUpAnCorwW/EAkH7GC45
 9sHsQ0R5GNdl9foXYGG8tVWqi46VBH2HlSGhx+89L9ZEqbHo1NLEErlzEuRkNG3xqWER7V5
 xHAS00ExpjcrZcs2qHWpfE/7l1GfoyFa/+5zYjXotwBHkWlBP0uJxiOf01OCq9uFnyyXzpb
 OeRyO4nGN5aYqgEjRrsxivJFb6rJNwBktM1YIPpoCA2CwJtV6zvB9XDvhjuDv5ZYgiwB29H
 gGz3Qd1kYxiEFMNOgAJK2zvON05qEvjOLsSde0Vo+LL6YZHv4M+VlHospu6p2a+wEMuEmHF
 Jc2st9+8GhXzqMowizoLQAL9VnQzdAOXMjWoyRvsXqT7B4Vc0LM4XecnPl0Ziru2BKirpPA
 qHkI1zSenEcKZXkvc23ex+ZqmzUztSiU4e/RZIrZsvktRyV/SbBD38JEeWOcNI+nTpBNslx
 iSwfov58UuPq6538i53SLFp+W5xh7QCd1qKPQXAOljWV5AvuAyaKKulKBGYDttswirvo6r0
 0oNQl9z2qpNBc/OtuZcFmGLL4vpn7ILM/Y7dCPvMO85opK0XJce6YlVCCUTeh04dthfKACl
 k+pLhAPReZWtmYTjow9htBMh3OFHZxmVd7cppGF6kZYVWO2OeK+mNL2+FOSTHHcxXshpWZb
 vErub9eGThX/A8VngZnkNdzGFFh+kutCnJM/uiHn4Af2yNS/MOKLin5rNs1vHhv3TxdC4hu
 PJzWLeXYsrFARDQrb66jMt7nTlS2mT9f+K/V7dpZw3LpyIDgi3kTgwqwerOn2yClL/iZKrv
 DZbuWNVc60wjyJ2QSJx9V51Y+lE9LALFS636snRufTrAe5eLiCLWBoPPg2wB9ETWOt9C2EA
 ghCObbyLYQElz+mAyIcubIu/ppF34Od5oZzNMZsR0f9
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
Cc: me@ziyao.cc, ast@kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>, chenchuangyu@xiaomi.com,
 edumazet@google.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 mohd.anwar@oss.qualcomm.com, weishangjuan@eswincomputing.com,
 Alex Elder <elder@riscstar.com>, daniel@iogearbox.net, chenhuacai@kernel.org,
 john.fastabend@gmail.com, maxime.chevallier@bootlin.com,
 siyanteng@cqsoftware.com.cn, sdf@fomichev.me, kuba@kernel.org,
 pabeni@redhat.com, konradybcio@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, hawk@kernel.org, arnd@arndb.de, brgl@kernel.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 livelycarpet87@gmail.com, linux-gpio@vger.kernel.org,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
 linusw@kernel.org, a0987203069@gmail.com, davem@davemloft.net,
 andrew+netdev@lunn.ch, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 inochiama@gmail.com, krzk+dt@kernel.org, julianbraha@gmail.com,
 matthew.gerlach@altera.com, andersson@kernel.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 10/12] net: stmmac: tc956x: add
 TC956x/QPS615 support
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
X-Rspamd-Queue-Id: A345D4DD66A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_MUA_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[sophon@radxa.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:elder@riscstar.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linusw@ke
 rnel.org,m:a0987203069@gmail.com,m:davem@davemloft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:andersson@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[50];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,kernel.org,vger.kernel.org,riscstar.com,xiaomi.com,google.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,linuxfoundation.org,davemloft.net,lunn.ch];
	NEURAL_HAM(-0.00)[-0.998];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,armlinux.org.uk:email,st-md-mailman.stormreply.com:rdns]

On 5/6/2026 10:45 PM, Andrew Lunn wrote:
>> Hi Andrew,
>>
>> Yes, the PHY is doing the WoL. And I guess this makes sense as it allows the
>> MAC to power down during suspend to save power.
>>
>> The INTN pin of QCA8081 is connected to the ETH_0_INT_N of QPS615. And the
>> INTN_WOL pin is connected to a SoC GPIO.
>>
>> Without this change, I can't get WoL to work. I have a working branch for
>> our board here:
>> https://github.com/strongtz/linux-radxa-qcom/commits/v7.0.2-8280-wip/
> 
> Please take a look at commit
> 
> commit 6911308d7d111a9c367293b52f2dc265819f2b60
> Author: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Date:   Thu Oct 23 10:16:50 2025 +0100
> 
>      net: stmmac: convert to phylink-managed Wake-on-Lan
> 
> In particular:
> 
>      When STMMAC_FLAG_USE_PHY_WOL is not set, we provide the MAC's WoL
>      capabilities to phylink, which then allows phylink to choose between
>      the PHY and MAC for WoL depending on their individual capabilities
>      as described in the phylink commit. This only augments the WoL
>      functionality with PHYs that declare to the driver model that they are
>      wake-up capable. Currently, very few PHY drivers support this.
>      
> Could you actually patch the PHY driver to make it list its
> capabilities. That is the direction we want to go in the long term,
> and not use STMMAC_FLAG_USE_PHY_WOL.
> 
>      Andrew
> 

Thanks for pointing this out! You are right that I should patch the PHY 
driver. I have made WoL work without the change in the tc956x driver.

-- 
Best regards,
Xilin Wu <sophon@radxa.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
