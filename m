Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QLsgNiHAImqjdAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 05 Jun 2026 14:25:05 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DD0648188
	for <lists+linux-stm32@lfdr.de>; Fri, 05 Jun 2026 14:25:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=riscstar-com.20251104.gappssmtp.com header.s=20251104 header.b=05CxohIs;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=riscstar.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D8F5C8F273;
	Fri,  5 Jun 2026 12:25:05 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45D73C8F272
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jun 2026 12:25:03 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-7e6dcc22cbcso1540103a34.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Jun 2026 05:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780662302; x=1781267102;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hOWy2W3C8F0epU9cKoqDrCPhuhX/iOel8Vt4x+uvwak=;
 b=05CxohIsWhKrJwTyhdMziL9c4y/4I16yVsgJx4L0SdA5XiH6B0dZaNRfpgMvQu79I9
 Z0n+MsjPJqx36tY3J+Vcf2FIO/UNMn14lriCIs11hRJxOtQ/saYDiEGP5Tc8szrtE7mI
 Sb7npnNG+ZgBByu/l2T0X4v49JZGx8b9pOQygkZds551j1+YUij4nCisw0SSSZji3oUu
 pb10C6Q0c+eNV19CC0Cu6Yf/YkTfUAr+LXqA3oattrxePisoQTJ9E8dujQjaF+5l5EAn
 1lsq9HdS9hROECexHcH5QDYl1t5KaDr06zSsuURVWuJd/omFaW28bobbzLPlo/C0rKcf
 DNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780662302; x=1781267102;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hOWy2W3C8F0epU9cKoqDrCPhuhX/iOel8Vt4x+uvwak=;
 b=EHzmKlie7OonKX+YBRGDzyr7nX4OH449yQXppR02LCDH9AxyLCCHpj6MQwM4w0Stmv
 0vJ/mxkBeFz3M3SDQ45QXR496ZQQhjWinF7wrVYhYrImTi7AhggC7lUQmA/0T2AwaXR0
 2DQM5oXDhn/jsVu4hh5x86aMtxAzssOya0/hriy0jTsUSrVoLyLXxi3jP3YNVfYzhUFx
 i7umAsrswGonz0TRgwro1PXuOqO2lfdJJXbKnR9rFYeMODvT1rAY512W4UTHtNUG6OWd
 F5BxGgxsSo5tlqXxL4FqZN6yq+VebH7y/0jrplQLK5nstkql0vBP7RBN3zECZfbRulMz
 i1Sw==
X-Forwarded-Encrypted: i=1;
 AFNElJ//NYqsq/Gtyizpqv/HQkhuLxERs8HdJOVg7bVx+u7r1ASS6olqQPF29eaW02GbMN2cwXTqTx1dtQqmUQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzgjjw5k/htWh7dQEQoqXRuTrZFU0/3tGvzZK5l69CMC3a+pvZq
 2ZVZSMIMB0W2H+EJt19e7zY2En0xoE7S7rybBQLRsWE0jIQ21pISURaE9rY76Jx997w=
X-Gm-Gg: Acq92OEX8w9QM1SBRX3mDvQGhr/itgeAo23PzR8+s5T/oGhogZbAMzzK1tbmwAR8wVp
 0hdldDwgmrGm7RBvMtrZVs2o6hThYmDXJuVjRCvd4kX7yBhZYfpoUHK+6QRMKXLUU/15vQJFuh0
 KFOa8HRSlgky9NiMiH5F7MBoE84iBz345K6/p2iFm6edrdZbvWfRm5unrzoDyboftooOOzaFa5d
 V9MIajx1MQk0YQ8pK0/0YK3Vukdxg8/FGRQYR/t3xnqtBSQQh4r9vj0u7+XrSwjMsciQBCF2FLu
 anZd0qTa8MzsQpnXTbBbRqmCiXEMKjZq1l9w1ksaXOVcXTUeLSsoTbPhiReAhms8hhsTAVgRbPu
 B5833GHd3A7E9jGZt40XlVWp3k4sDeqmIiQJHUygstdRZNbFHH5bqDwPH9gUW568VGL+icCwI/v
 zqMIhCE4Uy3FbyPfwUh9+YhyPbo69hLtFpmjI=
