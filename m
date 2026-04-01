Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yChZKdqczGkaUgYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Apr 2026 06:19:38 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8FD3749BC
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Apr 2026 06:19:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9E78C8F27F;
	Wed,  1 Apr 2026 04:19:37 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70599C87EBD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2026 04:19:37 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-7d7f09aa39fso7883146a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 21:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775017176; x=1775621976;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dFONURkaqW7NTmmG72z2KFu2mOMfbPaei0blX1R+FTo=;
 b=RDamX21BdVaD4+ei5kRlV+dHZ2SijYrSlW6a46PmgSuIHOuL/c+B7Ta0krphrMryqW
 8+9R0BuECwjnqDunH+a6d91uBTzEEAnweCgmGFBTv0drIc12EprgeW6PXSWCYYTQlYmP
 XSYhrxvf6zTqDNll9HNi1dvtcC2PLCPgwCPR5BodLd1Z3Z+pOxk3RJwRSLkIYdXuOzzF
 p5kGrwIR6Y1E+ChZYxp6a7lVNuMh1NI7ILZiNIoUyLY7JTHU7WYo3OBA35Cv0QfyZwPb
 4IH2Q3WaYKlxd7Iy8zRWKmu/eYApGcjvjbM5nTSVSD/pb7B50rCIp7fNchfDoXXyocfe
 MmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775017176; x=1775621976;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dFONURkaqW7NTmmG72z2KFu2mOMfbPaei0blX1R+FTo=;
 b=sXJ8UMelKtHmZrm7ZEXiqEXYj9kKVE/uKOvDyrkepBhNbuvqu12ymYZBJL8vq0hf1F
 bdfCOQPC5NE5izQnrZOClev3TiCBHP7cK+TnyPTC/52uzCQuoWvPoSfP9r4b9Ze8vGvq
 O/+0BmE5IZhZhZzkNesKRNxC51BwLIpnISZPBbcfK+FwlGywQ6xmaW2BovpWIrOMgY0Q
 J+IC2psSgwEfT1rYtKW3ObicRclK0G+lL1FlcXzyXn+XdKv+sEdvD4JXg23/MA5oatb/
 hX/zMCU994nF/orScAsVgMeaktQrcNXV3n+5XkX2wTa/q7fSRLK3n89//voHVUhAbkWx
 6DkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrHHnTVmtv9nFp1cFafJp6SUogupTFsg7QFsJ8GdRPJ0kpw0/9UV2gQeJhLG/quD8fzq8aFxdk5lXk/g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzcyRSCfYnNLHdN1tgcqOSnlWOyCjUuQqLLwDxQWjPLHZoxQTIp
 mEyTVxkCmTe/p9PSZhbbqroDzkPFiKvU9jrp5fZLFJj/eEKRrxSMnsQC
X-Gm-Gg: ATEYQzwaXIZnhbEGkDIdlvHmJ1BvWxtpYVhDFhrxp/7gB/Tdsim2dp4oPm4s2clbJBk
 UHJEsNgl/8GC4QlQQuNNSAR0FQR3UPVqmKJdQnkOKbzDWd8GaoLKN+ips7ohr9PP0RJ7dBlFKvg
 cSsxQt/hFnVIWcJOvv6UIcmccgkmJl9YtISGGhVrdiaBSZi4gMFn4yZBgderPMHBKulKAb5p6Ya
 xeDl+NK0/9tz+flzoSMksqkqA36ZUcF85sYvrta1J2MrF+dEtXBlX6OLX+8zmAHSGvWONxdQts9
 5ipSv7ZdflIcHyjqfyzGDHZBCgi0oLyF9UkAXcSbqFuemRgkKQV+O2PLvLcDO7TkPTb8Ohx/yPD
 BHPVRC7ujzhInZtZGWuW70bES5wEcyvr6lWJMLfGFTMo4PIb/PHu+a8nJtrqJVtnE3g7GfDnfvK
 3Uft8hpo4eVAy7XTkvfUwkeNN3g20unve4C44f8FlQ1+6aqoIE8D2ejVvdVvw=
X-Received: by 2002:a05:6830:43a9:b0:7d7:fada:89ca with SMTP id
 46e09a7af769-7db99343898mr1622685a34.15.1775017176031; 
 Tue, 31 Mar 2026 21:19:36 -0700 (PDT)
