Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YG+AN2UPymmV4wUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Mar 2026 07:51:33 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3673355BBD
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Mar 2026 07:51:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECCE2C8F295;
	Mon, 30 Mar 2026 05:51:32 +0000 (UTC)
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05063C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Mar 2026 19:25:24 +0000 (UTC)
Received: by mail-dl1-f50.google.com with SMTP id
 a92af1059eb24-126ea4e9694so3789463c88.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Mar 2026 12:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774725923; x=1775330723;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sL0ml+VWm2YV7ulhW2wYXZxFABQP0IsIT5aunFSXxAc=;
 b=sRpE9suLhtf30AoiFK58+CK1bg6w4p3llUpDLuqoyQ1gxgXmD3+qWlzulGPQJPa5bh
 KdOsLp0ODQQqHyW8v8xLKTDohQHivPJPC3hOaBxWIROWSFuFwVFJ220Yy8Wthuopp5km
 NF2TJuqMsiKsFdhfFul/+eRWRv58DPRG8x5FSC1CS2Cr0EwVmQs3SvsyYZ3iUA4EE4a+
 w/M7FEYfZNPTLJNWJL4GHDrcQiK5kMjzgINtUTuuqbSa79ghHDjQNFgOx2mwogwjs+Rv
 phAmb9n08g8iAUuxg4j1vfmbF80mqYFv6Bzzx6JzGTV0RRh/sOah/eXzIkyv3kdKHIxH
 5lhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774725923; x=1775330723;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sL0ml+VWm2YV7ulhW2wYXZxFABQP0IsIT5aunFSXxAc=;
 b=Dp1hIhrllLnJ+lSq1/MhpDuGN51zxy8J25X8zK6H0QMezhGrKuPC6MlemaRB8SRxlw
 43aRdLWHL/Img9O4vIzhveN2DT/rnehQyNsGHOKClaq8iuXffMmTtiymSbmZVKDd4w8Q
 9UUNCreoNGmfulWDekUmXomuq+BTj5k1FZYpfYa9P7aTV8X3bM9q1+n8cadLXtPTAQM2
 OIupLYSIlUnD2LzMQxI7dA9WmZOlmK3jK4bB+KvNiiGstPIPaB+AOtMHvwdGHyKmKpmQ
 3eyynN5Z01cUi8sxYBcnegTtB95iSIAhaRL88ejSMMWkyt5FHs2HfFwT6eRhdJyTxksZ
 qS0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7w6eRtBj5nEU9Fh2Jczs9leDn4S0Ols+iV3woMjJiyI1X0c89KfRHCZxbfups4hF4/+Bc+VDTbYBiIg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzgbnRit4Yxmt3Ja0ATdVZ2Nf5QC4/2IoOiIMhCAohkmzKjpjgv
 OCl3S5jijRP6br0p4zKHpICUAsr+Er0+uBC/DKmGmEC76nyiYAJMMGSl
X-Gm-Gg: ATEYQzxKnwrBUowgrOjznvjaWAoqNxPrTuMhqV99uIJ7K4ILih66HTmRtjMea68rZV/
 JSxagBBX6v6N9bq4q4wZYJ5PTQJPA7SGCLXK/3BihhNnfOKCRJDgatK68rKMa0wL4hZpsIwc3C2
 iD68GjMolob4v0efQTJFWbgyQubBPcS89NKis+xjDna9Wzf+PELa/Bl1G3PnePPMDAjuQgwOesg
 rbl/MUZBsOHkHalJ/omSI2gEAQmxmG6SKizFe2H9VObtncja7cFL7mGFLeABUi3hsx/+5twhacP
 vdel1eGlqPYBLjwg8jRjRsW9hzFzj6Gc9PdUIHFbYpEd+CZz/ZZF/SHs7p6d2Au5qt8vcCm3sZf
 b0iPhdwsjsphaIplYTSMaknhtS8jev+S20wjeLZtmJ/ZD0+RGmPP+e5GsBfyRY54hlt8ivsOTtx
 kk2V7+G7vVD4tzt07ioCzoxjB2UpBM6BLAMY3WUZjLd1UtWg6IdSCOF5ld
X-Received: by 2002:a05:7022:6707:b0:119:e56b:9592 with SMTP id
 a92af1059eb24-12ab28e4f04mr4498030c88.23.1774725923210; 
 Sat, 28 Mar 2026 12:25:23 -0700 (PDT)
Received: from localhost (static-23-234-93-211.cust.tzulo.com. [23.234.93.211])
 by smtp.gmail.com with UTF8SMTPSA id
 a92af1059eb24-12ab97d88c0sm3993488c88.5.2026.03.28.12.25.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Mar 2026 12:25:22 -0700 (PDT)
From: Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <CFSworks@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Date: Sat, 28 Mar 2026 12:25:01 -0700
Message-ID: <20260328192503.520689-1-CFSworks@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Mar 2026 05:51:31 +0000
Cc: Baruch Siach <baruch@tkos.co.il>, linux-kernel@vger.kernel.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Sam Edwards <CFSworks@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [Linux-stm32] [RESEND PATCH net v3 0/2] stmmac crash/stall fixes
	when under memory pressure
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
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	DATE_IN_PAST(1.00)[34];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:baruch@tkos.co.il,m:linux-kernel@vger.kernel.org,m:vladimir.oltean@nxp.com,m:fancer.lancer@gmail.com,m:rmk+kernel@armlinux.org.uk,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:peppe.cavallaro@st.com,m:CFSworks@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:ovidiu.panait.rb@renesas.com,m:andrew@lunn.ch,m:fancerlancer@gmail.com,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[tkos.co.il,vger.kernel.org,nxp.com,gmail.com,armlinux.org.uk,st.com,st-md-mailman.stormreply.com,lists.infradead.org,renesas.com];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[cfsworks@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[cfsworks@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.975];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C3673355BBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi netdev,

This is v3 of my series containing a pair of bugfixes for the stmmac driver's
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

RESEND: Oops, my subject line didn't have `net`, so I'm resending the series to
fix that.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=221010
[2] https://lore.kernel.org/netdev/20260316021009.262358-4-CFSworks@gmail.com/

v3:
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

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

-- 
2.52.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
