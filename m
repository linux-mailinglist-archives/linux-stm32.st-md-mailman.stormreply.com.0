Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4329B69F01B
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Feb 2023 09:23:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB4B1C6A612;
	Wed, 22 Feb 2023 08:23:30 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3DD9C6A5E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Feb 2023 19:37:42 +0000 (UTC)
Received: from maxwell ([109.42.115.188]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MLRDv-1pDIgO3GwF-00ITDs; Tue, 21 Feb 2023 20:37:27 +0100
References: <87fsaz6smr.fsf@henneberg-systemdesign.com>
 <Y/T0NRtorZn74EH3@corigine.com>
User-agent: mu4e 1.8.14; emacs 28.2
From: Jochen Henneberg <jh@henneberg-systemdesign.com>
To: Simon Horman <simon.horman@corigine.com>
Date: Tue, 21 Feb 2023 20:35:25 +0100
In-reply-to: <Y/T0NRtorZn74EH3@corigine.com>
Message-ID: <877cwa7qtm.fsf@henneberg-systemdesign.com>
MIME-Version: 1.0
X-Provags-ID: V03:K1:0u8rYgmp9bhY/iDXFU3B1tZaxQ+5aTcRHMJgkC1asXab22AA2cm
 8hNer//gFftW5zMJmS0OGwIMpVmCTrizh0H9L7v95+b+qKKQIXQxeBWrT8uTSD+BPaqAsZ2
 SxpUfRjtKZBOv9NvrIxikRZPsOt3MdG22XqRtXcn3osuHorBmsP0oeG8JViiLDRR5g39qnP
 Y9CIhIWvKmgS59PBH2A5Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Mg6DrOlZEeI=;wZAdP1leOOBHltclXahfqutetpA
 k3esz5E4vIKMIvnehBqXryrzJzasNZLFQfRiUvZIxEN+44508EOhukCXdJgDZa38zZ/Z01QCI
 J4z0CEPs/6pq4Fxd1RkrfuPit8ZFXUq5QmhI53VVd4FUJRCQjROm4qrj4hLIZ55B/ihXl+Iv0
 XKvtYqn7jy8AXO8sxx+oOdSEiHNZmCx4LA5XaE+ULW59pqsYDQo6mSi+PBF950VvTCUKFsJ9s
 wgI42mvtJACdznjnOC3Byxc7XZ8zfhU27J8CE3RPvtv2IvTcJDrtkeQ5PUpegRmYMzMbrWQd1
 D/7bY/aMkWo0nAbMyUS0YprMZMi4dz5rmZPd0F+FYUGQgvRMOI5jZWD7URhIdXeG5fDYWFC6I
 cfsH8xvpxptlbLsZ09Xx4GUr2MrqfWUK4hQ2G2SS0WZNpQai3InKMwN7XUx2ivq9pL3/0AktW
 I9crEuzHvWuJvfqLXARoFJLslSCkiy/fZ+6piB7q6628CwZ3oe4lld6tccTP2vlqaMhzq2ff0
 uIUlqojMk7OKdPPiLEyp1XtgVFnIpptuGxqN/z4XOo0jQYZsKzZbsJu9WxQIHVM1BlfRjc8uC
 kJJaX7RUDf7klge2dMUEe1sh9uN9ETGLVkXWEAQU8DuqIbsrDzHbHDfZ98tTlk/zxx4jDfas6
 7boqcOChDavFIJ6hLzDL1Au3beYFhEFyj+82aAcCUQ==
X-Mailman-Approved-At: Wed, 22 Feb 2023 08:23:28 +0000
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Paolo Abeni <pabeni@redhat.com>, "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net V2] net: stmmac: Premature loop
 termination check was ignored
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


The premature loop termination check makes sense only in case of the
jump to read_again where the count may have been updated. But
read_again did not include the check.

Fixes: bba2556efad6 (net: stmmac: Enable RX via AF_XDP zero-copy)
Fixes: ec222003bd94 (net: stmmac: Prepare to add Split Header support)
Signed-off-by: Jochen Henneberg <jh@henneberg-systemdesign.com>
---
V2: Added fixes tags for both commits that introduced the issue

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 1a5b8dab5e9b..de98c009866a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5031,10 +5031,10 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 			len = 0;
 		}
 
+read_again:
 		if (count >= limit)
 			break;
 
-read_again:
 		buf1_len = 0;
 		entry = next_entry;
 		buf = &rx_q->buf_pool[entry];
@@ -5221,10 +5221,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 			len = 0;
 		}
 
+read_again:
 		if (count >= limit)
 			break;
 
-read_again:
 		buf1_len = 0;
 		buf2_len = 0;
 		entry = next_entry;
-- 
2.39.2
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
