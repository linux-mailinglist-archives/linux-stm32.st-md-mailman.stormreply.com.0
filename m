Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNJ2FyZm3WmydgkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Apr 2026 23:54:46 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E664F3F3A45
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Apr 2026 23:54:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72438C01FB5;
	Mon, 13 Apr 2026 21:54:45 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7E9BC3F95E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Apr 2026 21:54:43 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-43cfbd17589so3381524f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Apr 2026 14:54:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776117283; cv=none;
 d=google.com; s=arc-20240605;
 b=eI8Ada/IgTjSrBqzyOVTLuDLdRW3pa/6Ih95jCtuZkDUK/4qdRQZac5ECA7Ldw1KV/
 8fiW6hLPnM2AfsxD5sE/uWOz7Kkt0LVhy6lfmkt71l1H6RBDkN8AqAYTEQsD0PeKA8W+
 WQ/QI4KajMqF3tO4S2Wi0uopi7Qr/8Dgbry8zKEIFsXLEuBQx1ydsxymP9fFYqVYQFUh
 XplixaMxuAm+qFAErprJQvZYh4+zATyxJ8YHwkgYmSWUjXhK8tOEl7EwYRZnlu2CVQSv
 rC1znPFQ7d4zwsEziQ457b0enOWZEpOLUveNjD7ji6XmSbNtoqsuij9IY+F9AbXWD5nb
 jnEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=OIvSVDNyRXVMKIryJy1tu7/f3jU7uICWZPfOZkml13I=;
 fh=ikcy++J+SPRLQcPb/c6Q6IEP97egqw66i0hEoZdvjA8=;
 b=Wz7h5C+jY5/pbpHobVfS4EtLTMcVPUuY9LFnKZz/rXhVdXy67p9GVS9oRvX1KUKvE7
 yXUaBsix2uCvGKIdiifJf1pDz8VCt7vMSUX4RoQY+bt/K0qHJbb+yrB9Tm1RKGCj6bdn
 rKffN1tNbmwzvKNS22nfshwkQ0trSZsUpzVWwBXP9wQVv2DioiM67C9JoSemDvuSx10+
 m2+Fq2kNpeodqzaJHCzR/aio5ZN3osrkxOdzxyV+2xhtpEkLx2ykrIY8SEzf/xlVBTrD
 ypUI9yKW6hqUfKJH4JicWoeaL13a45y5bi1ON/BCpurT1uAC+1ZWCQ6GoVh+ve5TQu6T
 0ANg==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776117283; x=1776722083;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OIvSVDNyRXVMKIryJy1tu7/f3jU7uICWZPfOZkml13I=;
 b=NxKTJHgiWKOPvPaBx/acrCLzxQ0EK68WjJE9Te8mcwv6+JwI85Z4l3memsn5nnWr+3
 YrUAjiopuI3pWk4853HJ5XEwvPQVTQ96uvmz/u3TTlELY+xhy3QEswdov2Q6Hb9eR4Eo
 HqEvllGjOTkt3letZHyliNA1P1IbVJV5JgPA9swFyiPjQF4EIwVqpVzODem0yWZc396P
 fdfK6N/Rrkz+CDv7Dxy1EATruTtGCvu+zNuKJU2SOK/F3kxg/7YpbqrlAGllpvsp42aa
 bLFqiYuxKaaotgJnuUOjYX2hIpQNnevFPQiw6cZiqPEwebGvFpJxWe9jdoPd6/UUpmCe
 RGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776117283; x=1776722083;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OIvSVDNyRXVMKIryJy1tu7/f3jU7uICWZPfOZkml13I=;
 b=MS30XoYKos9KJFf0ptCwqDC7rSx0MR1xdOVFuACyGnNDTyXJXU3OHhFQ61Gj0rKTXT
 uhTsXGIW/rL+SZDgn6KI70EC0TCFIHRvXv9wFJqPN6IRDX5UsR7xgYzSi0hJu1zfG2yF
 Y2HjsTC97dQOgpx40Dlis72ZLkXiC5mAocPruZ8ElojTLjwFKP5Q1NGKLabmozuSqQSo
 0S4WvRJpH8QCQAZWRsOc6ecIKQop30So6vg/DlEusflBttjPOpnGl2l63D1XDWDw3krl
 L2GZDUvJBqmS6JfjsYIuLJPLOCNJz8aNABVwSSbQfZCyGwTOTofYsPy9RdxcAOTL4s+R
 vc/A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+m/6gImincM0hfBHlOV72pxP+jUVujUpWET85127QkjTChiN6ySgeNp3O3uMR7yLKpDmNqBXVazGqN5g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwJGriNrisChBcfIlv8MuESiL9ymSrY2vmaycb2SXxPlPmoRaWJ
 7hOrHtGld9GqtQu0MO6lhdjcKd0RYDA5ML2K2Mj3DOYZCUz9L0uaO1qULb7uVRapWGsO7H+VOmt
 utA/V1MO+gatZTlnlLWHGqd+YBH94NPs=
