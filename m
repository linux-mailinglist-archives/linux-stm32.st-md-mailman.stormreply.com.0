Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7jnDNCUGRWoU5QoAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Jul 2026 14:20:53 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B98306ED31D
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Jul 2026 14:20:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=collabora.com header.s=mail header.b=dHDcqsed;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=collabora.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87052C8F265;
	Wed,  1 Jul 2026 12:20:53 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B1B6C8F272
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Jul 2026 12:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1782908450;
 bh=D8xSYkpIyl50Azpbz1Ovm3/ITMW8MoCD/TiEbkzX/jw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dHDcqsedFd/kZVRR/4ve7GtOgmycdE7Op4ya+bnevyvQ4lEMNiPk8jVTkC7ZgK2dB
 Qf6PS8wvdQMpISu4N7Kx8hUhWl3ngEECh95NDu7LdsRdiynLKL0Qfx0aOrQxGVv1T+
 zg5UmZRT7D0qozy4TVFPr+tGn8uHAAmUH9mzCVCZNVeAok8t+7/XgGIAXdNStFFHWs
 DKKPwvTdEDXCGzP/ZUM0aMow6xmbg0NGKwHR37z9LFQ70L5HMa/guK9XMTJb97dGJB
 FHcJczU+HF6PBSSTlbF4KoDX3npb9AWdoulnD/x3pxJEVO98UvYOEHRNgCPqNxQfra
 RDfs0mhzLLisQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 54A5817E0CA2;
 Wed,  1 Jul 2026 14:20:49 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Date: Wed,  1 Jul 2026 14:20:40 +0200
Message-ID: <20260701122043.19612-4-angelogioacchino.delregno@collabora.com>
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
Subject: [Linux-stm32] [PATCH 3/6] dt-bindings: display: mediatek: Allow
	trigger-sources on relevant HW
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,collabora.com:email,collabora.com:mid,collabora.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B98306ED31D

Most of the MediaTek Display Controller hardware sub-IPs need a
specific (and reserved to them) MuteX trigger.

Since now MuteX is a trigger source, allow specifying trigger
sources in all of the display IPs that support one.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,aal.yaml     | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml   | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,color.yaml   | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,dither.yaml  | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,dp.yaml      | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml     | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,dsc.yaml     | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,dsi.yaml     | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,ethdr.yaml   | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml   | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,merge.yaml   | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,od.yaml      | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml  | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml     | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,padding.yaml | 3 +++
 .../bindings/display/mediatek/mediatek,postmask.yaml           | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml    | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,split.yaml   | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,ufoe.yaml    | 3 +++
 .../devicetree/bindings/display/mediatek/mediatek,wdma.yaml    | 3 +++
 20 files changed, 60 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index 4bbea72b292a..41d60a3d8007 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -55,6 +55,9 @@ properties:
       the power controller specified by phandle. See
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
+  trigger-sources:
+    maxItems: 1
+
   clocks:
     items:
       - description: AAL Clock
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index 5c5068128d0c..e148aa57b1b9 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -47,6 +47,9 @@ properties:
       the power controller specified by phandle. See
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
+  trigger-sources:
+    maxItems: 1
+
   clocks:
     items:
       - description: CCORR Clock
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index 5564f4063317..7c0985d0f9ea 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -57,6 +57,9 @@ properties:
       the power controller specified by phandle. See
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
+  trigger-sources:
+    maxItems: 1
+
   clocks:
     items:
       - description: COLOR Clock
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index 891c95be15b9..85a1746965b9 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -45,6 +45,9 @@ properties:
       the power controller specified by phandle. See
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
+  trigger-sources:
+    maxItems: 1
+
   clocks:
     items:
       - description: DITHER Clock
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
index 3a752a99949a..d8cfac0326ba 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -42,6 +42,9 @@ properties:
   power-domains:
     maxItems: 1
 
