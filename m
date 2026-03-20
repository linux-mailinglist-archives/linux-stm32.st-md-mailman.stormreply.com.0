Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEC4JS8KvWkO5gIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Mar 2026 09:49:51 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAEF2D778A
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Mar 2026 09:49:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 280B5C87EBD;
	Fri, 20 Mar 2026 08:49:51 +0000 (UTC)
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com
 [95.215.58.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C358C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Mar 2026 08:49:49 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1773996588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=izBpg3f4YsX+0N/YH8T17Ma2BiNyBCvm7Snr6+pnP1s=;
 b=a6B8WhbCKhlkLZh25B+fJjUtDE+V8ipFSZHjbFSa9r9aV1THdd8ZfgOXQEW/TkU81tEbTK
 nUiuJzojPI6m77qrVliMsB6Gv6mxGyT+xhYB8K8Ct+mdxq8v/1wDKUmYjpO03K9fzcmQD1
 /PGidZXC+LvLp30mGIaS9Be1fSQ8GpE=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Colin Ian King <colin.i.king@gmail.com>, Kees Cook <kees@kernel.org>,
 =?UTF-8?q?Maxime=20M=C3=A9r=C3=A9?= <maxime.mere@foss.st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Thorsten Blum <thorsten.blum@linux.dev>
Date: Fri, 20 Mar 2026 09:49:14 +0100
Message-ID: <20260320084914.7180-4-thorsten.blum@linux.dev>
In-Reply-To: <20260320084914.7180-3-thorsten.blum@linux.dev>
References: <20260320084914.7180-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158; i=thorsten.blum@linux.dev;
 h=from:subject; bh=fS46rTjiGgSzi3MWcwcXeXN0mlGqe7jt3cqh8IomgFk=;
 b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJl7uYRvdnaf6P13MGC5mZTXtuU8Nc1+4ffmGp9k0f7Ep
 cxpcfF0RykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAExkmRAjw1edX79VZN9LTwt8
 PNfnxL534ucuMNledLWqFPI+sV7nuD0jw76v8x3OP13QstZjSl2moWvhoVAX90W8d/dcffy1vG0
 yKxcA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp;
 fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
X-Migadu-Flow: FLOW_OUT
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 2/2] crypto: stm32 - use
	list_first_entry_or_null to simplify cryp_find_dev
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
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[linux.dev:s=key1];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linux.dev : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,gmail.com,foss.st.com,kernel.org,linux.intel.com,linux.dev];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:colin.i.king@gmail.com,m:kees@kernel.org,m:maxime.mere@foss.st.com,m:sakari.ailus@linux.intel.com,m:thorsten.blum@linux.dev,m:linux-kernel@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:mcoquelinstm32@gmail.com,m:coliniking@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[thorsten.blum@linux.dev,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.171];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7BAEF2D778A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use list_first_entry_or_null() to simplify stm32_cryp_find_dev() and
remove the now-unused local variable 'struct stm32_cryp *tmp'.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/stm32/stm32-cryp.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-cryp.c b/drivers/crypto/stm32/stm32-cryp.c
index 3c9b3f679461..b79877099942 100644
--- a/drivers/crypto/stm32/stm32-cryp.c
+++ b/drivers/crypto/stm32/stm32-cryp.c
@@ -361,19 +361,13 @@ static int stm32_cryp_it_start(struct stm32_cryp *cryp);
 
 static struct stm32_cryp *stm32_cryp_find_dev(struct stm32_cryp_ctx *ctx)
 {
-	struct stm32_cryp *tmp, *cryp = NULL;
+	struct stm32_cryp *cryp;
 
 	spin_lock_bh(&cryp_list.lock);
-	if (!ctx->cryp) {
-		list_for_each_entry(tmp, &cryp_list.dev_list, list) {
-			cryp = tmp;
-			break;
-		}
-		ctx->cryp = cryp;
-	} else {
-		cryp = ctx->cryp;
-	}
-
+	if (!ctx->cryp)
+		ctx->cryp = list_first_entry_or_null(&cryp_list.dev_list,
+						     struct stm32_cryp, list);
+	cryp = ctx->cryp;
 	spin_unlock_bh(&cryp_list.lock);
 
 	return cryp;
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
