Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDdjCFQH/mkxmQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 17:55:00 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC8A4F908A
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 17:54:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FB54C87ECE;
	Fri,  8 May 2026 15:54:59 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76F1DC03FCA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 May 2026 15:54:58 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-449d6c68ed8so1777428f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 May 2026 08:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778255698; x=1778860498;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=beGQbSohbqovdwuat6nKIVAFYzmFCR8PUrxcs94i44o=;
 b=f2DATpHe5AW0rY9+EsUHU+dl0p81UEXJGUYDLBulg6gmsUc546EmWszcvfgkdo6kBo
 ka88BFRCe7WmiVDuV8mdKd/L+k3ajb005P8BJSaLo6NnYIL2BqkV1q1K4Qp2sdCfo+xy
 CX6bWJ0aegF1lpiiM9DY/rsthEEQFcKlPaCXrIcLbhtgcYXlh8HnOSh51H2kJKt50DfG
 JYSS/U+w7xl9jpmwelXOx8/zygmE7DtHFsBsB342SRBHairpvqbgSLE4ZQA7WUtNQrCJ
 RxumAWVRK7u28qBdZO/WKukRlEqcbOV2vHJHM0lanZNypRrkVE/1F0p2bl17ENAcoGNv
 pkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778255698; x=1778860498;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=beGQbSohbqovdwuat6nKIVAFYzmFCR8PUrxcs94i44o=;
 b=r0w0SzmY9EJl/l/Yb7r45YqlCfdftSbgYivW2SSVTisrWwiCeWcDIuYbsEzOzc/4HL
 ixdHBoDM4RgavqgQZhRt9QLAg5sfi7o2JYRZfGRjgQms4zKa7CI1nuNAXZXEhOOgCcrh
 yQkjGQxYkF8m10vLpYxNMsp7gGuSS05D7hICRFGxke75Cdwx0ZJJgOBjEoyEALfOSFKk
 /+sCJTN+mqrsmKmzNJe6nZ2y6GoWIPa1kaSeOUV+9aUiqzBCCZVJyUVTeSxX/R5XZTKR
 pHyCizKAX7o4d+UVswzkZ//wbGlA0odqyq2msnxSLMZc7kCY+Pl+7OFii1/vwQ69ka27
 /7Ew==
X-Forwarded-Encrypted: i=1;
 AFNElJ89bsJLjXfztc81SYYfODewUbV7UfB6PjP4tXoxG6hkLRNU57q+K9S103/pmDTcd5FEBCxxkNZRdcIiPw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzBfN4kbSN/9pEtdhY1FlNuEOkrypPVh6ZkAjYV/pEm33tdm7l2
 HK1I7D0f9BfwdjWqxQdpzUC1sfPTdVSDA7jmGX51EJHifw+JNR2/4cyZHaZC8Fe90lo=
X-Gm-Gg: Acq92OEF5vLcduxiNWYbj2/Q6+ePep5YAkc9O9NPM74veicIOmupoD9k6c2LBE3FkAQ
 H/a9MzapuFZdbEMidA8I2+xyD0L64ikC5Kj/jZ0vSIrVq0PVypUaa7oQ7ZrPrWGf5Oo7wggB4dK
 1jOJIgh2L+wEgCSYVZq8SfToWCHZUk80C7Q2aMHTQBOy65rq21zFk7C/UFq5fpkSobwNb32W8DU
 wKiufb0pgc5ArFhJIruBON3ES6AZAJFBJwOO4mtcW1mbkR1sxL7gaaleFocIk9d0d8rON0hkceJ
 CDukq+FUpPQIrOKefHcE3yPjhaEkoCzqlgl7YVd/rWRY5oexqjRrVNhLZhGytFFGM5owfGzQaKu
 FfHbeflRDm/pv7+Adf+h5MtpiZD60N7G4dqrQSsldcUhU5a1bcnHPll5i5ebYfHI3HMDlJqHyWl
 6Qa4M8ua1NWo+MRTydtzZ6d7SPYA+DKmOmSdbScj8qZJTtgbT6qRvS3VALKN1OlAJtQ0FjqlOcT
 1IgxlXnd+f+xrCDLqKXjMAOIxb2rsDCIFnxZCkAS0p/mNwB0iKbxdPIjkxlVFdSVLQWeagZUnpM
 89YwpsaJ
X-Received: by 2002:a05:6000:22c4:b0:43d:1c21:ead5 with SMTP id
 ffacd0b85a97d-4515ce1c6bcmr21753628f8f.22.1778255697345; 
 Fri, 08 May 2026 08:54:57 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4548eb75c29sm5680163f8f.9.2026.05.08.08.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 08:54:56 -0700 (PDT)
Date: Fri, 8 May 2026 16:54:54 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <af4HTg5P3j0GsNvt@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
 <2ce5897d-5bbb-486a-b0f0-0e30e54b451a@lunn.ch>
 <afy34kj2hPxIlArO@aspen.lan>
 <ef6df85f-11ac-404d-958a-8cf69b3b6bb6@lunn.ch>
 <af3IKKkjl0jK8GGB@aspen.lan>
 <f15e2fe2-88c9-409d-b953-cdc94aee4e16@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f15e2fe2-88c9-409d-b953-cdc94aee4e16@lunn.ch>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: ACC8A4F908A
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
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:elder@riscstar.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linusw@kernel.org,m:a0987203069
 @gmail.com,m:davem@davemloft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:andersson@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[daniel@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[49];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,kernel.org,vger.kernel.org,xiaomi.com,google.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,riscstar.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,linuxfoundation.org,davemloft.net,lunn.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	NEURAL_HAM(-0.00)[-0.792];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 03:34:42PM +0200, Andrew Lunn wrote:
> > BTW if you are bothered by SP_SEL_SGMII_2500M, that name comes directly
> > from the TRM and I'd prefer to keep it if I can. The enumerated value
> > we have to write into the SP_SEL for 2500base-X is "SGMII 2500M".
>
> We try to avoid anything to do with SGMII and 2500 because it is
> technically wrong. Cisco never defined SGMII for 2500, it is something
> silicon vendors have made up, without any foundation in any
> standardisation. We much prefer to refer to it as 2500BaseX with
> broken signalling, which is a much more accurate description.
>
> The TRM is also not a public document. If it was, i could see some
> value in keeping with the naming, but since ~0 developers have the
> document, this is less useful.

This is a pretty obscure register buried on some of the TC956x glue
logic (e.g. it's not part of the DWMAC's register set). I take the view
that if someone is debugging the hardware interactions deeply enough to
care what this is called then the odds of them having access to the TRM
are actually pretty good.

However having a different name would be only a minor irritant to the
poor soul trying to debug the thing! I'll rename to SP_SEL_2500BASEX
in the next rev of the patchset.


Daniel.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