+  trigger-sources:
+    maxItems: 1
+
   interrupts:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index eb4f276e8dc4..f5be6c1e4b0e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -109,6 +109,9 @@ properties:
     items:
       - const: dpi
 
+  trigger-sources:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
index c8b3e86943e4..4863db6aba6e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
@@ -43,6 +43,9 @@ properties:
       the power controller specified by phandle. See
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
+  trigger-sources:
+    maxItems: 1
+
   mediatek,gce-client-reg:
     description:
       The register of client driver can be configured by gce with 4 arguments
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
index b5cdfe0eaca4..a9793b274070 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -73,6 +73,9 @@ properties:
     items:
       - const: dphy
 
+  trigger-sources:
+    maxItems: 1
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
index 98db47894eeb..89370690ee71 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
@@ -100,6 +100,9 @@ properties:
       - const: gfx_fe1_async
       - const: vdo_be_async
 
+  trigger-sources:
+    maxItems: 1
+
   mediatek,gce-client-reg:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     minItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index ec1054bb06d4..4d06085e6014 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -54,6 +54,9 @@ properties:
       the power controller specified by phandle. See
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
+  trigger-sources:
+    maxItems: 1
+
   clocks:
     items:
       - description: GAMMA Clock
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
index 3798a25402d3..656df51335b5 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
@@ -47,6 +47,9 @@ properties:
       the power controller specified by phandle. See
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
+  trigger-sources:
+    maxItems: 1
+
   clocks:
     minItems: 1
     maxItems: 2
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
index 930c088a722a..c912ae2493c3 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
@@ -60,6 +60,9 @@ properties:
       - port@0
       - port@1
 
+  trigger-sources:
+    maxItems: 1
+
   mediatek,gce-client-reg:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: describes how to locate the GCE client register
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
index ac0d924a451b..326223b36112 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
@@ -40,6 +40,9 @@ properties:
       the power controller specified by phandle. See
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
+  trigger-sources:
+    maxItems: 1
+
   clocks:
     items:
       - description: OVL-2L Clock
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index 4df5c7b410c6..dc200068d617 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -61,6 +61,9 @@ properties:
       the power controller specified by phandle. See
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
+  trigger-sources:
+    maxItems: 1
+
   clocks:
     items:
       - description: OVL Clock
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
index 86787866ced0..9dac0319dd60 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
@@ -34,6 +34,9 @@ properties:
   power-domains:
     maxItems: 1
 
+  trigger-sources:
+    maxItems: 1
+
   clocks:
     items:
       - description: Padding's clocks
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
index fb6fe4742624..caef5194371f 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
@@ -40,6 +40,9 @@ properties:
       the power controller specified by phandle. See
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
+  trigger-sources:
+    maxItems: 1
+
   clocks:
     items:
       - description: POSTMASK Clock
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index d914c06640df..13deb7c87ee6 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -60,6 +60,9 @@ properties:
       the power controller specified by phandle. See
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
+  trigger-sources:
+    maxItems: 1
+
   clocks:
     items:
       - description: RDMA Clock
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
index 4b6ff546757e..7307a50fa30f 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
@@ -40,6 +40,9 @@ properties:
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
     maxItems: 1
 
+  trigger-sources:
+    maxItems: 1
+
   mediatek,gce-client-reg:
     description:
       The register of display function block to be set by gce. There are 4 arguments,
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
index 036a66ed42e7..31e0863dd815 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
@@ -39,6 +39,9 @@ properties:
       the power controller specified by phandle. See
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
+  trigger-sources:
+    maxItems: 1
+
   clocks:
     items:
       - description: UFOe Clock
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
index c3ed867d058d..3e6b346baa11 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
@@ -45,6 +45,9 @@ properties:
       the power controller specified by phandle. See
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
+  trigger-sources:
+    maxItems: 1
+
   clocks:
     items:
       - description: WDMA Clock
-- 
2.54.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
