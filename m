Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPCSJpx8pGl+iQUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Mar 2026 18:51:24 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 871FE1D0E6D
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Mar 2026 18:51:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37994C8F291;
	Sun,  1 Mar 2026 17:51:24 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 460F0C2909A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Mar 2026 17:51:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2670A44558;
 Sun,  1 Mar 2026 17:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA744C2BC86;
 Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772387480;
 bh=53WHfGqqSMrj0Jn3TMtTuxOcR8r6avGv76zZSnG4JUY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=JScHEKDeJnP87v0I/Jqc035udD/zNgdpn7XvcSUKDkHOnLnqofkWFC6vklzq7tO3j
 iYgqv8gJO5Yyi4nJfUKzdpNeSmxQAcXgowRgeFS2cs7rfH9gUj2/vzCh+LtnH3tBS3
 39d9lJ4gr7LtS8oicga7xrfijSFb5VnqpPWuQ9NtCCLizhdnvpqTjFSc5UkJhY6BpA
 sMxuhnyFMCh+xgEzNOHTRDw5Q29nYlobfR5xn26XgjGWOVe/7Yk2lkH2ktx4r29/Qp
 KZwxY1mFX3RZHFocQkDssXoJiKakZC+W8Cp7zi5pmNgthkDpbn42KoF/0dTZe5yn73
 ojcMtijYE5LUg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id E00C1FD0075;
 Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 01 Mar 2026 18:51:22 +0100
MIME-Version: 1.0
Message-Id: <20260301-stmfts5-v1-8-22c458b9ac68@ixit.cz>
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
In-Reply-To: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=hq9RJ0MPDH3qjbBs4V4v4YyIoe73PSNk1u1yb638HiY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBppHyVCoxRU7IViUqu//ep20pNs3plY0LsjQwgQ
 lDE67NHdlWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaaR8lQAKCRBgAj/E00kg
 co93D/9PCMgQHcgoRm260zPygFP00u9m2DCOEZSMzuD4dRL4nBeebVnK7tWlZOCUgc1Tk0pyxf0
 QvYfnMkKFpTQwqj+S+Tje/BEeqI2XP77/OW8qTx4pVab7h88y1lo1z1G/T1nGqfnedrn3iQFpG3
 7Unluofdg94QhqjPVx18olmR6T3OuY467B6j2fK5UjZMkv84ndIJF5AUFRiZgNPffoWAWO8v77F
 foYfGO4Biy1VtPIkyozYea9ZDTsO5z2j8Y3x52Eet3bUITLySIvC15ocbPaxT6qroGf9JICPAz6
 NxlnqhAKnBNK9V4sGzHQ/o8aRPoIs2P8svd4WjJyA3eu+CEy1ILbJQ5RTc9Qu2HULTDdtr8wMKo
 3OmhYBpX0bqHjb2HRN3wX7bFVwENH46wM+hAPmhzQUcY0nAywkME7d9GvdcH7SYt/Dd0G5vUz5c
 6XtPfKED2ok1y4wvFZJ9BdnxrK48bXVqUBAp9L4CpwjKtaDu4uRRBtyVZXNUjATH1+W/qmrkjYT
 8K35YL7wyplFX369igIdXYxrGAiEGJhOhE2BQgYikAw/xj1G9D2yixFq+NhH++Ypke1yixmXVVf
 dcvXvW8T3dq8/TUlD8FqLdqHLxOgceK/qlcIqz68odYJdJCKkTjSgpoTp+AbVMDmrHnQZfqQKFA
 hgcL0puDUAOlU4w==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Petr Hodina <petr.hodina@protonmail.com>, David Heidelberg <david@ixit.cz>,
 linux-input@vger.kernel.org, phone-devel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 08/10] dt-bindings: input: touchscreen: st,
 stmfts: Introduce STM FTS5
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
Reply-To: david@ixit.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,protonmail.com,ixit.cz,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rydberg@bitmath.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:petr.hodina@protonmail.com,m:david@ixit.cz,m:linux-input@vger.kernel.org,m:phone-devel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dmitrytorokhov@gmail.com,m:mcoquelinstm32@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[david.ixit.cz];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 871FE1D0E6D
X-Rspamd-Action: no action

From: David Heidelberg <david@ixit.cz>

Introduce more recent STM FTS5 touchscreen support.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../bindings/input/touchscreen/st,stmfts.yaml           | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
index 64c4f24ea3dd0..329d89977bdbc 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
@@ -19,7 +19,9 @@ allOf:
 
 properties:
   compatible:
-    const: st,stmfts
+    enum:
+      - st,stmfts
+      - st,stmfts5
 
   reg:
     maxItems: 1
@@ -53,6 +55,19 @@ required:
 
 unevaluatedProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: st,stmfts5
+    then:
+      properties:
+        switch-gpio:
+          description: Switch between SLPI and AP mode.
+
+      required:
+        - switch-gpio
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>

-- 
2.51.0


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
