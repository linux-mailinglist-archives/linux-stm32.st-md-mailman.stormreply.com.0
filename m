Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id J3g5DJrT1mkpJAgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Apr 2026 00:15:54 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A76E93C44FD
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Apr 2026 00:15:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5075C87EBC;
	Wed,  8 Apr 2026 22:15:52 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C086C1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Apr 2026 22:15:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E69A8600AD;
 Wed,  8 Apr 2026 22:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9064DC19421;
 Wed,  8 Apr 2026 22:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1775686550;
 bh=KEpr4zJFKU/KOf0lTdcERja2Oc3rB1xw26v3jW80j10=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=XOZut4nQBQJ2CIRnCGrF1f+AW8dfr1zSluVBXW2d7pVbH401hUsz3rsirs2g4mX5F
 KgCOg5H6xPiaTH4hKVuJLS/2USqCzUitTI6Ikow4DQjUCXSr3zc9xibS9S9w4jbkSG
 KYhAwU4uIcHtwMs9oNY8sT83/RvDoMKUjIhsVlXTFOptX1pKF4P2h/xDOy2ohUi1xL
 eLKRsMoz8RGrFPlGjFdk0rxUD8OlLIRP9We1IjrVT9hxL1JuCLVJMSsHjhNPJ1Octv
 D+Uqh094QDn9NLkQzNIl13rgjqvxi1yuBk+ntGgQ/rPNnaYmOWM75tJV1qbu7nl7qh
 0PQcPMrXh4VxQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 85C9010FC453;
 Wed,  8 Apr 2026 22:15:50 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 09 Apr 2026 00:15:43 +0200
Message-Id: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAI/T1mkC/1XMTQ7CIBCG4asY1mJggNK68h7GRfmzLGwNEFJte
 ndpTWxdfpN53glFG7yN6HyYULDZRz/0ZfDjAemu7e8We1M2AgIVAcpxTA+XosCKS0apU0YyQOX
 7Gazz41q63srufExDeK3hTJfrt8EI/TUyxQQDaC5q1bS6qi9+9Omk32gpZNgpKjYFRUmidM2sb
 URD/xXbFCdsU6woYVpZ1doZIDs1z/MHAYjuawgBAAA=
X-Change-ID: 20260214-stmfts5-b47311fbd732
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2723; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=KEpr4zJFKU/KOf0lTdcERja2Oc3rB1xw26v3jW80j10=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp1tORj8Tz8uq8GTC1dEqjNeUZc9jKY8+OcF1HE
 gWaiIeQF1OJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCadbTkQAKCRBgAj/E00kg
 csZwEACUcK4e6blbpGOxU1nC7RkaviK2zL+5IB8QV5bmROBL3UOw8GzYJr9xKE5FDAjx08xsloV
 IeFAmw9cRqlVnSXFIp7wP6FsB/Z4n2mb/5aZxmh4loULzdzneXGEYm5Hu60nyMhpMc66WOZ+UkR
 sGfsfVaoQrJsL4SNeJItTYoayRwhYKcirluxBbsNxZpZ6/JHa61bbY9j3yLkxca+IHS+Vj+q+fi
 weAxo+naTXefK/v8EbRgrQXWv/TIFaZ8Mqi3tBqNEQVOdZ9rP6x/CsV3ySR2DudA7Uj6KaJwtV1
 S2/2pIYv3YpWBcknNuBThDLS8ZgIBpumUY1roXksBlFvAVGVxXiBTQ51M0CqFWpffSQYreeGpAo
 IG4M9uScArO91G6pWqIJRJkCM1MPZ9MpJbiNBBrr1+IH2e8a6B3d/ccJYKwk4D0noOXYqA2Ob2r
 qaqve6GK2KwWTHEWab3PBQg3R52v6o5gaLmX1B3QIS2au02qr9bwSP/KVJjC3CGJlESfsfm4KtL
 KnzMD6AwQK2rTdXiMQp2lL/oIa8HaJOZ59GELbUhgTYHK0zsjSsScjkwFLjAHUjx42QxHRxOJpo
 QCERx6t6yPC6eR1lLR3FewECmpwTWwxTYQBUtLlTrE6m3Q9L5uDJKgsbGEJ1aPgWnD8PNhdYmHB
 AXhpNMpFLZBpAxg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Petr Hodina <petr.hodina@protonmail.com>, David Heidelberg <david@ixit.cz>,
 linux-input@vger.kernel.org, phone-devel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 00/11] Input: support for STM FTS5
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rydberg@bitmath.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:petr.hodina@protonmail.com,m:david@ixit.cz,m:linux-input@vger.kernel.org,m:phone-devel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dmitrytorokhov@gmail.com,m:mcoquelinstm32@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[david.ixit.cz];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,kernel.org,protonmail.com,ixit.cz,st-md-mailman.stormreply.com,lists.infradead.org];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.603];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,ixit.cz:replyto,ixit.cz:mid]
X-Rspamd-Queue-Id: A76E93C44FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Used on various phones. Minimal viable driver.

