Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFxyCqmN+2lvcgMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 20:51:21 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C309C4DF87C
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 20:51:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06ED9C8F289;
	Wed,  6 May 2026 18:51:20 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57F16C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2026 18:51:18 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-8d4f78fc9f6so1284985a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 May 2026 11:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778093477; x=1778698277;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qVXRMaORBAm1p+hmPERIzD3vaX/XPR3tJcXrI0tApsg=;
 b=DmenBJNMD/W/9ixo+YJkUhjmKGLKphlO+RP8fXx/FWmADDBRwRuNLZOH1mouNEWMBI
 TWRfVPKdptvBjQ3b6TCfhBW9BUT8BgGhk70c+R3i48LwbxxiOVdIoa0AgtWgvQ/Q3xm6
 PsUKPfmbjvApmgIWgtnisw6x846F4p+YXry75LuRxpsncbSBBjRP2DcBfCnHLIVn8gc3
 oo08G+qZfxQvnR2HgImvcK56qJfsig30qat/GCbjNSYlHcV+HqnaWcGFZfbktsiP894l
 1jr1wIax+nsZvQ6/sIiyu5KnX+RZGslVfLvJm+Q+/SeosCtt1LLixQlbgYj/IxXddywx
 VwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778093477; x=1778698277;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qVXRMaORBAm1p+hmPERIzD3vaX/XPR3tJcXrI0tApsg=;
 b=FUqJDpUHn4ywfQsusjRppJImFK8gSgcBPueOU4mKXnFCVrnlpcrGnvKFdX3C1jy39Y
 k3bLttGd4R40V3PWrgPax+dezGI6LKnMQb9TIwyZmu4kHc3XNrUfPl/q0tgA2UeGd9ZS
 SG5OB1ob5Ai3xs25+WDCc8u7E8IeFEAuQsx7JxP0QZf/4LjwsJuL0773jIEUk13GwnYD
 Gaec2e6h0orj/5NYBZxlAiViGkb/FO4wm+qamEXQBLuH1Ytl3usyN8y5RJKgjjMPkAR2
 WdlskN9TMwebS7JK7uDtSoe+szOnevZzTU382uB46CmDqitvUiwziwZ06o9tIFpmM67N
 UNZw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/sXkgfheRC+21P2WZhikCyqAqDA1wp5br0S3Lie2DXn7ZFknQ2cWnxIXaZDMpqxyi/VcSxIXXulLLSZw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxiHO0MQNAPy19BITq1AZWAXfGOZUWzCa8OtJbliiEdxb1kA/S2
 3m+Did3SWvKPcLUkzgbDXmhx1zlpVb3FNlp5XvqWE92NxZnTSegrWlGmNnwT+m19zts=
X-Gm-Gg: AeBDieuZPB0/As5AsNmww2lHFd6hJHX6VUwcT1YI6GC9VpFDMsuvQVUMI3XeNuEHCMM
 V+zgeZpZdjAJYsvZ3sPlEGfNwP/7YHfoIkQCUM6S3Af7nFN7mGncZvEJKoa2YMZNgq2ZXqNauof
 yHUjUmem6cQCh9fpdI1Yop6dsCwjUbCMPdIIn02f9gUkl+91NCzgzBu8djPriK8NvaqVskBxPfR
 j5pFOfcnrDeTtsZSEFtBEEpHjh0C/BzfP0/wLOqTaTyrkcCYGHIYNLrgI9GEKE5hxNe6ecKh/qe
 K/4ROL3MY261WCZR/N6zsQDEiLyxNQpXa9D59/9aYuJc5Pg3baEVNy/v5YgNeb1nsPaHFaiMnhQ
 t0EtVuo6QBPvlpzAHZ4Zc77RNQuCCR+xL8tDt4XNBtQqntEm1WEoAZvscGK2S2Gg84+yZJ+CQXM
 XCMxfB9VoAbapUxTipwfxgFtw3YaXr6DApQkJstFt7hSoSBDNJjtO1l6zWvIBl4mt3u6OM0uns2
 Q==
