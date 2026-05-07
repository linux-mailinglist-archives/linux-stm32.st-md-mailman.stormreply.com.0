Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kL+0Hn8P/WmwXAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 00:17:35 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1E44EFACF
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 00:17:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 586D9C8F289;
	Thu,  7 May 2026 22:17:34 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6692BC32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2026 22:17:33 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-8eab809593cso136871685a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2026 15:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778192252; x=1778797052;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V2Ov38+ykmqD6nZk6coLqjQ6cOEYuoDtYD74/Mx9UCo=;
 b=r79Rti+rH+2C5nl+k61GtYu9W6f+vblZDhjlbrsjafyCAZnY6Dafomp8nRdq+H+1UD
 WfmN8E1qoLpen/B0iMF/vg47WsDSFuA4Y1kEnGvMNU5YtAdbIRMNZt7956BRNCdmJ1n9
 wPw08Zjz+jzDeQTqHb3+/6JvKEIdiBbmVePC5hG7quLLA2JYlXEMi+3uwmXyOn456E8a
 D7woP8EJJXa/VSowWwyyZh57293vLQMJ47tAA13VWiQ5H8xyAIMGq70777YRyy3RToXy
 EuFVqje0+3rJuP3EgJSRyK0pAZXpsQZH1EN6sFdie+3Z4xBqWuZKn/VvM8hHLA7vYjYE
 5p5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778192252; x=1778797052;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V2Ov38+ykmqD6nZk6coLqjQ6cOEYuoDtYD74/Mx9UCo=;
 b=bAqKXPLbROZNJA3uAXUXeuMxgy5jMUhrUHyhMeFWTNQRB71qikNtMfe4L+KO3kiN4F
 Es6bJVX8mzFSCFqALiAB5sZHyircAJH4bJS4lbVS9rGo3F4C4L3EVhqEhtQ3sFy/ENj1
 J+ErpyPNHTDYj9On2eB/sxZPhOSTaI/fmP2RNoaKisQ53UJso6Nmmv6s5dPzbP6BzlLG
 HplT/TDS7Po3M3t6CJTJL7YU9s42KL/rtW7BH1TAQftFox+OUxP6VGvR5TLrQo4A35Gz
 rwQ9w7aamYjZmnpZkxOCpTGGRrnQuPEISMcRqSTQWBRZSj8v2wkyiaPnb2rEJ3nZzgMi
 AE/w==
X-Forwarded-Encrypted: i=1;
 AFNElJ+6BDVjWv2rqOgZgG4cvcAiseKJtoMIZSPPCvggn+po2tGFjh6HQ4qY/VLb5rTNM8E4eGPKJshx67dOsA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwLGElKXCpeZ8PDJtupXi/wixnD8svf6g7336FX6wLRjpDyicy/
 RNzEm2eADygZ83/R/QaOl46UkjHHVimmBHMZIDnTuvJjI5pjM2u7Jjp5zCXHJu5w7rc=
X-Gm-Gg: AeBDietsEdbsYFWnwxNhCjVcdNyegWV0DQOjE5AoT7mnY7462YnTzI2UMoS1oTijbyW
 iLqvhDYbjvH79iVgZAuA6Eqw4vN2A5BhM42CFBx9AUCBM8kx8Wuot4dTyE5uJpq5arSZ4SmafCl
 cWPSblCV+pHPCoST9jbwYfA7A3+Bs9Io/8fosOArqnQtA7tQQ5q+oR9568foJyqf0wryKkWfIzb
 FSEZvYKYOUe9W+HkesZRSOa01jcBMK2XNyXCYnVQq6FW982t3zDNujyxvadj+T5shJ/ZYZDiijL
 pypkmALiLtTSdR19KGdq7MP15TPgfhJ5UGSvrVt+hWErKXM9ojCCOsYRLHB5EwmSG6+tzTARNBp
 zcreZuvpbqLB77iQeyQPnjCh7/stjPriyeRugf4w/UBpZ2lSfk7qW8ovwErg/NMCCAgPKxanz+U
 sQlG1hRqF3UsJ/ZiRK7IfHCS2m05WU8pyuCZ9D351gYXzx+VdOPa2hnkJgR1jR8MsFMrNl/+WEG
 YY=
X-Received: by 2002:a05:620a:29d0:b0:8cd:9033:1724 with SMTP id
 af79cd13be357-904d3cb8ed7mr1550360785a.9.1778192252020; 
 Thu, 07 May 2026 15:17:32 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net.
 [75.72.117.212]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-907b986c371sm9463285a.2.2026.05.07.15.17.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2026 15:17:31 -0700 (PDT)
Message-ID: <967c1d96-9a48-48de-b7d9-58b63e782aee@riscstar.com>
Date: Thu, 7 May 2026 17:17:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-9-elder@riscstar.com>
 <1f34cbce-e2dd-4e80-b136-55d0efa50002@lunn.ch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <1f34cbce-e2dd-4e80-b136-55d0efa50002@lunn.ch>
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
 davem@davemloft.net, andrew+netdev@lunn.ch, boon.khai.ng@altera.com,
 mcoquelin.stm32@gmail.com, inochiama@gmail.com, krzk+dt@kernel.org,
 julianbraha@gmail.com, matthew.gerlach@altera.com, andersson@kernel.org,
 hkallweit1@gmail.com
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
X-Rspamd-Queue-Id: 1F1E44EFACF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [7.19 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed),none];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linusw@kernel.org,m:a098720306
 9@gmail.com,m:davem@davemloft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:andersson@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.513];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,kernel.org,vger.kernel.org,riscstar.com,xiaomi.com,google.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,linuxfoundation.org,davemloft.net,lunn.ch];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	R_SPF_ALLOW(0.00)[+ip4:52.209.6.89];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,riscstar.com:mid,1c:email,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: add header
X-Spam: Yes

On 5/1/26 12:38 PM, Andrew Lunn wrote:
> Why not add an subnodes for the ethernet interfaces?

We will define "ethernet" devicetree subnodes of the PCIe functions
in the next version of the series.  Something like what's below.

					-Alex

pci@0,1 {
         compatible = "pci1179,0220";
         reg = <0x50100 0x0 0x0 0x0 0x0>;
         #address-cells = <3>;
         #size-cells = <2>;
         device_type = "pci";
         ranges;

         ethernet {
                 phy-mode = "sgmii";
                 phy-handle = <&tc956x_emac1_phy>;

                 mdio {
                         compatible = "snps,dwmac-mdio";
                         #address-cells = <1>;
                         #size-cells = <0>;

                         tc956x_emac1_phy: ethernet-phy@1c {
                                 compatible = "ethernet-phy-id004d.d101";
				...
			};
		};
	};
};
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
