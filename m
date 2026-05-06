Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4G9bMa3D+2kREgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 00:41:49 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F04D4E148F
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 00:41:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82B95C0693D;
	Wed,  6 May 2026 22:41:48 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE3C7C35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2026 22:41:46 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-8d65f4073bfso28910985a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 May 2026 15:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778107305; x=1778712105;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cYpEI+XfMfA1fnjJlUUXbcclTkGZqiM6qT8lT03dl1A=;
 b=A74bSGvXwW3orVwiv2VgpZHM9oyLJk4AZGe05czKvI4f5YQO69whVQt3NwIfEK2Wkk
 EcG1mmduu7iusCL+QGcTxiwKTWXAKVqC1vbr98m49r1Djb9fEUEAGhemC7NtgQOLR9L7
 A3YxgHnZWqlUJA20sF4P5AoGJmbG6r6ZfyrSBrGZctYX/a9UT4ZSIzXZQoNSEQ/4EyC+
 ogFzAzhHnh0MrEFAiAM9b9nHjO7U9NZqv6CXNUfxrnehrL2eDNtxkPweWc6tb5HJ8Nf6
 qpZ5Z1KfvCa3pfVn+iLkm4tZU8yFIk4qLtz2nF8LS358txiStZDlseaHp2bG1XWQ4OET
 VPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778107305; x=1778712105;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cYpEI+XfMfA1fnjJlUUXbcclTkGZqiM6qT8lT03dl1A=;
 b=UdoLur/rAC8PnxMMzlnkZevJFtqUXoXrluXmI3kw/echMkJ30eDkEIpSqkfQE5Qddt
 Pd2DiVG5NLeCVoL7dJHKmOcc5C+szBSv6OZEXKQ/Bm4RPrVi6Tbot3b+uygKVXXfcXLX
 rt8IcLzHLYsbi+87Tl8N4TEaoLvW85yyMGbAofavXaPUn2pkXIR8B0TRtQHCSb9QJMkL
 i5LyyiH5bHy7zFfox/iWdt5K9Q7zqV0JVs+WTkcjeGzdmL704DekNbxmyMPUjs02JnMo
 pMe6u0GYacx1fURhz5oErSbyyT8JaVG4LaYH/TJ3K3dPHqFobLJfdXhPwzdz/rBzCYBU
 K7hw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9WgGGHypzcT0b9FuU2WRAzbMUpCGZDLXeq1wF4LWQ7X41JshlEU2J97fLFAGa6NbDuS43JbMGLf8zhLQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxjZt4S0KsSefzcKv4CaHv70hmdiYu6lMo9j7wY/VOLmZSwvSMS
 mM22L+6AvkUc40XMiLrlVm1flup7lJnQ9Lt9f1wwJ1w03LF3cGRo/Zw+Tu7vfrPZh7I=
X-Gm-Gg: AeBDieuxAefOLhmcwgZLlnjO9/Y1h/JxRwHCOL/+tBcc4GytyBd5GvKWnq3u9ukB4A3
 98H8GMoX0i0FEeKR4dEkyEjoOYc5R5mbfNkFTrbJES+puN4n46vxsz+kJy1JNog8itzvru9KNoO
 ObQrcpHMdOebrM1G2QFJULGgTzl5Is5XnrLtuGw7lJr9wHfRlSuHRBoFYUz4+IKg7rjSRBQjl0a
 3Xwt67va1QvxSPj80yqscmxoOQB4UnLXqs4IM3+I+JuW76TrQicXOWwAP9/dw9m/wZDztTv4QlT
 ysAK9LQ5zhW3zKIws2Qy+U6VQN3N52XF8foM32j3k6le66O5KJG/L66br/52EFtp5Xc5QjnRcqf
 DQrX11anYwzpr2BZbt3hM7iHXwzKJZqga3Ze8jd6mYS1KQ8pO7Yd846juH+hzzqd9viewltevju
 MjTUIHeqAxQB7Ouc7SDW7vpAHtVTUYQTT7kXzxyilVPTSepqj2lBSwOYVS5lLeLUKmhJXFd4J72
 k373mBv0XaE
X-Received: by 2002:a05:620a:f0c:b0:8f1:9e59:220e with SMTP id
 af79cd13be357-904d63e7a90mr807845985a.39.1778107305508; 
 Wed, 06 May 2026 15:41:45 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net.
 [75.72.117.212]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8fc2cd06f16sm1787057085a.42.2026.05.06.15.41.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 15:41:45 -0700 (PDT)
