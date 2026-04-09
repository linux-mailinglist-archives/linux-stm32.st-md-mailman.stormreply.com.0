Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AL3VNcUT12kSKwgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Apr 2026 04:49:41 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C6C3C5B04
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Apr 2026 04:49:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA835C87EC1;
	Thu,  9 Apr 2026 02:49:40 +0000 (UTC)
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32817C08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Apr 2026 02:49:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9084D11276A; Thu,  9 Apr 2026 04:49:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
 s=dkim; t=1775702977; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=Y/Vs+lajGNLuHVTZi9YuxQObAJW7yBV0C3O93uFX/q8=;
 b=fbd4W5wCyZNMs4RQdmQV/nWZ2NrK4FZ9nr5hlDhgtMMdsQCYm4IE3dhIv+WqKy056IZ+3m
 XRfHE9ZwPjNhSG9Kd9BNJ5kkzrqMulsMJ5Sb+pSFKp4xbG6YHzeRnwJgzY1/DuqNUTLVXD
 0JmR4dqn3ZyP+R0Cg4nlY+SC4t7k5CUVa8LVvKNWVaKslG9Vn05rwD8QhH87FnVXv1H2s2
 i2Aa5GoPBPOqJPHPVSbIkDe1nWA0+jQwLox3uKzdpFRMoBNqcydS3SSrScQ4dGuV7k1vrt
 IFCNbBEYNo/orIfYT0YIpIYSVmzkcU+MboZdVnhpjVM9AsCwH8KOFs/nqg0VoQ==
From: Marek Vasut <marex@nabladev.com>
To: dri-devel@lists.freedesktop.org
Date: Thu,  9 Apr 2026 04:48:41 +0200
Message-ID: <20260409024928.344010-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Simona Vetter <simona@ffwll.ch>, Marek Vasut <marex@nabladev.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] drm/bridge: stm_lvds: Do not fail
	atomic_check on disabled connector
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
X-Spamd-Result: default: False [6.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[nabladev.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[nabladev.com:s=dkim];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[marex@nabladev.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:simona@ffwll.ch,m:marex@nabladev.com,m:tzimmermann@suse.de,m:yannick.fertre@foss.st.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:airlied@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	DKIM_TRACE(0.00)[nabladev.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marex@nabladev.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ffwll.ch,nabladev.com,suse.de,foss.st.com,linux.intel.com,kernel.org,vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.679];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 75C6C3C5B04
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

If the connector is disabled, the new connector state has .crtc field
set to NULL and there is nothing more to validate after that point.
The .crtc field being NULL is not an error. Test for .crtc being NULL,
and if it is NULL, exit early with return 0.

This fixes a failure in suspend/resume path, where the connector is
already disabled, but .atomic_check is called, fails, returns -EINVAL
and blocks the suspend entry.

Fixes: aca1cbc1c986 ("drm/stm: lvds: add new STM32 LVDS Display Interface Transmitter driver")
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Philippe Cornu <philippe.cornu@foss.st.com>
Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 drivers/gpu/drm/stm/lvds.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c
index fe38c0984b2b5..25e2ba98f36ae 100644
--- a/drivers/gpu/drm/stm/lvds.c
+++ b/drivers/gpu/drm/stm/lvds.c
@@ -897,14 +897,14 @@ static int lvds_connector_atomic_check(struct drm_connector *connector,
 	if (!conn_state)
 		return -EINVAL;
 
+	if (!conn_state->crtc)
+		return 0;
+
 	if (list_empty(&connector->modes)) {
 		drm_dbg(connector->dev, "connector: empty modes list\n");
 		return -EINVAL;
 	}
 
-	if (!conn_state->crtc)
-		return -EINVAL;
-
 	panel_mode = list_first_entry(&connector->modes,
 				      struct drm_display_mode, head);
 
-- 
2.53.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