Received: from localhost (static-23-234-115-121.cust.tzulo.com.
 [23.234.115.121]) by smtp.gmail.com with UTF8SMTPSA id
 46e09a7af769-7da0a335440sm9588380a34.4.2026.03.31.21.19.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 21:19:34 -0700 (PDT)
From: Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <CFSworks@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Date: Tue, 31 Mar 2026 21:19:27 -0700
Message-ID: <20260401041929.12392-1-CFSworks@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Cc: Baruch Siach <baruch@tkos.co.il>, linux-kernel@vger.kernel.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Sam Edwards <CFSworks@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [Linux-stm32] [PATCH net v4 0/2] stmmac crash/stall fixes when
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:baruch@tkos.co.il,m:linux-kernel@vger.kernel.org,m:vladimir.oltean@nxp.com,m:fancer.lancer@gmail.com,m:rmk+kernel@armlinux.org.uk,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:peppe.cavallaro@st.com,m:CFSworks@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:ovidiu.panait.rb@renesas.com,m:andrew@lunn.ch,m:fancerlancer@gmail.com,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[tkos.co.il,vger.kernel.org,nxp.com,gmail.com,armlinux.org.uk,st.com,st-md-mailman.stormreply.com,lists.infradead.org,renesas.com];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[cfsworks@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[cfsworks@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 3F8FD3749BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi netdev,

This is v4 of my series containing a pair of bugfixes for the stmmac driver's
receive pipeline. These issues occur when stmmac_rx_refill() does not (fully)
succeed, which happens more frequently when free memory is low.

The first patch closes Bugzilla bug #221010 [1], where stmmac_rx() can circle
around to a still-dirty descriptor (with a NULL buffer pointer), mistake it for
a filled descriptor (due to OWN=0), and attempt to dereference the buffer.

In testing that patch, I discovered a second issue: starvation of available RX
buffers causes the NIC to stop sending interrupts; if the driver stops polling,
it will wait indefinitely for an interrupt that will never come. (Note: the
first patch makes this issue more prominent -- mostly because it lets the
system survive long enough to exhibit it -- but doesn't *cause* it.) The second
patch addresses that problem as well.

Both patches are minimal, appropriate for stable, and designated to `net`. My
focus is on small, obviously-correct, easy-to-explain changes: I'll follow up
with another patch/series (something like [2]) for `net-next` that fixes the
ring in a more robust way.

The tx and zc paths seem to have similar low-memory bugs, to be addressed in
separate series.

Regards,
Sam

---

[1] https://bugzilla.kernel.org/show_bug.cgi?id=221010
[2] https://lore.kernel.org/netdev/20260316021009.262358-4-CFSworks@gmail.com/

v4:
- Changed patch 2 to tolerate dirty stragglers up to a critical threshold (the
  same threshold tolerated by the zero-copy path), to avoid nuisance looping
  during OOM conditions (thanks Jakub)
v3: https://lore.kernel.org/netdev/20260328192503.520689-1-CFSworks@gmail.com/T/
- Rebased on latest net/main
- Changed patch 2 to require that stmmac_rx_refill() *fully* succeeds before
  exiting polling, to reduce the chance of rx drops.
- DID NOT use the CIRC_SPACE() macro as suggested by Russell: I fear that the
  perspective shift (first think of the dirty descriptors as the "work" that
  refill "consumes" -- therefore the "space" is how much stmmac_rx() may loop)
  is too counterintuitive for a stable fix, but I'll do it in v4 if reviewers
  insist.
- Updated the recipients for the series, which was invalidated in v2 due to the
  `Fixes:`
v2: https://lore.kernel.org/netdev/20260319184031.8596-1-CFSworks@gmail.com/T/
- Completely rewrote the commit message of patch 1, now assuming the reader is
  generally familiar with DMA but wholly unfamiliar with the stmmac device
  (thanks Jakub!)
- Added missing `Fixes:` to patch 2
- Moved patch 2's `int budget = limit;` decl per the reverse-xmas-tree rule
- Dropped patch 3: this was a code improvement not appropriate for stable
- Generated the series with --subject-prefix='PATCH net'
v1: https://lore.kernel.org/netdev/20260316021009.262358-1-CFSworks@gmail.com/

Sam Edwards (2):
  net: stmmac: Prevent NULL deref when RX memory exhausted
  net: stmmac: Prevent indefinite RX stall on buffer exhaustion

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

-- 
2.52.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
