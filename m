Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGYiHrg2g2kwjAMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Feb 2026 13:08:24 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 133BCE5943
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Feb 2026 13:08:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84512C87ECA;
	Wed,  4 Feb 2026 12:08:23 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10D5CC87EC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Feb 2026 12:08:21 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id
 ffacd0b85a97d-4358fb60802so459177f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Feb 2026 04:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770206901; x=1770811701;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ioG9uYV0HuJP9D1DgqNAsKhOMqjhdFQVQ0SW047PMUE=;
 b=sj578L5WvG7SZ1vgwvPVQXXWNdFwETTj25/Ase4ag3oQXMr6U3yDCTV76riO15+Tfd
 FdBTfsAdYC87b9eMic0bpO70lYfl9b+56ExH7D8dl7HLnsUSh1nmlmLbujtQtqOJ4tiv
 /APjr95Z29xYQh35UYtrsm1RMFeZ74NL5TB7Cdu7QoIVviaaGiA8giV1odrfICXC9dcS
 eZXYQbjA9pYn7gHxhuqjZx2AyX0Ebxk69l+C0yOce8eKjkOZXRH94X2lN3qZ3hSEjsHg
 0lr9mHbSuXY1hWK6hkccGEYvyKWJoIOUBUNU/KIgFz6xT0rqFO8T21TbrSK6YzChS24h
 y1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770206901; x=1770811701;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ioG9uYV0HuJP9D1DgqNAsKhOMqjhdFQVQ0SW047PMUE=;
 b=tyf6hojQz9O0mH7Zh4o6KburKlc9dt0n75F7hk3JcCrQY+DUPtDAU/wf/HGY4wlD9a
 AR2Hqq0yZynQjIbZTyV8E/Zfh7ksLrO3l9Yi2ZYekPaKfgux2PYKKMNmljnTpZdBhq4a
 Rtgjg7yKs6nzJnmes7ham3rKpO1QMu6BwTFdRMPctyZA5X3IWb72j2QwIESd08eJZbvJ
 TqnfG33zKOz9r8S28zS2XgoG6EDqMJ9d9MNl2p9JUUPhkyMY7SmMkXFUMkTLt3d88+gw
 qFZ+Un9MkxS2WsRKNtBE2k6cOauualKiiqrC7XN8CYHEwxWKJq3Ej9vLpxLN273DrEUn
 VTmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMGd97aH1A5Xr4vDSKAULnXTA68hUYepBodzC6GJKavfFcUg04GMaVzdbRp3Gi+P6xVJPZJ/saXBlt1A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyuXghWOPYwoWb0EaB3R2YYBhkzysxYX4N9XLU1jTJDfL1Da4j0
 zjTepGf+oT68jyfEH3nhBjPNvInBwYHf2OCdgRundwVH5aPRPtaSiRrAC+2NfrgXtbc=
X-Gm-Gg: AZuq6aL5WeGgCOpFBfqDxV04X14NL64MhKFfX3zYr6/OsJu9m9x4CqHeJzzkZi7BTjD
 d/dMe5YwtUAQiNfOTWYaxRtNJOu1P8O8pcIKdSE7deIEPPlzyVabH8A61L5dGKrYuwkvfxFpbKj
 t8z2ZrbkjeHyK+spOz1DIkTXFa0XgZub9wgp8us9IuQU5Wd1vwKE2dYRztCovMcbAp5wzTJtiJB
 JIymsMo7vJA2tamhWJbcYCUdKA1Itixn2ojK1dDh8PY2sav12QiNNcO+T80+D3G6q8tA8UD/uhO
 IP62mv3QjsMWlonxt7zCsioqn0RCmjgeFisLFcshcUJ7LQmkx1E3DpRVOw0sDTq6eoKAZ7Nf2to
 L8Ycl+eNYQayxg3OYDzZgitB0b3DEtv/e/drIOoSe3IOTstbA6W3seXBlE1iC91eEYXx44sTHmO
 F3SwGptEiafVy7axdk2hYYAELw8Ew=
X-Received: by 2002:a05:6000:288a:b0:435:92c6:d556 with SMTP id
 ffacd0b85a97d-43617c84202mr4190603f8f.16.1770206901187; 
 Wed, 04 Feb 2026 04:08:21 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43618057f7csm5851345f8f.23.2026.02.04.04.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 04:08:20 -0800 (PST)
Date: Wed, 4 Feb 2026 15:08:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>
Message-ID: <aYM2sXq2FXCISrCI@stanley.mountain>
References: <cover.1769764941.git.dan.carpenter@linaro.org>
 <bdb7cd69-7dcd-4e8a-b04a-14a2eb902311@redhat.com>
 <20260203145438.5a850b61@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260203145438.5a850b61@kernel.org>
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Frank Li <Frank.Li@nxp.com>, Eric Dumazet <edumazet@google.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Paolo Abeni <pabeni@redhat.com>, linaro-s32@linaro.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 linux-arm-kernel@lists.infradead.org, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v6 0/3] s32g: Use a syscon for GPR
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[linaro.org:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linaro.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[dan.carpenter@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:robh@kernel.org,m:imx@lists.linux.dev,m:s32@nxp.com,m:Frank.Li@nxp.com,m:edumazet@google.com,m:ghennadi.procopciuc@oss.nxp.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:pabeni@redhat.com,m:linaro-s32@linaro.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:kernel@pengutronix.de,m:s.hauer@pengutronix.de,m:jan.petrous@oss.nxp.com,m:linux-arm-kernel@lists.infradead.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,nxp.com,google.com,oss.nxp.com,gmail.com,st-md-mailman.stormreply.com,redhat.com,linaro.org,vger.kernel.org,kernel.org,pengutronix.de,lists.infradead.org,suse.com,lunn.ch,davemloft.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 133BCE5943
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 02:54:38PM -0800, Jakub Kicinski wrote:
> On Tue, 3 Feb 2026 12:18:54 +0100 Paolo Abeni wrote:
> > It looks like patch 3/3 depends on 1/3 but it should land in a different
> > tree, as patches 1 && 2 looks suitable for 'net-next' and 3/3 should
> > probably go via the arm/freescale tree.
> > 
> > We either need explicit ack from freescale maintainers or this should be
> > split across subtrees, right?
> 
> FWIW normally we don't touch the dts patch at all, unless the
> maintainer chimes in and tells us to take it. No waiting for acks.
> Off the top of my head us taking dts patches only happens if 
> the person posting the patch _is_ the platform maintainer..
> 
> For this series we're waiting for the bindings to be reviewed.

Ugh.  Crap.  Rob already reviewed them.  I included his Reviewed-by tag
in v5 but I accidentally removed it that from v6.  I'm so sorry.

https://lore.kernel.org/all/939fdaf94038613486bdbba510a92a1e57e18c71.1769592679.git.dan.carpenter@linaro.org/

regards,
dan carpenter
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
