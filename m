Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NM8DEcNs2nURwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 20:00:23 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD4E2776D9
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 20:00:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 379AEC8F28F;
	Thu, 12 Mar 2026 19:00:22 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECBB4C8F28C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2026 19:00:20 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4852f8ac7e9so15515785e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2026 12:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773342020; x=1773946820;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1uRNP8sj9zOHORQvbyaXxs4QwcaBwFw81kautX3rWdo=;
 b=UmIuW4SEXNr7YWaEudY/XRIb/5Vwglw6DM0BwQ/R8O/DcugSwo4CBoxzvb8+p2OVwH
 Q0yA+J8vBbJ4D2uNyenWSuhjkQ6yCDdUzU/vHAgyktyHKOINjKe2gRVY3HPxI1Ozf4lz
 TcG9vo4jBRUKriFF3D9Ax50zXeosj0vyBr8BBjrnzjtcLaEOEJ+ZCn9AtLQo1sQg3ezi
 PQq0WKxouOjIrp0tknZOZpbD0gMvx65mohZDw3votolh6q99IlKkXednS21pVDbqPBcp
 yg+7q7S3DywCzcZnTznrW2mn376BODCe8gGyDKHMCLjb8MHsawTFKIFafoU8d3JZ/jGV
 vDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773342020; x=1773946820;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1uRNP8sj9zOHORQvbyaXxs4QwcaBwFw81kautX3rWdo=;
 b=P/fzNLSAIuv1dYso+YxGaT0lkGDCqj0845PxjXk0F1Og6aiUlbFSpPLVRg4RQQOv7M
 734l5ay8f/A8AJoq8nUqlSuQHkGmgzhLomYdUII/Q5832L6CPTf7xg/PoH06LjUiCaDM
 6dUHlTEXaZSIYM4VE82cX7GwR6j1ZQkAj9AljFa2guazOyP7z/e6Jicm6to+QsFDRD3c
 ytuDzS+fO/nl7Vtm3LG9HyS4dfdNwNNkFrt9MQj2dpKB++bRt6XUGG1dVsb4/KCnpd06
 9jQbt/B2lrBARG3ZsTi0ENCQP0ih4NgkVXeliIQhYxSvMId01FgUtKSn1zTl+xqnTHA2
 ylmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3aoA6sUFDUieGZ43SR3VcD86f6MbPP/TFo4RQuSqnsZymxKGRKOfAkv2KqwCYZiQlJnnFcTWDhibzTw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzU7gVco/WILI2KtlIvE+jPi/ufBfdcsuj5eljj8DT18holOcv/
 +cJZgLmcBmp98PEDrB83f+tH72X2Z86MRo4pNbe1wwbdj3wvHPFt/ual
X-Gm-Gg: ATEYQzwbAgTVYt5tb9YwVhXiizmvLgCyGiCPOzTWYrrwBLclwCKF1u/cOkQR97nHKhW
 bL4xEjaf1i39bPOnbFJSYqlJFqcIXLAGfGDGk8360Eu5WQ7hlEz0RzqokQnZNJWZHzSEEU/egtX
 vqjqHmUmigPibCAXDkuLChGlM1xB2rlxAncETZEQRACZrHKYm132UpPU+KcEG1ponj02aQCz870
 WWtRqMdn7ASKPhuW9DSF6W6ZjE3R872mejssNw0ddCTa9q5tyC4skkRLrAPl9zwBS3oJMy3NAMB
 bPVW6uTQ+1sZ7d3VlT2G6tJjYm5GW7mi9OIu9jiRYnwTOr62RGQhKoA8eccfkbifO/Y6ZfLGJFx
 rOzHzgHToCZKF5ajXwDBnx40vJQQGYq45hN7INdtbIEAfHCkPSEYKILWDHhVlNOvotF4FB8ptWR
 SQU6ScdQE3oebTe1hUV4VnjZvR2QAnfQ63R2r6gf2NiJe01FKzG6kgS/DsBiFnPHlicpzqBBg+r
 J4=
X-Received: by 2002:a05:600c:8286:b0:485:34b3:8585 with SMTP id
 5b1f17b1804b1-485566d6dffmr6984515e9.8.1773342019666; 
 Thu, 12 Mar 2026 12:00:19 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe19ac5fsm10964630f8f.1.2026.03.12.12.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2026 12:00:19 -0700 (PDT)
Date: Thu, 12 Mar 2026 19:00:18 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>
Message-ID: <20260312190018.15e6310e@pumpkin>
In-Reply-To: <09528d3a-e08a-4942-aff7-b59610f6b13e@redhat.com>
References: <20260310140155.3359-1-david.laight.linux@gmail.com>
 <09528d3a-e08a-4942-aff7-b59610f6b13e@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Cc: Johannes Zink <j.zink@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bartosz Golaszewski <brgl@kernel.org>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>,
 Jakub Kicinski <kuba@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH resend net-next 1/1] net: stmmac: actually
 error requests to change the auxiliary snapshot capture channel
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
X-Spamd-Result: default: False [3.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:pabeni@redhat.com,m:j.zink@pengutronix.de,m:mcoquelin.stm32@gmail.com,m:brgl@kernel.org,m:netdev@vger.kernel.org,m:richardcochran@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:alexis.lothore@bootlin.com,m:kuba@kernel.org,m:wens@kernel.org,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,gmail.com,kernel.org,vger.kernel.org,st-md-mailman.stormreply.com,lunn.ch,google.com,bootlin.com,armlinux.org.uk,davemloft.net,lists.infradead.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.839];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: ACD4E2776D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 12 Mar 2026 15:07:49 +0100
Paolo Abeni <pabeni@redhat.com> wrote:

> On 3/10/26 3:01 PM, david.laight.linux@gmail.com wrote:
> > From: David Laight <david.laight.linux@gmail.com>
> > 
> > Commit 2ddd05d1d5ed ("net: stmmac: do not silently change auxiliary snapshot capture channel")
> > added code that attempted to return -EBUSY to a PTP_CLK_REQ_EXTTS
> > request whan a snapshot was already enabled.
> > However it tested bits in 'acr_value' after they had been masked off
> > so the check would never return an error.
> > 
> > Change the code so that the test actually works.
> > Note that when the commit message says:
> >     Previously in case of a PTP_CLK_REQ_EXTTS request, previously active
> >     auxiliary snapshot capture channels were silently dropped and the new
> >     channel was activated.
> > this only refers to two commits earlier (a few minutes earlier).
> > Prior to that only a single fixed snapshot channel could be enabled.
> > 
> > Note that the check will reject requests to re-enable the currently
> > enabled channel.
> > Plausibly the best fix is just to delete the check completely.  
> 
> I agree with this last statement. Enforcing the check could potentially
> break the user-space.

I did wonder why the 'half hearted' support for multiple snapshots
was added at all.
Either it is needed and should be done properly or always using a fixed
snapshot bit is fine.
Not that I've any idea what this code is for...

	David

> 
> /P
> 
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
