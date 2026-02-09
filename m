Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +D07B2RXiWlQ7AQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Feb 2026 04:41:24 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A4710B6CF
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Feb 2026 04:41:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 426EDC5A4C5;
	Mon,  9 Feb 2026 03:41:23 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3096BC36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Feb 2026 03:41:21 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-8c59bce68a1so254011585a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 08 Feb 2026 19:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770608480; x=1771213280;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TmldnmLhL9SqYkNgbH+pg//X2nCE1O776WGQ3GQgbFQ=;
 b=b3o41EEvRTGjYcdtPgy0qFCgzwCFRyx+dOwS/fcmgL68AL4wcfvhYB+SzJiOWxGf8e
 zXh9Uc15Imc5FmpJZ190KyZ4O917oukk0YpcN2fAuy3VDQCjUlvvs5aF3cBqBlfcFg+6
 Lpv5idbH9VcOe4f2Ma3kussC4ZJasziTym5ykBEjCIaB/TXmvOkwsfcMG3wpT9HamqHE
 20868n989Eh+vAU45V2NnenC9GXC6KQZOjBO/WiwmeiISV4wfaRqB3lExxXLxuMsyvRY
 FHOvwcM6PXs/6wVm0pSFhWElsYSrwOgBFvQoZbE/mQuf21KdhyJg3scYs/nzmqmZe2UB
 VJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770608480; x=1771213280;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TmldnmLhL9SqYkNgbH+pg//X2nCE1O776WGQ3GQgbFQ=;
 b=ecgdcvrrsE2w1q0z7/K5emb1yFxuV6BTL95CQEE8z+9bgImG112VnTRbWfaBPlJ5h2
 +X9wU+iNf1HIZQRiWYYOEj/T8zzB1jz69bbcmKHAO1lBnLmqyu2EMyn7tCrmSiOrCEkx
 xnDvMdKU/xfU0xBZFoPghb59Sw/w6QIo4dOscSZgURhLFiHEFxCdCxXZI3DPD8tGqxWe
 7EBgYKWpfR0Hsz1KRCRj6+rdAnj+cBnMCokV0WfJEjfhk1VPFgo61nwEog9I6vcpzIhM
 Th9KP81Aw1+dHcNRl3fTLPiz279Rr/AoTw5R0C9d2ZXdD3csK7cqgg0ecJcZhErZzSQE
 C3eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtbcaTOR3pk8lxWYtmd1aNX9f81ovZZEtUG5Y3TOp99p+avohI03cWsxELSFD6DWzrcGpcIwHIwoXSSA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxguY2EOyC9gVGEd1Kqj+leLm3ROgGcdGcFngHA3g+38StR9gkL
 +hp70LarPBoUg7R1I5zzsohfq4uCzov4R1JG0C1YWJpO0ng2CtSUIphf
X-Gm-Gg: AZuq6aL9obxUOe6UXA4649YYW3nvRzMiJF9SgApfGhBhtP5Gn0xX5vaXvGVU+9q+xA3
 Iv8qYOSXt1MqOm1R1OaOpIIBxavet/y3BDUf8rplZoD10Kazr5UyeEZ9lfQoB/GnFI41RZHDQVL
 RL9AMzSSeGwclz73MkGFeM0tJXoiWdTy4aKwtbbTYCWrznwlw+OBFKNB+rZqco7W6Z+PH7Ro+Wy
 5GleGPfiCiIpu6fLXnWrNL7zRg8Yt+ReAhAjg+EFCSaWsV14HdvZDkMVtv2amE1prpfmyuzQotG
 4MMdiyTuTdVJ2DiZ2IX21LsXWn0pdFTV5S3M9E8iwf5qW+7nmmbtJB7evbbwKRc3VESKOVHF/P/
 wAO7+hUb35anbtXqOBky/aJFDgWHr9KBb9so+mUV4k5cqno30oRmmpJyb/VHtE0/HVzmEoox/CH
 j/AJQvTvuI69OMRPF2OzMO/S1oohBmOIQNvkMFFO0WJcc2Dlt95eN6
X-Received: by 2002:a05:622a:1386:b0:506:217e:b0e5 with SMTP id
 d75a77b69052e-50639675655mr130106381cf.0.1770608479777; 
 Sun, 08 Feb 2026 19:41:19 -0800 (PST)