Includes device-tree enabling touchscreen on Pixel 3.

What is missing:
 - switching between AP and SLPI mode (to be able to wake up phone by touch)
 - firmware loading
 - anything above basic touch

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v4:
- Wrap everything below enabling the supplies into stmfts_configure()
  to avoid bunch of gotos to power off on error (Dmitry T.)
- Finished chip specific ops and removed is_fts5. (Dmitry T.)
- Link to v3: https://lore.kernel.org/r/20260403-stmfts5-v3-0-5da768cfd201@ixit.cz

Changes in v3:
- s/touchscreen_pins/touchscreen_irq_n. (Konrad)
- Use interrupts-extended. (Konrad)
- Fixed rebase conflict against 8665ceb926ec ("Input: stmfts - use guard notation when acquiring mutex")
- Rename switch-gpios to mode-switch-gpios.
- Do not define properties in if:then: branches. (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20260315-stmfts5-v2-0-70bc83ee9591@ixit.cz

Changes in v2:
- Fix typo in the binding s/switch-gpio/switch-gpios/.
- Deduplacate allOf. (Rob yamllint)
- Add missing S-off-by. (Dmitry B.)
- Dropped irq-gpios as it's not needed. (Konrad)
- Correct x and y touchscreen area size. (Konrad)
- Correct reset introduction commit description. (Krzysztof)
- Partially implemented chip specific ops. (Dmitry T.)
- Separeted license naming cleanup into separate commit (Dmitry T.)
- Link to v1: https://lore.kernel.org/r/20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz

---
David Heidelberg (7):
      Input: stmfts - Fix the MODULE_LICENSE() string
      Input: stmfts - Use dev struct directly
      Input: stmfts - Switch to devm_regulator_bulk_get_const
      Input: stmfts - abstract reading information from the firmware
      Input: stmfts - disable regulators when power on fails
      dt-bindings: input: touchscreen: st,stmfts: Introduce reset GPIO
      dt-bindings: input: touchscreen: st,stmfts: Introduce STM FTS5

Petr Hodina (4):
      Input: stmfts - use client to make future code cleaner
      Input: stmfts - add optional reset GPIO support
      Input: stmfts - support FTS5
      arm64: dts: qcom: sdm845-google: Add STM FTS touchscreen support

 .../bindings/input/touchscreen/st,stmfts.yaml      |  19 +-
 .../arm64/boot/dts/qcom/sdm845-google-blueline.dts |  19 +-
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi |   2 +-
 drivers/input/touchscreen/stmfts.c                 | 601 +++++++++++++++++++--
 4 files changed, 580 insertions(+), 61 deletions(-)
---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260214-stmfts5-b47311fbd732

Best regards,
-- 
David Heidelberg <david@ixit.cz>


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
