Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIDZFg9i+2kuaQMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 17:45:19 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD6D4DD83F
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 17:45:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 028CAC8F289;
	Wed,  6 May 2026 15:45:18 +0000 (UTC)
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB869C8F283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2026 15:45:15 +0000 (UTC)
X-QQ-mid: zesmtpsz7t1778082303tad718e7d
X-QQ-Originating-IP: IUbeVjFMUOeWOYng8sGFzDDtrsWNZj3aHK3Nzskz1o8=
Received: from [127.0.0.1] ( [116.234.74.217]) by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 06 May 2026 23:44:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7158039803468193792
Message-ID: <549BE66F62F1470F+a489d4fd-10ab-484c-9b55-6aecfd05d383@radxa.com>
Date: Wed, 6 May 2026 23:44:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Thompson <daniel@riscstar.com>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
 <224E233C593EF171+8c8a43dd-5061-40f8-9eb7-f360eabf2ecc@radxa.com>
 <4015f47a-af62-441d-b1b8-a8598f963970@lunn.ch>
 <4C0D95BC59F1A4ED+53f3be85-2cdd-4058-8950-57970027d481@radxa.com>
 <aftgorkah-Hjrvq2@aspen.lan>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <aftgorkah-Hjrvq2@aspen.lan>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MGxrRyrvqqSAJPtm9+Xn8xQ2xA1AHSxENunW+ehiuhpYbHNZNVX+5I77
 wfEoPZdY8rSSnBMxbOMBAUXrcxyTiHvHjYdLIruNFlVs5lr5HDLEQ1ApU0cFLR+6YfK0cxl
 xLQwQUO7Tb69bQylEOxrNQ6mWphQKFg/TiXsZ1gi+FVTHjgIg/Fr6j8Q457nWfpG48XAJzc
 5XvJ2E6Usyo8kQ57Bnnqm+krfqblXcs7i1vUPim1nujyUIPBIbi8cwlBm36UDmFh3srxEhE
 +Ryb56EQI1VkDQa2KKpshuWjq99XGYnWUOM/1rx4F2kFuyYWa2Z4COGGN9BC+ALkqj5ePLH
 gbFiAWQ8TibPnvNKMS36uWka8lMqh7bKXZxLD/k8uLcy/PVK3UWVekpSyAFTm1MafcK88MG
 VoAWmLFZ2mggMy2AuIU7+qsCwNCuVdY5sg3BJB51QtMSyOfS2mUsq0m/v0hpmk3xADo5kK9
 8FlW7z8nbMx8jvr66nXsWSoEdREevD5+5Xmy1nAdvuGWktXcGQhVnd2CZKJbVVfuaT1pf/4
 C3cwwkAyC54RvT6IWnn9HShasbW724+bTFuNBJfsSCilvctGMH6syQbfTBK5OXQKvmIw3x4
 qarzR6NdI1hR994C8uKTsqpkUrueoQnqMFptlxAEM7X3jvvwwKbXzDc48sHQUQXwZ7B7aMa
 Nal6lzE8DmjyGk461b4kkEEATnaV8ntovq9/27lotTr1/xibXNTV9+AqsNiPkHXhoiDZ9aS
 /5rpNyFTXrtTnE6OsWnPwjzI8uFcL7V3DeIY3PENtYZLgjn2hABGOpP/FpulKp01zIu/AgG
 ENVE8OEgHs0pcexza2gSGkY1zJzV2iyqswTeiiqJ8XKL1yVdsmIBIFWYLyEqYOWPqPJzIhi
 Tre2PFAPTXsrW8c0g33qtsnMjdlCxTQcbWps7nfZCdy4bU05lSAE96EcWRLkNu1O4Z27qV+
 h9nrlUOx7j5H/UqAO0ENqXCkAmY5Rkmwfe7kIlC8UklVOo4ZAc5o6kI8cPsw3yP2N8BQ1fh
 aBu0P+aQQ0sAvHSKc2povYS6tafFYhOZCJpENmhXfoKDGX96f5QE0Jx3VZ2z0/w7bZde9Wc
 Lu07ZB4YcFxuQPT4Rqx3Cjt7S1VQoSk0g==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
