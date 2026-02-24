Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEbUGS13nWmAQAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Feb 2026 11:02:21 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D276A185128
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Feb 2026 11:02:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 971D6C8F286;
	Tue, 24 Feb 2026 10:02:19 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E12EC8F285
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 10:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WdEZMFpQwHHmjmHMSwjs7JUUFErg72GIrhiSikPqoEI=; b=fBhIoRXhvjPAk7lxdXgmVZ4eF0
 CYw+FGwMDwqu2PAtevCfLNsu9NyKOKz0/xKV95U85oWU2Hy7s1Z2x1Hd1QNY9P+VwUrIYUTZdG0qh
 cQBKxf+uZGDhSPthm26p01JeytMS4I8YLZPsbacg8uu6MyvCAroM/DFupj3tpMwR+ENOH0YYqKV1+
 mFqJa8z5kdEMmUmdqb9WfBSDRCFp5eMhi6UAnq7olMESK+Nijbo16rClkZ+LxfvDvimBAY70bJ6T2
 5egdIJrpto1hSoHd0P6Fg0yoQ+1m6PPyoLHeDbyMBxKHVm5c8x9KgMbQBj6ta8YkUtI8x8GCODxqw
 +N2jBGmA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48140)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vupF0-0000000053j-2ZSh;
 Tue, 24 Feb 2026 10:02:06 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vupEw-000000008Gi-48I1; Tue, 24 Feb 2026 10:02:03 +0000
Date: Tue, 24 Feb 2026 10:02:02 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Simon Horman <horms@kernel.org>
Message-ID: <aZ13Gjav_5PYNGEN@shell.armlinux.org.uk>
References: <E1vuUvf-0000000AfhS-0lJR@rmk-PC.armlinux.org.uk>
 <aZ1uxX_fddwO7UYD@horms.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aZ1uxX_fddwO7UYD@horms.kernel.org>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: ptp: limit n_per_out
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
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:horms@kernel.org,m:Jose.Abreu@synopsys.com,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.854];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,armlinux.org.uk:url,armlinux.org.uk:email,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: D276A185128
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 09:26:29AM +0000, Simon Horman wrote:
> On Mon, Feb 23, 2026 at 12:20:47PM +0000, Russell King (Oracle) wrote:
> > ptp_clock_ops.n_per_out sets the number of PPS outputs, which the PTP
> > subsystem uses to validate userspace input, such as the index number
> > used in a PTP_CLK_REQ_PEROUT request.
> > 
> > stmmac_enable() uses this to index the priv->pps array, which is an
> > array of size STMMAC_PPS_MAX. ptp_clock_ops.n_per_out is initialised
> > using priv->dma_cap.pps_out_num, which is a three bit field read from
> > hardware.
> > 
> > Documentation that I've checked suggests that values >= 5 are reserved,
> > but that doesn't mean such values won't appear, and if they do, we
> > can overrun the priv->pps array in stmmac_enable().
> > 
> > stmmac_ptp_register() has protection against this in its loop, but it
> > doesn't act to limit ptp_clock_ops.n_per_out.
> > 
> > Fix this by introducing a local variable, pps_out_num which is limited
> > to STMMAC_PPS_MAX, and use that when initialising the array and setting
> > priv->ptp_clock_ops.n_per_out.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> > 
> > This could be a user exploitable bug (although one has to be root
> > so the gun is already pointing at one's foot.) This is the commit
> > which introduced the problem:
> 
> Hi Russell,
> 
> From the description I assumed that for this problem to manifest
> out-of-range values would need to be turned by hardware.
> But maybe I misunderstand things.
> 
> Could you elaborate on the vector you have in mind?

priv->dma_cap.pps_out_num is initialised from hardware:

dwmac4.h:#define GMAC_HW_FEAT_PPSOUTNUM         GENMASK(26, 24)
dwmac4_dma.c:   dma_cap->pps_out_num = (hw_cap & GMAC_HW_FEAT_PPSOUTNUM) >> 24;
dwxgmac2.h:#define XGMAC_HWFEAT_PPSOUTNUM               GENMASK(26, 24)
dwxgmac2_dma.c: dma_cap->pps_out_num = (hw_cap & XGMAC_HWFEAT_PPSOUTNUM) >> 24;

As can be seen, these are three bit fields, and as noted in my commit
description, values in this field above 4 appear to be reserved, but
"reserved" doesn't mean they will never be seen.

Meanwhile, priv->pps[] is defined as:

#define STMMAC_PPS_MAX          4
        struct stmmac_pps_cfg pps[STMMAC_PPS_MAX];

The code in stmmac_ptp_register() takes account of that, and is careful
not to overrun the priv->pps[] array:

	for (i = 0; i < priv->dma_cap.pps_out_num; i++) {
		if (i >= STMMAC_PPS_MAX)
			break;
		priv->pps[i].available = true;
	}

but the code there goes on to assign it to the number of per_out:

	if (priv->dma_cap.pps_out_num)
		priv->ptp_clock_ops.n_per_out = priv->dma_cap.pps_out_num;

Core PTP code uses this to validate user input. This limits the value
that can appear in rq->perout.index for a PTP clock ->enable() call
for PTP_CLK_REQ_PEROUT.

stmmac_enable() implements this method, and with no bounds checks,
does this:

                cfg = &priv->pps[rq->perout.index];

                cfg->start.tv_sec = rq->perout.start.sec;
                cfg->start.tv_nsec = rq->perout.start.nsec;

Thus, if priv->dma_cap.pps_out_num were to indicate e.g. 7, then
there is nothing to prevent rq->perout.index being e.g. 6, and thus
overflowing the priv->pps[] array. This will likely write to other
struct stmmac_priv members if it were to occur.

So... there's two views one can take here:

- hardware will never indicate values > 4. If that's the case, then
  what's the point of the limiting check in stmmac_ptp_register() ?

- hardware might one day support more than 4 outputs, resulting in
  priv->dma_cap.pps_out_num being greater than 4. This will be a
  silent overrun until someone attempts to configure an output > 4,
  at which point non-PPS data of struct stmmac_priv will be
  overwritten.

Either code should care about values > 4, or it shouldn't. The current
code cares about it in one place but then ignores it in all other
places where the index is under userspace control, allowing the
potential for array overrun.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
