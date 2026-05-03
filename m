Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qA9aFoCT+GnRwgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 14:39:28 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4339D4BD06B
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 14:39:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C73ECC62D2C;
	Mon,  4 May 2026 12:39:27 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A55F9C8F276
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 May 2026 02:06:33 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-8d736211595so208310385a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 02 May 2026 19:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777773992; x=1778378792;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pi7lj8hY/RV2kHI36GdoypDFeZXohRaZRLU99hRCU8E=;
 b=WfHArJ5Ji4uAAPgpm9qoOPv5dllrGzUaAfqnn4yuhUc1kwY00rKUS4R5xDF6eNir7L
 eAB0AGt7TN30/dfEOMSkR6wuMpWSoi5XU9/lB2CJNI9kr7Sg8S0DNY4APKf5Xj2lUsiL
 /xpCVSwGQJaNHbzBjQCTOyqx37sDX81/ZNlP39m3kbiifv2GCUhJY0rlKDfK8YofQAYs
 JiNtHKIlO/3GG0N4c16SMxzdBSIy1NKi65qeGbc7/57qze5AmteQnR54UUAZBrhKKsMg
 95VMsYrhXlGCOa0XSIBKZvLF+0m1UFIVq9VjXOeJUjOUH8Grv6RJt/5ooiV9yKd22OS1
 SH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777773992; x=1778378792;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pi7lj8hY/RV2kHI36GdoypDFeZXohRaZRLU99hRCU8E=;
 b=pw6A75qkdFT3zmFQPU3W0+GKZmt9KeVDxguezqU+DNdM26jpICgbadJmUOmqA7Qdnw
 2VYgm6WbZviUBOq7geh6EZlwxJ0GFJnHC60dbe2TJ1VVDG2Ouymart6diV7I9A5YMgsI
 WowOefi4B+/gKZUr3dHp3/NF5CHTOpoaQ74BoAOM4JPoKCpz9s8IR0p58+f1/ezv56MB
 lWsQCKaB5+dVa89RiMtSGP3YTmsBZWBCIxdrXMuJh5/TdNRhCuwO9mIdpku5VOG7h/qt
 b99xGzwVcv4i9oKSHLAzVLUaTAjCiO3aSXztJ6uTkhpamg93VI6BUFNcJ+LaBRyKW1co
 hX9A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+fe1dAiRsxO7Jtisbi0F2fDblhch/D0RcJwXxwlk0/2JFancDRPmBXSz4uTm42QL3BGJ8dx4pu/D0NNg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyQ1uHKP7JSbq6HEkx2GoGz5CjYPeq280ChrwHN5BuMVqHN4BoK
 +9xJBh+EhFo6RnFtykrF74bnQ7nBnbb3VEltEzf8XmZJPHOE3muEfXzMo0g1QQYLsvM=
X-Gm-Gg: AeBDievl7XfZMBHXnPVAf2KIxpvMpouSDY4GDd1DV2IDSSdwRH5lKsB21a640YEPOCh
 R//H/kk6Sc6wl0gtuV359xqnA6SnH4R1NC94IKJk/yTtdRssntr6oh1zjNr9mmar2dXSjKUgkP+
 hFmn3KTCF7iQ2l8KDdu7qnNIu40Azyq1Xvii/dYbtTC7aQI2pjRz+AEh9jTeFceaR5SN8lk0kfU
 VuPqUwRaGIxyx89M5MTfV9AjtIHtoTTjC0IUIttDNgtJ5PC/vsp3VYtkJa6YGfcFZHeOc/YXsl4
 KndKg0rzJMgrU9KPhsPxqzsGYJmjnmm1VYGXg2i0QboHv3D7gzQ344camirtjd2QNl7y7U60mxl
 Q58SMxrC5Spu+DBchMi0hBKxfwqSzczwLAqVo2fcRfXYVYejW/InPVHp9mNUdPX5FYc8F4TNI+1
 DpEgOugbRLsRAvaAV+xge5J7z+sDTuzif/L5S6V+aASWotZntSGZ9ZuFRvaLO14aJvmwAT+REgq
 Q==
X-Received: by 2002:a05:620a:4083:b0:8f1:5e8f:ffe8 with SMTP id
 af79cd13be357-8fd16aa97ebmr768552485a.23.1777773992247; 
 Sat, 02 May 2026 19:06:32 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net.
 [75.72.117.212]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b53d831ac7sm72634806d6.49.2026.05.02.19.06.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 May 2026 19:06:31 -0700 (PDT)
Message-ID: <083e91d0-d86f-4de9-a01f-ce44eadacc13@riscstar.com>
Date: Sat, 2 May 2026 21:06:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-12-elder@riscstar.com>
 <f9336d01-e2d1-4894-848a-17ab20976872@lunn.ch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <f9336d01-e2d1-4894-848a-17ab20976872@lunn.ch>
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
X-Rspamd-Queue-Id: 4339D4BD06B
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
	NEURAL_HAM(-0.00)[-0.666];
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

On 5/1/26 4:07 PM, Andrew Lunn wrote:
>> diff --git a/drivers/misc/tc956x_pci.c b/drivers/misc/tc956x_pci.c
> 
>> +static inline void chip_reset_assert(const struct tc956x_chip *chip,
>> +				     enum reset_id id)
>> +{
>> +	tc956x_reset_clock_set(chip, true, true, true, (u8)id);
>> +}
> 
> This is in drivers/misc, where the rules might be different. But in
> netdev, we don't like inline functions in .c files. It is better to
> let the compiler decide.

That was a mistake.  I agree with that perspective.  These functions
were moved out of the header file because they were only used here.
And in the process, I neglected to drop the inline.  Will fix.

>> +static void chip_init_state(struct tc956x_chip *chip)
>> +{
>> +	/* The only IP block we currently use is MSIGEN */
>> +	chip_reset_assert(chip, RESET_MCU);
>> +	chip_reset_assert(chip, RESET_MCU1);
>> +	chip_reset_assert(chip, RESET_INTC);
>> +	chip_reset_assert(chip, RESET_UART0);
>> +	chip_clock_disable(chip, CLOCK_MCU);
>> +	chip_clock_disable(chip, CLOCK_SRAM);
>> +	chip_clock_disable(chip, CLOCK_PLL);
>> +	chip_clock_disable(chip, CLOCK_SGMII);
> 
> With my networking hat on, this one standard out.
> 
>> +	chip_clock_disable(chip, CLOCK_REFCLK);
> 
> The name REFCLK is sometimes used as for the clock signals for RGMII?

You're saying that the REFCLK disable stood out, and you want to
understand what "REFCLK" actually represents?

I believe this is an *output* reference clock signal generated by the
TC9564.  Looking at the schematic for the RB3gen2 it leads only to
a test point.

However I want to compare notes with Daniel on Monday about this.

Would it draw less attention if it were named "REFCLKO"?

In any case we can add some reassuring comments.

> 
>> +static int
>> +tc956x_function_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct tc956x_chip *chip;
>> +	unsigned int msigen_irq;
>> +	int ret;
>> +
>> +	/* Despite being a PCI device, we require devicetree */
>> +	if (!dev->of_node)
>> +		return -EINVAL;
> 
> Might be worth a dev_err(), since it is unusual.

Good suggestion.  I'll add that.

Thanks a lot for your review.

					-Alex

> 
> 	Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