X-Gm-Gg: AeBDiev9iJoamiZFKiXRkrKBCTnS7spH+ObsPjapmbY1ZjF2eqJyJDFUC110lRlJt0L
 rYc6Gc8YJaNMdv1sSntR9wLlXXQcdGvPRmS4Z8b7vK/s9e3CpxD29/i4I/qrHqu8ttP2NI6aRBq
 ZqWSJsaTxaB0lPbOKKRDlj2pMr1wfdE2jYOoe+9EsAXBPqHxncWHFw0vp0QbR+zQuKVArMY5ZAV
 /xiuzPQ9Xl1YAOeemEJ16lK0xYWofR7Ur3o0vbHkviyrt8qhQecKW+CDs1IQl+fHa/3rMQRrc4x
 7Hl+sH0P0qpk5pLDpc1JX/LMwd+LHkXkqMrT6w5N5NIuc3ksJLE=
X-Received: by 2002:a5d:5d83:0:b0:43d:5ec9:246 with SMTP id
 ffacd0b85a97d-43d64250a83mr20728904f8f.12.1776117282589; Mon, 13 Apr 2026
 14:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <E1wBBaR-0000000GZHR-1dbM@rmk-PC.armlinux.org.uk>
 <20260413110222.49fc3759@kernel.org> <ad06yiZZbLC9k3jY@shell.armlinux.org.uk>
