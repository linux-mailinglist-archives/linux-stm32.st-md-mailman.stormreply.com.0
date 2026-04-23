Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wiCsJaOG72kPCQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 17:54:11 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 590AA4759E7
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 17:54:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 075ADC5F1CF;
	Mon, 27 Apr 2026 15:54:10 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC1A2C87EC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Apr 2026 15:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1776957644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iQf/P7hvHt9A1fs4c4DenfrxwjfBH28w3+BhoS4FuwU=;
 b=BahwhcjwWgzlYETYLkE+zf42eXHZWWb/NOANfjcwly3UlC6QmFLdDPs4ZTqMgC4jsi35qb
 IZMYgcKlVnuTGiE0MgCLgmUeP1HgdPBYx5Ar59OSJvIRJb5BDI4PK1/ViGFwaYg0mnb14U
 J9Lusefx4raQS6eD9a0Ngl0mox1IxV0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-b4q3tkRmPW-z0jEI5p3P0w-1; Thu, 23 Apr 2026 11:20:43 -0400
X-MC-Unique: b4q3tkRmPW-z0jEI5p3P0w-1
X-Mimecast-MFC-AGG-ID: b4q3tkRmPW-z0jEI5p3P0w_1776957641
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-50d5d1c2289so146542241cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Apr 2026 08:20:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776957641; x=1777562441;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iQf/P7hvHt9A1fs4c4DenfrxwjfBH28w3+BhoS4FuwU=;
 b=SkeJvgSLsXOdo1wBeVdelMHPuHie0/xA8PSQ3WywYKNj3+R5KEIt8qbU/YHGu1d9I1
 WvHvlm2chZnw/PDwtW695KpAYcGlmznt1z3whgXxWJKv47oqyNKzmntSOaAj55r1SnD4
 fkpncO0vL8hEdD8B/NvRRs1qHuyp7ycRsDOTOIkQoHPNPvQEiSaR9yuIK8XV8E9wsbej
 YSXgWNVbwMfvfzqyaM2tmFc70ujd2F8uFFgG/wmgkLsF7HYEWlF1KaaCXZAZu3DrtBSa
 KlFeHGoRo2obD6SYoWckfmp/J8XYipYpM8mDTRkic6pRNQd5RCXq+oobn0leTSRgamZF
 22dw==
X-Forwarded-Encrypted: i=1;
 AFNElJ819Erk+50nz0GgIx8yol515258bJ3l1jZkakzp1sh22iPtPZOzfwLRXCHZ5c8/70JNZh4RUcbezDhYKA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzf0KNZfz1/ZxRbjjBy1u9ZnepUkZrckldyDQhoNIJ5y7uckZYC
 IsweRbSPm+ph9isE3r2Vd1CuaQbWh3LiHhdyAoHM/N52OeezYw4hr+xl6bJt3ixoa6C1L1mcp6G
 99h4UbUj8ubz5m/OeU+cD6qEbAE23h/9dNQTSh4E8+FTa+SnPvztwnlHU6o7TpliKV6UYToYySA
 BVzVcQkg==
X-Gm-Gg: AeBDietbV9bwdUukHZdWUEH+1Fz6kvGaGSIKBH/4kIrsUyw9PCfJNHkpbmTXnbBxcMs
 7T4u589fWgtIt0nxvSaVssuRUXxPxyvE3czcFjaWly/ule+V2BAhpYc+HcBXsdHbuLXi1gGvn0i
 tZIc07GBgPrgCkRL6SilMeJ9vIsO2m9WAhoS4SUMo2aVd3MFDP7CwWsXcPLjEPjS4bx9bLB+3SP
 qI4pIs9w8nQjvNrXp6w220H+ITppTqb+y0x8NJnOgucxhyBQi1EnubvVF6VREfs7A87VlGV7wgt
 JomkF0DdtJtairOLweMK8kNIXcexH6xhHwdHefAXUU3QIAXDmWp0NNXGnliMFFMiRbFfIUaKuII
 1X64gebOkLsMwEilHnth1NZSFnZ95sADh/UFOyeDQzw==
