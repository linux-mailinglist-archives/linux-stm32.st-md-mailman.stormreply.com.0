Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOwpOuBkimmiJwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Feb 2026 23:51:12 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71001115421
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Feb 2026 23:51:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0471EC36B3E;
	Mon,  9 Feb 2026 22:51:12 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADB1CC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Feb 2026 22:51:10 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-50146483bf9so53904241cf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Feb 2026 14:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770677469; x=1771282269;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g+TvrkNSZE9ym2PFZpW4r5uQoR0rtxBqbUzuUkdsCDo=;
 b=k31Z5nHzZANsGbbZ6SXg3dRcV2d/WssEEABLv/f/XjwvEiqzAjEQKwSitkfjM+1mAN
 Jtxsfr4ljx+7HmkNh7s6jgXKH0gd5rU/PQncLyUudjPg3CymRERKxB3KRqq6VoxLbJou
 Ntu9j9lHNqH7otpppKcmjVCMTkoNsOGxW1EbVRXyT2jCN7sdV06bjWnYvT/bIs+Izibh
 qiEfBthKtJ5j/TOlcse7fbjNRgOdVzwyYay57u+s6ARLDKbukP+JGTFC/SDwyeESrrTf
 8f4TCGsltdB5B6xLzjq7WoqubVP7YTEYTcnBlHA2/wwy6XfVErjKLhT54nW8EoDtwSnw
 6zKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770677469; x=1771282269;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g+TvrkNSZE9ym2PFZpW4r5uQoR0rtxBqbUzuUkdsCDo=;
 b=jHq0Cw+y92WeCSdzi3xFAIlSRSZoRbFXQFl/qk0Twxwuee/AlTOvqquy7chqJmUhRi
 cY/vtMCOwayjzM8UWeUChWVQmvjH1+Wn+/HbYtc+XP5MPecu4uwncR39T/MoZDwviaRY
 ArozOljc/OuYtryDoJRADeYpSWrEZkJzL1Qg/cPaYrHc8j4ryChT7GcGIFNp1shI7BE9
 BYJkoZhWPCMEZubxjWrYvd3c7sKzxiH+PQotjBGMov8/qvDjBc05giMT3HKjFEstXmPM
 d4aZE91tTu7pv08o1opDlLEqGpARVQSbYBouN5k4fKA0yy2o6UlEDOXMDDvf7f3HzUYN
 sUug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXs16vd3i0biW+yv6NkhnQ9W1gAZ9/fpp4fxy37SDMOBGR/zvASElW/YjyHB8LxsHvRIa5QRt1mwZYLYA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyDM2m0BvHkq8SRJZdpJxDS5xFbROL1O1iX5yk2AVtW2/6F3Ek+
 qGUqnKLvs5iPXFXohrZreQ0Nl9UERJtLNIwB3ce/CSeeoMniBK2Ji5RF
X-Gm-Gg: AZuq6aL3GkFxENVhVXZkJjfZPU8az90sIxH33dU/meDu0RTj8GkXJJn85BK+i3owMOb
 WXqU/ZE8XvxEIPq3g6Da5OiAkA85hOOMD9AJ63StpT2B3oMD1otOa0XUp2KoFV6oNgBzxbLnGLY
 5JvdtXWGCM4ad4UD5DNDHqe8oUL6eG/eH7sH3CEgV0GbS8bnHoSmOqRfBF5FrxzLKQ4vg736wbY
 +UXc+XSn5iiYp/If7YZK4QOtKXH0ZD7Az0vAUPhqfPAJk2mYA2oahAww6WW2st5Ih6Mb6+oAOvu
 tRIJFK9zu9A269bN8afv7FTt/LyWnRMgk11vvBQqfysuuXysVkJarGcjygRbf3HCzq3RrOWuc9w
 Jx6KxdxuIa/yZP2YQI/P8bxjnoBBNjdQ0xLEs+soO+FWQTFld6lE03KxtHvOzDZO1DkugZLug8A
 MrYuPHvuv7k29AnETf5Qj2TtKPFvyAXbqhkz4NT+hv5ZcKDNxzSIFQZ865xy7iXdyo8MmrI7Z0t
 bA=
X-Received: by 2002:a05:622a:314:b0:4ee:4a8b:d9f6 with SMTP id
 d75a77b69052e-50639999b38mr165019831cf.59.1770677469375; 
 Mon, 09 Feb 2026 14:51:09 -0800 (PST)
