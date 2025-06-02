Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C23A0ACB690
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Jun 2025 17:19:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84687C3F954;
	Mon,  2 Jun 2025 15:19:00 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58F99C36B31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Jun 2025 15:18:59 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso3506712f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Jun 2025 08:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748877539; x=1749482339;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yYI0Df/Q5zXhStAf9TQ+dtCVBtZRyAW6V2IwV5wSjV8=;
 b=yqr6/qdEd9nXzCWvR2161PftM6dsVdl+1DZKy/xRF980qJR1UfJxmyqza9xDaYjLr0
 ITJKwt+7gB8cZcd+p4iULmaZUvcqtFpKW9mkEPDoC2pZp2ZYUM6h0ibgGHoYIIswj+5N
 gC+xjFaPCZAsjw999gpidnGjtlvic7L3ES0fygNtHNxw9GC0/zjadMah/oAt8Keihs3B
 JbR9SC1WoiM202ocwfdmDk2LjnlL4o9Vyd5GdP5TClPhiZQeFdmcKoSGLYj5JxYaQIvF
 H2ezjiK5RxRhy0J0mhCXMhbqMlE3nnA5ZWHRyogokxCepQ5iH+ejz273KyptP9VxyIjz
 mbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748877539; x=1749482339;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yYI0Df/Q5zXhStAf9TQ+dtCVBtZRyAW6V2IwV5wSjV8=;
 b=Rc0dkB7yliynfSSIyKdIiedHysTr1uUBStlQJMKTFb9LqieD8zn0GdkloytrOHkavs
 ndGj+QEbvlF6+PlMhU6vUnspWkB8lx1lnlNmEKcXq7Dns8i1cMmlS0meVDV+Rs1sSw3i
 c52zQ3rANJe0aJZL3AoKB83yhnOBCNTKaFBTR0gO18hWcGnz0cGuKrYJKhtkYhFe4Ydv
 PzMaB1fDMTux3DLUkz+zfj0K4DNEF10ds39CsV9JUX0asAd2PEIRpvnU8gyZd7K9i5aY
 bk3cM8OPe1whM6upqTAFUCLeAY39rdJf1EiHsGovIZyJgJTXuzQ3JQusaqPChYQBrpM+
 LR/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOHim+maofzO5ZZgKwak5OIyxtnSlf6y80aaI2Tk4KLEkwmbWwGFyeZSy5sCVGhkQGPPJE1TfnmXaEPw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzAxvfGMnWD+UfJhEx5YIk/JvYmjPNw9ZrZ+IchHRpl37SBJ/we
 x9uZWhrgVNoeFGGFriaq8H1Egt4zj/bMKkM7Hxm7cP27IhYo8EePduXAoX0cxCxB7MI=
X-Gm-Gg: ASbGncsX9bDqFw7DDnmO2JY9vGgqUNtCi+y3LFKOE8bbu+8TDhE+Hrh2r0iA9ljzIDl
 MB+wm0kOD+DgGwtEbS8FZZCgAn44T8zyzr8xMnSRexEMhuuYRuLrIG2wZhjlkM5yn7tL9f4bI2Y
 Jl+NmPEHtdSQNsnk00f6bp5qg3tpyfkSQiXjL+GGM6Jgg1XNnigua+7WZB5y/rasuZ3qN0MLskL
 Pri7tr86YEm8ASoaI6A6iv5AubAnOJdKY/hP1WlKQwEfCAiyqxSybXg2s8G7y/Zwv19SMg/LUpn
 p99dkgRaIF1qBbRiePF5zfFZVH+qH38NnAiACvuAkPVBUrZ5fnuFkNGCyWL7y1XtLVJbRFuFfHz
 zbnIqfpZSVSSB
X-Google-Smtp-Source: AGHT+IG1GHyy8b8GYVbfzlnN8+J2RSq7hqEKi6/Yl/QaRXVbKZmvYaubZ7QAl5jOTOJVDXQoWBizUA==
X-Received: by 2002:a05:6000:381:b0:3a4:f893:3eff with SMTP id
 ffacd0b85a97d-3a4fe39a982mr7159013f8f.57.1748877538797; 
 Mon, 02 Jun 2025 08:18:58 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 08:18:58 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Date: Mon,  2 Jun 2025 17:18:45 +0200
Message-ID: <20250602151853.1942521-2-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Cc: Nam Cao <namcao@linutronix.de>, Marco Elver <elver@google.com>,
 Will McVicker <willmcvicker@google.com>, Saravan Kanna <saravanak@google.com>,
 Samuel Holland <samuel@sholland.org>, Jim Cromie <jim.cromie@gmail.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>,
 John Stulz <jstultz@google.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v1 1/7] clocksource/drivers/scx200: Add module
	owner
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

The conversion to modules requires a correct handling of the module
refcount in order to prevent to unload it if it is in use. That is
especially true with the clockevents where there is no function to
unregister them.

The core time framework correctly handles the module refcount with the
different clocksource and clockevents if the module owner is set.

Add the module owner to make sure the core framework will prevent
stupid things happening when the driver will be converted into a
module.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/scx200_hrt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/scx200_hrt.c b/drivers/clocksource/scx200_hrt.c
index c3536fffbe9a..5a99801a1657 100644
--- a/drivers/clocksource/scx200_hrt.c
+++ b/drivers/clocksource/scx200_hrt.c
@@ -52,6 +52,7 @@ static struct clocksource cs_hrt = {
 	.mask		= CLOCKSOURCE_MASK(32),
 	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
 	/* mult, shift are set based on mhz27 flag */
+	.owner		= THIS_MODULE,
 };
 
 static int __init init_hrt_clocksource(void)
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
