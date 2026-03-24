Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPGxK1SJw2m8rQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2026 08:05:56 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F44320693
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2026 08:05:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB494C8F287;
	Wed, 25 Mar 2026 07:05:55 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CA7DC87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 18:28:37 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-3590042fa8eso3729177a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 11:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774376916; x=1774981716;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pWQFrxeJ9xbwYy1VhHH7N7bPolG8RRVJqSZfUbUVPdk=;
 b=UFs8NMx75fI0iewlSdgLHImb6pjH15NXgtDdjymiGZU+7sMe9/z5xO9bIVcbUKKHOb
 8dEPKgBnWbhm2HB/BmzEuWkIwSi6uV2xKGkFE3+wylHI3AoKBDsaXVxbTZo7C5xb2lG5
 WwPBzVhm5tcwCXIWQVjPB4QRGKzBxIt3QC+hoLNZ1Wi4TnFvXEbRLPX6fxvymXd6ej5O
 F2Az/KRnZU0zdn90W38gdd9HNDcuGbyIWGpOKM/y9h/4Gj5hsR5jLmOj+58JyBqvKDsk
 gf+ERPNF0SsPxQzNF0oovYHzfbJor16ZA++B1Vm7giueAT3VsLBs9yOTJ7GRJ6hDqvxA
 5QUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774376916; x=1774981716;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pWQFrxeJ9xbwYy1VhHH7N7bPolG8RRVJqSZfUbUVPdk=;
 b=DZzYrx03jV6vqbBCbRYMXlQXiHLqBquQyjP+1Sl3B+3VzwfZLP1FPXVkw7dvg0qL8i
 J2Dvw/wsH7l0G5HJ7u2u3h9laS0joSUjhuL2uJwxGd7sR7/snWjLFt+vk2NIT8Ev8yWr
 63sHkEiVbMQUuOOj84fJ9h7NynF3Tl3rbgLKRCko3nxxGzXFl1rbc4qbLGbTjQv/VHS9
 LEWC4yJCl6jJx3MYpyuc/zro45LNvqLyZ/vzQJ4AjKhiB3dGvp0dUMhttynEX5x7YgEt
 HqJ882dNA6NiKXn9JZoUXVTKRMosvusFwm6vEMzHUdFj4XpJCGdJhcZUIP1D3kVvxU23
 xRsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxTPXehXdsruf99XytoOBKJQIA8s/zEoYGdN2LmYuXKTkWGu5G8oLKCuf+D/Cap1F5Exr1FUMTwz9scw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzxL0jisntGxeqEcfGg0sPPJrYAnYncp2fMFpCxQAyg55cKo9BB
 TuxjuoFHobl+44hCna4yTACE++sFAaha48IYNPRX64eLNkvgu77HMJOi
X-Gm-Gg: ATEYQzwcQfKHWLT69oaPZ0280qHRumPf5kNj4OdmRU3H8NNWcJBGR+dm/FWtyvDBbG5
 U3NOSrqfT1KB3J67qnWU/Z2mWaY627/2b9mCQ17XodwwR+V8v2AXA6RWAkN7VBtwOEx6sn9lbLN
 l5e0ZJpTIFJxKAjymT4CBrcMy/4tge/uW2R1GXco3tfMhJ6oMnFCzricQSVC9qENWuYFirMx0qD
 hoSNq/74QI1Wgt4n4q+rR2ndLEByLLLlyz44tgQwYbA07zYBbRS8IYIDlGU89OXhn1eHIi/FOM6
 OtIJvVvBI4x/bpnmSElV+KzmDSfXjRc5lbUqkXPeS6KykQLor0DpNjGAJJRsE9fxCeCOIV8pP+e
 cyQJcX/mSdZaCr/Tle0mfdV7Z8cfZJd4T8QKogMgC1yj1qpB4x1Djc0bvowraMMp0ltO7W6K+Mp
 pweIdXal7AgcCq3vm8x7ElittENQ==
