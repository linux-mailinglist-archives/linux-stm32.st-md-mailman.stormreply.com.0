Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HPMF4CT+GnSwgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 14:39:28 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 431BC4BD06A
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 14:39:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB17CC0693F;
	Mon,  4 May 2026 12:39:27 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33BB2C8F276
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 May 2026 02:06:38 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-8b1f2b7f1bcso44032286d6.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 02 May 2026 19:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777773997; x=1778378797;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PnVCaxNshzzHjwMMq5W7gN5QUApxgL+R58MdQlfO6d0=;
 b=dcOQSWrSvaG8iFptgPuhSfUlO5GZlzcFziUDQpL/CX+QLADj65sysmkq2V/UuN9tkH
 HAQ0lCzWfdzLpYldwRcmp7R/XV3pB7hB6UUq80cKznUfw4gaHjyyt8cMD72JuTK2mQoG
 TGbEHH2p0ICw8TbMarjbS7B8cj62aE1mwWu2FX0yWfXWsw3Gk58qtpFwz8k2+AwSvBuI
 UvVqAN+qNRPE6+RNBLBHpk2gNWoT9MbqYSYA9aEFfFMlJXxn3OFQ16msZjQtmyk+p+Ji
 fVvanxNc7s2rzofpaOkgFiskiU4M6bVbCRxp1/QNShUm0BkUfOe158E4WSoV4we0pYhV
 zAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777773997; x=1778378797;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PnVCaxNshzzHjwMMq5W7gN5QUApxgL+R58MdQlfO6d0=;
 b=GNQDVA4f8KXdqzN2na+Qr9KcWu3vndSfiJqusDdbGiGml0GyLAMBpPieAUqpZMALf5
 fssvjGB4Nso4kZYuDrIkIeQnfO4zt7UQBO6avHPPzqU9jS5aeZUZND7u3f12bU9Vwksr
 9e/lyBnQuf9FuIUIMlJiF3KFM8JLYDjq2ktkBx++zQyRIlg7fa21F3bJJDalgPbCa2CD
 QH7OYDQQVaF4rj+Ji1eQV5EqEz3VdVyQBihp+CXrp7eaesWzThB0QeLSZ6XowMbfAjy8
 px5IDR0cO8X10UK2NLpWxMzWygzPZxs33hWmR8lKNWuM113t3+jJPqm1wy8eiqMo8ri3
 I2TQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9NnsMbK6wWyhHXHILQWtmjm/nXjgQFjZG8VWwDnRn2DhgIdt1OuPRC2RqYnH1M4uEiEP9ykOXGtXCYqQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxz1mL5YHKBtUvaGm6qgvXTI24Q1W5OYga0ZWiINM7Hygwo9fJk
 GZvtp/DXb0CqQ0f6kj1dZWSJE0an0p+8wURrvuWo1K+VFHr1QsgMjyqgjs4lux9F14Y=
X-Gm-Gg: AeBDievUorUSBZuom1904LFC9uUAjGbiKQf8v6Lj5364JR1EAZNmDfYYSIPN56GZtl6
 Yk54I1OQJgLvsvUwnbb6KS3R2GvPVoMgdr/U0U/wqRAgybgCyAFFwHX9afVo17HrAs6mDFBxLAP
 wBpkUAhnjlhcjkga9FoTc5ylcVbUzVpJaTKKtErXhGbzqOdZGRMOxVrzA1ON3d61+YLsEz6eIPt
 L+z7JYWbUiowmyKzBVcy6x9e29KpNoD6zMXgylElbLlUpUyUOSN+X196+GXSDMjvKUjZVkOV92u
 zm9hAUKCt2g5jTMUaUPz6ytSghmMvqd1l+yNWzsxnJycCUrUpchLtnVQPjcyg5N4qI9G9CxbcCo
 WEed6kj5zKLTjBGDjvi92+NUlFr16yd0sR92ChNOl0eAWzom5QC1rBqKZ4but9bgSGkXpi3eVVb
 Tapbv3EqrB6c0+PwKJscIpA7LdMNfFd2m1NWNBrmVm391Xd8/MgvDGp5wyYWkrwKZXWsUlhuAQW
 w==
X-Received: by 2002:a05:6214:610d:b0:89c:8a3c:e34f with SMTP id
 6a1803df08f44-8b667b79753mr56665696d6.12.1777773997147; 
 Sat, 02 May 2026 19:06:37 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net.
 [75.72.117.212]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b53d831ac7sm72634806d6.49.2026.05.02.19.06.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 May 2026 19:06:36 -0700 (PDT)
Message-ID: <649428a4-9505-4a1a-bbbe-bd90be9b8155@riscstar.com>
Date: Sat, 2 May 2026 21:06:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jakub Kicinski <kuba@kernel.org>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-12-elder@riscstar.com>
 <20260502094559.15c3f479@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260502094559.15c3f479@kernel.org>
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
Subject: Re: [Linux-stm32] [PATCH net-next 11/12] misc: tc956x_pci: add
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
X-Rspamd-Queue-Id: 431BC4BD06A
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
	NEURAL_HAM(-0.00)[-0.645];
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

On 5/2/26 11:45 AM, Jakub Kicinski wrote:
> On Fri,  1 May 2026 10:54:19 -0500 Alex Elder wrote:
>> The Toshiba TC956x is an Ethernet AVB/TSN bridge,  and is
>> essentially a small and highly-specialized SoC.  It implements
>> a number of internal functions, including a GPIO controller,
>> control registers managing internal reset and clock control
>> signals, a PCIe switch and internal endpoint, and mapping
>> hardware that translates between PCIe and internal addressing.
> 
> drivers/misc/tc956x_pci.c:541:17: error: call to undeclared function 'u32_get_bits'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>    541 |         chip->rev_id = u32_get_bits(val, NCID_REV_ID_MASK);
>        |                        ^

Yeah I think I noticed an error like that shows up with 32-bit builds?
In any case we didn't see it during development, and we'll make sure
<linux/bitfield.h> gets included.

Thanks.

					-Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
