Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNqPJ5mIp2nliAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Mar 2026 02:19:21 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9531F92C6
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Mar 2026 02:19:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C975BC5A4C5;
	Wed,  4 Mar 2026 01:19:20 +0000 (UTC)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com
 [74.125.82.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38D8AC055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Mar 2026 01:19:19 +0000 (UTC)
Received: by mail-dy1-f169.google.com with SMTP id
 5a478bee46e88-2be0711f493so1093633eec.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Mar 2026 17:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772587157; x=1773191957;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gvvy8mrMhzjULjG/waJaGKSbWOymXRI0aiNwOWuVKAk=;
 b=YeInlIt85OIGYfxUOp7jWuNX78scEqXT2aN9ZqoKH6U1nvGRP3nUimihuh0O7jMbPU
 BhzA8g49SgtoYVLYWr+UMXO7R6Ud6XstEinKzCXGGbprZ7nt7ZF2dnesEaSCenC8S7ua
 +x0Cx+o4JPbJvz2poJWgApvXBL075mFmYoXruciS2ThcwEThXkTFiJHgG77Mif4bcnQO
 NXPWQmGJ9GGh43fS+a6dsZhEd+Sdtix+qcDe1vwPT/p077M73nki3pb6/mXoLeac5Frm
 Pqp2/cZn3X8R9WSQnIkNiMyiLUOMEFmcDfxeRNYfWPIFRVkeeWCiaUdrSY1feaoukzwK
 SNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772587157; x=1773191957;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gvvy8mrMhzjULjG/waJaGKSbWOymXRI0aiNwOWuVKAk=;
 b=F/3X/dvtzCCFQa7X4RcLW9CtnF5FJKgwBOjChGlmy335wlIAifxGZgHuHRjDEj/5/5
 DgCAuaOzDjIQdFGRG63zZ9k0Xib0oc+IFBf9ICwtSgsYinw4xze77lf33HynzHIQ2oeb
 vWC+MYznfCNRNWUGZUtqsAd6CPVqJ4ypCQIHcAf9Ls1GWag4yO2/IXExVEv2pkkVTsuv
 3jqJT/gMw2h5iUPTCXyBZ5rqOdELklniyAdRyaWU34/JC9ftmkaNekepz7W/zW74TFLy
 M0eUyQ7asbZBWbDhaIuqzOVfRqLnvV0P7Tm2Uvxvn4NlX6m63i3C2l5Tdh0mx9xFDNtt
 30XA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvXyimuoRGaosD6UNvUDHlZw7D+++u0Pt6hyt0SAwo8OZD7cUQ5QyS0xZqJjvG9xgqQFIDxpldUB7ezQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxuwIPmBVeBpkVva9nOQE7u4XFz8PoGqulINa+DBt+ftMeOsWNw
 NCyBMfDc5FXTv87WCc5lRxbV5YVCoBJco4etXDWnOrlyntPpwT3EItCu
X-Gm-Gg: ATEYQzyIGVLONwJVegAWBj+e7FxFNun8rCVSL2Ue49X/TfWmk8WYaA0FKhU8aLRAd2t
 +eANHsFQ6YukHZF5lsHCl/Ms4CUoSBB5Rh2ZEW3EP6Vdr6BQCqvBayqXUdM6MqXBkN/95JCLOTj
 qeKpCGudbVQH1TZvC4GrSU/BbGXtOnWm0nxTeU8bqxBKpiaO/XtvOMkrEvnODpj73QWgTjTdqc3
 NnFtbmQRtLQOA+DvPa0mRAAbgYCH3Tx6mVAhTF0+l3c+mirxcABEOIpLaWpuUFkY8XMaWtC+VvE
 dvgPqoyJih3Tf7i56EI0ypV5d+AYHuB+pp6jvSMWekcv93NWwHyvDmIeDcFl1FSpEdeCAM8sss5
 Wk0yiSIjCorqlJjolOvxK1qWEGrjl5nVyXVPuq6u3XAhb/IV2silcQF+4LHMWD5hzvpag8pIZRE
 VX7m+jspZvUl6Kn/55G4zXY/n/ZbP6rWRzX5NYYT5NUXkGfNc=
X-Received: by 2002:a05:7300:ac81:b0:2be:969:75f6 with SMTP id
 5a478bee46e88-2be2344da48mr1494176eec.9.1772587157326; 
 Tue, 03 Mar 2026 17:19:17 -0800 (PST)
Received: from [172.16.0.242] ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2be0d7e0d40sm6999679eec.12.2026.03.03.17.19.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 17:19:16 -0800 (PST)
Message-ID: <05a15890-392c-41c3-9566-8eb506ddfe5f@gmail.com>
Date: Tue, 3 Mar 2026 17:23:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Conor Dooley <conor@kernel.org>, Jakub Kicinski <kuba@kernel.org>
References: <20260303061525.846-1-lizhi2@eswincomputing.com>
 <20260303061637.872-1-lizhi2@eswincomputing.com>
 <20260303163846.156d18f7@kernel.org>
 <20260304-regulate-verdict-c3a361d2dc83@spud>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260304-regulate-verdict-c3a361d2dc83@spud>
Cc: edumazet@google.com, lizhi2@eswincomputing.com,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, weishangjuan@eswincomputing.com, alex@ghiti.fr,
 ningyu@eswincomputing.com, pritesh.patel@einfochips.com, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com,
 linmin@eswincomputing.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, palmer@dabbelt.com,
 mcoquelin.stm32@gmail.com, pjw@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/3] dt-bindings: ethernet:
 eswin: add clock sampling control
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
X-Rspamd-Queue-Id: 3D9531F92C6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:kuba@kernel.org,m:edumazet@google.com,m:lizhi2@eswincomputing.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:ningyu@eswincomputing.com,m:pritesh.patel@einfochips.com,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:linmin@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:mcoquelin.stm32@gmail.com,m:pjw@kernel.org,m:davem@davemloft.net,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ganboing@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[google.com,eswincomputing.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,ghiti.fr,einfochips.com,redhat.com,vger.kernel.org,eecs.berkeley.edu,armlinux.org.uk,lunn.ch,dabbelt.com,gmail.com,davemloft.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[ganboing@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	NEURAL_HAM(-0.00)[-0.896];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi All,

On 3/3/26 16:47, Conor Dooley wrote:
> On Tue, Mar 03, 2026 at 04:38:46PM -0800, Jakub Kicinski wrote:
>> On Tue,  3 Mar 2026 14:16:37 +0800 lizhi2@eswincomputing.com wrote:
>>> There are currently no in-tree users of the EIC7700 Ethernet driver, so
>>> these changes are safe.
>>
>> What do you mean by this sentence? The commit under Fixes was part of
>> Linux v6.19 already.
> 
> The "funny" thing is that caring about users doesn't even really matter
> on the devicetree patch, except for this hunk:
> |@@ -81,7 +99,9 @@ properties:
> |                          or external clock selection
> |           - description: Offset of AXI clock controller Low-Power request
> |                          register
> |+          - description: Offset of register controlling TXD delay
> |           - description: Offset of register controlling TX/RX clock delay
> |+          - description: Offset of register controlling RXD delay
> |
> | required:
> |   - compatible
> And it only matters here because an item is injected mid-list. If this
> was moved to the end with the RXD delay, the **dt-binding** changes
> don't have issues with safety. I've not looked at whether there are
> knock-on concerns about users in the driver or whatever yet, but from a
> binding POV only that hunk can break something that currently works.

This was already discussed here in v1:
https://lore.kernel.org/lkml/e7183ae1-8b8b-4e77-9f4e-3bc1b4b63556@lunn.ch/

The device-tree is not checked in yet by ESWIN folks, so there's currently
no user of the dt-binding. No need to worry about backward compat.

> 
>>> Fixes: 888bd0eca93c ("dt-bindings: ethernet: eswin: Document for EIC7700 SoC")

Bo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
