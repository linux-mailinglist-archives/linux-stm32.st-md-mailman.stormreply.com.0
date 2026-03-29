Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFGvOWUPymmL4gUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Mar 2026 07:51:33 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F57355BC6
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Mar 2026 07:51:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20F97C8F29B;
	Mon, 30 Mar 2026 05:51:33 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0F8EC87ECD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Mar 2026 11:14:12 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-8297e0b27e5so1844506b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Mar 2026 04:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774782851; x=1775387651;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QVjoQBkXiGI1oWD/lbihuPbS4PWSjwfos2KaFS/Ehss=;
 b=lzrh5m9VgGyq8ooN9xbWzzMY4J2KTOorCuhzJXoCFskuEvjqHjD/Qgjhryu5+ai4gP
 SQp5cwV+wklPkv9IrhsSvcN/xmPFuyCkxX70SuNJtHVatBbrFmuYX3bAlYAR68+MPmeH
 frOk56BJQ9DbqkGCevPJLDcMbFWSAmgFHsj52ayjK6gDakxrzKdSF3+LcrMuyV23WFmF
 O3Pp00SCOrZuDx39Dqxn0YFy0FvfO+RehhLBfJMNQxvKMptUYJ80ekraeWu3vDDOdaSg
 bPhJ5pGK0HEz73yVd5h0YsSUxkyma3fROHfUD3s/7gffuQCkd8P4TM91wCMmdDJvQEuy
 qkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774782851; x=1775387651;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QVjoQBkXiGI1oWD/lbihuPbS4PWSjwfos2KaFS/Ehss=;
 b=VQGgYbcpzTMzoEeN8kUx35hXJR+iw7I3uAdtNRGdKgWMcY7UNr0kt54kS5MtmK1FcD
 pRMVSBoGsl2m9vyXUWQgbmRq2nZSdE0y7PLC/ykKeAtsUojIpWuLuqyxDLOaP6ckoct5
 pMxRXFCCN8YaIg0VuIFy3OCbvci07QYkywQ1wL+6+f3bK3DNAc1KcOkh8fE1t6EzqIys
 eyDq3nkr3DyRc6TTPiFHjFFLqForVrPSLQky6W9rijJD4R45iPaXQnkzPp5YZxzBxDce
 XIbpIbei3hvPsA1oiTbtPzXdxU444b2c1pYs7w4BfLE+EjSZPLbIw0I7Lp2/9hHb8VRG
 +HOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcwpo3166cgQ3O3X8uWR5t9zxJ6UjKVp8ruGQx8lXo56xtMzCqCk2pnhLrplHDomq2pRwYuLty81Bx2A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxM/KnVD+aeXMTy6l/Dw5otYDA6RfE7sfs+Sph+gHVkqdSokb3n
 wgfaHYqOyZOcZZv2u6yJFU0hkYCSjbCzQto5vC/duPTStFoGpiG6O202lt9QWi0QBdg=
X-Gm-Gg: ATEYQzw5R8NT6HJ2Y+HOSOi0EcbipGlB201efI7e81yyXkLVIEvfsyNwrlPuj4j5xvy
 9X3/ck8rcpRS/Ezca0IHRQ583Fmm7Vq1yTaKg0FzKGgYlrhpBN+kXL4uiAr+F7F0SfPN+kBLc7R
 CBERpDXVL6563LpPiPy3QCPENzAtTQJdhUkdVzXXQuBt5cyQIRBLsr2xobZiJ+6hxlT5XzTc7DU
 401K9NZkMURofLUH16ZPqXbAc61kV2OGu8C5J8brXmthkPK9ffDO8iYW3kCN3KKZ3qdd33hP83t
 Rqy2QsLccyVY13FT02iBZPA+5wYNC5MbAOOk30NxEzdIdnBvbo9LB6fklr616lz7iy76IgJS041
 IyLvdtQhEwMghH5QyZSvlYOedRqS1NUObiwUkzbqaxaNCtQaJzxo5T2LD/OnpDYn3NqegEkTF4z
 3Lv8ePnlWRUszNUYfcFo/BWo+a5qNC1orHoa4P
X-Received: by 2002:a05:6a00:2395:b0:823:ad3:4ff4 with SMTP id
 d2e1a72fcca58-82c9605da6amr8434908b3a.37.1774782850914; 
 Sun, 29 Mar 2026 04:14:10 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82ca85fc72asm4266744b3a.48.2026.03.29.04.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2026 04:14:10 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 29 Mar 2026 19:14:05 +0800
MIME-Version: 1.0
Message-Id: <20260329-ospi-v1-1-cc8cf1c82c4a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAH0JyWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyNL3fzigkxds8REUwMzgzQDS4NUJaDSgqLUtMwKsDHRsbW1AK/8AIF
 WAAAA
X-Change-ID: 20260329-ospi-6aa5060f090e
To: Mark Brown <broonie@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774782848; l=1157;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=u+hbg2H3lOYYW1ebDQugMjdlCQVFZ+T5/ivVf6GLPhs=;
 b=Wc+RgivG/glkyD6BlqKjX69NgtVzBwdBy7l8yiL6UpV2oi7bjj4Pt1hW9blTiLqjXXkYTkr2Q
 oNytratwqJCBjE2tZt6rpcUGtyqOf5tFXsRvhdA1IK+XuVfSZ9CeaiD
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Mailman-Approved-At: Mon, 30 Mar 2026 05:51:31 +0000
Cc: linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: [Linux-stm32] [PATCH] spi: stm32-ospi: Fix resource leak in
	remove() callback
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:patrice.chotard@foss.st.com,m:linux-kernel@vger.kernel.org,m:ustc.gu@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-spi@vger.kernel.org,m:mcoquelinstm32@gmail.com,m:ustcgu@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ustcgu@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.983];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: D7F57355BC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The remove() callback returned early if pm_runtime_resume_and_get()
failed, skipping the cleanup of spi controller and other resources.

Remove the early return so cleanup completes regardless of PM resume
result.

Fixes: 79b8a705e26c ("spi: stm32: Add OSPI driver")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-stm32-ospi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index acf2d182e8b1..192a20de1ae6 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -984,11 +984,8 @@ static int stm32_ospi_probe(struct platform_device *pdev)
 static void stm32_ospi_remove(struct platform_device *pdev)
 {
 	struct stm32_ospi *ospi = platform_get_drvdata(pdev);
-	int ret;
 
-	ret = pm_runtime_resume_and_get(ospi->dev);
-	if (ret < 0)
-		return;
+	pm_runtime_resume_and_get(ospi->dev);
 
 	spi_unregister_controller(ospi->ctrl);
 	/* Disable ospi */

---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260329-ospi-6aa5060f090e

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
