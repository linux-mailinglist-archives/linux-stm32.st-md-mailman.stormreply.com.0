Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJgONZKkzmlZpAYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 02 Apr 2026 19:17:06 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FDD38C74E
	for <lists+linux-stm32@lfdr.de>; Thu, 02 Apr 2026 19:17:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0DF2C87ECE;
	Thu,  2 Apr 2026 17:17:05 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86DDFC55590
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Apr 2026 17:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OBUNBOUtPI/k+VSXotfbt5ddiQ0C3Y6bmoMp5MELPG0=; b=jhQTOP6FbSgr96iF6NQ9PpTjPG
 AMS8+vlXjAla1qlHlpYHs5nczppotue/hndP1ILMlgEIPAG9yuQxsYS3xiqtFL62ks9jszKXB/Ynj
 AuDOmaI8uNBDjn05w5PCtk7+AL0k4mp3kEaMZ2rz9Y4IG1emsEK77XPZTA8euj7WpkcpCeyWN523Q
 Tl0vm6hYqwLU3qV+7GICIKlCoM6ObHoFB9XK3zo/tAl1yjqeS0/TZJW5bSp7Jzd5ipTttcA9VLMVq
 1gWirMUKBSmjLVn4PDvmaWHRTnYLdRyA5o1ycnuYBZLKTiXLE/E/QEcdeYdku9dF51cvqMz+IMbET
 Zcel0E+Q==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52218)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1w8Lf0-000000004kJ-2mdR;
 Thu, 02 Apr 2026 18:16:50 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1w8Lew-000000005wN-0dmu; Thu, 02 Apr 2026 18:16:46 +0100
