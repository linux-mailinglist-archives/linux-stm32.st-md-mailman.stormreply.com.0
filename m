Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MdIwAYwDTGoEewEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 21:35:40 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 853D271507D
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 21:35:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=c127.dev header.s=resend header.b=hL0wCrsm;
	dkim=fail ("body hash did not verify") header.d=amazonses.com header.s=224i4yxa5dv7c2xz3womw6peuasteono header.b=gVnWzwzw;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4304BC8F271;
	Mon,  6 Jul 2026 19:35:39 +0000 (UTC)
Received: from a9-6.smtp-out.amazonses.com (a9-6.smtp-out.amazonses.com
 [54.240.9.6])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DF9CC6C859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jul 2026 19:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
 d=c127.dev; t=1783366537;
 h=In-Reply-To:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
 bh=+yaV2nYwgAaxNIV72gm61ALSOYBmm7bDIUElv0EL4As=;
 b=hL0wCrsmMvM/WL3klErCI7+e6LOjEUUctPNEZaFkHnTRBojfAVNZrLQMzvq1Mwhm
 bhJTmtTGMYZ2Xg5XTwzuLXCUW5jY4sg7JTmzPlFMqQCXd/x+lveUo+Es1081OR1wrBO
 jB+MwlBXsKA/oYmVCdWHcps6XG4e8J/XFBk4hS8c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=224i4yxa5dv7c2xz3womw6peuasteono; d=amazonses.com; t=1783366537;
 h=In-Reply-To:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
 bh=+yaV2nYwgAaxNIV72gm61ALSOYBmm7bDIUElv0EL4As=;
 b=gVnWzwzwHjUX9eiYko7eUirjGQIErf3nRIOYjarUqELpOAatA3LR7ojnEBez5MT5
 WdsfIlUvD2FVQALsgRhw605ngZ4vLE7iOdb6NclAoB7FqJb3wBBzk4i077i8kwn7tqy
 G5igf6jTNVFWPmAQ5hRv3IfX+2Kpgnh+wSRtxd6s=
In-Reply-To: <akuLzI9GVGn4eI1j@boxer>
From: Johan Alvarado <contact@c127.dev>
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Message-ID: <0100019f38edce40-fcb1cb45-6136-4563-8289-df75ca13eaa1-000000@email.amazonses.com>
Date: Mon, 6 Jul 2026 19:35:36 +0000
MIME-Version: 1.0
Feedback-ID: :1.us-east-1.z4rHY0qbNtjoW80ZyzVy+DEul17RQEOMT7FC66S60ffkhLWkV35D8ZWXVyxJY1/89bAuLCem4GFJq1VXsxM0u6ZfZbvT1qSjDUeuZG9/Lxk1uINIqi7CenEa93u+fNllqnJMZ0quaBrclhnmtzdFllG4KHSjZOEcaGLa1BWoSpA=:1.us-east-1.epbACCJLarUaEI78XZoGREJ9LamRjxMH5pM2kZb64rA=:AmazonSES
X-SES-Outgoing: 2026.07.06-54.240.9.6
Cc: Jose.Abreu@synopsys.com, linux-kernel@vger.kernel.org, pavel@ucw.cz,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: raise TX completion
 interrupt at the end of an xmit burst
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
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[c127.dev:s=resend,amazonses.com:s=224i4yxa5dv7c2xz3womw6peuasteono];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[c127.dev];
	FORGED_RECIPIENTS(0.00)[m:maciej.fijalkowski@intel.com,m:Jose.Abreu@synopsys.com,m:linux-kernel@vger.kernel.org,m:pavel@ucw.cz,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[contact@c127.dev,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[synopsys.com,vger.kernel.org,ucw.cz,st-md-mailman.stormreply.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[c127.dev:-,amazonses.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[contact@c127.dev,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 853D271507D

On Mon, Jul 06, 2026 at 01:04:44PM +0200, Maciej Fijalkowski wrote:
> Very messy thread. To reiterate - does tx coalescing do any good in this
> driver?

It does, but today only for traffic that queues deeply enough. Within an
xmit_more batch the frame counter reduces the IC density to one descriptor
per tx_coal_frames, and that keeps working with this patch applied: in the
447 Mbit/s test from the changelog the NIC raised ~3.3k IRQs/s for ~40 kpps
on the wire, i.e. roughly 12 packets per interrupt, because qdisc bulk
dequeue, TSO and the intra-batch frame counter still coalesce. What was
broken is only the case where a flow never accumulates tx_coal_frames
in-flight frames; there the timer was the sole completion mechanism.

> I did some digging and seems there was a rework of coalescing in 2018 and
> then some more polishing happened in 2023 (net: stmmac: improve TX timer
> arm logic).

The 2023 change only avoids re-arming the timer while NAPI is already
scheduled, which helps the loaded case. For a lightly queued flow NAPI is
idle, so the timer still gets armed and the completion still waits out the
full tx_coal_timer. That is the path this patch addresses.

> Wouldn't your change imply that tx coalescing could be dropped altogether?
> I do agree that each single batch of tx descs should be signalled with ic
> bit at the end.

I don't think it can be dropped, for one correctness reason and two
practical ones.

The correctness one: the frame counter enforces an upper bound of
tx_coal_frames descriptors on the distance between IC bits in the TX ring.
If coalescing were dropped and the IC bit only set on batch tails, that
distance becomes unbounded, and a batch larger than the ring can fill it
without a single IC descriptor: every frame queued had xmit_more set, and
the tail frame that would have carried the IC bit is never queued because
stmmac_xmit stops the queue first. The hardware drains the entire ring
without raising a completion interrupt, and only the coalesce timer can
restart the queue - reintroducing the same timer-bound stall this patch
removes, now on the bulk path and once per ring drain. With the bound in
place a full ring always contains at least dma_tx_size / tx_coal_frames
completion points; even the minimum 64-descriptor ring (DMA_MIN_TX_SIZE)
still holds two.

The practical ones: the frame counter is what keeps IC density low inside
large batches (one IC per 25 descriptors rather than a single one at the
tail with nothing in between), and tx-frames / tx-usecs are user-visible
ethtool knobs on this driver that users can rely on.

Dropping the frame/timer machinery would also be a rework rather than a
fix. If there is appetite for that I would rather keep this patch minimal
for net and discuss a rework separately for net-next.

Best regards,
Johan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
