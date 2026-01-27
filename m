Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJx4NocAeWmOuQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 19:14:31 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B5D98DD9
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 19:14:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12D05C555BE;
	Tue, 27 Jan 2026 18:14:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE4D3C01FBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 18:14:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DF1D1515;
 Tue, 27 Jan 2026 10:14:22 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 393233F5CA;
 Tue, 27 Jan 2026 10:14:27 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 27 Jan 2026 18:14:13 +0000
MIME-Version: 1.0
Message-Id: <20260127-fix_stm_kconfig-v2-1-3c067e00f82e@arm.com>
X-B4-Tracking: v=1; b=H4sIAHQAeWkC/2WNywrCMBREf6XctZHeNA905X9IKTEm7UWSSFKKU
 vrvxoIrl2eYObNCcZlcgXOzQnYLFUqxAj80YCcTR8foXhl4yyVyVMzTayhzGB42RU8jM5p70Vq
 tkFuoq2d2tbIbr33licqc8ns/WPCb/lz6z7UgQyY79LdOaSHF6WJyONoUoN+27QNMEZ3OrAAAA
 A==
X-Change-ID: 20251216-fix_stm_kconfig-a72f40c7612c
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769537667; l=2151;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=xrqHMLh+h7bTnHzxFrucYIU6jvgcxjDytBv9grxjLtw=;
 b=F4S1iXCK8hpgfWjS2PzpQd37/ljfUsDbMcr8LWKuuBFjmjd4luLA4GeklShfzjqFmkoMKgL1i
 SEZV/U6rAksB4UkFHCl9mmXP7RTPVwvzI5GvrWFZ7KcwaY8Ah63n3Fj
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
Cc: Leo Yan <leo.yan@arm.com>, coresight@lists.linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2] stm class: Fix Kconfig symbols
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
X-Spamd-Result: default: False [2.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.shishkin@linux.intel.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:gregkh@linuxfoundation.org,m:james.clark@linaro.org,m:leo.yan@arm.com,m:coresight@lists.linaro.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[leo.yan@arm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,foss.st.com,linuxfoundation.org,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leo.yan@arm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 63B5D98DD9
X-Rspamd-Action: no action

Kconfig symbols must not include the CONFIG_ prefix.  Remove the CONFIG_
prefix for default values to work.

The STM_PROTO_SYS_T config is selected by default when STM is enabled.
However, its description currently says "If you don't know what this is,
say N," which contradicts the default behavior.  Update the description
to say "Y" to align with the default setting.

Fixes: a02509f301c6 ("stm class: Factor out default framing protocol")
Fixes: d69d5e83110f ("stm class: Add MIPI SyS-T protocol support")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Changes in v2:
- Updated STM_PROTO_BASIC description to align with default selection
  (James).
- Link to v1: https://lore.kernel.org/r/20251217-fix_stm_kconfig-v1-1-531fb3674549@arm.com
---
 drivers/hwtracing/stm/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/stm/Kconfig b/drivers/hwtracing/stm/Kconfig
index eda6b11d40a1f9ab49a1ec1e6faae8ee178c5ed3..8ab079785189052945521e9b0a93a0d458de37e0 100644
--- a/drivers/hwtracing/stm/Kconfig
+++ b/drivers/hwtracing/stm/Kconfig
@@ -13,7 +13,7 @@ if STM
 
 config STM_PROTO_BASIC
 	tristate "Basic STM framing protocol driver"
-	default CONFIG_STM
+	default STM
 	help
 	  This is a simple framing protocol for sending data over STM
 	  devices. This was the protocol that the STM framework used
@@ -28,7 +28,7 @@ config STM_PROTO_BASIC
 
 config STM_PROTO_SYS_T
 	tristate "MIPI SyS-T STM framing protocol driver"
-	default CONFIG_STM
+	default STM
 	help
 	  This is an implementation of MIPI SyS-T protocol to be used
 	  over the STP transport. In addition to the data payload, it
@@ -38,7 +38,7 @@ config STM_PROTO_SYS_T
 	  The receiving side must be able to decode this protocol in
 	  addition to the MIPI STP, in order to extract the data.
 
-	  If you don't know what this is, say N.
+	  If you don't know what this is, say Y.
 
 config STM_DUMMY
 	tristate "Dummy STM driver"

---
base-commit: fcb70a56f4d81450114034b2c61f48ce7444a0e2
change-id: 20251216-fix_stm_kconfig-a72f40c7612c

Best regards,
-- 
Leo Yan <leo.yan@arm.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
