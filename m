Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l4e/NSMGRWoS5QoAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Jul 2026 14:20:51 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B64816ED315
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Jul 2026 14:20:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=collabora.com header.s=mail header.b=Z0SLQdhS;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=collabora.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74276C8F265;
	Wed,  1 Jul 2026 12:20:51 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89866C8F272
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Jul 2026 12:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1782908449;
 bh=wgHgcm8xmrhSZqBKw4j7YQgDPCGbEX4RDBXbqihHAaY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z0SLQdhSwyJDbeiKvQ+HrIpTUxzjvAh0AcbNdueDIZSowjEUHOYjSYGxglQmEumKU
 KPSvzcVFxC0eFa6W+31sk7e3oWPUQM5zsYoh+h7tLjjxf95WIyt6utg/hWq9YmjqFG
 QvCNvCCYWffKv8ESM+vDbZtK+WWSCC5Vedq3t5QMNysXlxERskkI4Y7qnhpLaJOEiO
 ePcbSt60kXV72W4i39Q54yZQkqBXHfqBwAX37QLO5Jx8zSjjnDEEjDHb8UDD5HLiaq
 /KTLPKC7aMMka9VzSWl3/TYLfAL1P/oBdEO5/CNnzufbLu4RsluuEFixa382hfSP+8
 zyBpU2nwIjF6w==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 25B3817E0CF4;
 Wed,  1 Jul 2026 14:20:48 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Date: Wed,  1 Jul 2026 14:20:39 +0200
Message-ID: <20260701122043.19612-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122043.19612-1-angelogioacchino.delregno@collabora.com>
References: <20260701122043.19612-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Cc: justin.yeh@mediatek.com, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, airlied@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, simona@ffwll.ch, robh@kernel.org,
 ck.hu@mediatek.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 jitao.shi@mediatek.com, andi.shyti@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 mcoquelin.stm32@gmail.com, tzimmermann@suse.de, linux-kernel@vger.kernel.org,
 p.zabel@pengutronix.de, jason-jh.lin@mediatek.com, djakov@kernel.org,
 krzk+dt@kernel.org
Subject: [Linux-stm32] [PATCH 2/6] dt-bindings: soc: mediatek: mutex: Allow
	#trigger-source-cells
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[collabora.com:s=mail];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[collabora.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:chunkuang.hu@kernel.org,m:justin.yeh@mediatek.com,m:dri-devel@lists.freedesktop.org,m:kernel@collabora.com,m:airlied@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:simona@ffwll.ch,m:robh@kernel.org,m:ck.hu@mediatek.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:jitao.shi@mediatek.com,m:andi.shyti@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:broonie@kernel.org,m:linux-mediatek@lists.infradead.org,m:matthias.bgg@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:mcoquelin.stm32@gmail.com,m:tzimmermann@suse.de,m:linux-kernel@vger.kernel.org,m:p.zabel@pengutronix.de,m:jason-jh.lin@mediatek.com,m:djakov@kernel.org,m:krzk+dt@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[mediatek.com,lists.freedesktop.org,collabora.com,gmail.com,st-md-mailman.stormreply.com,ffwll.ch,kernel.org,vger.kernel.org,linux.intel.com,lists.infradead.org,suse.de,pengutronix.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[angelogioacchino.delregno@collabora.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:mid,collabora.com:from_mime,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B64816ED315

This hardware controls trigger sources, and there's even a generic
binding just for that: allow #trigger-source-cells in MuteX, so
that this is allowed to provide triggers to external HW.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml      | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
index 1ba086ad749d..429ea149068e 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
@@ -57,6 +57,9 @@ properties:
     items:
       - description: MUTEX Clock
 
+  '#trigger-source-cells':
+    const: 1
+
   mediatek,gce-events:
     description:
       The event id which is mapping to the specific hardware event signal
@@ -119,6 +122,7 @@ examples:
             interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
             power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
             clocks = <&mmsys CLK_MM_MUTEX_32K>;
+            #trigger-source-cells = <1>;
             mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
                                   <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
         };
-- 
2.54.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