X-Received: by 2002:a05:6830:6685:b0:7e6:deb1:484d with SMTP id
 46e09a7af769-7e70c7b1386mr1725355a34.13.1780662284484; 
 Fri, 05 Jun 2026 05:24:44 -0700 (PDT)
Received: from [172.22.22.234] ([73.62.185.64])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e6e7974f22sm5817653a34.25.2026.06.05.05.24.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2026 05:24:44 -0700 (PDT)
Message-ID: <bd2c09d4-462d-4392-bb3f-ca91b2f08bd7@riscstar.com>
Date: Fri, 5 Jun 2026 07:24:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Rob Herring (Arm)" <robh@kernel.org>
References: <20260605010022.968612-1-elder@riscstar.com>
 <20260605010022.968612-11-elder@riscstar.com>
 <178062720108.1744752.12164392208085928081.robh@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <178062720108.1744752.12164392208085928081.robh@kernel.org>
Cc: me@ziyao.cc, ast@kernel.org, a0987203069@gmail.com,
 Daniel Thompson <daniel@riscstar.com>, chenchuangyu@xiaomi.com,
 edumazet@google.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mohd.anwar@oss.qualcomm.com,
 weishangjuan@eswincomputing.com, daniel@iogearbox.net, chenhuacai@kernel.org,
 john.fastabend@gmail.com, maxime.chevallier@bootlin.com,
 siyanteng@cqsoftware.com.cn, sdf@fomichev.me, kuba@kernel.org,
 pabeni@redhat.com, konradybcio@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, hawk@kernel.org, arnd@arndb.de, brgl@kernel.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 livelycarpet87@gmail.com, linux-gpio@vger.kernel.org,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, inochiama@gmail.com, linusw@kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
 boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com, gregkh@linuxfoundation.org,
 bpf@vger.kernel.org, julianbraha@gmail.com, andersson@kernel.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v2 10/14] dt-bindings: net:
 toshiba, tc9654-dwmac: add TC9564 Ethernet bridge
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[47];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:me@ziyao.cc,m:ast@kernel.org,m:a0987203069@gmail.com,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:inochiama@gmail.com,m:linusw@kernel.org,m:linux-kernel@vger.kernel.org,m:davem@davem
 loft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:gregkh@linuxfoundation.org,m:bpf@vger.kernel.org,m:julianbraha@gmail.com,m:andersson@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,kernel.org,gmail.com,riscstar.com,xiaomi.com,google.com,vger.kernel.org,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,davemloft.net,lunn.ch,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:mid,riscstar.com:from_mime,riscstar.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 58DD0648188

On 6/4/26 9:40 PM, Rob Herring (Arm) wrote:
> 
> On Thu, 04 Jun 2026 20:00:17 -0500, Alex Elder wrote:
>> From: Daniel Thompson <daniel@riscstar.com>
>>
>> Add devicetree bindings for the Toshiba TC956x family of Ethernet-AVB/TSN
>> bridges.
>>
>> The TC9564 contains a PCIe switch with one upstream and three downstream
>> PCIe ports.  The third PCIe downstream port has an attached embedded PCIe
>> endpoint, and that endpoint implements two PCIe functions.  Each internal
>> PCIe function has a Synopsys XGMAC Ethernet interface capable of 10 Gbps
>> operation.
>>
>> The TC9564 also implements an embedded GPIO controller, which exposes
>> 10 lines externally.  Some platforms use these GPIO lines, so this
>> GPIO controller is managed by a separate driver.  Other embedded
>> peripherals (like a microcontroller, SRAM, and UART) are currently
>> unused.
>>
>> The GPIO controller is managed by registers accessed via MMIO on an
>> internal PCIe function's registers.
>>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   .../bindings/net/toshiba,tc9564-dwmac.yaml    | 120 ++++++++++++++++++
>>   MAINTAINERS                                   |   6 +
>>   2 files changed, 126 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:

Thank you for this report.  After upgrading the "dtschema" package I
also see these errors.  The "gpio" and "ethernet" properties will
have an "unevaluatedProperties: false" constraint added in the next
version of this series.  The name of the binding file will also be
correct in the MAINTAINERS file.

					-Alex

> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml: gpio: Missing additionalProperties/unevaluatedProperties constraint
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml: ethernet: Missing additionalProperties/unevaluatedProperties constraint
> 
> doc reference errors (make refcheckdocs):
> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
> MAINTAINERS: Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20260605010022.968612-11-elder@riscstar.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
