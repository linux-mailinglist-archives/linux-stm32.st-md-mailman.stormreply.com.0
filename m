Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BDPmJqwVVGqEhwMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 00:31:08 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CFB7462CD
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 00:31:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=XyAg9BNc;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB1D2C8F271;
	Sun, 12 Jul 2026 22:31:07 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 623F9C7A833
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jul 2026 22:31:05 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-8454160043aso2436679b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jul 2026 15:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783895464; x=1784500264;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=m0aMkvFlpD7qcpmPu98mFfzTGpFjwWgjgBJW3Blyf0I=;
 b=XyAg9BNc6jM1wXZquTI3V+V9kO0iFmE4e3bKzaIwEVs8K3G6zZaVVUOANxUi5jtX1g
 68XRJcyPx5/+//pEfLvaRVUUcLfSccB8R3/OWDHF+er0RXl+2yqjO2nTvUjDTZB25SgH
 +w/yrovRRIQ5yxe5OZY3N3MA5mvY0sfck30jwkjKM0eEV4xPZgilEPKkoSo0LP+mKJUq
 abjdDA52P+ZiLVzcSSBnOX9NXnL6C8wXIS51ekgcdBBbO2dW2H4wNn1dAR0tEG9uWdgo
 BIuXBV+cyQj3nSq5jD3SPomYiYqaQ9xhN4pOYAc3RrkOcbwmpP5WBgjfPsJHr6dXHYpp
 NqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783895464; x=1784500264;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=m0aMkvFlpD7qcpmPu98mFfzTGpFjwWgjgBJW3Blyf0I=;
 b=Hc2NsYEadeyb7NcIfrGGNAwsE63w2ndIvjs2rOmu7eGu4AsNfMNQNthN8KJT5pJVMz
 VEoVIPI60mFpenqzl61bwKeEaYKctbKod3NuwPIjqpYkRCn9V9eAQrJ7EUXFjxYAyymk
 ovrpgTBJPrwSIrxgsVzsG+0ebL4/PqBJH5VYukFN7ok26nm6l/LVoaI3V7BT7VxONN+f
 dOKgOXEid/7vZFqby/aawiuecLEZRtJ6vI4zxS8DSk6RvemFdxQREXD6SSow9YJFP8fY
 luDBK+XohXoOGU7h9VfTzEkCfa8+CDUmkoYbfeM31qig8vFjnuyjgcoOukbhAxBPFOGc
 iKVg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpiWtLb+eGFzeHseyG59o6sw+iPCsPnNHcPNAEkE2hqwPClB2/V+ygDJud6B3f/TG42tvGXpaC6YqhzWg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyUaST/fb6PmN1YsCClMTalRl5tNeKGHxbT+NybVZxYUtmAMkgA
 j4u4dclD6Q75T99Cm8PpB9wd695hIOiLfTw4HGdv+xjBxF8MCds6UAlL
X-Gm-Gg: AfdE7cmyREO/02OGVel42ddTPV1t/i9vIeIUc8vDm3iiGHYKR570RU5ROuKkQ9w3RAa
 84462gxRabqe2asCPZDC8AgIAIMl/7Sp3hSfLIOz9YXQRVNDHqQYa85s8G7DZC99XozmZojB5z2
 tdySZIPydmBceffJoUcoXTEiA5V/yY3JtTLnG7fgX+o7oAkLrHQUgBO5AAdelu75lYnP2vkbTT0
 CiTxriobhN+zg2/X7OyarFA+0hfZtY4V9AHIe1U1xohyi2xUukh0n9Ma4jNc/YhXLMUc+JLnb+1
 0XdPI6hwm+ApbQJx1KFeRTzApHbMYZ/jkjOKrMXkWf0U9nI6byBYNCOvXEB9JxKVf43ZMzqB9Vc
 8Bci0FQLhQxNPDzrrKp7wlnhOKMLNVg7/FO9v8oxcp8NYpKYMWe4vrVkHvHlKMRa5
X-Received: by 2002:a05:6a00:3e24:b0:847:86b0:888c with SMTP id
 d2e1a72fcca58-8488971d94bmr6700212b3a.48.1783895463640; 
 Sun, 12 Jul 2026 15:31:03 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84a3b8d3310sm345744b3a.40.2026.07.12.15.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2026 15:31:03 -0700 (PDT)
Date: Mon, 13 Jul 2026 06:30:19 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <alQVRx2vCWnqCDEs@inochi.infowork>
References: <20260712045233.800748-1-inochiama@gmail.com>
 <bc78469c-3f45-4234-88b0-49f050d651db@bootlin.com>
 <8689bf7d-e00d-4097-bd3c-4d7d7844d1d2@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8689bf7d-e00d-4097-bd3c-4d7d7844d1d2@lunn.ch>
Cc: linux-kernel@vger.kernel.org, E Shattow <e@freeshell.de>,
 Inochi Amaoto <inochiama@gmail.com>, Han Gao <gaohan@iscas.ac.cn>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Yixun Lan <dlan@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, linux-riscv@lists.infradead.org,
 Paolo Abeni <pabeni@redhat.com>, spacemit@lists.linux.dev,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] Failed to reinit phy of spacemit-dwmac when
	reset-gpio is present
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:maxime.chevallier@bootlin.com,m:linux-kernel@vger.kernel.org,m:e@freeshell.de,m:inochiama@gmail.com,m:gaohan@iscas.ac.cn,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:netdev@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:dlan@kernel.org,m:kuba@kernel.org,m:linux-riscv@lists.infradead.org,m:pabeni@redhat.com,m:spacemit@lists.linux.dev,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,freeshell.de,gmail.com,iscas.ac.cn,st-md-mailman.stormreply.com,lunn.ch,google.com,kernel.org,lists.infradead.org,redhat.com,lists.linux.dev,davemloft.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 24CFB7462CD

On Sun, Jul 12, 2026 at 03:49:43PM +0200, Andrew Lunn wrote:
> > > --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > > +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > > @@ -196,7 +196,8 @@ &eth0 {
> > > 
> > >  	mdio {
> > >  		phy0: phy@1 {
> > > -			compatible = "ethernet-phy-ieee802.3-c22";
> > > +			compatible = "ethernet-phy-id001c.c916",
> > > +				     "ethernet-phy-ieee802.3-c22";
> > 
> > Indeed that's merely a workaround :(
> 
> Despite is being a workaround, there has not been much progress on a
> generic framework for dealing with clocks, resets, regulators etc,
> before probing PHYs. So this is probably what you want to do.
> 
>        Andrew

OK, I think I should accept the fact and let this workaround
solve the problem.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
