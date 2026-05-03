Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +P0PCYCT+GnSwgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 14:39:28 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC9A4BD054
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 14:39:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B799EC628D5;
	Mon,  4 May 2026 12:39:27 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7F4FC8F276
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 May 2026 01:45:54 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-900fa9f178dso44330685a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 02 May 2026 18:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777772753; x=1778377553;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k2VDIdBulUU5TGbhBANhJGFN/QeEIFSIYNJHL/TT6dc=;
 b=fjnCckEBKSIIvO/GavDh0SqrI1IQpeaWfY7HMoebM1/IiGw0LbmEzepC+lQbKyO2ns
 d+S7Jn+SkPOwVuFRPfYV2Y7jYWdmVZtzN903ydggwhouZ3ZnFp/oG28fIjLPSFlY/tR6
 Cm/YVUCCQme/I+IEtmnmyV+33M/fmLU9n/Hf4GnO1zzFAbkpgxfyj9NK424xflvA7k4O
 ks97jVxLZkYH6EgwakMiNVMIgAgLRqr3PRV04pNYzBijVLXNT/gigslpDr0kajc8zWQg
 mBIWFDz6tk3ppGOLyixt56f39O2Z403viVEXx//QqU0CTIL1JincZ35nZNsIY0xiANzX
 +pVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777772753; x=1778377553;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k2VDIdBulUU5TGbhBANhJGFN/QeEIFSIYNJHL/TT6dc=;
 b=r0/KXFPwN/4q2tfbFmBLmp+Lcbej8KbvY5Gm+yJY18zXuVLFcWcbGu+UsdGj+m5+IJ
 4Q5QLfxl2IXQCd9rC2Eyd1IuFT8OaRayyfsxDdyEuIO4tuks/lF2UCH3aOuHdfVn19sR
 YgBH13tGoKdogE4uXJYzIYjFikogvqUxpLfGU+Pk+R7ThjFQfdCzdJUfhb7kQQFki0P7
 G8xBHqrOC0OAFBmKq+vaT+XM4SRXlsHBEGT3y7ieS5b6e6UtIOJY85+Lkxke9RNlovxp
 XRyRUKFIsUysT2P5N+HA8+wfVfO0z5PjnFgnkXGLDOK3msPcawTuskHPnmy66540mHUx
 akxw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9I9uFcn6nkkrEigLFkRzesA9NVUAs/dXoHWKoNkuc/WIj180QjkZRxgA3g8nE2PSPnNXI0jz06MnJ8fQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwXo7MRSmQvqjf50rQzE9KxRHyGqHQc6aoINdXFgn0CW4xAYxzO
 bR6J1wfPADxkgcbOGe6mhQvlg2FU3XFpAUgzQ6MZYbrreVDpNU0AzpgUw7Iw7OBH4Sg=
X-Gm-Gg: AeBDiesqNMbk1VGWNh4l9xmFTSMySi0KAyPv18DKPAP+OSOhRA8acg2vhVJxCMukGGW
 s8LoCGERH17Ymnn4c33kz5X9b9cQOK2Zl/lTaptabMF6BMDz6RGVqejBywqtsj/29mCVTCQ2oc2
 Huom4unPAbNvAVWS+ezdS3THZbaTGISP56p4mpcgHCswEKDTKfVVeFTE7R929OgloGjPHhxT9Ty
 Lbik6caAzX+CxHXOeEgBEM5MTkXXtnWtIRipAZFZApYSsKFkR1DmTpb7QVbLsZKhN8RIXyflDR1
 Cc/j4b3BLIUNYGzC5htuFvxT27n/TdWta/3PGitKLm9Hv4XOZAUEHzzOdGvL1qqbhLWEaihtHE5
 xk2u2ENBLyA1UH8b9SaljSIex4CDikUFoKkrfxvTwckakAcH5Vzppe0Zy3jSxLdoi9h179OrxOx
 31lwxhh+jDCnfJBzKu8BitHaCIpIU1sncaKmXziIk8ZKE5WII4Nu3t2tKY/OMfz4hZ9G+zvMrJc
 A==
X-Received: by 2002:a05:620a:284a:b0:8eb:10d4:a471 with SMTP id
 af79cd13be357-8fd17e4b6c1mr769719785a.43.1777772753243; 
 Sat, 02 May 2026 18:45:53 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net.
 [75.72.117.212]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8fc2c9229c8sm680230385a.36.2026.05.02.18.45.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 May 2026 18:45:52 -0700 (PDT)
Message-ID: <30cec7dd-ac3c-47ab-896a-c29992bd5ba5@riscstar.com>
Date: Sat, 2 May 2026 20:45:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-10-elder@riscstar.com>
 <736fb3b7-c88a-4ec4-96ad-d1b79cc48d30@lunn.ch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <736fb3b7-c88a-4ec4-96ad-d1b79cc48d30@lunn.ch>
X-Mailman-Approved-At: Mon, 04 May 2026 12:39:23 +0000
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
 julianbraha@gmail.com, matthew.gerlach@altera.com, andersson@kernel.org,
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
X-Rspamd-Queue-Id: 0BC9A4BD054
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
	RCPT_COUNT_TWELVE(0.00)[49];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linusw@kernel.org,m:a098720306
 9@gmail.com,m:davem@davemloft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:andersson@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.655];
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

On 5/1/26 1:36 PM, Andrew Lunn wrote:
>> + * There is a TC956X PCI power controller driver that accesses the
>> + * direction and output value registers for GPIOs 2 and 3.  These
>> + * GPIOs control the reset signal for the two downstream PCIe ports.
>> + * Their values will never change during operation of this driver, and
>> + * this driver reserves these two GPIOS.
> 
> Why doesn't this power controller driver actually use this driver to
> control the GPIOs? Chicken/egg?

I am not the one with authority on this, but yes, that's my
understanding.  *Something* about this chip requires that the
PCIe ports need to have some configuration done on them *before*
PCIe is powered up.  So that driver uses the I2C interface to
apply these settings.  Meanwhile this driver uses the PCIe-mapped
memory to manage the GPIO registers.

> Maybe add a comment why gpio-regmap.c cannot be used. You probably
> need to instantiate it twice, but i still think you will end up with
> less code.

It's possible gpio-regmap.c *could* be used.  We started with
vendor code and this code got separated at some point along
the way.  It was working, and I don't think I pursued other
options at that point.  I'll look at this possibility before we
send out the next version.

What do you mean instantiate it twice?

					-Alex

> 
> 	Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
