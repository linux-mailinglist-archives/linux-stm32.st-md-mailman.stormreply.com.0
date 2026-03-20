Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LS1qLokXwWmZQgQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 11:35:53 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6872F031D
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 11:35:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0DFDC87EC5;
	Mon, 23 Mar 2026 10:35:52 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B028C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Mar 2026 06:20:49 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id
 d9443c01a7336-2ab46931cf1so22927705ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 23:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773987648; x=1774592448;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bsX7j3IsBCAR2JvcHeowKyby9MbV8ivPuVe631jWpdc=;
 b=PjaEZfUk2/fr/X8GNABjE13YyyDL5XoiNUrZ8OereOz9nMEbSF4o9XVHnDmryTU6zM
 +xy7JUgKA6AS1yplYXmqRWQc/bL5L27kiN7yaiWe2Ti/5+8ow0SMn9dv1BtK+WA+L3Cn
 jaSu5Jdb+3bM+0GVEBS4vB2z76ak9vZrM7qm+RCYfVjxuTSm5ywhtFxudlXR/yq4iAXg
 a06ZaHj8b/2eRYurr684fDFRrzq3ccq/MWJRF2wlDeCblzD8JwmyDuiigjN5UYsOUqag
 Du/GZLY3T1Jz400z9OLe/tD3ZMzqVlcR0zxjGvdPixvQZBS6xqQVevGdlKfZxfmK7swl
 LgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773987648; x=1774592448;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bsX7j3IsBCAR2JvcHeowKyby9MbV8ivPuVe631jWpdc=;
 b=g2AQF0oqGkpqABjxUNz+6BSf0v0F3A5JyUrj9g39BQjADOpHA/MTQJwSFrEoqnq41y
 MOv+r++LSHRgYEA6s1U/h5fSI2euWTsqnMgY3IzPaJKp7/SFv467jhNJKDV/0LquVD75
 KY4cduajoFLJ/YsEPomWnjvZhrh0iD7USQtfezx+0UU39lgPcDiJr/C88tO2U2n+8PD2
 Z5tY+2/6Vrokk/c5AZo2cojQSXlUKBJnlqi9szVHx8LbzvOts9zce+sUfnyTHJVpGwEZ
 1K5Ogf2af2mXVhhJk87w7Vo8BZ26Qr5BjxUgzSbvB5pesGxR81XJC6zQbyqfEGKxkSo2
 LUKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZ0suMsb2Jw3b4B6yQhgjce8zOB+tAEYMONYTAG3yibInp8NQmYg1Kd1pcYOBwiveaYSCcgMxoo/5nQg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxayz1QDRes/f6T1wOJNslBBNMQOp2LttYu3uWHVUCPytD0oLpP
 8QVWuOW/B/WKBNP+2MmrFoG+XGG37hqm0bclgRhPaN6/ZmI3XtCneOqn
X-Gm-Gg: ATEYQzw4G+gRQqW+z+q8tc28/b121okrOx9HauYXdImYiOMA7BPWFosRsRbkkWQMHnl
 RoC/BY89ZeC4S6h2lHnkmSeuryFecftJkhe2tl3KV+peK1orNE2TyCZdfT+PMMdtbG03lbw6MEm
 eQr0nZMaSWAODFfbGZFzE2dNIYp30lUW00r+Y/la2V2rfUXTk1Fa+mVUSeRk9Nt/+lK5IdMxOb/
 OMC33a4q0zTIcSPrPM7tlkgMxi3M/fB1SRghpyn8g8mVS4zGZDwJLDjAjjg5Zgu4Y2jxvbKz+rV
 +A6AWYO48OwSamPdH9ENoHtWb8Mml1AOZy9FcosHG621WDlH6QaeK/Y/Xc1qBo6Rdf+myfQdbDQ
 KSB8cpjI7Vf7Rf1yHTb8JkXWKNVNZqvHbv/EC/Slq+xAqWKiuqtzlIqw8+HVIPxWHJA8geWGpnB
 tObXL+IS/qi8j/1FyjQuO5WmbtDjMM2ljjH7+DV5RtYDOAFA==
X-Received: by 2002:a17:903:1a2e:b0:2ae:cd8c:bd04 with SMTP id
 d9443c01a7336-2b077165dabmr46941965ad.10.1773987648287; 
 Thu, 19 Mar 2026 23:20:48 -0700 (PDT)
Received: from XP-PC-yangg9.xiaopeng.local ([98.98.112.219])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b0836554acsm14418715ad.51.2026.03.19.23.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 23:20:47 -0700 (PDT)
From: yangg9 <cohenyang511@gmail.com>
To: netdev@vger.kernel.org
Date: Fri, 20 Mar 2026 14:19:55 +0800
Message-ID: <20260320061955.833785-1-cohenyang511@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Mar 2026 10:35:52 +0000
Cc: linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 vladimir.oltean@nxp.com, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, yangg9@xiaopeng.com,
 kuba@kernel.org, pabeni@redhat.com, rmk+kernel@armlinux.org.uk,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: close reset IRQ window and avoid
	double free
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
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	DATE_IN_PAST(1.00)[76];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:vladimir.oltean@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:yangg9@xiaopeng.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,nxp.com,st-md-mailman.stormreply.com,lunn.ch,google.com,xiaopeng.com,kernel.org,redhat.com,armlinux.org.uk,davemloft.net,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[cohenyang511@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cohenyang511@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 4D6872F031D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: yangg9 <yangg9@xiaopeng.com>

During reset, stmmac_reset_subtask() used to set STMMAC_DOWN before IRQs
were freed in __stmmac_release(). That leaves a window where interrupts can
still fire after the device is marked down, which may lead to interrupt
storms while the interface is transitioning.

Move stmmac_free_irq() earlier in the reset flow, before setting
STMMAC_DOWN, so the reset path no longer has that interrupt window.

Since IRQs are now released in stmmac_reset_subtask(), guard IRQ release in
__stmmac_release() with STMMAC_DOWN to avoid a second free_irq() during the
same reset sequence.

This removes the interrupt-storm window in reset and prevents double IRQ
release.

Signed-off-by: yangg9 <yangg9@xiaopeng.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 124d7a00f9f0..99b661379d9c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4212,8 +4212,9 @@ static void __stmmac_release(struct net_device *dev)
 
 	netif_tx_disable(dev);
 
-	/* Free the IRQ lines */
-	stmmac_free_irq(dev, REQ_IRQ_ERR_ALL, 0);
+	/* In reset flow IRQs can be freed before dev_close(). */
+	if (!test_bit(STMMAC_DOWN, &priv->state))
+		stmmac_free_irq(dev, REQ_IRQ_ERR_ALL, 0);
 
 	/* Stop TX/RX DMA and clear the descriptors */
 	stmmac_stop_all_dma(priv);
@@ -7331,6 +7332,8 @@ static void stmmac_reset_subtask(struct stmmac_priv *priv)
 	while (test_and_set_bit(STMMAC_RESETING, &priv->state))
 		usleep_range(1000, 2000);
 
+	stmmac_free_irq(priv->dev, REQ_IRQ_ERR_ALL, 0);
+
 	set_bit(STMMAC_DOWN, &priv->state);
 	dev_close(priv->dev);
 	dev_open(priv->dev, NULL);
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