X-Received: by 2002:a17:90b:17c8:b0:35b:e555:f19 with SMTP id
 98e67ed59e1d1-35c0ddc5abamr302415a91.25.1774376915602; 
 Tue, 24 Mar 2026 11:28:35 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 11:28:35 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:56 +0530
MIME-Version: 1.0
Message-Id: <20260324-deverr-v1-8-7e591cce33a3@gmail.com>
References: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
In-Reply-To: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
To: Till Harbaum <till@harbaum.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jean Delvare <jdelvare@suse.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=1529;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=ASHKLgyhVdhgUS0PF+wcYp1muqF4w//oNCLBXZkcUHY=;
 b=hXROFYzb3OmT3cxRxEoFIuEeGuiZJd8xLM4x0yhyQx4WWK4SUYX6zSFRnwpUkd47L0bbPAvtp
 mE3F0pCOHTsA7C6xaX1n86n4DvW3PrzzB2RQAlr/W45yvtlvUvwnwXb
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=
X-Mailman-Approved-At: Wed, 25 Mar 2026 07:05:52 +0000
Cc: linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
 Atharv Dubey <atharvd440@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Enrico Zanda <e.zanda1@gmail.com>
Subject: [Linux-stm32] [PATCH 08/10] i2c: sprd: Replace dev_err() with
 dev_err_probe() in probe function
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:till@harbaum.org,m:andi.shyti@kernel.org,m:ldewangan@nvidia.com,m:digetx@gmail.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:pierre-yves.mordret@foss.st.com,m:alain.volmat@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:patrice.chotard@foss.st.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:jdelvare@suse.com,m:linux-kernel@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-i2c@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:atharvd440@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:e.zanda1@gmail.com,m:thierryreding@gmail.com,m:jernejskrabec@gmail.com,m:mcoquelinstm32@gmail.com,m:zhanglyra@gmail.com,m:ezanda1@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[atharvd440@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[harbaum.org,kernel.org,nvidia.com,gmail.com,sholland.org,foss.st.com,linux.alibaba.com,suse.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atharvd440@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.952];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 55F44320693
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Enrico Zanda <e.zanda1@gmail.com>

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 drivers/i2c/busses/i2c-sprd.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index 1b490525d8dd..7b321a956fca 100644
--- a/drivers/i2c/busses/i2c-sprd.c
+++ b/drivers/i2c/busses/i2c-sprd.c
@@ -469,11 +469,10 @@ static int sprd_i2c_clk_init(struct sprd_i2c *i2c_dev)
 		i2c_dev->adap.nr, i2c_dev->src_clk);
 
 	i2c_dev->clk = devm_clk_get(i2c_dev->dev, "enable");
-	if (IS_ERR(i2c_dev->clk)) {
-		dev_err(i2c_dev->dev, "i2c%d can't get the enable clock\n",
-			i2c_dev->adap.nr);
-		return PTR_ERR(i2c_dev->clk);
-	}
+	if (IS_ERR(i2c_dev->clk))
+		return dev_err_probe(i2c_dev->dev, PTR_ERR(i2c_dev->clk),
+				     "i2c%d can't get the enable clock\n",
+				     i2c_dev->adap.nr);
 
 	return 0;
 }
@@ -548,13 +547,13 @@ static int sprd_i2c_probe(struct platform_device *pdev)
 		IRQF_NO_SUSPEND | IRQF_ONESHOT,
 		pdev->name, i2c_dev);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to request irq %d\n", i2c_dev->irq);
+		dev_err_probe(&pdev->dev, ret, "failed to request irq %d\n", i2c_dev->irq);
 		goto err_rpm_put;
 	}
 
 	ret = i2c_add_numbered_adapter(&i2c_dev->adap);
 	if (ret) {
-		dev_err(&pdev->dev, "add adapter failed\n");
+		dev_err_probe(&pdev->dev, ret, "add adapter failed\n");
 		goto err_rpm_put;
 	}
 

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