Received: from P5510 (h69-131-24-92.cntcnh.broadband.dynamic.tds.net.
 [69.131.24.92]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5063913ba7asm66837111cf.3.2026.02.08.19.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Feb 2026 19:41:19 -0800 (PST)
Date: Sun, 8 Feb 2026 22:41:08 -0500
From: Jie Zhang <jzhang918@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <aYlXVIqHfdOfcAAl@P5510>
References: <20260206195643.11333-1-jie.zhang@analog.com>
 <aYZPUx2WrIkPmvIU@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aYZPUx2WrIkPmvIU@shell.armlinux.org.uk>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, jie.zhang@analog.com, horms@kernel.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: fix oops when split
	header is enabled
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:Jose.Abreu@synopsys.com,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:jie.zhang@analog.com,m:horms@kernel.org,m:vladimir.oltean@nxp.com,m:jacob.e.keller@intel.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jzhang918@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.982];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jzhang918@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[synopsys.com,vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lunn.ch,google.com,analog.com,kernel.org,nxp.com,intel.com,redhat.com,davemloft.net,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A3A4710B6CF
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 08:30:11PM +0000, Russell King (Oracle) wrote:
> On Fri, Feb 06, 2026 at 02:56:38PM -0500, Jie Zhang wrote:
> > For GMAC4, when split header is enabled, in some rare cases, the
> > hardware does not fill buf2 of the first descriptor with payload.
> > Thus we cannot assume buf2 is always fully filled if it is not
> > the last descriptor. Otherwise, the length of buf2 of the second
> > descriptor will be calculated wrong and cause an oops:
> > 
> > Unable to handle kernel paging request at virtual address ffff00019246bfc0
> > ...
> > x2 : 0000000000000040 x1 : ffff00019246bfc0 x0 : ffff00009246c000
> > Call trace:
> >  dcache_inval_poc+0x28/0x58 (P)
> >  dma_direct_sync_single_for_cpu+0x38/0x6c
> >  __dma_sync_single_for_cpu+0x34/0x6c
> >  stmmac_napi_poll_rx+0x8f0/0xb60
> >  __napi_poll.constprop.0+0x30/0x144
> >  net_rx_action+0x160/0x274
> >  handle_softirqs+0x1b8/0x1fc
> > ...
> > 
> > To fix this, the PL bit-field in RDES3 register is used for all
> > descriptors, whether it is the last descriptor or not.
> > 
> > Fixes: ec222003bd94 ("net: stmmac: Prepare to add Split Header support")
> > Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> > Signed-off-by: Jie Zhang <jie.zhang@analog.com>
> > ---
> > v2:
> > 1. Update for the latest net HEAD
> > 2. Reduce crash dump message in commit message
> > 3. Add Fixes tag
> > v1 link: https://lore.kernel.org/all/20251202025421.4560-1-jie.zhang@analog.com/
> 
> I was trying to work out whether this was a re-post of a patch that had
> already been merged and it was the result of someone inappropriately
> re-posting old patches, or whether it was something to take seriously.
> 
> That is because of this in the patch:
> 
> > +	/* Not GMAC4 and not last descriptor */
> > +	if (!priv->plat->has_gmac4 && (status & rx_not_ls))
> 
> Commit 26ab9830beab ("net: stmmac: replace has_xxxx with core_type"):
> 
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 99022620457a..151c81c560c8 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> ...
> +       enum dwmac_core_type core_type;
> ...
> -       int has_gmac4;
> 
> So, has_gmac4 no longer exists, and hasn't done since October last
> year.
> 
> Thus, it seems your patch has been generated against an old kernel.
> As you are submitting for netdev, it is a good idea to ensure that
> patches apply to the net-next tree and/or net tree depending on
> which one you are targetting, and have been tested against that
> tree.
> 
Thanks. This is a new version of the patch I sent last year. I tested
the original version again the net tree. But I forgot to test the new
version again. I just test it now on the latest net tree with other
patches for our board. But Ethernet stops working. I'm trying to figure
out what causes this new issue. After that I will send out a new version
of this patch.

Jie
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
