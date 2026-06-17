Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sElfB7OYM2r8DwYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jun 2026 09:05:23 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA5469DF8B
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jun 2026 09:05:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=jqNxp32Q;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5AFB1C8F291;
	Thu, 18 Jun 2026 07:05:22 +0000 (UTC)
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCB4CC712AA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jun 2026 18:22:09 +0000 (UTC)
Received: by mail-dl1-f43.google.com with SMTP id
 a92af1059eb24-13810b63a1aso198348c88.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jun 2026 11:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781720528; x=1782325328;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=HQIkf5SvJGerJpzJyK7LEUA5xTlZO86ZcJ/z+85FafM=;
 b=jqNxp32QxfTRl6QNSiir8dvtbnoQB/qQEe4mDuQX2iXf6x675v0iaioGpgm6ofDP0w
 rv1u0BQ3x8kb1k+pXB4NXoC2cVsdkJO1AjrF4fvsxnUvTbgxBsUffv/G9PvcASm9jC51
 2rqEAxx5vZhnRpAbLKeaFEKWPNE1TAicp8ow+l/f8XVT2ZjjVqT5FdwWqEuhZuiHL0xR
 DpE4FfE3oUGPuyJo0178wWg77CiEIXo6jdUi+TIWWLuAiLn3lw0DE5P7DOy/dz5ykxVv
 s7LK8MsvlQuiCKVSWqS5j2Ph9Wyy190rWq1kyAk3V4efXs+XqwTJurV1dIPXKdjn/ayS
 cJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781720528; x=1782325328;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HQIkf5SvJGerJpzJyK7LEUA5xTlZO86ZcJ/z+85FafM=;
 b=QsJWkiMQvVWZ56v2asV97bULozpKQhB8KjbQ0i0of+np0rk5boyNw7OTQmU8v84e6a
 R0a5Zyg6SnypQyXCVAwdODBRNVq1ljXa09nweKt+qNXZVLuXwYUgcLSiHdhw4dYoflw7
 BbegIlJIhMfyNnBrMkNZhHfgMgo6Pe9LuDR9l0O+TW+sEQMxN/f+mPRLy/zZHD+KaIOV
 GzjDSBKmxRYauAFhdtwVl7efumCCarL1UYW5JCI9E37XbXMHMkDPRcnJiBzXqcehUIrr
 zWkS11KyF6M3k81UyXHLyULrfjtbgQNiNw3gU9Ad8LZIneEK1bl4uY/5F6F795HjeJ9O
 x/jg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+58Vs7/Sw7+Qkr2iGiqD8EOhyi9rmZ17vvT8VhfMuhpzx5LF2x0rE4aZFHASsYXQ9BMFW7pcxtF2/Y7g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzVw5fFBB2EKOYADqyPIjCa4jofgOYvsuRdU2Ao1EHyaBZm3NBp
 QQKkODaxFPluRrOd19gh4cH7GRkBjz8Y5dqX3hTkoZDIMgpZQcT8JjwB
X-Gm-Gg: Acq92OFZ2IaVm06UYP4XBj+BQAelCfdSjSb5lpMePqddTIy3ZEOI3Ab7BfSkgiOGCVr
 Qp9XFjwZKLvjnjYh5AFxLzfm3GUfZTvfVv7K/yp7uxJFoB5d4S2wN4M9LXX8NNDJixUyUCqlSrQ
 lvfdMmFlgaAJPxEXmt9f5Pe4NsPioAxOJ9Zja4Gi9nAFh8tCaRZfds0+3W0/YOngiXb3ciizbXQ
 ozz6W9gRsEoIHc4YkE77UEKEZ97ONNfRnL95/JvMleG6XMUTX0kD/3nZ4jIeELqLfDPRd8TG4ow
 OjiVeNQDLs9FDpyilDkPFM5eFTSX7a1VG0AcVtMW9L30eJjTcaqfARvq2/NctblPKREqzQ1EEwX
 jNqoRiBp8hEi/ZwbRKv6oYlqhToCL6U248cvqjgDhKL8OwcfrYgeteuOgDYMvNc55Mv4CJhEcw4
 y2fAi3hKLkfqHmQiizZNq7uOLUA13jSQGd
X-Received: by 2002:a05:7022:4390:b0:139:86cf:c305 with SMTP id
 a92af1059eb24-1398f66b777mr2273424c88.3.1781720527835; 
 Wed, 17 Jun 2026 11:22:07 -0700 (PDT)
Received: from haichao.tail057a43.ts.net
 ([2001:da8:e000:1206:1886:6b7a:3e78:272c])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1384b964862sm17359988c88.10.2026.06.17.11.22.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 11:22:07 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 18 Jun 2026 02:22:02 +0800
Message-ID: <20260617182202.961843-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 18 Jun 2026 07:05:21 +0000
Subject: [Linux-stm32] [PATCH] memory: stm32_omm: initialize ret in
	stm32_omm_set_amcr
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:krzk@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[ruoyuw560@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruoyuw560@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AFA5469DF8B

stm32_omm_set_amcr() returns ret after checking whether the AMCR value
matches the device tree description. On the normal matching path ret is
not otherwise assigned, so initialize it to 0 before the checks.

Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/memory/stm32_omm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
index 5d06623f3f689..2a1af229d2444 100644
--- a/drivers/memory/stm32_omm.c
+++ b/drivers/memory/stm32_omm.c
@@ -47,7 +47,7 @@ static int stm32_omm_set_amcr(struct device *dev, bool set)
 	struct device_node *node;
 	struct resource res, res1;
 	unsigned int syscon_args[2];
-	int ret, idx;
+	int ret = 0, idx;
 	unsigned int i, amcr, read_amcr;
 
 	for (i = 0; i < omm->nb_child; i++) {
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