Message-ID: <3e1b1859-2d02-41ce-838e-a0b7f4745d82@riscstar.com>
Date: Wed, 6 May 2026 17:41:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-10-elder@riscstar.com>
 <736fb3b7-c88a-4ec4-96ad-d1b79cc48d30@lunn.ch>
 <30cec7dd-ac3c-47ab-896a-c29992bd5ba5@riscstar.com>
 <3666e3e6-e6f3-4cbf-b9fe-caa394fbab7c@lunn.ch>
 <0751a051-9894-45be-92d6-0d46f2c39293@riscstar.com>
 <7d7b6b89-3ef4-4891-a794-c8b11f39db34@lunn.ch>
 <79684efa-4ba9-4144-a99b-dab935007a2f@riscstar.com>
 <ec5765aa-b830-468b-8965-a95fbe020065@lunn.ch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <ec5765aa-b830-468b-8965-a95fbe020065@lunn.ch>
Cc: me@ziyao.cc, ast@kernel.org, linux-kernel@vger.kernel.org,
 daniel@riscstar.com, chenchuangyu@xiaomi.com, edumazet@google.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, mohd.anwar@oss.qualcomm.com, weishangjuan@eswincomputing.com,
 daniel@iogearbox.net, chenhuacai@kernel.org, john.fastabend@gmail.com,
 maxime.chevallier@bootlin.com, siyanteng@cqsoftware.com.cn, sdf@fomichev.me,
 kuba@kernel.org, pabeni@redhat.com, konradybcio@kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org, hawk@kernel.org,
 arnd@arndb.de, brgl@kernel.org, linux-arm-msm@vger.kernel.org,
 richardcochran@gmail.com, rohan.g.thomas@altera.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, livelycarpet87@gmail.com,
 linux-gpio@vger.kernel.org, rmk+kernel@armlinux.org.uk, wens@kernel.org,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 gregkh@linuxfoundation.org, linusw@kernel.org, a0987203069@gmail.com,
 davem@davemloft.net, andrew+netdev@lunn.ch, boon.khai.ng@altera.com,
 mcoquelin.stm32@gmail.com, inochiama@gmail.com, krzk+dt@kernel.org,
 julianbraha@gmail.com, andersson@kernel.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 09/12] gpio: tc956x: add
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
X-Rspamd-Queue-Id: 5F04D4E148F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linusw@kernel.org,m:a098720306
 9@gmail.com,m:davem@davemloft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:andersson@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[48];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,kernel.org,vger.kernel.org,riscstar.com,xiaomi.com,google.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,linuxfoundation.org,davemloft.net,lunn.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	NEURAL_HAM(-0.00)[-0.879];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:mid,st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url]
X-Rspamd-Action: no action

On 5/6/26 4:43 PM, Andrew Lunn wrote:
>> To be clear, the reason you're asking is that you're suggesting
>> we might want to model the GPIO controller differently, correct?
> 
> Correct.
> 
>> I.e., model it as *not* associated with the embedded PCIe
>> functions.  Then we need to think about what its parent device
>> would be (the power control device, which I think somehow
>> duplicates the switch device?).
> 
> Logically, the GPIO controller cannot be part of a downstream
> function, if you need to use the GPIO controller to turn the
> downstream function on.

Yes you're right, though the PCIe power controller functions
before the PCIe switch is enabled, and uses I2C to communicate
with the host.

> Logically, the GPIO controller needs to be above the switch downstream
> end points. Where above, i don't know. Which is why i was asking about
> where it appears in the address spaces.

You are touching on an issue we have faced since we started on
this earlier in the year.  Our objective was to enable the eMACs,
but there was no device representing the "chip" (which holds the
switch and the GPIO controller, etc.).  The TC956x is more than
just a PCIe switch, and more than just two Ethernet MACs.  The
vendor code handles some of this between PCIe functions with
some reference counting and perhaps other things.

Eventually we settled on the model we have presented, which
creates a device for each function and lets one of them take
care of common "chip" things (including creating the GPIO
auxiliary device).  The function device driver creates a
new auxiliary device to represent the MAC for each function.

I also considered modeling the TC956x as a remoteproc, but have
been reluctant to really pursue that.

> But i also don't know too much about PCI, i'm used to SoCs with simple
> linear MMIO.

I'm no PCI expert either, but I'm learning.

>  From the little i know, it is more than what address space does the
> GPIO appear in. Its also, what enumerable entity does it appear in
> within the PCI bus. Because its the enumeration which is going to
> trigger a driver load, which can then drive the GPIO controller.
> 
> Or, something more radical, you make the PCIe power controller an MFD,
> instantiating both the power controller and a GPIO controller over the
> I2C bus. GPIO access will not be as fast, but is there anything here
> which needs to be fast?

I considered that, but opted not to mess with the PCIe power controller
driver.

It's only asserting resets in the RB3gen2, so I don't the speed is a
major factor.

					-Alex


> 
>        Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
