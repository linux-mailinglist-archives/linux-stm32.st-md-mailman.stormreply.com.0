Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SVypARJp1GlAtwcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Apr 2026 04:16:50 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAA43A8F27
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Apr 2026 04:16:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6431DC8F284;
	Tue,  7 Apr 2026 02:10:09 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B549C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Apr 2026 02:10:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7831040B5C;
 Tue,  7 Apr 2026 02:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCD7EC2BCAF;
 Tue,  7 Apr 2026 02:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1775527807;
 bh=/bV+bTTfPhODyuYodpZsbu0E+ohIbVKUHn1OOkkT/gM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H0kvEK4WdPguBs68FdUXumtOEYMcAARWdKr5U9iHRFFYdhHvbwdHcBhp+l/h6qAuC
 n/M06MPGTRWbTxt+BiTqZDCiPXOc7l7Gj2QkcFZACW4PuO/SzRqjpHzzjjXeTIS1or
 Rl8un6WwuDy8hcdeKI9J5bJ8R5vcgKBW7dLgW62MAasDUgxMn3Gamf0OKuHA+/deXe
 Nyn1dYZgYlrfYEhU3d0X7o/FQ4b9d41mEPJ8ABZKfFHVqOi7Hs7+GcFTLjxy0kBG+t
 088imVURnvi+0tCIo5SBq3diHslVrb7nqhmsFwmjGfbGQ0h9moqybpKh/HS8two8F8
 4af+y58m0ms7w==
From: Jakub Kicinski <kuba@kernel.org>
To: jitendra.vegiraju@broadcom.com
Date: Mon,  6 Apr 2026 19:10:04 -0700
Message-ID: <20260407021004.3674655-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402213629.1996133-5-jitendra.vegiraju@broadcom.com>
References: <20260402213629.1996133-5-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Cc: quic_abchauha@quicinc.com, me@ziyao.cc, chenchuangyu@xiaomi.com,
 edumazet@google.com, lizhi2@eswincomputing.com, yangtiezhu@loongson.cn,
 linux-stm32@st-md-mailman.stormreply.com, weishangjuan@eswincomputing.com,
 daniel@iogearbox.net, chenhuacai@kernel.org, john.fastabend@gmail.com,
 siyanteng@cqsoftware.com.cn, sdf@fomichev.me,
 bcm-kernel-feedback-list@broadcom.com, vladimir.oltean@nxp.com,
 Jakub Kicinski <kuba@kernel.org>, pabeni@redhat.com, hawk@kernel.org,
 richardcochran@gmail.com, rohan.g.thomas@altera.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, ast@kernel.org,
 rmk+kernel@armlinux.org.uk, wens@kernel.org,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 florian.fainelli@broadcom.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, boon.khai.ng@altera.com,
 horms@kernel.org, bpf@vger.kernel.org, davem@davemloft.net,
 ovidiu.panait.rb@renesas.com
Subject: Re: [Linux-stm32] [PATCH net-next v9 4/4] net: stmmac: Add BCM8958x
	driver to build system
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
X-Spamd-Result: default: False [5.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[quicinc.com,ziyao.cc,xiaomi.com,google.com,eswincomputing.com,loongson.cn,st-md-mailman.stormreply.com,iogearbox.net,kernel.org,gmail.com,cqsoftware.com.cn,fomichev.me,broadcom.com,nxp.com,redhat.com,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,vger.kernel.org,lunn.ch,davemloft.net,renesas.com];
	FORGED_RECIPIENTS(0.00)[m:jitendra.vegiraju@broadcom.com,m:quic_abchauha@quicinc.com,m:me@ziyao.cc,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:lizhi2@eswincomputing.com,m:yangtiezhu@loongson.cn,m:linux-stm32@st-md-mailman.stormreply.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:bcm-kernel-feedback-list@broadcom.com,m:vladimir.oltean@nxp.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:hawk@kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:ast@kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:florian.fainelli@broadcom.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:horms@kernel.org,m:bpf@vger.kernel.org,m:davem@davemloft.net,m:ovidiu.panait.rb@renesas.com,m:johnfastabend@
 gmail.com,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	NEURAL_SPAM(0.00)[0.782];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 8CAA43A8F27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: stmmac: Add BCM8958x driver to build system

This commit adds the PCI driver for the Broadcom BCM8958x to the Linux build
system. It enables the configuration option and updates the MAINTAINERS file.

While reviewing this patch, I noticed a potential regression introduced in the
previous patch of the series (net: stmmac: Add PCI glue driver for BCM8958x)
that is enabled here.

The driver defines a global static array of software nodes (brcm_swnodes)
and registers it in brcm_drv_init() using software_node_register_node_group().

Since PCI drivers must support multiple device instances concurrently, what
happens if there are multiple BCM8958x PCI devices present?

If the second instance's probe attempts to register the exact same software
node pointers, software_node_register() will return -EEXIST. The failure
path in software_node_register_node_group() then unconditionally unregisters
all nodes in the group.

Could this unregister the software nodes that the first probed device
successfully registered and is actively using, leaving the first device with
dangling fwnode pointers and leading to a use-after-free? Would it be safer
to dynamically allocate the software nodes per device instance?

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> index dc55aec915a27..a1e39f65cd42e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> @@ -51,4 +51,5 @@ obj-$(CONFIG_STMMAC_PCI)	+= stmmac-pci.o
>  obj-$(CONFIG_DWMAC_INTEL)	+= dwmac-intel.o
>  obj-$(CONFIG_DWMAC_LOONGSON)	+= dwmac-loongson.o
>  obj-$(CONFIG_DWMAC_MOTORCOMM)	+= dwmac-motorcomm.o
> +obj-$(CONFIG_DWMAC_BRCM)       += dwmac-brcm.o

This isn't a bug, but it looks like spaces are used here for alignment instead
of a tab. The surrounding entries all use a tab character before the
assignment operator.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
