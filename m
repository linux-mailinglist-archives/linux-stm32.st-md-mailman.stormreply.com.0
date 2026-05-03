Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kITTF4CT+Gl8wgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 14:39:28 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACE44BD06D
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 14:39:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F40F9C2909A;
	Mon,  4 May 2026 12:39:27 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BDDCFC8F276
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 May 2026 02:07:19 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-8ef5776530bso351555985a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 02 May 2026 19:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777774039; x=1778378839;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2F3DN6wiiB7iU2Xt5hwtqlQ5YfweZqx1JbBrqimlAs8=;
 b=AQqK9EktTrQqEa18vuZClVJGdvhO3doUmxkFjJyz0I2yBUu5U3/T1rqg+1XVHIDlCi
 gb12VJK97PNIBQUfwCTBQDI8sKUOVEqN3KsX9JfkXzN5bllIUiQtOItcF2c/0S3mlXml
 0pTWzTRbeZEQcxol3Ysm/SnwLbqv3jFR984zxz6rr4minlYvOCI8k5cowyjb5IM3FSAB
 HR69HLAWMJxXZdJFML/XNxXMcawXPeRk+cBfG4zfeIvrmxuMnREo6+g8bhX+ZMhszxuM
 H4AVa+c8mhKe1Y9RkpZmQT8wfe+p7g7mENPH+0gGKPCCJ8C/JgM763TPgRJwU0+cKhTh
 MdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777774039; x=1778378839;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2F3DN6wiiB7iU2Xt5hwtqlQ5YfweZqx1JbBrqimlAs8=;
 b=r8soG6DMxoob54+WfXGv4yBwPIOlyqG4hX5UgDBqdtXwIUO/4HL4jGO1I4362Vp29X
 /d70RE9nbf/3s2ryWuFu12EK6VZzzPv7STmndeCPJkvVlNK/Se8bnkTIgOcLqwLc6jdY
 Rw+iWBCs6pkp1UVqmWJte7VLaSRHed5odRwsAbS4I4gZhPRU2Wk61DlFyU4ZiS/K2h6Y
 ddF4pnV6ttS7FHtBPzdI19i5mkutOP+eBpMJo5fOMgt2fnEFOasYlKtZtuVbuy3UJ/Ju
 UPcSitCLF4QNxkqrIE9/gWYOIlSEdRaPrv58lg9BgtpLeNeEG+ramvSbi6d8FoORV9xG
 w/9w==
X-Forwarded-Encrypted: i=1;
 AFNElJ+n4/+mrKXryBw/tMfSY+NKeaTU0Ccl1ZD1uPsJd01NuvjKzH964EliBLvniljgkNuc7HR25SVMrB9utg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyWE+0+vfn9WoWobxjNCm/MIT6GZa1R+2TH/dgorvQr/CKm20Eg
 Lff03/yelHiXF/Qdyewri0o0s6G1L11sp45cGeQOJM27Ts2qg2owkl0E4hlMTcZoQD8=
X-Gm-Gg: AeBDieuqkuu5k2iTFSY2Xcrgp5Rqoy9ORHwcaNRIoUyH7HdJEs9VwqkfW72rUQZg0f2
 18twS4mnRY+UMYUCknAkefmq5fUwc6DnHRGPLpTaWIETUj6DqoiSltoVyFtLeRsnPwdPWhEJYBs
 gUDVoRPoBfJj9kEadX1nkRCQk5aKAK3rb5jCenIac2BSlG29R8DV8sPL5iut7Ao0BBmHPEPjdT1
 dYjR8DpUxlRGf0zwmCyL7ws/IMOHaUfddAByqzYKwEcic2qrA+ds/9yoy1mqHRCmUTK6B3oIrbO
 P1rdSJYJQdMKPwUSidoLY3sM9UInsKP/xiAWtgQDf+tx/q9IgUDLh4IA1OnSEIiYrP3Qs8Hm/m/
 wATcGbM7pZ85NOpZsz86iGIMMqxl4i2+rdxYy8uwlx8o3eei3AxYS4GceWBb/Lqq4BPeUbfFWe1
 VBPLnY+gAYfFMPdjoCgj17KoBKQbncxAP9wXU959NVnjxI5xO8W6FpjfsCCyCuCoQFZtCzwyYQc
 UI0OvR863dm
X-Received: by 2002:a05:620a:6914:b0:8ee:cbf0:8311 with SMTP id
 af79cd13be357-8fd18337fcamr755624485a.54.1777774038660; 
 Sat, 02 May 2026 19:07:18 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net.
 [75.72.117.212]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8fc29889603sm636397485a.11.2026.05.02.19.07.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 May 2026 19:07:18 -0700 (PDT)
Message-ID: <e39b710e-c742-4485-8798-7e27bf15e0ac@riscstar.com>
Date: Sat, 2 May 2026 21:07:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jakub Kicinski <kuba@kernel.org>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260502094712.69b29dc8@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260502094712.69b29dc8@kernel.org>
X-Mailman-Approved-At: Mon, 04 May 2026 12:39:23 +0000
Cc: me@ziyao.cc, ast@kernel.org, linux-kernel@vger.kernel.org,
 daniel@riscstar.com, chenchuangyu@xiaomi.com, edumazet@google.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, mohd.anwar@oss.qualcomm.com, weishangjuan@eswincomputing.com,
 daniel@iogearbox.net, chenhuacai@kernel.org, john.fastabend@gmail.com,
 maxime.chevallier@bootlin.com, siyanteng@cqsoftware.com.cn, sdf@fomichev.me,
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
Subject: Re: [Linux-stm32] [PATCH net-next 00/12] net: enable TC956x support
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
X-Rspamd-Queue-Id: 4ACE44BD06D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	DATE_IN_PAST(1.00)[34];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[48];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linusw@kernel.org,m:a0987203069@gmail.com,m:dav
 em@davemloft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:andersson@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.638];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,kernel.org,vger.kernel.org,riscstar.com,xiaomi.com,google.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,linuxfoundation.org,davemloft.net,lunn.ch];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]

On 5/2/26 11:47 AM, Jakub Kicinski wrote:
> On Fri,  1 May 2026 10:54:08 -0500 Alex Elder wrote:
>>   create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
>>   create mode 100644 drivers/gpio/gpio-tc956x.c
>>   create mode 100644 drivers/misc/tc956x_pci.c
>>   create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
>>   create mode 100644 drivers/net/pcs/pcs-xpcs-regmap.c
>>   create mode 100644 include/linux/pcs/pcs-xpcs-regmap.h
>>   create mode 100644 include/soc/toshiba/tc956x-dwmac.h
> 
> Please add an entry to MAITNAINERS for tx956x stuff?

OK, I'll do that for the next version of the series.  Thanks.

					-Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