X-Received: by 2002:a05:620a:1a13:b0:8cf:d804:456a with SMTP id
 af79cd13be357-904d4c54265mr713100885a.20.1778093476942; 
 Wed, 06 May 2026 11:51:16 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net.
 [75.72.117.212]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8fc293837b5sm1889639085a.10.2026.05.06.11.51.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 11:51:16 -0700 (PDT)
Message-ID: <a52659e8-0382-4eb2-ab2f-5563bbb73fcc@riscstar.com>
Date: Wed, 6 May 2026 13:51:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julian Braha <julianbraha@gmail.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-10-elder@riscstar.com>
 <1fe6bcb7-b5c0-454f-ad54-5014006edab5@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <1fe6bcb7-b5c0-454f-ad54-5014006edab5@gmail.com>
Cc: me@ziyao.cc, linux-kernel@vger.kernel.org, daniel@riscstar.com,
 chenchuangyu@xiaomi.com, linux-stm32@st-md-mailman.stormreply.com,
 mohd.anwar@oss.qualcomm.com, weishangjuan@eswincomputing.com,
 daniel@iogearbox.net, chenhuacai@kernel.org, john.fastabend@gmail.com,
 siyanteng@cqsoftware.com.cn, sdf@fomichev.me, devicetree@vger.kernel.org,
 hawk@kernel.org, linux-arm-msm@vger.kernel.org, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 livelycarpet87@gmail.com, ast@kernel.org, linux-gpio@vger.kernel.org,
 wens@kernel.org, linux-arm-kernel@lists.infradead.org, inochiama@gmail.com,
 a0987203069@gmail.com, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, bpf@vger.kernel.org, matthew.gerlach@altera.com,
 hkallweit1@gmail.com
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
X-Rspamd-Queue-Id: C309C4DF87C
X-Rspamd-Action: no action
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
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[48];
	FORGED_RECIPIENTS(0.00)[m:julianbraha@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:maxime.chevallier@bootlin.com,m:rmk+kernel@armlinux.org.uk,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:me@ziyao.cc,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:linux-stm32@st-md-mailman.stormreply.com,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:devicetree@vger.kernel.org,m:hawk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:ast@kernel.org,m:linux-gpio@vger.kernel.org,m:wens@kernel.org,m
 :linux-arm-kernel@lists.infradead.org,m:inochiama@gmail.com,m:a0987203069@gmail.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:bpf@vger.kernel.org,m:matthew.gerlach@altera.com,m:hkallweit1@gmail.com,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:conor@kernel.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.855];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,vger.kernel.org,riscstar.com,xiaomi.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,kernel.org,gmail.com,cqsoftware.com.cn,fomichev.me,altera.com,bp.renesas.com,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:mid,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]

On 5/2/26 10:42 PM, Julian Braha wrote:
> On 5/1/26 16:54, Alex Elder wrote:
>> +config GPIO_TC956X
>> +	tristate "Toshiba TC956X GPIO support"
>> +	depends on TOSHIBA_TC956X_PCI
>> +	default m if TOSHIBA_TC956X_PCI
> 
> Hi Alex,
> 
> In your Kconfig changes, this condition 'if TOSHIBA_TC956X_PCI' is dead
> code. Since you have the dependency on TOSHIBA_TC956X_PCI, you can just
> make the 'default m' unconditional - assuming this is what you intended.

I'm not sure I'd call it "dead" but you're right, it's not
necessary because it already depends on that symbol.

> Perhaps you would prefer to use 'default TOSHIBA_TC956X_PCI', which
> would have GPIO_TC956X default to 'm' or 'y' when TOSHIBA_TC956X_PCI is
> 'm' or 'y', respectively.

Yeah that might be better.  I'd like to eventually include
COMPILE_TEST as well, and that might need the "if" on the
default.  I'll find out whenever I test that.

This GPIO feature should still be a module even if
TOSHIBA_TC956X_PCI is y, because it's not always
necessary to enable the GPIO driver (depending on
how devicetree defines the PHY resets).

So:  In drivers/gpio/Kconfig it will be "default m", and
for drivers/net/ethernet/stmicro/stmmac/Kconfig it will be
default TOSHIBA_TC956X_PCI (at least for now).

Thanks a lot for the suggestion.

					-Alex

> - Julian Braha

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
