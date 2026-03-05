Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBb4J+ddqWkL6AAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Mar 2026 11:41:43 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3324620FD7A
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Mar 2026 11:41:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DBD85C87EC9;
	Thu,  5 Mar 2026 10:41:42 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B98BBC87EBD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Mar 2026 10:41:41 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4806bf39419so65100435e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Mar 2026 02:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772707301; x=1773312101;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Uy5K6i+BQ/ZCb+F1ScR3BTCuEFkunym54py6/4zT4Xk=;
 b=YonZ9u6P/3WkwR+DLQP4qMGSrXy01G5uTSPFJI+rjWxhc+4Q/ahXv0jA5hYqaBZ7UK
 MQZl/f2Opkc+k6H/LIYqIiEOZ2AarUzk0+YbrInR/eH3nisXUp5I8gOUCw2eTiQ/Gzlm
 MRrszfh9xcx8d23lDMdUiiJu1iFFjSkDNu3p7DP60a7ugHp6GHmXoJwfEYU6h0qVIS4/
 ocym1F761cStbf8SBt9bOxByv5WcEM3lcpfGvVOxBNA96uAN+sIzuT8dNPrPR60SjKsN
 /25tWy7Q7TEAm/G3iPAFEGb817G4bnc7dFj4nY4VT9yTFxqeYBba9dVH6Ii0Sm031ifn
 Pxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772707301; x=1773312101;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uy5K6i+BQ/ZCb+F1ScR3BTCuEFkunym54py6/4zT4Xk=;
 b=FaLHPzMv+/Col4IFMeqTLKla63szhe5cVvZHFNLR43/+tKPFwSyPZF9ONFVhHmZHTX
 ZfMRLy3UV63xOzQQ4LKNZNcNTvtyHYELjEBq5/cG2YHGYirT4WYVFCxGaiyGA+vmBj1S
 WjQ2L7swcafpGShIbwkdQRo7YDCJH3sokaDDci9q/qXQrTnls3A2eSyw3ACeM9ztJbsg
 nusUcW3Tzy4p3B5oZCyDd1pSk9VQQNAl/WcfsU/NiVRnRMNtTKX5U8+xO2+uAmxRT8p2
 cPBOat5QjaKpRpAnQI4BDam4t0H042ZWLaRLjuECC1Fii34D5NXPzrG6km+mc2ufGMzA
 +H5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpZ8aJrS2O4dYNlPI30sQ2GUP4wf8PImB7VAZ+SIGShMXIyS7tznZJnvqBoRLNzdONfQ03WnPk0Dy42Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwdLeg5zuqkQpcse1uDO0Hs/xQwGP43CHK5JFRPpQ0uk7BBDGtp
 NpoSO/XPlah/mTEzG6tvMnIz1lQ4mhdLoIlqUoAJpmXwbgIZAUrHhFbt
X-Gm-Gg: ATEYQzz6B4NIlgWTHoZlAE+Gwo0IrahJMsQ8mQhwibid8T7N4b7+zhgW3FqikChspLt
 HdFxKol5xfAtC9nKmwxy7OBTRcgSkOWZ1PhA3Ih+5NlIgcVgwLOCx3EgcbooRcL9gs5fIDsHn2I
 uJ8NIILgj8m0wxmhVliKJlctxU2+TWd/Ye4ydPezwx9KLwL9CRSnmnEw7zvnjalhlANeSwzGbkB
 UK7WtQueWw4gL0+nlTI4vLgNwHl5eyv1V3dN1ozi2y9XzVXzLZ7iWTG2GKCqFpOgtc6fuixjUAs
 1Q9VB6Rxktg5C7kvepUAPrudRPq8dJfYsZJqAc3fdvTwV7fSNn8UYwTqpXewytgl4d0m+IIuIjH
 2+V+LN7NUU64WEPBMmy8Kzg5+xOgyshwTbKyQza6H/2dpU85xm5ANjcqoYI7+4lv+m+Mch9gMH2
 w+QIWJ+w01LpcTHTxjtCLZS7SE2JJyKgeD6kdctm00oZ27dXU8wMnXXiilYBqFLLKLBd8QzNC+/
 cKnVKAAgIFs
