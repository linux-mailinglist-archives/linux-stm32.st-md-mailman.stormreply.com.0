Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 76HhOsHMK2r3FAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jun 2026 11:09:21 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7147C678130
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jun 2026 11:09:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=St1pSwzb;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 235DFC9AE33;
	Fri, 12 Jun 2026 09:09:21 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FFA6C424DE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 13:28:49 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2c2da7fa321so3737785ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 06:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781184528; x=1781789328;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kr6lr/Zk4qDdZQL9yjJdI0zh4QdrOtRvdN1aN8UPXKU=;
 b=St1pSwzb1IDbssFXfIRkwdv3p7SSQaq3E1UFqTuEYQjwfhq6mR7yjWnyT+qjHZjD3f
 jSyRJLzWMA7ki1DjEUTrAsBJ/F9BDWhSUSDpN16ADh6ggcJpjfS0iBCPq1XCVHtycJ2e
 lCQm/bk2OKXFh1vDKuVujs9Es7MQbBekntZWWqymDluBZ5AItodH0iIk8usCWMu9TfjZ
 lLw/N3eUXN9YbK60dKzTUL0HqjI26gw0Oyd3/SV4exviLc9g5HWOegif8B2Iy/kEFlBy
 0vw+Rt1IRLtYlku/IFh3iiNoN40f+zc5x0uRy54uTKt7Q3rxcOuwF9eEhqYys1ubD1G+
 GKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781184528; x=1781789328;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kr6lr/Zk4qDdZQL9yjJdI0zh4QdrOtRvdN1aN8UPXKU=;
 b=XjHq4uwujXQVGatw3ZOH68oZCocP2BKKFiXeWFyu//aGfqUhq82Fi8XR+zLzOYt7Km
 STB7bi2FmqC+S3/aAtBLeztWrK2JKhTpQeXByOimbBj8+tObCJH2kkFQRIrkUU/P90hS
 wGcgIi9HM6eNmjCO1sh/Ua33ItTZVk1r0bEc9vwO0dc5svLD0PVwouT9mENairVSfTpV
 R69DsMLW/X5C/RdU7u1eZYCtmEYu2J8nfiw56hFnM8exVXb8sRvWDpVgl39e7b7y1QyJ
 FQXp+erakOgDBo5RtGgPuFaF+lx3DyS7z3maVDxzzAj8NehZJMg+ZLyi+7Z3kOuBZHhD
 +oBw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8uhkg/ZWzeOWaC7fE0Y1Y2rkxBaB2e2b9cgoSbmFnI5Ra6ONZTD0/dnyKa29aI76glYiVwmx12pVexkQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyI7ZzKSDqQN5WZDlccRqDf8J+ppjbnhcC6hDrKPtoDx1vaAHKN
 pWxy9dorsfL0rJG5TZgU4BAtDb41psdjQsk0E6cmFrzYCFlYkTFB523S
X-Gm-Gg: Acq92OHaWXF2rtRLBhvq3mUgHHufOj5Oy7F2ujw7z3mDlL4LBQ0YrJa9cjOdebx/H6t
 /o70QRgdhy+M8uzj35LhH+PX/BYvabz599AnIJmILC3/hGEAQGDipmxIMDVIfPza9LW3O1SFy+Z
 MfnkZj4gHPoe/fD6erud1oFXJyaEyjuQNOqr1urviZPquSkDtnlBrWN4Ao1NAFEqiBMLNo3etsE
 SAUltVwC8zX/ENFfxwaeSwljSt2iTwi+XekGqvvJPTw/9IIBePNl/AvNmXxayuf1XfZU2OwLn9b
 MnKuxx5vx/mh20lYbwMBn6lqmyC2yDL/8+p0wvTLKdiS0AsdysDvHEwh7ozOeMujpBhJSSBkGXN
 fz4OOJia1q8+dseekFbrZkSLTPp217qKfSs/6YO/zAkf//LJ8yr+RxXGUvxZ7j+5I4mtmsoOsRJ
 vAalCgCLZUAj6TPlFK7IwmsBgitZUQvi7aw9A4AmDW0lMPU/I376UpNiSgnokix+w6nK2DkU82V
 Y9ZG3oPCMPoam+UiVRX1VrMpy+Cwm1Kum6WpX/rbt5ebepDsbLx/c8RVorbMwNEF5E28x83vaxD
 9lc3MXUEbdRRTOPHcxA4DucSyf20vQBcQLYNxEeo9AQYBlD9
