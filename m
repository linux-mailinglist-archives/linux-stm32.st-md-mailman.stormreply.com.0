Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGuwOLN8gmnAVQMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Feb 2026 23:54:43 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 753DADF6D7
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Feb 2026 23:54:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F8A0C58D7A;
	Tue,  3 Feb 2026 22:54:43 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 305C8C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 22:54:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0017D60134;
 Tue,  3 Feb 2026 22:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91E38C116D0;
 Tue,  3 Feb 2026 22:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770159280;
 bh=xTEa66SqIkzAleDgDRd7lGWFimq5gjopqYwFXFVLDpQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sjCVV9peYhhrciKha3J/XPkboPPVtTmNcInZhTc+F62AFgALdSSL+Hmzh3A2B1EZw
 Arb6xJM4W1nFMQHJ3SDeign5nxpIop7IWk+jPnwsbnxebEoNgGkNU9yyuUd4JXgWp8
 uzRMtCfHfyqKmTWraf02FKOFcXLaV0kNPjJdZtK16eOujseXLzblXMxMdLyjtshz6e
 XpLGxeymh3oTeJzBWHskWP+FjM38PaSmDrWkwiV9MOHXwXgPgcGCmV7tmjtrBEmWup
 7ZfQI4kVJN5yRgs5VWOkBuS6/mK9mZoru9ha9OUUsxkn0fL38QTmXizln3FJaYtyfx
 BeatimVe6FgrA==
Date: Tue, 3 Feb 2026 14:54:38 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Message-ID: <20260203145438.5a850b61@kernel.org>
In-Reply-To: <bdb7cd69-7dcd-4e8a-b04a-14a2eb902311@redhat.com>
References: <cover.1769764941.git.dan.carpenter@linaro.org>
 <bdb7cd69-7dcd-4e8a-b04a-14a2eb902311@redhat.com>
MIME-Version: 1.0
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Frank Li <Frank.Li@nxp.com>, Eric Dumazet <edumazet@google.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Dan Carpenter <dan.carpenter@linaro.org>, Rob Herring <robh@kernel.org>,
 linaro-s32@linaro.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
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
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_CC(0.00)[lists.linux.dev,nxp.com,google.com,oss.nxp.com,gmail.com,st-md-mailman.stormreply.com,linaro.org,kernel.org,vger.kernel.org,pengutronix.de,lists.infradead.org,suse.com,lunn.ch,davemloft.net];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_RECIPIENTS(0.00)[m:pabeni@redhat.com,m:imx@lists.linux.dev,m:s32@nxp.com,m:Frank.Li@nxp.com,m:edumazet@google.com,m:ghennadi.procopciuc@oss.nxp.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:dan.carpenter@linaro.org,m:robh@kernel.org,m:linaro-s32@linaro.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:kernel@pengutronix.de,m:s.hauer@pengutronix.de,m:jan.petrous@oss.nxp.com,m:linux-arm-kernel@lists.infradead.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 753DADF6D7
X-Rspamd-Action: no action

On Tue, 3 Feb 2026 12:18:54 +0100 Paolo Abeni wrote:
> It looks like patch 3/3 depends on 1/3 but it should land in a different
> tree, as patches 1 && 2 looks suitable for 'net-next' and 3/3 should
> probably go via the arm/freescale tree.
> 
> We either need explicit ack from freescale maintainers or this should be
> split across subtrees, right?

FWIW normally we don't touch the dts patch at all, unless the
maintainer chimes in and tells us to take it. No waiting for acks.
Off the top of my head us taking dts patches only happens if 
the person posting the patch _is_ the platform maintainer..

For this series we're waiting for the bindings to be reviewed.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