X-Received: by 2002:a05:600c:1d21:b0:47d:403a:277 with SMTP id
 5b1f17b1804b1-4851ee7b570mr29539135e9.4.1772707300639; 
 Thu, 05 Mar 2026 02:41:40 -0800 (PST)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk.
 [82.69.66.36]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b03db76bsm34322545f8f.18.2026.03.05.02.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 02:41:40 -0800 (PST)
From: david.laight.linux@gmail.com
To: Johannes Zink <j.zink@pengutronix.de>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Bartosz Golaszewski <brgl@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Date: Thu,  5 Mar 2026 10:41:33 +0000
Message-Id: <20260305104133.3101-1-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Cc: David Laight <david.laight.linux@gmail.com>
Subject: [Linux-stm32] [PATCH net-next 1/1] net: stmac: actually error
	requests to change the auxiliary snapshot capture channel
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
X-Rspamd-Queue-Id: 3324620FD7A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:j.zink@pengutronix.de,m:alexandre.torgue@foss.st.com,m:alexis.lothore@bootlin.com,m:andrew+netdev@lunn.ch,m:brgl@kernel.org,m:wens@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:gatien.chevallier@foss.st.com,m:kuba@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:maxime.chevallier@bootlin.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:david.laight.linux@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[pengutronix.de,foss.st.com,bootlin.com,lunn.ch,kernel.org,davemloft.net,google.com,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com,gmail.com,redhat.com,armlinux.org.uk];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.041];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]
X-Rspamd-Action: no action

From: David Laight <david.laight.linux@gmail.com>

Commit 2ddd05d1d5ed ("net: stmmac: do not silently change auxiliary snapshot capture channel")
added code that attempted to return -EBUSY to a PTP_CLK_REQ_EXTTS
request whan a snapshot was already enabled.
However it tested bits in 'acr_value' after they had been masked off
so the check would never return an error.

Change the code so that the test actually works.
Note that when the commit message says:
    Previously in case of a PTP_CLK_REQ_EXTTS request, previously active
    auxiliary snapshot capture channels were silently dropped and the new
    channel was activated.
this only refers to two commits earlier (a few minutes earlier).
Prior to that only a single fixed snapshot channel could be enabled.

Note that the check will reject requests to re-enable the currently
enabled channel.
Plausibly the best fix is just to delete the check completely.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---

Found by a test for FIELD_GET() returning 'constant zero' from a
non-constant 'reg' value.

 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 3e30172fa129..aa17335a2031 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -222,19 +222,16 @@ static int stmmac_enable(struct ptp_clock_info *ptp,
 		write_unlock_irqrestore(&priv->ptp_lock, flags);
 		break;
 	}
-	case PTP_CLK_REQ_EXTTS: {
-		u8 channel;
-
+	case PTP_CLK_REQ_EXTTS:
 		mutex_lock(&priv->aux_ts_lock);
 		acr_value = readl(ptpaddr + PTP_ACR);
-		channel = ilog2(FIELD_GET(PTP_ACR_MASK, acr_value));
-		acr_value &= ~PTP_ACR_MASK;
 
 		if (on) {
-			if (FIELD_GET(PTP_ACR_MASK, acr_value)) {
+			u32 enabled_snapshots = FIELD_GET(PTP_ACR_MASK, acr_value);
+			if (enabled_snapshots) {
 				netdev_err(priv->dev,
 					   "Cannot enable auxiliary snapshot %d as auxiliary snapshot %d is already enabled",
-					rq->extts.index, channel);
+					rq->extts.index, ilog2(enabled_snapshots));
 				mutex_unlock(&priv->aux_ts_lock);
 				return -EBUSY;
 			}
@@ -245,6 +242,7 @@ static int stmmac_enable(struct ptp_clock_info *ptp,
 			acr_value |= PTP_ACR_ATSEN(rq->extts.index);
 			acr_value |= PTP_ACR_ATSFC;
 		} else {
+			acr_value &= ~PTP_ACR_MASK;
 			priv->plat->flags &= ~STMMAC_FLAG_EXT_SNAPSHOT_EN;
 		}
 		netdev_dbg(priv->dev, "Auxiliary Snapshot %d %s.\n",
@@ -256,7 +254,6 @@ static int stmmac_enable(struct ptp_clock_info *ptp,
 					 !(acr_value & PTP_ACR_ATSFC),
 					 10, 10000);
 		break;
-	}
 
 	default:
 		break;
-- 
2.39.5

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
