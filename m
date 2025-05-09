Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6EBAB1172
	for <lists+linux-stm32@lfdr.de>; Fri,  9 May 2025 13:04:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DA1FC78F96;
	Fri,  9 May 2025 11:04:36 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3940EC78F94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 May 2025 11:04:35 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3a0adcc3e54so1162038f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 May 2025 04:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746788675; x=1747393475;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RFGeu4rqa4NbdBxLMRAKny6nuW4xYvTJilVyN9sQWDs=;
 b=moCBiFNRcCN7n72LyEnpQCdKcnzwCPoXKDYm1dNYeymCuDTmbnF4VcbZyfq5ntI1x1
 auTuazrjoWKkX5YEtQFSXUTSKgCfv9616czSxORvAKe1YUZXZ6roRCkSpuGOkLDiFqOv
 +K82mxt/mNBDRxBAcJih3KIEF+F3xStIhzRHeBp/Aly5U0gpl9tts38CeIi8waZC5+vO
 Ff0th/EwcO/q+sDMyksvHeZuJxSXc2mLWA8LBAEPFxz1gEdKKfWbIR0X7ZDJMLNbNhdg
 E3qqardE0sJCvTjoTdjZ6ys+p1chei0v0Rp7++xJVwPwFaaCkMNEo2HeYt9/rgX3ORHi
 Ej8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746788675; x=1747393475;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RFGeu4rqa4NbdBxLMRAKny6nuW4xYvTJilVyN9sQWDs=;
 b=v+/sZfN5J+bbEOQpOt74k4ckpLTY5TFc8EcvP/jvx6dVGKHb0HS1kqGZgngIYaak3W
 9uCT1U8LqyY7AXhp0RT5hPVq5nYieKLNkfSxNco55L87CljyZ2Uh6VPJ+sYWtAnfjjYt
 zX/AAqerqFY1WST4L1mY4siqOqU2P46SEqe6qcVdy2yy4QJqJ+Nq0DX3XkhwpkkanN/l
 /zLAww2oJJiCWKJvYYJ/OHTHAYqmGEGQA2exa1SX4YlaPv7SOOlW10IVlB1JAj78VXPp
 4kNi3YIE8+JzdOZvex4zK91+m+BJjqT+S4s2Naocs+Qa8/SWppmCCjtpxh8Aw53EL9lg
 vAkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9MSCFOA6TsoH7CajuWq5lgUDQsqNC2F41G0U5BRn+UZqF+oltluqwz7Rp8uq5DWF7/xOKN80uvamAYg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwEbnDmA8TCVDaLmqxk0q67g2a38oc4wtPZlLZt1lkhvwa91guC
 AK6qReQgJE+s5dkKjXRZibH3y5eZN1JLUpKc1VRCFc/nLMAubFJsrhJQDoTcops=
X-Gm-Gg: ASbGnctkPXIEn0bguE9YtMuY0vZOq0/lZdRXEDrab1+nGF6vupWKNh6vvibvVFMt8mA
 jFAi47IceO1lvjnrL7Sbzi4w/PJJfY66Q0MtAslJLrxZ19ytriPxt5me7QllWuXTjHItmR0eQng
 wL78in7dr6lrJ+VkYMMRTJC2F8E3i8bDOfORzwuKKOY1bV12svjC6+syzAmu8rQPFCm+4d/kaLi
 IZOUx82rao+6wQdQiFpsfp6FeO7llnwNTXrU3ailQ9J+sg9okI1dkHz/Y4Tmn4FcEJfNnrA8O97
 +aojXYgkFjPfsrdubWi4CWOki+q+fo/G232F07SvsretMA==
X-Google-Smtp-Source: AGHT+IFoLOmKX914wuAyiGBAuaM7PeEJMdeV8PiUZxo0dtylTjuaMjYw6oH6HF/eoBRmbKUgAyX7qA==
X-Received: by 2002:adf:fa87:0:b0:3a1:f684:39a7 with SMTP id
 ffacd0b85a97d-3a1f6843a51mr2176018f8f.0.1746788674618; 
 Fri, 09 May 2025 04:04:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a1f5a4d21esm2931116f8f.99.2025.05.09.04.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 04:04:34 -0700 (PDT)
Date: Fri, 9 May 2025 14:04:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <a69ce0445324e994ea2ed7493bda1f6046c7ff69.1746781081.git.dan.carpenter@linaro.org>
References: <cover.1746781081.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1746781081.git.dan.carpenter@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] memory: stm32_omm: Fix error handling in
 stm32_omm_configure()
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

There are two error handling bugs in the stm32_omm_configure() function.
1) The error code needs to be set if clk_get_rate() fails.
2) If devm_reset_control_get_exclusive() then call
   pm_runtime_put_sync_suspend() before returning.

Fixes: 8181d061dcff ("memory: Add STM32 Octo Memory Manager driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/memory/stm32_omm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
index 166baed0738a..fa0f75e4a6e8 100644
--- a/drivers/memory/stm32_omm.c
+++ b/drivers/memory/stm32_omm.c
@@ -222,6 +222,7 @@ static int stm32_omm_configure(struct device *dev)
 		clk_rate = clk_get_rate(omm->clk_bulk[i].clk);
 		if (!clk_rate) {
 			dev_err(dev, "Invalid clock rate\n");
+			ret = -EINVAL;
 			goto error;
 		}
 
@@ -230,8 +231,10 @@ static int stm32_omm_configure(struct device *dev)
 	}
 
 	rstc = devm_reset_control_get_exclusive(dev, "omm");
-	if (IS_ERR(rstc))
-		return dev_err_probe(dev, PTR_ERR(rstc), "reset get failed\n");
+	if (IS_ERR(rstc)) {
+		ret = dev_err_probe(dev, PTR_ERR(rstc), "reset get failed\n");
+		goto error;
+	}
 
 	reset_control_assert(rstc);
 	udelay(2);
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
