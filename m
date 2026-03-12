Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MB0MOFgTs2mDSAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 20:26:16 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 598D0277DD3
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 20:26:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06273C8F28F;
	Thu, 12 Mar 2026 19:26:16 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 064DDC8F28C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2026 19:26:13 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2ae527552acso6299125ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2026 12:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773343572; x=1773948372;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UUxQK5QJNlcyTiSWRj3BOnT+rEkUhbC9Gnm0lW0kamY=;
 b=Z4SQE2yHvL00oUh5q9E1nX9iA3IBz4Rjj4RzlGwptlHmxasty3wJQoNaLkx5h1QM0b
 ajqcxxTWKPijjmCLGBcIYrf7CEW/sGhgfPTlAQYObLNnAfhHLRx/xoH/aV1z3W3+HTBt
 fUUXn2GBvbtsEDXVmVYsAhbFtKyICtOYB5JcpCn4l1M4UE+NFPsYx40ix6jT7PdS+n0n
 YhfrnOJ7HPpgsYFm8O3tsmu7cu/6MYfaRrzDmw1fO0lpT0PycecvfAi5OcLMiUURNcQ5
 anbcpdZ/0XqyZ6DOiwvDA0bgZ5mhFUa7bwz0WrFhgka96owPe+q9EEiLN0THomq95FfX
 37dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773343572; x=1773948372;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UUxQK5QJNlcyTiSWRj3BOnT+rEkUhbC9Gnm0lW0kamY=;
 b=mOrX/xmJiKlXrAztF/amSESPZkt0oNfCz0o3jhlb4rqvwDxkj39YPFuawSsoYBuzEM
 j1zM6pyACN964fX/5Yz8Ax3jNjlmOPodbt1b25Wm7ntwybK2gBWzd9L3rkwfDTsxzt4u
 /goShYfXQCrw/qUiwP1iUSBDug1wnjjLTkpMFJQu5cprMpTvE2VqbB9uWQJ9rGiB1ViM
 XMyW6l9EpPKYv6pgQjOWFvE7y5iRjHJ+eUzGEqfOkiCVCvi26o6WEkwS56f6ZjQPdFG2
 IE3wJ2q00nTcXPtI4Iw8qrstrFosZxml/rFzCSPVkRwpVZeuGM8mxLMlkTapue5Ke3ig
 ffjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXfsDKq1aCxDwNrHVytYEB+eRJceGJwybNuQkperAeS7AME9oh6kp5umRrTM/bc+gsIWhhpeoI8mmcQg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyhmcjb1PH5NAJ8nbviQJ3XmJqxpfBU/CMdfqY98Q0IKQ0+85ym
 LWtZ7zfyzBGfp461IbCOmBQJY/1el55HktN9yqVsLexso3Yjm5W80NXp
X-Gm-Gg: ATEYQzzo8R2nTwjnGs5P/ijPOzKRcWCmiT3h4EoC1TPdp3DNWGSa4DLSR7vogCz1mth
 tI3ogoubIUMn7oLcZgop99SIIkHKzJkdrG2oHufXaaE/TEPY9HCtB1Z2/zPtdge9WAmGQF68dI6
 YSditolPGzv1YJpziFD+JfGUa36UmnGsIUO4XjT9C1Ff9Zcz0HFGXSsEE62LlBNz5AIW3RaVvJt
 meFBsPlJUcNfZeskSuku+5Gg3j4Gze+WuShE/fEcbPgMMPxa5llxWyRhNiikigKRfQRhvzIc3yg
 fwoSAClAR2z7HT9zIcxbi7XrQetMOnc/lvWAD2z/Qp7IoLowibuJNG6ClLrMwNrLpWuahFCUl1M
 4/gtigvY3GbBXTOvdg7YG/DtgCaVF0ij7W/evA0nYWRqg1i3Kl85OjGPNpIaPYOaMFPtwjDAULq
 AlJqc358C4gBf2+G91s/D8wuhYlLO5ckuR4Q98HZBP8/x/NZZCI/m/8Q==
X-Received: by 2002:a17:902:ecd1:b0:2ae:5655:b42 with SMTP id
 d9443c01a7336-2aeca95988bmr5392935ad.12.1773343572347; 
 Thu, 12 Mar 2026 12:26:12 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2aeae34de2dsm67068375ad.59.2026.03.12.12.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2026 12:26:11 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 12 Mar 2026 12:25:49 -0700
Message-ID: <20260312192549.4453-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Cc: "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Thomas Gleixner <tglx@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [Linux-stm32] [PATCHv2] irqchip/stm32-exti: Use kzalloc_flex
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
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:tglx@kernel.org,m:mcoquelin.stm32@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,gmail.com];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.882];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 598D0277DD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Simplifies allocations by using a flexible array member in these structs.
No need for a second kfree.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: fix title
 drivers/irqchip/irq-stm32-exti.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
index 5fdf335acb46..144120cadfa0 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -45,8 +45,8 @@ struct stm32_exti_chip_data {
 struct stm32_exti_host_data {
 	void __iomem *base;
 	struct device *dev;
-	struct stm32_exti_chip_data *chips_data;
 	const struct stm32_exti_drv_data *drv_data;
+	struct stm32_exti_chip_data chips_data[];
 };

 static const struct stm32_exti_bank stm32f4xx_exti_b1 = {
@@ -269,26 +269,20 @@ stm32_exti_host_data *stm32_exti_host_init(const struct stm32_exti_drv_data *dd,
 {
 	struct stm32_exti_host_data *host_data;

-	host_data = kzalloc_obj(*host_data);
+	host_data = kzalloc_flex(*host_data, chips_data, dd->bank_nr);
 	if (!host_data)
 		return NULL;

 	host_data->drv_data = dd;
-	host_data->chips_data = kzalloc_objs(struct stm32_exti_chip_data,
-					     dd->bank_nr);
-	if (!host_data->chips_data)
-		goto free_host_data;

 	host_data->base = of_iomap(node, 0);
 	if (!host_data->base) {
 		pr_err("%pOF: Unable to map registers\n", node);
-		goto free_chips_data;
+		goto free_host_data;
 	}

 	return host_data;

-free_chips_data:
-	kfree(host_data->chips_data);
 free_host_data:
 	kfree(host_data);

@@ -389,7 +383,6 @@ static int __init stm32_exti_init(const struct stm32_exti_drv_data *drv_data,
 	irq_domain_remove(domain);
 out_unmap:
 	iounmap(host_data->base);
-	kfree(host_data->chips_data);
 	kfree(host_data);
 	return ret;
 }
--
2.53.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
