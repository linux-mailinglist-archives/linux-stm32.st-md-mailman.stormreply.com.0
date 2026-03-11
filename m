Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPOwHW0AsWn1pgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 06:41:01 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC1C25C805
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 06:41:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2926C8F280;
	Wed, 11 Mar 2026 05:41:00 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A2C4C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Mar 2026 05:40:59 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-829b2018c94so2574131b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2026 22:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773207658; x=1773812458;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Bi+cpYb6Vg0VXFOuregCJb6MTqBCf/daXiAT548yjY0=;
 b=N44IuT32UjVWq2ySisppRQyINbyFu+VKPOSdrS5gtg4ku8vGTrtoqIEDmJArrqab2O
 bTLgvW0ArqL+nkOKp5vnOrVJX+2TDm5MacKRzg4sPAfb6Y0pfRc9zDxMm390h/a1xDTt
 LysOg4jNEsxd7JBmsSgeeHPJUVdLbaM0LhEbOOMup7ubqe28b/lSiTjq1ej7myXRSbFe
 rn3kUPrcHZTZ904hf52MaxvYeymFEKbc4loLi91F5YrPf72lPppWHpGHLbYk/1EbEMVu
 s3IsGVPV0erLl22UBHMZxBCvli/USgBQrCXSgF2HS7GcacpY7J2NaIt6CMzYxdYRoG7A
 mPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773207658; x=1773812458;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bi+cpYb6Vg0VXFOuregCJb6MTqBCf/daXiAT548yjY0=;
 b=fKKeR2Osmq3j3dBAQatkjILiXC0ndUU1p5yHtlwegmBqWZU6LSQWeDii4HeTOzvaWu
 cYUMxUwv/rNLAF44GM9DNloZ0zYQW9qXO1OKnP3ORcBb0OWatpI6sgaLXt6x6fdhUuWc
 j6hZecwZtt9xTBzgIeduENXAbeIt+m0IAPP9FRnJ+rBD/TnvKQJ8YAGaa/NwoRm/F2kX
 qzRcVEgcXHgDt/Xz1l9LcXuMZwQJJ5cORUhwo8HTzi80D7zi6sZn3+4yU/2OIAqiTnxe
 nYGqxuZN5lc5P7rG96/EGClWAOom0GV6dE82zX9cjDcyImbRmpZyZ4t/zN4zuoZhtJCc
 V9Cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjJnMuR4WIz0s3aUnK3z5tnsYOPGPuYT8K+uUVbh4D3FMTnNCehhPGXWDGj/bvjt17LNDrrt5sqE+YZg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz6ZrxMWQDAAHV2MLoSb48Y5m8DDboNvm8hj5BpmXeXqlGoc0Cn
 PsN619nixDWePz60zIosNsFEwpaGiW/oaVEpZJKzNiyYXPaP6wJfzO45
X-Gm-Gg: ATEYQzzKnKoUpAt5vj7uRUwFZ8V5PmClwvD+g0b3QrcCMtkv6x9dJCklnIi4SVf6QK3
 2oVepdteGcB3PXLoX2N/J1lgGCtJwiMrzqrwBT55Xk6vZ2UzIcyFdO7w8kV/Qxf4Ihgq5ojr+zD
 n+lJnLgyXhN5pPD+zuUu8P75MyNCXhu0Z9SdCGfdevkhKdST7+ggB38e2Xu1xCD3Kndnv1K7jsH
 9BWgJFZeaME5Bv4oLi+gnnCDmUmGqxDUYUlXT5A+z6SuYmufBT5h51WOGCTNc+6BPnuwt20V2+b
 Xxw3PsqXMXMj8kB9wJfds/KaRPXm+sx6KuGZmLdOaVIHky5QK3NkoUOzwEu2h5cSW5VjV276SYd
 /TAXefZVIIvw7F8AdHJan3/1LJ61CgGe7CZhRWFzWjGQ/aznP/7G7UfTvLsv6T6QsV8z29dMZsC
 AQaGEVEcA1up1ko+CZqU8fuu4Y9H/GI0HNCHTkyQ9rWngpUd0lwoIEyA==
X-Received: by 2002:aa7:88d3:0:b0:828:d9a1:c604 with SMTP id
 d2e1a72fcca58-829f6e71531mr1386417b3a.12.1773207657593; 
 Tue, 10 Mar 2026 22:40:57 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-829f6eebff0sm1058168b3a.32.2026.03.10.22.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 22:40:57 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 10 Mar 2026 22:40:38 -0700
Message-ID: <20260311054038.166293-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Cc: "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Thomas Gleixner <tglx@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [Linux-stm32] [PATCH] irqchip: stm32-exti: use kzalloc_flex
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
X-Rspamd-Queue-Id: 0DC1C25C805
X-Rspamd-Server: lfdr
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
	NEURAL_HAM(-0.00)[-0.475];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

Simplifies allocations by using a flexible array member in these structs.
No need for a second kfree.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
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