X-Received: by 2002:a05:622a:1390:b0:50f:b076:43dd with SMTP id
 d75a77b69052e-50fb0764918mr197598031cf.36.1776957640938; 
 Thu, 23 Apr 2026 08:20:40 -0700 (PDT)
X-Received: by 2002:a05:622a:1390:b0:50f:b076:43dd with SMTP id
 d75a77b69052e-50fb0764918mr197597111cf.36.1776957640401; 
 Thu, 23 Apr 2026 08:20:40 -0700 (PDT)
Received: from rh-jkangas-kernel ([2601:1c2:4400:6bf0:7677:bcee:4ef0:e09d])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50e5f5cc439sm105170541cf.17.2026.04.23.08.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 08:20:39 -0700 (PDT)
Date: Thu, 23 Apr 2026 08:20:34 -0700
From: Jared Kangas <jkangas@redhat.com>
To: jan.petrous@oss.nxp.com
Message-ID: <aeo4wlrSinKUsdrZ@rh-jkangas-kernel>
References: <20260313-dwmac_multi_irq-v12-0-b5c9d0aa13d6@oss.nxp.com>
 <20260313-dwmac_multi_irq-v12-2-b5c9d0aa13d6@oss.nxp.com>
MIME-Version: 1.0
In-Reply-To: <20260313-dwmac_multi_irq-v12-2-b5c9d0aa13d6@oss.nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: t073yr2JdUMCegamBB8Lt9aCQuSeA9ipey_RYBzVFec_1776957641
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Mailman-Approved-At: Mon, 27 Apr 2026 15:54:08 +0000
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 vladimir.oltean@nxp.com, Frank Li <Frank.Li@nxp.com>,
 Eric Dumazet <edumazet@google.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, rmk+kernel@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 boon.khai.ng@altera.com, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v12 2/4] arm64: dts: s32: set
 Ethernet channel irqs
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
X-Rspamd-Queue-Id: 590AA4759E7
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.29 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[redhat.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[redhat.com:s=mimecast20190719];
	DATE_IN_PAST(1.00)[96];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,nxp.com,google.com,oss.nxp.com,gmail.com,st-md-mailman.stormreply.com,kernel.org,redhat.com,vger.kernel.org,pengutronix.de,armlinux.org.uk,lists.infradead.org,suse.com,lunn.ch,altera.com,davemloft.net];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:jan.petrous@oss.nxp.com,m:imx@lists.linux.dev,m:s32@nxp.com,m:vladimir.oltean@nxp.com,m:Frank.Li@nxp.com,m:edumazet@google.com,m:ghennadi.procopciuc@oss.nxp.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:s.hauer@pengutronix.de,m:rmk+kernel@armlinux.org.uk,m:linux-arm-kernel@lists.infradead.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:kernel@pengutronix.de,m:krzk+dt@kernel.org,m:shawnguo@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:krzk@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[jkangas@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jkangas@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[redhat.com:-];
	NEURAL_HAM(-0.00)[-0.603];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,suse.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]
X-Spam: Yes

On Fri, Mar 13, 2026 at 08:13:33AM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> The GMAC Ethernet controller found on S32G2/S32G3 and S32R45
> contains up to 5 RX and 5 TX channels.
> It can operate in two interrupt modes:
> 
>   1) Sharing IRQ mode: only MAC IRQ line is used
>      for all channels.
> 
>   2) Multiple IRQ mode: every channel uses two IRQ lines,
>      one for RX and second for TX.
> 
> Specify all IRQ twins for all channels.
> 
> Reviewed-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---

I missed that there was a net-next rebase and ended up sending a T-b to
v11 instead of here ([1], [2]), sorry about that.

To give more details on my testing around this specific patch since the
driver patch was merged: I configured RX queues 1-4 with
'snps,route-multi-broad' across several different boots and verified
that interrupts showed for all TX/RX channels in /proc/interrupts.

Tested-by: Jared Kangas <jkangas@redhat.com>

[1]: https://lore.kernel.org/all/aefX7Ajltzt5EqIR@rh-jkangas-kernel/
[2]: https://lore.kernel.org/all/aefY8WGCuNr4BQG4@rh-jkangas-kernel/

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
