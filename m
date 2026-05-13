Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFEvEnFzBGprIQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 14:49:53 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7550533543
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 14:49:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 474C8C8F289;
	Wed, 13 May 2026 12:49:52 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51A5DC87EC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 12:49:51 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-45562c41ec7so3217748f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 05:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778676590; x=1779281390;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=u3zF8kES347TPoEbvDwkqQbzfa05yrB1P5lQaxsmy/k=;
 b=KlJ8HF9g1yF6py7YM1VBQx1RAmTrHA18fvRt1igV8/HWYuZ91TTS6SgzoFOCIUuB1J
 Lb7cBPsZMit4frUhqGYk2eaU70yWt/SstYNZimIoSf0RKzkYZxV0qpvrzcdcNlcmW4EV
 qgou2GrQ0NYuWx466Gofk7wSkiSkI+Yx7K2D5vhsaI/TcJM7Td2pLiSKjJYullbUL53A
 ChxhXtfODmiwW54SSNpRj4KGiCwbYN9QG6wX0KL0ljV9NU5S1gswo8bB89Fci6MJ5uWb
 7FmYIseK/+QqlLvC3Az2/G6JvF4GmlQEp/uKyH6uET/tJ1oX+PIc/OOnt7oc+MkDHdCD
 2TuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778676590; x=1779281390;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u3zF8kES347TPoEbvDwkqQbzfa05yrB1P5lQaxsmy/k=;
 b=qIAQcoSnjYThACA7jYvEByYRGQb5J0lYiRKT5Mx7r3ZjOfu3hbQM/G1O/snWNGolU2
 o/aAZOuzQvy9jz3NMoqaRjfMdLjV4x+A5/4ZEAQjGxTnSCOsMhbh1uVCkOrH137Ay8IE
 RYmkED6z35SH9WsbnRlHmRPa+E36wURzX/VSebEDDIG9WF1qFk7LGywvI7LcOMKPFYs3
 QcYXPCvsLXaLlZcoAiim5pYNviMQLUXfSRVI5y7a9IauoZetuafGZukIHp1IA1YyUksp
 ThAReTviMjbqHDk8ZgJ2bCcwQo2FgmVIS4frIQWDTc5J/m84mDMoEcjllHoJp5Zq3W7t
 cIeA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+oDEUlXNr1xMozpDdQt30zk9IbVU/SLChjA6T2vP93uOjh3ygPgfpmJdnaHV7PAE3KyVlx65J47S85eQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzMoA9H5Sh2nziu+aQD1i8fD+gOB2yL4PnZzXdqg8S/rp+P6nDU
 I1ONexiQm7HRntJ0CP2lPoE/F3V0NPREwo1suFycYX+QR/4nIuKs623V8gwzD86rb6I=
X-Gm-Gg: Acq92OFcWDmGZbFFk0gZ9/eHxdfotKDH1p/tcSidd/UjHrYeQ3XqYwC8eby8vf8ztbZ
 TY1W0L3LXXZMp1ONPKJwFHNo5H9BpCbbVspUv/1xiYxHJRKzCQuZZtcK5GtHUiaPEKo0TG6GjN1
 UTtYcYRUf82iZUiVS3z9tAIC7t74GJWT2o3HLhxCET7x52MaFpWU2vWRSF+LJpMyJwyg1f8yJuG
 bC9a82C9bNnAZn0cDleowPEmmJx0hNJLgQXlBV2yM6e40myqlg9qd+DW2NNEEIAqPbA3idV7AQE
 7L4BT4Kq0N1bHaYWSPy3pYK2fbu4l9ROPl/ZWzmvevuSvptDlrlHiMOUqSEo+xXXSnJgqIMPf9x
 Qf5mFhpW1Bi86JMx4XAOS3/Nf0IxpQu7i27+fY1kOQzoeY+xafBtBCsn+q7Agw4wtTytN5rjxrK
 /MW3KW30bfwlyy5uSHkcRQuZKCMYEKakdrgmZ6hxarbGyF2R+j6LZd5ekqkBfCenwI2P83ptjKY
 doLm6QLb5WsbZnp3+XrFiAbTQ7awUBr8IrEeNu0auSKM2B5t9cWXrLWXSNXcjqD/kxT4uhK3mzr
 ZVJj7gL6
X-Received: by 2002:a05:600c:6305:b0:48a:5301:bb5c with SMTP id
 5b1f17b1804b1-48fc9a32aeamr49565525e9.16.1778676590239; 
 Wed, 13 May 2026 05:49:50 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8cd49fesm78578015e9.0.2026.05.13.05.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 05:49:49 -0700 (PDT)
Date: Wed, 13 May 2026 13:49:46 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Message-ID: <agRzai1UoHEIotZe@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-13-elder@riscstar.com>
 <01d6ea18-e022-41c7-a642-ac0321957923@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01d6ea18-e022-41c7-a642-ac0321957923@oss.qualcomm.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: B7550533543
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
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:elder@riscstar.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linusw@kernel.o
 rg,m:a0987203069@gmail.com,m:davem@davemloft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:andersson@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.148];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,riscstar.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 04:03:36PM +0200, Konrad Dybcio wrote:
> On 5/1/26 5:54 PM, Alex Elder wrote:
> > From: Daniel Thompson <daniel@riscstar.com>
> >
> > The QCS6490 RB3Gen2 includes a Toshiba TC9564 (a.k.a. Qualcomm QPS615).
> > TC9564 is an twin Ethernet-AVB/TSN bridge with an integrated PCIe switch.
> >
> > There are multiple builds of RB3Gen2 with components included/excluded.
> > That means whether or not there is a phy attached to eMAC0 depends on
> > the exact board. However all versions include a TC9564 combined with a
> > single QCS8081 attached to eMAC1.
> >
> > Add properties to the existing PCI nodes to describe how the TC9564 and
> > QCS8081 are connected to each other (and to the host SoC).
> >
> > (Note: "pci1179,0220" is documented in the "net/toshiba,tc956x-dwmac.yaml"
> > binding, but checkpatch.pl doesn't recognize that.)
>
> This should probably go under the --- line

I'll leave that with Alex...


> > +	qep_1p8: regulator-qep-1p8 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "qep_1p8";
> > +		gpio = <&pm7325_gpios 8 GPIO_ACTIVE_HIGH>;
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <1800000>;
> > +		enable-active-high;
> > +		regulator-always-on;
> > +	};
>
> If I'm reading the schematics right, this is only required for the PHY
> - is it collapsible, or does it really need to be a-on?

It could be turned off if the socket isn't in use but it would prevent
hotplug detection from working. In practice that means it can only
collapse during suspend/resume.

However the real reason we jammed this on is because I couldn't find a
way to get the phy/mdio code to turn one on. However it is possible to
add regulator support to MDIO devices by extending their existing logic
to manage resets so it can also manage a regulator. It comes out fairly
clean so we can add that to the patch set and remove the
regulator-always-on.


> > +	qep_irq_pin: qep-irq-state {
> > +		pins = "gpio101";
> > +		function = "gpio";
> > +		drive-strength = <2>;
> > +		bias-disable;
>
> There's no pull-up onboard, should we use the on-chip one?

It is configured the same as lt9611_irq_pin (which I couldn't see a
pull-up for).

I switched the interrupt trigger to active-low based on other feedback
on the patchset and the counts in /proc/interrupts remain unchanged
(with a single figure value). It certainly doesn't look like the irq
line floats when the PHY interrupt is deasserted.


Daniel.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
