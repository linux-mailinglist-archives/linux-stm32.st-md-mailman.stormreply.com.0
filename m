Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GrhVOtzb/GnqUgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 20:37:16 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF9B4ED839
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 20:37:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3B09C8F289;
	Thu,  7 May 2026 18:37:15 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3A06C8F283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2026 18:37:14 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-7bd810cdc5dso12883317b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2026 11:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778179033; x=1778783833;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x8i4c2z2WoES1t5qSKN6GUknygX5CCKfGDT1oqYJPeA=;
 b=Z2EhuUG0OQXcMFrA14QxQdIteYjWsTLOYVdblROaV8Te+7eeqfG9kBrgcCN9V91j2J
 UPowaycspsvOw+3c021eTSH/KePl8nzCNRuHzquG62QwzDNBadOXgms8N6ndSFrXb686
 qJ9vnF8vH/bMAFweDrO8EbnhQm8ZevRPvtv6LxDfz8eDTHbd3DnXxL7aKSuumyk/xZj8
 Zuy/VgbeLuHrXKc7TtVbwV0BFV5qlGejGCQp8NhZU1uJ9k64BM02e47L2gDGL7MKtFww
 +O4b7QXlb8f8Wk2co6ayrjLldKe8p/GiDp2UPQuB54fikz8fcFrM4E5Z3otjTxi8U/GB
 grZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778179033; x=1778783833;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x8i4c2z2WoES1t5qSKN6GUknygX5CCKfGDT1oqYJPeA=;
 b=M5bl65yfwRjlloYF/NCGm3fhBDlQ0d/W57+J6VV1mQhtndyHyy/IvYxr4UJ9w29vHp
 zwahJS3pF4Nvt2TY8ZwF+RuWlSlfV81iAFeLfOPIakTmcoG7KOnt5bWlI2lhpS9hlf2i
 xaTrh0ZN5qaqqvgJ4BJI4negcOTMDRgcExR3Cs/lpx4euflT3n5PesHROfibWV7Triri
 0SjcEHEQILr59MVpT9jl+Vc3Ozcn8dviXf6lm083oPKCtf74hyU8fbC2jjZ6uQRLFf9M
 RApbqm3LNo5EPZcwHsGzQXHg/WrkaojIQ+JhVBSkI0dwpeWzIHUTJt/CRUx4/bD/cPXI
 fcIA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9JZw6xYVdFM7Doqey9/hSHS9iWPUa26h5U9psWadHF8LqMLDrF++ZCSviiisX7abTj1dRzT9eIoGakXw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxSxA2bAtSZiykPVSpBNITfvCcu77iJGQRIogbvpy/Pd+kqkpie
 d6QGSmog8Hz/WRn4TduhZBebVa8ltbAinVlTI/a60mZNBcmcMgEeElwSUrf+KO0XckE=
X-Gm-Gg: Acq92OEPESfYdDkbrT4FO92mBl+HszWxsbuPrgPLyNawxLs51JEi1N6LJYc9MIzBuIz
 UcxtdL29+928rQCAhiIR+deY9j5cmF1JDhJoXtf8SdyN2/M3H78xHnJYnCg9q+QxpkB58v/d7Tf
 OwfxBPvRgZxkXEYDmfIdkl6OOyU4+lW/nmyHFtBb9J+9Auu6X5CFJ6H5Z21oBeVtFmONu53xSay
 Xz7YdJUZfGQqmKo+ssjBieeQcQYogOv3/hj9OX3aAvevbC1V9JRdt2kdRXEiXnL1tx2v0zNORQz
 tlYDdBH/BGew9EgF2mu3o/EvZ50x/PKuCoLuDZ8aTJZl3RnVBlsMdTRaLFPpDwbul7hLBrcHSI9
 70NNf2LwxXLQsQIeOPeHtXB/5aaGEuzM9YixzkztAbh8tXDwXfyAni0PU2J6q5UqUo/Sh1oIi19
 woEBvJGf0ZFbysS5r0esl6trmNsEmBJqc3+48uSOjUU7LzDigL8UF2ZmjM2k2zUF4V
X-Received: by 2002:a05:690c:6101:b0:7a3:7ad3:3e9e with SMTP id
 00721157ae682-7bdf5e7cda0mr98323737b3.32.1778179033551; 
 Thu, 07 May 2026 11:37:13 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net.
 [75.72.117.212]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-7bd976fd09asm57064577b3.41.2026.05.07.11.37.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2026 11:37:12 -0700 (PDT)
Message-ID: <3c78f48c-6478-46d0-87c2-581bb58637dd@riscstar.com>
Date: Thu, 7 May 2026 13:37:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bjorn Andersson <andersson@kernel.org>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-9-elder@riscstar.com> <afycOwz5TpkegkZd@baldur>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <afycOwz5TpkegkZd@baldur>
Cc: me@ziyao.cc, ast@kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>, chenchuangyu@xiaomi.com,
 edumazet@google.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 mohd.anwar@oss.qualcomm.com, weishangjuan@eswincomputing.com,
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
 andrew+netdev@lunn.ch, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 inochiama@gmail.com, krzk+dt@kernel.org, julianbraha@gmail.com,
 matthew.gerlach@altera.com, davem@davemloft.net, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 08/12] dt-bindings: net: toshiba,
 tc965x-dwmac: add TC956x Ethernet bridge
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
X-Rspamd-Queue-Id: 7DF9B4ED839
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
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linusw@kernel.org,m:a098
 7203069@gmail.com,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:davem@davemloft.net,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[48];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,kernel.org,vger.kernel.org,riscstar.com,xiaomi.com,google.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,linuxfoundation.org,lunn.ch,davemloft.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	NEURAL_HAM(-0.00)[-0.639];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:mid,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

On 5/7/26 9:12 AM, Bjorn Andersson wrote:
> On Fri, May 01, 2026 at 10:54:16AM -0500, Alex Elder wrote:
>> diff --git a/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml b/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
> [..]
>> +
>> +  gpio-controller: true
> 
> I don't have any concern with the use of a proper gpio driver to model
> the implementation, but if I understand correctly this relationship
> between gpio controller and gpio consumer is strictly internal to "the
> PCI device".

(I think you're already cool with this but I still wanted to respond.)

That is not correct.  These GPIO lines are used two ways for the
RB3gen2:
- drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c uses GPIOs 2 and 3 to
   assert/deassert the reset lines associated with the two exposed
   downstream PCIe ports on the PCIe switch within the TC956x.

- Each of the Ethernet PHYs has a reset GPIO.  On the RB3gen2, the
   GPIOs used for the purpose come from the GPIO controller embedded
   in the TC9564 (00 and 01).

These are therefore "exposed" (they are *not* strictly internal).

> Is this connection variable or is the link merely expressed in
> DeviceTree to mitigate the fact that you choose to implement the
> responsibilities of the two parts split into two device drivers?

It is variable.  These resets might be implemented by other GPIO
controllers on other platforms.

> Are there other consumers of these TC956x gpios which would result in a
> board designer (and hence dts author) to ever reference this
> gpio-controller in a different way?

They could.  Nine of these GPIOs are exposed by the TC956x pins
(GPIO00-06, GPIO12, GPIO35 and GPIO36).  The RB3gen2 uses 00-03
(and possibly 04 but that's for a PHY we haven't tested yet).

					-Alex

> Regards,
> Bjorn

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
