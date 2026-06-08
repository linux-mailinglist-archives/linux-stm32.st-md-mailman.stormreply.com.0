Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YyuMK7AWJmrFSAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 08 Jun 2026 03:11:12 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADDA6520F7
	for <lists+linux-stm32@lfdr.de>; Mon, 08 Jun 2026 03:11:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=radxa.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9A05C87ED2;
	Mon,  8 Jun 2026 01:11:11 +0000 (UTC)
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65151C57A50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jun 2026 01:11:10 +0000 (UTC)
X-QQ-mid: zesmtpgz3t1780880959t22d2278c
X-QQ-Originating-IP: bXSnog20lGiDAATqGnwBlNDtCTN8ekmUmHTMsQS2HH0=
Received: from [127.0.0.1] ( [116.234.26.110]) by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 08 Jun 2026 09:09:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6460039914688242846
Message-ID: <3ADB82C061204E67+dec56a7d-f8d1-4be9-9b21-3481a710df87@radxa.com>
Date: Mon, 8 Jun 2026 09:11:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Thompson <daniel@riscstar.com>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
 <DD71CDEABC7C16D5+02d052ff-13bb-4712-a847-91416f76c578@radxa.com>
 <7f3a0f16-5159-4bbc-8b15-9b5841603bf6@riscstar.com>
 <3A5C0389E7C0D241+21a4f16b-1af8-46ac-8831-0c1b49694df0@radxa.com>
 <agH4qC74A540koDl@aspen.lan>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <agH4qC74A540koDl@aspen.lan>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MRY6qckr/MVJ+kK2INdi9MO4KHX3MM1GpxKzmuVCag607lHLR4TIDa4e
 FBExJSNS1BcjmCq4MRbunv4TLXVHhSh+nAU/UHeb1clS3gqESkLCp1/vJ5DmuBMx0XE82Wp
 r6dhYKMKQr7BZDwtk2PHb/DyvJ/CorWh27LINQHszriJauHpHS8xsIT6xyZnqD+DyLUP8eW
 DkPNq9bp9N7HtctT+ch3amUKD4BWr+HroTyrP38RkU9fWacMBZkXA8fLpQ+OCjR5DKlKxdD
 Nx4JZ5s/bpkb/qSrRilH8fFj+8k7XlRX5ftbiIKoS6onr78J8/tY3d6Kp4AnlXUqZqDHCTu
 i8SV6xipXpU4ktPAO1xi1Fq9FY96WaIPEjgYuNxu6kbYHrMxUFFyjajXs8ymcGzuI8vt3U5
 x+2GYsezK4fcng21TAxDuTS00NmoFf+j9HZ23j+cUKVEyYjk+HFz1LZYeW3/SxMeeagrmmY
 sFcAzNbO62phM4udZ19j+dTLMqu5/ilgwgnOix5ywMHt3aIxFVD7EHrO9WHDx89aBtU+1jl
 L376wLvnzhxyq/mn8DwtgpkHYO14tSvMo2G2ReBjlC73ptxOuYAmQkD3myRWyMruB0ShWc5
 XaMxSS5Jh3vx05F9soFLz0kFOeGhYKyNT1WSs+gj+RBlsb7FBdcIWd5pNqqjy8ho6pRCiDM
 4tQMEIdTuRvWlqGE1fxPTmxAWx5m3iRr4ObSXZIROhc3jYlkr/XLD2QMv96Q4iHr39AuZOn
 fKR3EGqcrTZd8H+/+5UoAPKjCrMoNEyXBQN8HeEzuTS1x1qijJGYogJaugTXFrV3kNc2g7b
 YO5otpdNY1LzqivLSSd4OMGKBVMV+eSezDgYvzYkdipalutbQ9XfWVFvTlzNOAvIzKfmYXf
 aaX6vXbQkoeHtSdaOqOCi97QqB0k2v6Kz0kcnu8e2rlM+85wGP1uSJkmP60THdyGpfwvXV6
 yEcAi8gW7NDiZNAIsW0gsH3F/wIYcfhV/nq/hFUcQHPqpdLsMQtX+z1XskwOjjjKqoRI=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
Cc: me@ziyao.cc, ast@kernel.org, linux-kernel@vger.kernel.org,
 chenchuangyu@xiaomi.com, edumazet@google.com, netdev@vger.kernel.org,
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:daniel@riscstar.com,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:elder@riscstar.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linusw@kernel.org,m:a09872
 03069@gmail.com,m:davem@davemloft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:andersson@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORGED_SENDER(0.00)[sophon@radxa.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[ziyao.cc,kernel.org,vger.kernel.org,xiaomi.com,google.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,riscstar.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,linuxfoundation.org,davemloft.net,lunn.ch];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[radxa.com:mid,radxa.com:from_mime,radxa.com:email,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3ADDA6520F7

On 5/11/2026 11:41 PM, Daniel Thompson wrote:
> Hi Xilin
> 
> On Thu, May 07, 2026 at 09:57:26PM +0800, Xilin Wu wrote:
>> Do you think if a shutdown callback like this is required? It looks like the
>> driver sometimes does a MDIO MMIO read when the PCIe link is down, causing
>> the board to reset due to SoC side PCIe NoC timeout.
>>
>> After this change, the board can always shutdown gracefully.
> 
> I've preferred controlled reboots to power cycles throughout development
> and I hadn't spotted any major problems with graceful shutdown (which
> isn't to say there have never crashes but generally I expect `reboot`
> to provoke a reboot successfully).
> 
> Just to be sure configured my board with irq=POLL (to match your setup)
> and still can't reproduce.
> 
> We mostly run Debian/systemd so there might be something happening in
> userspace to sequence things nicely. However I have ruled out
> NetworkManager.service and networking.service (stopped this services
> does *not* tear down the network link).
> 
> Can you share a bit more about how to reproduce the problem (including
> reliability of reproduction)?
> 
> 
> Daniel.
> 

Hi Daniel,

Sorry for the late reply. After some more investigation, I think the 
problem is more likely related to the PCIe platform driver rather than 
this driver. So I agree that a shutdown callback is probably not needed 
here.

-- 
Best regards,
Xilin Wu <sophon@radxa.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