Cc: Andrew Lunn <andrew@lunn.ch>, me@ziyao.cc, ast@kernel.org,
 linux-kernel@vger.kernel.org, chenchuangyu@xiaomi.com, edumazet@google.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, mohd.anwar@oss.qualcomm.com, weishangjuan@eswincomputing.com,
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
X-Rspamd-Queue-Id: BFD6D4DD83F
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
	FORGED_RECIPIENTS(0.00)[m:daniel@riscstar.com,m:andrew@lunn.ch,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:elder@riscstar.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linusw@ke
 rnel.org,m:a0987203069@gmail.com,m:davem@davemloft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:andersson@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[50];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lunn.ch,ziyao.cc,kernel.org,vger.kernel.org,xiaomi.com,google.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,riscstar.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,linuxfoundation.org,davemloft.net];
	NEURAL_HAM(-0.00)[-0.998];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[radxa.com:mid,radxa.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]

On 5/6/2026 11:39 PM, Daniel Thompson wrote:
> On Wed, May 06, 2026 at 10:35:18PM +0800, Xilin Wu wrote:
>> On 5/6/2026 10:19 PM, Andrew Lunn wrote:
>>> On Wed, May 06, 2026 at 08:59:01PM +0800, Xilin Wu wrote:
>>>> On 5/1/2026 11:54 PM, Alex Elder wrote:
>>>>> +	/* AXI Configuration */
>>>>> +	axi = &td->axi;
>>>>> +	axi->axi_lpi_en = 1;
>>>>> +	axi->axi_wr_osr_lmt = 31;
>>>>> +	axi->axi_rd_osr_lmt = 31;
>>>>> +	/* All sizes (2^2..2^8) are supported */
>>>>> +	axi->axi_blen_regval = DMA_AXI_BLEN_MASK;
>>>>> +	plat->axi = axi;
>>>>> +
>>>>> +	plat->mac_port_sel_speed = speed;
>>>>> +	plat->flags = STMMAC_FLAG_MULTI_MSI_EN | STMMAC_FLAG_TSO_EN;
>>>>
>>>> I got WoL working only after adding STMMAC_FLAG_USE_PHY_WOL here. I guess
>>>> it's required, since the driver clocks down the MAC/PMA/XPCS in its suspend
>>>> hook?
>>>
>>> Nice to see somebody testing WoL.
>>>
>>> In your testing, is it the PHY doing the WoL, or the MAC? I assume
>>> PHY.
>>>
>>> If i remember the DT correctly, the PHY interrupt is connected to a
>>> SoC GPIO, not a GPIO of this chip. So for your board, it is the SoCs
>>> GPIO controllers ability to perform the wake which is
>>> important. However, where the PHY interrupt is connected is a board
>>> design issue. Could the PHY interrupt be connected to the chip? Would
>>> the chip be able to wake the system? Should STMMAC_FLAG_USE_PHY_WOL be
>>> conditional?
>>
>> Yes, the PHY is doing the WoL. And I guess this makes sense as it allows the
>> MAC to power down during suspend to save power.
>>
>> The INTN pin of QCA8081 is connected to the ETH_0_INT_N of QPS615. And the
>> INTN_WOL pin is connected to a SoC GPIO.
> 
> Interesting. That is different to RB3gen2 where INTN is routed to both
> (although there is a do-not-fit 0ohm resistor option that could change
> that).
> 
> Does that mean you don't get phy interrupts reported in /proc/interrupts
> before any suspend happens?
> 

No. The phy works in polling mode AFAIK.

> 
>> Without this change, I can't get WoL to work. I have a working branch for
>> our board here:
>> https://github.com/strongtz/linux-radxa-qcom/commits/v7.0.2-8280-wip/
> 
> I took a quick look at the DT and I noticed you have an SGMII PHY
> attached to both eMAC0 and eMAC1 on your board. This is something we
> think should work but were unable to test. Are you able to use both
> eMACs concurrently? Would be great to see that confirmed!
> 
> 
> Daniel.
> 

Yes, both eMACs can be used concurrently. And they can reach 2.5Gbps 
under iperf3 testing.

-- 
Best regards,
Xilin Wu <sophon@radxa.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