Date: Thu, 2 Apr 2026 18:16:45 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sam Edwards <cfsworks@gmail.com>
Message-ID: <ac6kfQ98Xjt3dCGj@shell.armlinux.org.uk>
References: <20260401041929.12392-1-CFSworks@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260401041929.12392-1-CFSworks@gmail.com>
Cc: Baruch Siach <baruch@tkos.co.il>, linux-kernel@vger.kernel.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: Re: [Linux-stm32] [PATCH net v4 0/2] stmmac crash/stall fixes when
 under memory pressure
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:cfsworks@gmail.com,m:baruch@tkos.co.il,m:linux-kernel@vger.kernel.org,m:vladimir.oltean@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:fancer.lancer@gmail.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:netdev@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:peppe.cavallaro@st.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:ovidiu.panait.rb@renesas.com,m:fancerlancer@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[tkos.co.il,vger.kernel.org,nxp.com,st-md-mailman.stormreply.com,gmail.com,lunn.ch,google.com,st.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.336];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,tegra-ubuntu:email,st-md-mailman.stormreply.com:rdns,armlinux.org.uk:url]
X-Rspamd-Queue-Id: 43FDD38C74E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 09:19:27PM -0700, Sam Edwards wrote:
> Hi netdev,
> 
> This is v4 of my series containing a pair of bugfixes for the stmmac driver's
> receive pipeline. These issues occur when stmmac_rx_refill() does not (fully)
> succeed, which happens more frequently when free memory is low.
> 
> The first patch closes Bugzilla bug #221010 [1], where stmmac_rx() can circle
> around to a still-dirty descriptor (with a NULL buffer pointer), mistake it for
> a filled descriptor (due to OWN=0), and attempt to dereference the buffer.
> 
> In testing that patch, I discovered a second issue: starvation of available RX
> buffers causes the NIC to stop sending interrupts; if the driver stops polling,
> it will wait indefinitely for an interrupt that will never come. (Note: the
> first patch makes this issue more prominent -- mostly because it lets the
> system survive long enough to exhibit it -- but doesn't *cause* it.) The second
> patch addresses that problem as well.
> 
> Both patches are minimal, appropriate for stable, and designated to `net`. My
> focus is on small, obviously-correct, easy-to-explain changes: I'll follow up
> with another patch/series (something like [2]) for `net-next` that fixes the
> ring in a more robust way.
> 
> The tx and zc paths seem to have similar low-memory bugs, to be addressed in
> separate series.

I've tested this on my Jetson Xavier platform. One of the issues I've
had is that running iperf3 results in the receive side stalling because
it runs out of descriptors. However, despite the receive ring
eventually being re-filled and the hardware appropriately prodded, it
steadfastly refuses to restart, despite the descriptors having been
updated.

What I can see is there's 40 packets in the internal FIFOs via the
PRXQ[13:0] field of the ETH_MTLRXQxDR register.

With your patches applied:

root@tegra-ubuntu:~# iperf3 -c 192.168.248.1 -R
Connecting to host 192.168.248.1, port 5201
Reverse mode, remote host 192.168.248.1 is sending
[  5] local 192.168.248.174 port 43728 connected to 192.168.248.1 port 5201
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec  30.3 MBytes   254 Mbits/sec
[  5]   1.00-2.00   sec  0.00 Bytes  0.00 bits/sec
[  5]   2.00-3.00   sec  0.00 Bytes  0.00 bits/sec
[  5]   3.00-4.00   sec  0.00 Bytes  0.00 bits/sec
[  5]   4.00-5.00   sec  0.00 Bytes  0.00 bits/sec
[  5]   5.00-6.00   sec  0.00 Bytes  0.00 bits/sec
...

The remote system says:

Accepted connection from 192.168.248.174, port 43720
[  5] local 192.168.248.1 port 5201 connected to 192.168.248.174 port 43728
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec  31.8 MBytes   266 Mbits/sec    1   1.41 KBytes
[  5]   1.00-2.00   sec  0.00 Bytes  0.00 bits/sec    1   1.41 KBytes
[  5]   2.00-3.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes

This is a dwmac v5.0. I think the relevant registers are:

ETH_MTLQxICSR: Value at address 0x02490d2c: 0x00000002

ETH_MTLRXQxDR: Value at address 0x02490d38: 0x00280020

 PRXQ[13:0]: Number of Packets in Receive Queue = 40
 RXQSTS[1:0]: MTL Rx Queue Fill-Level status = 2 (Rx queue fill-level
 above flow-control activate threshold)
 RRXSTS[1:0]: MTL Rx Queue Read Controller State = 0 (Idle)
 RWCSTS: MTL Rx Queue Write Controller Active Status = 0

ETH_DMADS1R: Value at address 0x0249100c: 0x00006300

 RPS0[3:0]: DMA Channel Receive Process State = Running (Waiting for Rx
 packet)

ETH_DMACxRXDTPR: Value at address 0x02491128: 0xffffe7d0

 RDT[31:0]: Receive Descriptor Tail Pointer (writes should apparently
 trigger DMA to start, but doesn't seem to)

ETH_DMACxCARXDR: Value at address 0x0249114c: 0xffffe7d0

 CURRDESAPTR[31:0]: Application receive descriptor address pointer

ETH_DMACxCARXBR: Value at address 0x0249115c: 0xffb55040

 CURRBUFAPTR[31:0]: Application receive buffer address pointer

 This makes it look like it's read the descriptor at 0x7fffffe7d0.

ETH_DMAC0SR: Value at address 0x02491160: 0x00000484

 ETI (early transmit interrupt)=1 RBU (receive buffer unavailable)=1
 TBU (transmit buffer unavailable)=1

 Clearing RBU doesn't seem to help.

Descriptors:

123 [0x0000007fffffe7b0]: 0xffbba040 0x7f 0x0 0x81000000
124 [0x0000007fffffe7c0]: 0xffbb9040 0x7f 0x0 0x81000000
125 [0x0000007fffffe7d0]: 0xffb55040 0x7f 0x0 0x81000000 <---
126 [0x0000007fffffe7e0]: 0xffc26040 0x7f 0x0 0x81000000
127 [0x0000007fffffe7f0]: 0xfff95040 0x7f 0x0 0x81000000

So they're all refilled.

Any ideas?


Full register dump via devmem2 (ethtool -d doesn't dump all registers):

Value at address 0x02490000: 0x08072203
Value at address 0x02490004: 0x00200000
Value at address 0x02490008: 0x00010404
Value at address 0x0249000c: 0x00000000
Value at address 0x02490010: 0x00040008
Value at address 0x02490014: 0x20000008
Value at address 0x02490018: 0x00000001
Value at address 0x0249001c: 0x00000001
Value at address 0x02490020: 0x00000000
Value at address 0x02490024: 0x00000000
Value at address 0x02490028: 0x00000000
Value at address 0x0249002c: 0x00000000
Value at address 0x02490030: 0x00000000
Value at address 0x02490034: 0x00000000
Value at address 0x02490038: 0x00000000
Value at address 0x0249003c: 0x00000000
Value at address 0x02490040: 0x00000000
Value at address 0x02490044: 0x00000000
Value at address 0x02490048: 0x00000000
Value at address 0x0249004c: 0x00000000
Value at address 0x02490050: 0x01600000
Value at address 0x02490054: 0x00000000
Value at address 0x02490058: 0x00000000
Value at address 0x0249005c: 0x00000000
Value at address 0x02490060: 0x00120000
Value at address 0x02490064: 0x00000000
Value at address 0x02490068: 0x00000000
Value at address 0x0249006c: 0x00000000
Value at address 0x02490070: 0xffff0002
Value at address 0x02490074: 0x00000000
Value at address 0x02490078: 0x00000000
Value at address 0x0249007c: 0x00000000
Value at address 0x02490080: 0x00000000
Value at address 0x02490084: 0x00000000
Value at address 0x02490088: 0x00000000
Value at address 0x0249008c: 0x00000000
Value at address 0x02490090: 0x00000001
Value at address 0x02490094: 0x00000000
Value at address 0x02490098: 0x00000000
Value at address 0x0249009c: 0x00000000
Value at address 0x024900a0: 0x00000002
Value at address 0x024900a4: 0x00000000
Value at address 0x024900a8: 0x00000000
Value at address 0x024900ac: 0x00000000
Value at address 0x024900b0: 0x00000001
Value at address 0x024900b4: 0x00001030
Value at address 0x024900b8: 0x00000000
Value at address 0x024900bc: 0x00000000
Value at address 0x024900c0: 0x00000000
Value at address 0x024900c4: 0x00000000
Value at address 0x024900c8: 0x00000000
Value at address 0x024900cc: 0x00000000
Value at address 0x024900d0: 0x003b0200
Value at address 0x024900d4: 0x03e8001e
Value at address 0x024900d8: 0x000f4240
Value at address 0x024900dc: 0x0000007c
Value at address 0x024900e0: 0x00000000
Value at address 0x024900e4: 0x00000000
Value at address 0x024900e8: 0x00000000
Value at address 0x024900ec: 0x00000000
Value at address 0x024900f0: 0x00000000
Value at address 0x024900f4: 0x00000000
Value at address 0x024900f8: 0x000d0000
Value at address 0x024900fc: 0x00000000
Value at address 0x02490100: 0x00000000
Value at address 0x02490104: 0x00000000
Value at address 0x02490108: 0x00000000
Value at address 0x0249010c: 0x00000000
Value at address 0x02490110: 0x00001050
Value at address 0x02490114: 0x00000000
Value at address 0x02490118: 0x00000000
Value at address 0x0249011c: 0x1bfd73f7
Value at address 0x02490120: 0x421e7a49
Value at address 0x02490124: 0x100c30c3
Value at address 0x02490128: 0x00320220
Value at address 0x02490200: 0x000e010c
Value at address 0x02490204: 0x00000006
Value at address 0x02490208: 0x00000000
Value at address 0x0249020c: 0x00000000
Value at address 0x02490210: 0x00000000
Value at address 0x02490214: 0x00000000
Value at address 0x02490218: 0x00000000
Value at address 0x0249021c: 0x00000000
Value at address 0x02490220: 0x00000000
Value at address 0x02490224: 0x00000000
Value at address 0x02490228: 0x00000000
Value at address 0x0249022c: 0x00000000
Value at address 0x02490230: 0x00000000
Value at address 0x02490234: 0x00000000
Value at address 0x02490238: 0x00000102
Value at address 0x02490d00: 0x00ff000a
Value at address 0x02490d04: 0x00000000
Value at address 0x02490d08: 0x00000000
Value at address 0x02490d0c: 0x00000000
Value at address 0x02490d10: 0x00000000
Value at address 0x02490d14: 0x00000030
Value at address 0x02490d18: 0x00000000
Value at address 0x02490d1c: 0x00000000
Value at address 0x02490d20: 0x00000000
Value at address 0x02490d24: 0x00000000
Value at address 0x02490d28: 0x00000000
Value at address 0x02490d2c: 0x00000002
Value at address 0x02490d30: 0x0ff1c4e0
Value at address 0x02490d34: 0x00000000
Value at address 0x02490d38: 0x00280020
Value at address 0x02490d3c: 0x00000000
Value at address 0x02491000: 0x00000000
Value at address 0x02491004: 0x0002180e
Value at address 0x02491008: 0x00000000
Value at address 0x0249100c: 0x00006300
Value at address 0x02491010: 0x00000000
Value at address 0x02491014: 0x00000000
Value at address 0x02491018: 0x00000000
Value at address 0x0249101c: 0x00000000
Value at address 0x02491020: 0x00000000
Value at address 0x02491024: 0x00000000
Value at address 0x02491028: 0x00000000
Value at address 0x0249102c: 0x00000000
Value at address 0x02491030: 0x00000000
Value at address 0x02491034: 0x00000000
Value at address 0x02491038: 0x00000000
Value at address 0x0249103c: 0x00000000
Value at address 0x02491040: 0x00000000
Value at address 0x02491044: 0x00000000
Value at address 0x02491048: 0x00000000
Value at address 0x0249104c: 0x00000000
Value at address 0x02491050: 0x00000000
Value at address 0x02491054: 0x00000000
Value at address 0x02491100: 0x00010000
Value at address 0x02491104: 0x00101011
Value at address 0x02491108: 0x00080c01
Value at address 0x0249110c: 0x00000000
Value at address 0x02491110: 0x0000007f
Value at address 0x02491114: 0xffffc000
Value at address 0x02491118: 0x0000007f
Value at address 0x0249111c: 0xffffe000
Value at address 0x02491120: 0xffffc500
Value at address 0x02491124: 0x00000000
Value at address 0x02491128: 0xffffe7d0
Value at address 0x0249112c: 0x000001ff
Value at address 0x02491130: 0x000001ff
Value at address 0x02491134: 0x0000d041
Value at address 0x02491138: 0x000000a0
Value at address 0x0249113c: 0x000d07c0
Value at address 0x02491140: 0x00000000
Value at address 0x02491144: 0xffffc500
Value at address 0x02491148: 0x00000000
Value at address 0x0249114c: 0xffffe7d0
Value at address 0x02491150: 0x0000007f
Value at address 0x02491154: 0xffc45b02
Value at address 0x02491158: 0x0000007f
Value at address 0x0249115c: 0xffb55040
Value at address 0x02491160: 0x00000484
Value at address 0x02491164: 0x00000000
Value at address 0x02491168: 0x00000000
Value at address 0x0249116c: 0x00000000
Value at address 0x02491170: 0x00000000
Value at address 0x02491174: 0x00000000
Value at address 0x02491178: 0x00000000
Value at address 0x0249117c: 0x00000000

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
