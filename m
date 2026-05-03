Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9QvqIjbE9mnBYQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 03 May 2026 05:42:46 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1040B4B44EA
	for <lists+linux-stm32@lfdr.de>; Sun, 03 May 2026 05:42:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DCBCC8F276;
	Sun,  3 May 2026 03:42:45 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE96BC555BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 May 2026 03:42:43 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-95d04f205beso369464241.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 02 May 2026 20:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777779763; x=1778384563;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=PiiXKGJux6g44aioDbCLD/YNgU+NyVlVqd4RaEM0CyY=;
 b=hcXaVoAMspWSnBm6isq+yYlDeAn6VdwR/x9A9dg+RcJmP8bY0aPzI+1jtZA8MIgLeZ
 Gjs3AXRN/g3HAkzcd0BySc+41JVVKz9pMwPFtLKbm/NZi1ZjsX+OI+ZkW2kjcFazcyTM
 1FhmDFJciX+z7tcZkjjtw8keC7AWSNRhz7EQcn68BdGUjH5lRofIjZb4dPEsnuVBYJwJ
 KoGmRSR2EqKogD2/QCUiTuKzKREsVXXDHtvRtx3fzpkT38SR3DQw7u6WxamJE1X9Mlp6
 6A3EfJns9uAPsGLMfRZReVebMZIRj70/vnKmmnDwPKhHBPjo98CqUkg5K6kx1UDftRDT
 mHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777779763; x=1778384563;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PiiXKGJux6g44aioDbCLD/YNgU+NyVlVqd4RaEM0CyY=;
 b=XSNSwJzxJ8UgfS9dHKG6ej0Sia7qupL0IDn268Gh1Ut9z36hwX9Y7FCSr7TRALVuFq
 Z17dcpZX29oWcZU/iZY4InlCxHUwTfrrIPTjBmahiLjcSUGfYgaRDrGHJ9MupgYke+tm
 SI5SfHvanmk55zpFnuFT5jAJX766lX5EAI/vpWfaeXx5Zpjppo7tO5PUy5SB88WJVazI
 9G+gQ1npVchDoyln0tbOFfolSzI97/rLf1aqtsxuZNXGNA3R4WmlxAKScVV3xRBtZ7ti
 nhlCkcdf93YDfXAO3zv5Hs4xCZts/Cs9KK85Y6Kh15Cg7b8OqR4KhEa1rkGs7Ppydh8O
 R59w==
X-Forwarded-Encrypted: i=1;
 AFNElJ8zxOekL3OCddfNgMb1FhlUNmrtnMdXiDr3L07qRIp6QnemiMmRtglSGPTeEn7jCo1AvaerQv54D00Nog==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwP0yTbrVt+Wk02dD958KPm0BUJUiuV2xBXO+nAls6S4W34kblG
 TRv9nN06I7kBt8eFLAGLwfF2lkYbF4JtnkZVR0GZ4tPRvHoizeIqlRVC
X-Gm-Gg: AeBDieuWDcS4OpfawJQP6aupRh6BoiGTfY0uqRdT9eqJAnlS4cV1wL2EneSewWOjzUZ
 XNiyWvOPOT5EulQN3Jpkziir9qWx8uCF4bXu8ySqcMPmIE+ladsnx8VYn96J2poxfc/X2T4LGxB
 V78VDv/EoiztUQ49BEyyRa0blS1mZQn779LDuZf8/xoTBVEsTSD2vJ3tkyrYKnXuTsleU+aGGGa
 Q1YTMU2nsgKmYjG6mkPruh5Oy6l6tcKBmG80mn0ciTOOo9LKVH+d9VCNLJD2RudNUM+RNa7wQG7
 bu/MeI7RmDh/Y8NMh1YZupzA8ugCetfAag0LuV1VHLzSGqs7MKRdMjpPseCihISSkEQcyPk/oi0
 EHYUqFs3Pa0tltQ9uw8B9R0gRv94Vq+PVx85/Wqk9HDAF9xCgIVbYAUqblkyL0KmGD4ugjEPJzW
 dYaaBv45uMks0Lao4yfaeSpEoy+qE9ZEvd8uDBekQflzM=
X-Received: by 2002:a05:6102:4b0c:b0:604:f29d:84be with SMTP id
 ada2fe7eead31-62d84a67460mr2488161137.3.1777779762631; 
 Sat, 02 May 2026 20:42:42 -0700 (PDT)
Received: from [172.27.209.232] ([129.222.53.215])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-95ce0af57f6sm3669350241.8.2026.05.02.20.42.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 May 2026 20:42:41 -0700 (PDT)
Message-ID: <1fe6bcb7-b5c0-454f-ad54-5014006edab5@gmail.com>
Date: Sun, 3 May 2026 04:42:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-10-elder@riscstar.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260501155421.3329862-10-elder@riscstar.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: 1040B4B44EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:elder@riscstar.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:maxime.chevallier@bootlin.com,m:rmk+kernel@armlinux.org.uk,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:me@ziyao.cc,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:linux-stm32@st-md-mailman.stormreply.com,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:devicetree@vger.kernel.org,m:hawk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:ast@kernel.org,m:linux-gpio@vger.kernel.org,m:wens@kernel.org,m:li
 nux-arm-kernel@lists.infradead.org,m:inochiama@gmail.com,m:a0987203069@gmail.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:bpf@vger.kernel.org,m:matthew.gerlach@altera.com,m:hkallweit1@gmail.com,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:conor@kernel.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[julianbraha@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[48];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,vger.kernel.org,riscstar.com,xiaomi.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,kernel.org,gmail.com,cqsoftware.com.cn,fomichev.me,altera.com,bp.renesas.com,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	NEURAL_HAM(-0.00)[-0.990];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel,dt];
	TO_DN_SOME(0.00)[]

On 5/1/26 16:54, Alex Elder wrote:
> +config GPIO_TC956X
> +	tristate "Toshiba TC956X GPIO support"
> +	depends on TOSHIBA_TC956X_PCI
> +	default m if TOSHIBA_TC956X_PCI

Hi Alex,

In your Kconfig changes, this condition 'if TOSHIBA_TC956X_PCI' is dead
code. Since you have the dependency on TOSHIBA_TC956X_PCI, you can just
make the 'default m' unconditional - assuming this is what you intended.

Perhaps you would prefer to use 'default TOSHIBA_TC956X_PCI', which
would have GPIO_TC956X default to 'm' or 'y' when TOSHIBA_TC956X_PCI is
'm' or 'y', respectively.

- Julian Braha
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
