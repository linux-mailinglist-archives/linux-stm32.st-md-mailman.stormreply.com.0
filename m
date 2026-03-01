Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIleGZt8pGkkiQUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Mar 2026 18:51:23 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4501D0E2E
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Mar 2026 18:51:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 493CEC8F26B;
	Sun,  1 Mar 2026 17:51:22 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4AF0C2909A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Mar 2026 17:51:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7B4D360008;
 Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 250CEC116C6;
 Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772387479;
 bh=MjnsDPgFAH43KtWaVxLKPW5yKsdDxokV0+MlP67ycVI=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=WiU6GOj9rgexHKcbUHxhE8vGSGcuc3LMoT+0qfWE3k1XeDPfoe2yNosTKzUIWE8qS
 OJVMhlkkcYzGpu4fFUI912wLylzP9x9bO/453Mkf6FqpjcvU0Qjim7Q0DiJ1476viN
 n3tK/DGQO2Ju0bcnDQd8eTZsmaofde4gro7FE4AccOHlwhURPe2tFKt1AbA+Cq6EZs
 Q6FNqY7ecD/r3I4CUOtkZvI/ki0zVqyEtjcVcmFU5/XY9JDTUxusILlxt89uzUHea+
 1apFeptc+0dB8kVxVq+GflLJHHh3EbcdieDsLFMstRmT5E/sXRMDpi29Ec44RSPqDJ
 1UCNBSrLHOg7A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 18B00FD0070;
 Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 01 Mar 2026 18:51:14 +0100
Message-Id: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJJ8pGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0MT3eKS3LSSYlPdJBNzY0PDtKQUc2MjJaDqgqLUtMwKsEnRsbW1ACF
 15gRZAAAA
X-Change-ID: 20260214-stmfts5-b47311fbd732
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1463; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=MjnsDPgFAH43KtWaVxLKPW5yKsdDxokV0+MlP67ycVI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBppHyU634xeBikriSOlFJINC2u0T7+JKAJtJW5f
 ar1XfFgWcuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaaR8lAAKCRBgAj/E00kg
 cpAUEACYalYL4mkkSfpqeXUaJbkCmdmssv5VfFW+rERyHBJSp7TnWVxDS1+NVPPKuVWQ3V5jWO1
 95Fpt0i3orAUfQE0HYiJX5IzIKmBACWJKjT79FbHYLhjmNlHj83/xsBU9cWa5ecO15Nq9Xh3PY1
 Tu1TP0ifOnNRy+h7dKppCOvi/1Zun++l/zBq1AaFk1I0R/N6z5Ufhn/trmg0pUuOapn7uEPsmoB
 iJl3d7Rf3ONswHNMKPyGqaUH9liS8+roURXtSpkK5pj+Gtu2L2yfkcw0AZPOeubBwIiFJ/zPCX3
 K8Btrp7+3HVRe7T3lVlj6FvOPEUJzIWpjfJaE+K3WGH9H+/qUTunlhO+a/XtDgSsWmqGP5tgmst
 SfHqdqZPWROchdZzrp6oypxOPnet1oTi6i658H71ftRIgI37D+xR26G1M/hFH7/JMFHLlvEi+31
 7XOCtZTpy0351ebfBvJw+PvjhqmjUszGD7XXyRFKGt2yD2CSZi1om9gkB1AKfcha0lHeTtRiYHP
 44L3zPrYBAuHPFYbtyRSbmGSyZPANqp40p7h4Ndmk3dPrzYO3N41K22EGB95t5R4Lszq7AvhB0w
 2ZeGvRrvkF57XAInWTw2YPRp5yQUqBfhbB9gmdWIBOOBIRvlGuuEwqqPu+t2wkJC+0Uw4otw9+A
 T27k3Kd3cB6D90A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Petr Hodina <petr.hodina@protonmail.com>, David Heidelberg <david@ixit.cz>,
 linux-input@vger.kernel.org, phone-devel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 00/10] Input: support for STM FTS5
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,protonmail.com,ixit.cz,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rydberg@bitmath.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:petr.hodina@protonmail.com,m:david@ixit.cz,m:linux-input@vger.kernel.org,m:phone-devel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dmitrytorokhov@gmail.com,m:mcoquelinstm32@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[david.ixit.cz];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: ED4501D0E2E
X-Rspamd-Action: no action

Used on various phones. Minimal basic support.

Includes device-tree with possibility to enable touchscreen on Pixel 3.

Sending as RFC, as this is first, seemingly clean version which works.

What is missing:
 - firmware loading
 - switching between AP and SLPI mode (to wake up phone by touch)
 - anything above basic touch

Signed-off-by: David Heidelberg <david@ixit.cz>
---
David Heidelberg (6):
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

 .../bindings/input/touchscreen/st,stmfts.yaml      |  21 +-
 .../arm64/boot/dts/qcom/sdm845-google-blueline.dts |  21 +-
 drivers/input/touchscreen/stmfts.c                 | 595 +++++++++++++++++++--
 3 files changed, 577 insertions(+), 60 deletions(-)
---
base-commit: c6870e543e8d55d725cccfe972fbfb5798daa1af
change-id: 20260214-stmfts5-b47311fbd732

Best regards,
-- 
David Heidelberg <david@ixit.cz>


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
