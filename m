Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GF9nNVs0pmlJMQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Mar 2026 02:07:39 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 868001E77EB
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Mar 2026 02:07:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DC0EC35E3C;
	Tue,  3 Mar 2026 01:07:39 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99AD5C290A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Mar 2026 01:07:37 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-c6e1e748dc1so1724068a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Mar 2026 17:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772500056; x=1773104856;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mvu4CKE+k1dKhf/6IPTDYQpL3MikIJGAowExFNxiKNs=;
 b=K+ov7HeyVRhOCzPEJkZcir5qizHAcX9LQ4w+WT8vtqXymlw8BLvHuwiCfm5D6gLVNN
 iZ5dSz9URt+e+JxRZhPk1T6fa+1gwk5ZbubOu2znWs97R8ZkwSDMdMmX4TWCZsK6bLYO
 khveSghkwyOmqWYYVVbv3GxhaVckbENS/dWqM2qg5JRtUANcSCCaJJ1a2IPYAw2SH0Dv
 /p4Fn6lrKwVrtCrTg1SwWOqQWRyw2tmn37rKtZXjcbZRiIhJCXj0fm4DOBN7wiKt7501
 wZ4I1HpDJtzzBhKBbpeHhelSX3gt6nmGsd+AsdrRbkug2lzg3hjrg9KOaXrTSnC38yr+
 zKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772500056; x=1773104856;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mvu4CKE+k1dKhf/6IPTDYQpL3MikIJGAowExFNxiKNs=;
 b=nsGoGY/gbr6igyaFdLklxqa62t46uFv5HHQIaC/ArIJPIduPhNYWM4ikZfaIEame2J
 x64qDGAbKAIZXKEvGDvdUaMlOJfkJozj1y1axsV4Y/qItuQvdBJsNDmK8nasTK5Wb86a
 zDvTkD2IFXXwlA9vljAqpUPRNogGxPP26+NalcJhQ0hgCOh/EDPkRpg9WAx/7wBNLC8C
 McD6SflvJmmT2crntsBkpfz050IgFsJkCcfI2u8tvswVsGQIFkb6lZikTYjeTwnNFN22
 5cxJcS2hMIdLM8JifqVXq8gb8geTymz0wDJV7J1MlNGjOiIrue6P/wRPKMmmkG9QtbLe
 iVpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWg1gXmcTf7XqtFiGBTo+HNvXcXiLE+dmguTCFfUBLCid95JuYZ9+WMub+Gd1o+282KbDmIxs7EP8V++A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxW+Q13wi71CJM+G9D3eL68PT1IlGnY411lUR0lfdNqwP/DgqxD
 ODB9SZ0gKdr8Vkxk0C2tKB+c42t4oDv2xgCltEobUHSsv1v6I5dkggc7
X-Gm-Gg: ATEYQzxuhIgVENCXdlIF9O/mTKzl6r7Pkcc3aIg7eVXPXnHkNNxpdumywHbCXmkxEJg
 41xQMuwja5a3kcAkK9pa/QwBN9BS5KxQxYCBo9XEKvfQJ/IOaV2SQH5HxWJLDk8E1iONl9/wsxj
 cmvaFhnd9NoD10WNMKTyp0kEIm9Z4bTaljD2rHaJPzV8zJlKHiW0opRYUox3yw770gLAtCg40HI
 IIqA1xL9rTJDrbJoCsC5K3nvDRe4sZpDZBDE+WNZdSJme/JuEMZkQb9TslaEMYZKdIqKOkhmOLm
 IkAwXP+KHma2Yke7laReq8/06DbcPt/q0zkEq5wUa5euOOW4ER2+WD8oYJrjJvJK6yfvwfygU4s
 cOQhRcj2z9hedyNXPKu8cBO3eO7/od6cDSoIhwQv+1yu8YEYj/VqkAPQa27WJd2iZuOkSiPkRse
 aAnl6F7Jp8FJiVrUGir5V4/Q==
X-Received: by 2002:a17:903:4765:b0:2aa:d2f4:9c11 with SMTP id
 d9443c01a7336-2ae60c60e17mr3650915ad.5.1772500056123; 
 Mon, 02 Mar 2026 17:07:36 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb6fe4f3sm146608315ad.91.2026.03.02.17.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 17:07:35 -0800 (PST)
Date: Tue, 3 Mar 2026 09:07:08 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Message-ID: <aaY0KeKuFwM-5wuS@inochi.infowork>
References: <20260227075718.2243818-1-inochiama@gmail.com>
 <20260227075718.2243818-4-inochiama@gmail.com>
 <20260228131845.70421792@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260228131845.70421792@kernel.org>
Cc: Yao Zi <me@ziyao.cc>, Longbin Li <looong.bin@gmail.com>,
 Eric Dumazet <edumazet@google.com>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Yanteng Si <siyanteng@cqsoftware.com.cn>,
 Jose Abreu <joabreu@synopsys.com>, Yixun Lan <dlan@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Richard Cochran <richardcochran@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>,
 spacemit@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Palmer Dabbelt <palmer@dabbelt.com>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paul Walmsley <pjw@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v5 3/3] net: stmmac: Add glue
 layer for Spacemit K3 SoC
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
X-Rspamd-Queue-Id: 868001E77EB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:inochiama@gmail.com,m:me@ziyao.cc,m:looong.bin@gmail.com,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:siyanteng@cqsoftware.com.cn,m:joabreu@synopsys.com,m:dlan@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:richardcochran@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:rmk+kernel@armlinux.org.uk,m:yong.liang.choong@linux.intel.com,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:spacemit@lists.linux.dev,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:dlan@gentoo.org,m:netdev@vger.kernel.org,m:quentin.schulz@cherry.de,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:pjw@kernel.org,m:davem@davemloft.net,m:looongbin@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.
 uk,m:krzk@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.962];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,gmail.com,google.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,eswincomputing.com,ghiti.fr,cqsoftware.com.cn,synopsys.com,redhat.com,vger.kernel.org,eecs.berkeley.edu,bp.renesas.com,armlinux.org.uk,linux.intel.com,st.com,lists.linux.dev,gentoo.org,cherry.de,lunn.ch,dabbelt.com,altera.com,davemloft.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,inochi.infowork:mid]
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 01:18:45PM -0800, Jakub Kicinski wrote:
> On Fri, 27 Feb 2026 15:57:17 +0800 Inochi Amaoto wrote:
> > The ethernet controller on Spacemit K3 SoC is Synopsys DesignWare
> > MAC (version 5.40a), with the following special points:
> > 1. The rate of the tx clock line is auto changed when the mac speed
> >    rate is changed, and no need for changing the input tx clock.
> > 2. This controller require a extra syscon device to configure the
> >    interface type, enable wake up interrupt and delay configuration
> >    if needed.
> 
> checkpatch says:
> 
> ERROR: "foo* bar" should be "foo *bar"
> #110: FILE: drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c:45:
> +static int spacemit_dwmac_set_delay(struct spacmit_dwmac* dwmac,
> 
> ERROR: "foo* bar" should be "foo *bar"
> #148: FILE: drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c:83:
> +static int spacemit_dwmac_fix_delay(struct spacmit_dwmac* dwmac,
> 
> WARNING: line length of 99 exceeds 80 columns
> #243: FILE: drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c:178:
> +	apmu = syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node, "spacemit,apmu", 2, offset);
> -- 
> pw-bot: cr

Thanks, I have updated a new version.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
