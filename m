Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCXsDgkAt2mbLQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 15 Mar 2026 19:52:57 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BA52920A5
	for <lists+linux-stm32@lfdr.de>; Sun, 15 Mar 2026 19:52:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEC1EC8F286;
	Sun, 15 Mar 2026 18:52:56 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18FD4C8F261
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Mar 2026 18:52:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E0A5B61855;
 Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A998C2BCC4;
 Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773600773;
 bh=6HW5C0SfqEBAxDJ9xWy7Rnz4x8QeHdPYr0Wv2/Kj0hE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=ZZWrgbzxJFKKYMi4JI1C/slZsljv3rdIuPa88CSrA+9wkYKUBRJ03CAdE26ve0i/I
 xx8eZhZ8pqaMeiSCJIC1CVfNvnJC57N4b1ixfseUoIOUOAP/Eq43myk6be24uI+XGA
 CKhB/RrX1zO02jvpA1wRO9xeVHRd9UXNhgBoJFXA054BjZL57xNGQZotANPO2bUuUX
 gd6gJ6q4AcReYCBosG5iD/5Ov+NrGiZnFhCAZTphr1S8CgoqmBB5sNhYLHk+IVsPl7
 ccEHn1ffIBI+aaXvN7KK13kXHCFshRoeOmTmroOEAZGYobFgJ24p+1OppYld0DA070
 F4THZ27BgUhQA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 8F399F30282;
 Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 15 Mar 2026 19:52:45 +0100
MIME-Version: 1.0
Message-Id: <20260315-stmfts5-v2-9-70bc83ee9591@ixit.cz>
References: <20260315-stmfts5-v2-0-70bc83ee9591@ixit.cz>
In-Reply-To: <20260315-stmfts5-v2-0-70bc83ee9591@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1055; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=h9cECjq5ixf532xdPZjxPL80kJ11WrP4Xf5V/9RKA7Q=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBptv/6lnDIMavIrwcYtj0lh0pCOWzu3RevBl4UZ
 /fzW91xkmuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCabb/+gAKCRBgAj/E00kg
 cvsJD/0Qp9xOpywUTHGKd9kmlHiS+une24wyAVlUwl4wIPH99T9Kz0GpdLiNi5iLoXZ+IVDMn55
 3EgVHXRuT0jTAb9x1gavYNq7Y6xjMhL1Nwy/kW4ihm8F6n60RjJUWlHCUK5hjtUgk3zdIcoO2Zi
 2uA09vJvOAyTyKLYUO6TwSab9cwEm3R5VqtJ1JMGCFMtUKGYY6QoThCx+B1Y0DnDE65L8WrsG+R
 nhmbFZFT/J6hOz/e4K4hkwA2ZjCp2t/2UrwTBwEXH09LT/KUV/uoWdRoC4dxgFZVsi57+i+ogRf
 Wknku5jEaEjXRJxk0EwP5rHkfmcdE0wbIQV1LUnlafnGEAEt2JW9aacE1mT7qBfdjCECl8xYPxZ
 V4nBwCsNrJEiOj8ouYuWEFcnJ3pZU10+SUWn7I5eudR18D8RUgC0QhzR5p/ufmOBtz5jLja3xbL
 ie1Hkv59fizlA3mST2/S2O3THCSS9NiIXznmHNeYhoIyHaz9Pz4Ufo0Bio3OM0tWs7d5rMIwUrr
 YvbspcwL2xe4Cun+3BAXEy/CnVbKDt4aawnEsp7AN6BItGL7e99k7t0tX9KoJVMsynqt2tResa7
 NP3lxa1bLZ2sRhDT0S/ipLJEnWvWf8pfTug4OXPzyNR5XELfhfgXemKqHiy/vjM0hxflN6DFsCw
 NiiShg53lFQ9MXQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Petr Hodina <petr.hodina@protonmail.com>, David Heidelberg <david@ixit.cz>,
 linux-input@vger.kernel.org, phone-devel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH WIP v2 09/11] dt-bindings: input: touchscreen:
 st, stmfts: Introduce STM FTS5
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
X-Spamd-Result: default: False [4.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[david.ixit.cz];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rydberg@bitmath.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:petr.hodina@protonmail.com,m:david@ixit.cz,m:linux-input@vger.kernel.org,m:phone-devel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dmitrytorokhov@gmail.com,m:mcoquelinstm32@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,protonmail.com,ixit.cz,st-md-mailman.stormreply.com,lists.infradead.org];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.977];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	HAS_REPLYTO(0.00)[david@ixit.cz]
X-Rspamd-Queue-Id: 25BA52920A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

Introduce more recent STM FTS5 touchscreen support.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../devicetree/bindings/input/touchscreen/st,stmfts.yaml  | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
index 64c4f24ea3dd0..66255893a99fb 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
@@ -16,10 +16,23 @@ description:
 
 allOf:
   - $ref: touchscreen.yaml#
+  - if:
+      properties:
+        compatible:
+          const: st,stmfts5
+    then:
+      properties:
+        switch-gpios:
+          description: Switch between SLPI and AP mode.
+
+      required:
+        - switch-gpios
 
 properties:
   compatible:
-    const: st,stmfts
+    enum:
+      - st,stmfts
+      - st,stmfts5
 
   reg:
     maxItems: 1

-- 
2.53.0


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