Received: from localhost.localdomain
 (h69-131-24-92.cntcnh.broadband.dynamic.tds.net. [69.131.24.92])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50640c60b3csm87021861cf.8.2026.02.09.14.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 14:51:08 -0800 (PST)
From: Jie Zhang <jzhang918@gmail.com>
X-Google-Original-From: Jie Zhang <jie.zhang@analog.com>
To: netdev@vger.kernel.org
Date: Mon,  9 Feb 2026 17:50:32 -0500
Message-ID: <20260209225037.589130-1-jie.zhang@analog.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, jzhang918@gmail.com, jie.zhang@analog.com,
 horms@kernel.org, Jacob Keller <jacob.e.keller@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v3] net: stmmac: fix oops when split
	header is enabled
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:netdev@vger.kernel.org,m:Jose.Abreu@synopsys.com,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:vladimir.oltean@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:edumazet@google.com,m:andrew+netdev@lunn.ch,m:jzhang918@gmail.com,m:jie.zhang@analog.com,m:horms@kernel.org,m:jacob.e.keller@intel.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jzhang918@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[jzhang918@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[synopsys.com,vger.kernel.org,gmail.com,nxp.com,st-md-mailman.stormreply.com,google.com,lunn.ch,analog.com,kernel.org,intel.com,redhat.com,armlinux.org.uk,davemloft.net,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,analog.com:mid,analog.com:email]
X-Rspamd-Queue-Id: 71001115421
X-Rspamd-Action: no action

For GMAC4, when split header is enabled, in some rare cases, the
hardware does not fill buf2 of the first descriptor with payload.
Thus we cannot assume buf2 is always fully filled if it is not
the last descriptor. Otherwise, the length of buf2 of the second
descriptor will be calculated wrong and cause an oops:

Unable to handle kernel paging request at virtual address ffff00019246bfc0
...
x2 : 0000000000000040 x1 : ffff00019246bfc0 x0 : ffff00009246c000
Call trace:
 dcache_inval_poc+0x28/0x58 (P)
 dma_direct_sync_single_for_cpu+0x38/0x6c
 __dma_sync_single_for_cpu+0x34/0x6c
 stmmac_napi_poll_rx+0x8f0/0xb60
 __napi_poll.constprop.0+0x30/0x144
 net_rx_action+0x160/0x274
 handle_softirqs+0x1b8/0x1fc
...

To fix this, the PL bit-field in RDES3 register is used for all
descriptors, whether it is the last descriptor or not.

Fixes: ec222003bd94 ("net: stmmac: Prepare to add Split Header support")
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Signed-off-by: Jie Zhang <jie.zhang@analog.com>
---
v3:
1. Fix build error
v2:
1. Update for the latest net HEAD
2. Reduce crash dump message in commit message
3. Add Fixes tag
v1 link: https://lore.kernel.org/all/20251202025421.4560-1-jie.zhang@analog.com/
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a379221b96a3..f98fd254315f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5023,13 +5023,27 @@ static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
 	if (!priv->sph_active)
 		return 0;
 
-	/* Not last descriptor */
-	if (status & rx_not_ls)
+	/* For GMAC4, when split header is enabled, in some rare cases, the
+	 * hardware does not fill buf2 of the first descriptor with payload.
+	 * Thus we cannot assume buf2 is always fully filled if it is not
+	 * the last descriptor. Otherwise, the length of buf2 of the second
+	 * descriptor will be calculated wrong and cause an oops.
+	 *
+	 * If this is the last descriptor, 'plen' is the length of the
+	 * received packet that was transferred to system memory.
+	 * Otherwise, it is the accumulated number of bytes that have been
+	 * transferred for the current packet.
+	 *
+	 * Thus 'plen - len' always gives the correct length of buf2.
+	 */
+
+	/* Not GMAC4 and not last descriptor */
+	if (priv->plat->core_type != DWMAC_CORE_GMAC4 && (status & rx_not_ls))
 		return priv->dma_conf.dma_buf_sz;
 
+	/* GMAC4 or last descriptor */
 	plen = stmmac_get_rx_frame_len(priv, p, coe);
 
-	/* Last descriptor */
 	return plen - len;
 }
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
