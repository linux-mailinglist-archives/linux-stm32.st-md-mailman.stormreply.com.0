Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGABDfAe+mnoJwMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 05 May 2026 18:46:40 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C67B94D1988
	for <lists+linux-stm32@lfdr.de>; Tue, 05 May 2026 18:46:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25684C87ED0;
	Tue,  5 May 2026 16:46:39 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8408C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 May 2026 16:46:37 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-79a535e7c00so67616957b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 May 2026 09:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777999597; x=1778604397;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DrfGKIeyY4VV6HtGnp4FKIxytz8xo/bAXQmJCIlvsw8=;
 b=SXCQPnOHRTrrTxgoJIxQBc1K3mWHoTHjmhuYlyxw9fzpHcOZ/ePx1GnjOiOM63GbwJ
 z2S6l4dfqP5PXGEJiy3GzWY0L5eahtIaMyDse6P9cym3IA4OqtemND2akTNYzSXRW/5P
 9lNSg8339CzBI9x7DExo1nXhVh8XkCq4m5oAmZNuY2XlBxeRZ1Kz1yTWlUFJa7ASNHnR
 STn5ZZ4MLoa9u9bk1O71WYbAf/Lhy7bjAHBIhjkWo7DCsmC4v2g2Qqh34yY1tIefR19O
 UrnYKFBQMNyB2Af0Z1y0EvC/ggIu7PIZbqKmaehJHc/Kh84kQJht1Vqqs+pUnQif68cH
 2DSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777999597; x=1778604397;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DrfGKIeyY4VV6HtGnp4FKIxytz8xo/bAXQmJCIlvsw8=;
 b=XcQMoS23+e//hDw8qd2n3Oro+i3fTmXrkPdh3Akogvmb1zFnqrl43WBYcQNpg15wvc
 bAZpVmOzzawYZRVtoRw5MC1bR6webw0DBX6XAsNW4t5eeZpqYCFqlqqNpyo6TCqeWc9K
 MYuq2NGksTHMDaGz5QKY5qBQT7vEKQToSuECeOFWgYmi+VhxcNC/ZdYlHlury5tQHFG5
 lSESpuw8paRXb4T9tUiLlraWQWtbGmRq3NGe4E6/buxfVSP7VSVFopIx+mZwthq4vn0U
 iZW8V8z48Vr2XUHTghvNSX9RzonNbPiyQ4TIJGI5/lQHOUMnUarDrZV+wRROGUggQoA9
 JXPw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+iA+NWfPjD4EmQtJnziwJMDhpvBxsvX+v5Laj3rgtd7LcN3Ym0v2H1v8uUqMF/uGsI2X6IDEo36PHCiQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywr/eqvFyZny2lUQanMLh/CTLCYRF6asjlUyqLAUYLwdajTB74K
 KwtuixglCSYtr8BMF5Zv8G7vAmPIiVWI0QDHwS3VqDg9y2WL8jNgWiptYcZF0BMh+k4=
X-Gm-Gg: AeBDiesRX6eGGBTdKn6tAlYwsW2I2lLmRWvnguVPqRZBFjyUV2EtwLn9GdyA/u9sUuE
 7ykAc7MT6FOomQxnXzCOt9RCdCjANnkXYFB6vnGvxOKbaZ9uiDSn8Ed8XpFrBdx0ta1pB/5GuM/
 U8qWqXi6xBVd1h7Ef5FLjsVjgipivWByGKTbrA0H3wp3AaNYqcRbI/Gy+xFnKiE4suJ+MV9E10F
 eYX4gzGRMEvQEMjJN+Gpcyq2BZDWjn5aQXmZdIDHmjbmw7EuAPhjH+HR6IKb6qv80/KBRSZzmfK
 PuIk7VdrT6VN1gAJz4embhe1IKXD7DoVduXke5PhuuNnoho7Tx3HD2PTjAlqtHea+nzYbir0tda
 z8HwF/xrQwWa9DiPv5e0NdsnxdNz6zU+VQEmMZ4IwwZp1ksN2tzOlMFu2Zjw0SffW9unCMiogdi
 gUbO30RsZjZ7wIXC97fegUx3/k6WQGNwS5CnwgBVGnaWBTjvbxTPzVurYrn7PRhJ0xJUXH81+FS
 A==
X-Received: by 2002:a05:690c:60c4:b0:7bd:8cb2:4fa4 with SMTP id
 00721157ae682-7bdac5ffe89mr42184327b3.39.1777999596609; 
 Tue, 05 May 2026 09:46:36 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net.
 [75.72.117.212]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-7bd66558f35sm66666507b3.15.2026.05.05.09.46.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2026 09:46:36 -0700 (PDT)
Message-ID: <c716efe3-1b60-4a82-8fcf-1928c0233d64@riscstar.com>
Date: Tue, 5 May 2026 11:46:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-13-elder@riscstar.com>
 <afod8ot7xb+g0wzN@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <afod8ot7xb+g0wzN@oss.qualcomm.com>
Cc: me@ziyao.cc, ast@kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>, chenchuangyu@xiaomi.com,
 edumazet@google.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 weishangjuan@eswincomputing.com, daniel@iogearbox.net, chenhuacai@kernel.org,
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
Subject: Re: [Linux-stm32] [PATCH net-next 12/12] arm64: dts: qcom:
 qcs6490-rb3gen2: enable TC9564 with a single QCS8081 phy
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
X-Rspamd-Queue-Id: C67B94D1988
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mohd.anwar@oss.qualcomm.com,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linusw@kernel.org,m:a0987203069@gmail.com,m:dav
 em@davemloft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:andersson@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[48];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,kernel.org,vger.kernel.org,riscstar.com,xiaomi.com,google.com,st-md-mailman.stormreply.com,eswincomputing.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,linuxfoundation.org,davemloft.net,lunn.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	NEURAL_HAM(-0.00)[-0.779];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,riscstar.com:mid,riscstar.com:email,checkpatch.pl:url,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email]

On 5/5/26 11:42 AM, Mohd Ayaan Anwar wrote:
> Hi Alex,
> On Fri, May 01, 2026 at 10:54:20AM -0500, Alex Elder wrote:
>> From: Daniel Thompson <daniel@riscstar.com>
>>
>> The QCS6490 RB3Gen2 includes a Toshiba TC9564 (a.k.a. Qualcomm QPS615).
>> TC9564 is an twin Ethernet-AVB/TSN bridge with an integrated PCIe switch.
>>
>> There are multiple builds of RB3Gen2 with components included/excluded.
>> That means whether or not there is a phy attached to eMAC0 depends on
>> the exact board. However all versions include a TC9564 combined with a
>> single QCS8081 attached to eMAC1.
>>
>> Add properties to the existing PCI nodes to describe how the TC9564 and
>> QCS8081 are connected to each other (and to the host SoC).
>>
>> (Note: "pci1179,0220" is documented in the "net/toshiba,tc956x-dwmac.yaml"
>> binding, but checkpatch.pl doesn't recognize that.)
>>
>> Co-developed-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> 
> There's a minor typo in the PHY name - QCS8081 instead of QCA8081.

OK, I'll fix that too.  Thanks a lot Ayaan.

					-Alex

> 
> 	Ayaan

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