In-Reply-To: <ad06yiZZbLC9k3jY@shell.armlinux.org.uk>
From: Sam Edwards <cfsworks@gmail.com>
Date: Mon, 13 Apr 2026 14:54:30 -0700
X-Gm-Features: AQROBzDMFq1J1BHeTMkIhkt-_OIJqPvCL5sV9otRjtVQgF6B-9x3ogZe80tOPWg
Message-ID: <CAH5Ym4i7VV53hQGY3AjAUW3B8g_ffgmw69kPhPrk2CmcRbguuQ@mail.gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Linux Network Development Mailing List <netdev@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: enable RPS and RBU
	interrupts
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[cfsworks@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.477];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cfsworks@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: E664F3F3A45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026, 11:49 Russell King (Oracle) <linux@armlinux.org.uk> wrote:
>
> On Mon, Apr 13, 2026 at 11:02:22AM -0700, Jakub Kicinski wrote:
> > On Fri, 10 Apr 2026 14:07:51 +0100 Russell King (Oracle) wrote:
> > > Since we are seeing receive buffer exhaustion on several platforms,
> > > let's enable the interrupts so the statistics we publish via ethtool -S
> > > actually work to aid diagnosis. I've been in two minds about whether
> > > to send this patch, but given the problems with stmmac at the moment,
> > > I think it should be merged.
> >
> > Sorry for a under-research response but wasn't there are person trying
> > to fix the OOM starvation issue? Who was supposed to add a timer?
> > Is your problem also OOM related or do you suspect something else?
>
> It is not OOM related. I have this patch applied:
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 131ea887bedc..614d0e10e3e6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5095,14 +5095,18 @@ static inline void stmmac_rx_refill(struct stmmac_priv *priv, u32 queue)
>
>                 if (!buf->page) {
>                         buf->page = page_pool_alloc_pages(rx_q->page_pool, gfp);
> -                       if (!buf->page)
> +                       if (!buf->page) {
> +                               netdev_err(priv->dev, "q%u: no buffer 1\n", queue);
>                                 break;
> +                       }
>                 }
>
>                 if (priv->sph_active && !buf->sec_page) {
>                         buf->sec_page = page_pool_alloc_pages(rx_q->page_pool, gfp);
> -                       if (!buf->sec_page)
> +                       if (!buf->sec_page) {
> +                               netdev_err(priv->dev, "q%u: no buffer 2\n", queue);
>                                 break;
> +                       }
>
>                         buf->sec_addr = page_pool_get_dma_addr(buf->sec_page);
>                 }
>
> and it is silent, so we are not suffering starvation of buffers.
>
> However, the hardware hangs during iperf3, and because it triggers the
> MAC to stream PAUSE frames, and my network uses Netgear GS108 and GS116
> unmanaged switches that always use flow-control between them (there's no
> way not to) it takes down the entire network - as we've discussed
> before. So, this problem is pretty fatal to the *entire* network.
>
> With this patch, the existing statistical counters for this condition
> are incremented, and thus users can use ethtool -S to see what happened
> and report whether they are seeing the same issue.
>
> Without this patch applied, there are no diagnostics from stmmac that
> report what the state is. ethtool -d doesn't list the appropriate
> registers (as I suspect part of the problem is the number of queues
> is somewhat dynamic - userspace can change that configuration through
> ethtool).
>
> Thus, one has to resort to using devmem2 to find out what's happened.
> That's not user friendly.
>
> For me, devmem2 shows:
>
> Channel 0 status register:
> Value at address 0x02491160: 0x00000484
> bit 10: ETI early transmit interrupt - set
> bit 9 : RWT receive watchdog - clear
> bit 8 : RPS receieve process stopped - clear
> bit 7 : RBU receive buffer unavailable - set
> bit 6 : RI  receive interrupt - clear
> bit 2 : TBU transmit buffer unavailable - set
> bit 1 : TPS transmit process stopped - clear
> bit 0 : TI  transmit interrupt - clear
>
> Debug status register:
> Value at address 0x0249100c: 0x00006300
> TPS[3:0] = 6 = Suspended, Tx descriptor unavailable or Tx buffer
>                 underflow
> RPS[3:0] = 3 = Running, waiting for Rx packet
>
> Metal Queue 0 debug register:
> Value at address 0x02490d38: 0x002e0020
> PRXQ[13:0] = 0x2e = 46 packets in receive queue
> RXQSTS[1:0] = 2 = Rx queue fill-level above flow-control activate
>                 threshold
> RRCSTS[1:0] = 0 = Rx Queue Read Controller State = Idle
>
> > Firing interrupts when Rx fill ring runs dry (which IIUC this patches
> > dies?) is not a good idea.
>
> Well, I'm thinking that at least on some platforms, such as the Jetson
> Xavier NX, unless a different solution can be found, we need the RBU
> interrupt to fire off a reset of the stmmac IP when this happens to
> reduce the PAUSE frame flood on the network.

Hi Russell,

Should that reset trigger be RPS, not RBU? My understanding of these
status bits is RBU is just "RxDMA has failed to take a frame from the
RxFIFO" while RPS is "the RxFIFO is full." That would make RBU our
critical threshold to start proactively refilling, and RPS the "too
late, we lose" threshold.

Thinking aloud: Do you suppose the RxDMA waits for a wakeup signal
sent whenever a frame is added to RxFIFO? That might explain why the
former never recovers once the latter is full: a manual wakeup needs
to be sent whenever we resolve RBU. Does the .enable_dma_reception()
op need to be implemented for dwmac5, or have you tried that already?

>
> If we can't do that, then I think stmmac on these platforms needs to be
> marked with CONFIG_BROKEN because right now there doesn't seem to be any
> other viable solution.
>
> My intention with this patch is merely to start collecting the already
> existing statistics so other users can start seeing whether they are
> hitting the same or similar problem. If we're not prepared to do that,
> then we should delete the useless statistics from ethtool -S, but I
> suspect they're now part of the UAPI, even though without this patch
> they will remain stedfastly stuck at zero.
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