X-Received: by 2002:a17:903:90c:b0:2bf:dd8b:7cd with SMTP id
 d9443c01a7336-2c2f10165e3mr31858515ad.10.1781184528412; 
 Thu, 11 Jun 2026 06:28:48 -0700 (PDT)
Received: from jfk-HP-EliteBook-640-14-inch-G10-Notebook-PC.cse.unsw.EDU.AU
 (dyn-dhcp-226.cse.unsw.EDU.AU. [129.94.175.226])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c16629cfb4sm292927115ad.59.2026.06.11.06.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 06:28:47 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 11 Jun 2026 23:22:48 +1000
Message-ID: <20260611132248.114519-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 12 Jun 2026 09:09:20 +0000
Cc: Weigang He <geoffreyhe2@gmail.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH] media: cec: stm32: prevent out-of-bounds
	write on RX overflow
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
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:geoffreyhe2@gmail.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-media@vger.kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[geoffreyhe2@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geoffreyhe2@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7147C678130

stm32_rx_done() appends each received CEC byte to rx_msg.msg[] using
rx_msg.len as the write index, incrementing it on every RXBR
(receive-byte-ready) interrupt without checking it against the buffer
size:

	cec->rx_msg.msg[cec->rx_msg.len++] = val & 0xFF;

rx_msg.msg[] is a fixed CEC_MAX_MSG_SIZE (16) byte array in struct
cec_msg, and rx_msg.len is only reset on RXACKE/RXOVR or after a
completed message (RXEND). The number of bytes received before RXEND is
decided by the remote CEC device (it sets EOM), not by the driver. A
peer that keeps sending bytes without ending the message drives RXBR
repeatedly, pushing rx_msg.len past 16 and writing peer-controlled bytes
out of bounds into the surrounding memory. This is reachable in normal
operation once the driver has probed and receiving is enabled, from the
IRQ thread, without any local privilege.

The length check in the CEC core runs on the consumer side, after the
byte has been stored, so it does not prevent the overflow. Bound the
index in the driver before the store, as the other platform CEC drivers
already do (e.g. tegra_cec), dropping the excess bytes of an overlong
frame.

Found by static analysis tool CodeQL.

Fixes: d69ae57453c8 ("[media] cec: add STM32 cec driver")
Cc: stable@vger.kernel.org
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---
 drivers/media/cec/platform/stm32/stm32-cec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/platform/stm32/stm32-cec.c b/drivers/media/cec/platform/stm32/stm32-cec.c
index 1ec0cece0a5b7..8c2fc232202de 100644
--- a/drivers/media/cec/platform/stm32/stm32-cec.c
+++ b/drivers/media/cec/platform/stm32/stm32-cec.c
@@ -132,7 +132,8 @@ static void stm32_rx_done(struct stm32_cec *cec, u32 status)
 		u32 val;
 
 		regmap_read(cec->regmap, CEC_RXDR, &val);
-		cec->rx_msg.msg[cec->rx_msg.len++] = val & 0xFF;
+		if (cec->rx_msg.len < CEC_MAX_MSG_SIZE)
+			cec->rx_msg.msg[cec->rx_msg.len++] = val & 0xFF;
 	}
 
 	if (cec->irq_status & RXEND) {

base-commit: 9716c086c8e8b141d35aa61f2e96a2e83de212a7
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
