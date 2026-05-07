Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCAeOtR1/GmdQQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 13:21:56 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB034E75F5
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 13:21:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 953D3C8F289;
	Thu,  7 May 2026 11:21:55 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED564C87ECE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2026 11:21:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 264464E42C2C;
 Thu,  7 May 2026 11:21:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E50F860495;
 Thu,  7 May 2026 11:21:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DC49A102F24D0; 
 Thu,  7 May 2026 13:21:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1778152911; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=FomEAYdAik4HwDQHklL8rlVv12AzA09UWLuUsHpy4Ts=;
 b=p2LEdreKQU9Whuz9NS1a6llAszhUVywcfElxsQhXyjSxrqKsBjxbAtFgzNMmfqBMzG2wZr
 BvS6WoISuifX3s2eZ6aXvN262FR8oQcSQ2PkS2T1bddy6fKB46af9iGx3uaDztsTwj9u6G
 U0Cc/uQv8Hv8xhVA/hpU5q7Tys/j8iPb/jH5EjQl9JZJG4b6Z8HKV5u7mHa22zWXEPiohv
 KlxXxNfUZmP7MT+nFc2Kiw5ooZtKj/fQNjXR4Jw0gxzwAEFLUVB5stoEnfSusJVeWM+VUW
 QdG6GRC5qTR6gdf5GwcqnFkub93PVMMKtJDOHeBeFqvmdv1Py2YvDa7MAmAdAg==
Message-ID: <92e8a3dd-a46a-499f-b5f6-99f7b99f45f5@bootlin.com>
Date: Thu, 7 May 2026 13:21:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: lizhi2@eswincomputing.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260507083037.152-1-lizhi2@eswincomputing.com>
 <20260507083214.192-1-lizhi2@eswincomputing.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260507083214.192-1-lizhi2@eswincomputing.com>
X-Last-TLS-Session-Version: TLSv1.3
Cc: ningyu@eswincomputing.com, pinkesh.vaghela@einfochips.com,
 weishangjuan@eswincomputing.com, linmin@eswincomputing.com,
 pritesh.patel@einfochips.com
Subject: Re: [Linux-stm32] [PATCH net v1 2/2] net: stmmac: eic7700: fix
 delay step calculation and ensure safe register initialization
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
X-Rspamd-Queue-Id: 7EB034E75F5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[bootlin.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[bootlin.com:s=dkim];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[eswincomputing.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org,gmail.com,foss.st.com,armlinux.org.uk,st-md-mailman.stormreply.com,lists.infradead.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lizhi2@eswincomputing.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:rmk+kernel@armlinux.org.uk,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:ningyu@eswincomputing.com,m:pinkesh.vaghela@einfochips.com,m:weishangjuan@eswincomputing.com,m:linmin@eswincomputing.com,m:pritesh.patel@einfochips.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[maxime.chevallier@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[bootlin.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maxime.chevallier@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt,kernel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

Hi,

On 07/05/2026 10:32, lizhi2@eswincomputing.com wrote:
> From: Zhi Li <lizhi2@eswincomputing.com>
> 
> Fix several issues in the EIC7700 DWMAC glue driver related to delay
> configuration and register initialization.
> 
> The hardware implements TX/RX delay with a granularity of 20 ps per
> step, but the driver previously assumed a 100 ps step. Update the
> definitions to match the actual hardware behaviour and align with
> the binding constraints.
> 
> Introduce explicit definitions for the maximum programmable delay
> range based on the hardware limits.
> 
> Move HSP CSR configuration into the initialization path after clocks
> are enabled. This ensures that all register accesses occur with the
> required clocks active, avoiding undefined behaviour.
> 
> Clear the TXD and RXD delay control registers during initialization
> to override any residual configuration left by the bootloader. This
> ensures deterministic RGMII timing and prevents unintended delay
> being applied.
> 
> The MAC RGMII delay programming is only required for 100Mbps and
> 1000Mbps modes, where precise clock-to-data alignment is necessary for
> reliable sampling.
> 
> For 10Mbps operation, timing margins are sufficiently relaxed and no
> additional delay compensation is required. In this case, the driver
> falls back to a safe default configuration with delay disabled.
> 
> For unsupported or unexpected link speeds, the driver avoids
> programming invalid delay values and falls back to a safe default
> state by explicitly clearing the delay configuration.
> 
> Explicitly programming zero ensures that no residual delay settings
> from previous configurations or bootloader state remain active.
> 
> These changes fix incorrect delay programming and initialization
> ordering for existing users.
> 
> This also aligns the driver implementation with the updated device
> tree binding.

There's a lot going on in this patch, can you split this into patches
that solves each of these individual issues ?

It's a mix of fixes (the reg access moved after clk config for example)
and non-fixes (the RGMII timings, you're improving the granularity of
the delays, is this required to fix existing setups, or is it a generic
improvement ?), splitting this would make it both easier to review, and
easier to bisect should problems arise in the future.

Thanks,

Maxime


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
