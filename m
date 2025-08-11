Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BD4B202B8
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Aug 2025 11:10:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D369C349C6;
	Mon, 11 Aug 2025 09:10:23 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 110D3C349C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 09:10:22 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3b78a034f17so3167420f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 02:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754903422; x=1755508222;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Qn1l1+ZBQDpWHIpCv84QlPIvcnD4wklf3q7JJCJ7Zg=;
 b=qCr/xf1bBN11VNMKUPCNzKS4QMHQiyiYED5/khk8Uq2RgZCSmze/26pApWP+5K5+X1
 +lNcoIoyfRBgN0LrXbwM+8pa9hNFWCZUm2p4hGn2rmX+ZulgcOzCi3SD9cV5JBPV4FRR
 gpG/JQiSFRSy3yF9/CoKVAPi+5hHTYDhTGhH2HAev4JAfjCuYwvtO3qAnwLk+pRrSkkb
 79xvhdFskobji3ijdBuyi4UVGxK5FxATVAoOOaT54W5pjjxCHpKr/VIkYGvxrYSZWqAV
 zQHvHan3V8Ze56kkLGS5rajz1nwwOUmrPfjKrvodVcG4fY/LYhV8twxqIwBieLcDoQbL
 eG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754903422; x=1755508222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Qn1l1+ZBQDpWHIpCv84QlPIvcnD4wklf3q7JJCJ7Zg=;
 b=sWYHhNXj4zIRhJprbp3HH9E1KvVvHkTBTR7LNtdIVl2YrPYKN8Ws4FZawAxEzgDaKU
 E6BtqQ1c55lVf9enTtqxOPuOI5AKu3Co3NP9FKuA65IT9WednR4gf7TsXkKt2gyrDn8n
 x+REdnxuIrvQWeRLz11fyX+tCTBG9hobLp0bJHbJYTfmmLNjS7Jf/mvDaMnNsZ/Uk8Tj
 XC+5Y7b8m2T7nv3MUAYh8D22Ajf22KIHURGiLcfmvdDo3rjOmFN2/2pc2gzHNW6X2ZCM
 7oA8RyWFz9ZKndHukWyUlibfqsz+NYeLLNuqREaskDPAQf9IDs06mCmzLzaz+FPFlC0c
 LcuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXmAqcwPTcXeH5XCyZIE3GIwgRaYU7I8RjWFYu7SWiemCbwnohn3vV5Pjg/t8liuqlui+mOg7fOoHKEQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxsXVy1v5UTSy7UYAYbiWtR7VI8QfVynYYmelutieqA+FFfoy9n
 ePVABc2cV2GZbCRz7iR8QmtPi581TGTVFDd/6KXS3EJOM0fz2Rw3P1EyxzVwHOp2FLc=
X-Gm-Gg: ASbGncs9Dq2hH3RWynSoCdLy0WkRlzmyBPdoB2dfjMWljX6YSMucvNIxP8ynEyO25i6
 PB6rYffxGV2t+WTf+wNyZBMHLbhS23f8usP/F0/24aVT8ji4FnFk8U+erYSw/a/RRoYBOUIP/vo
 WBTx+a81uiu+R3Q/0fQJ0BzeJC6PLUgLiqNEkHwAGe/L2NeAmUJq4ovWa5Kz54ZB1szuXinLcZn
 hOmnF9MGV7cniftCcPVapLoczaoxa7C5+h7SP+oJsdFzSD6+tPlvqWW7yIYdzYE4DEqpsd7Nlo5
 0zu2i6nqUSXQ62n2Ku5L6REZOK+M7JSfXEZZZDta2iX97jAb22lOTV84iEqBkgHkvbuVtZKOpVn
 OLRPuklWZ101aXnuhF87TItYJ
X-Google-Smtp-Source: AGHT+IFdVlgR2Uf1ca3NIwmvbqqLhuhd81ZtRnQK2kc8IJiQBuEcYZM46ftlzImE+aVrkBs1IL9pwg==
X-Received: by 2002:a05:6000:2010:b0:3b7:9d83:5104 with SMTP id
 ffacd0b85a97d-3b900b83ce4mr9953008f8f.51.1754903422254; 
 Mon, 11 Aug 2025 02:10:22 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6841:8926:4410:c880])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c453ab0sm40220239f8f.44.2025.08.11.02.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 02:10:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Date: Mon, 11 Aug 2025 11:10:16 +0200
Message-ID: <175490341188.22509.14430833125542251906.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250728060544.18169-1-alexander.stein@ew.tq-group.com>
References: <20250728060544.18169-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 1/1] gpio: stmpe: Allow to compile as a
	module
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 28 Jul 2025 08:05:43 +0200, Alexander Stein wrote:
> Add the necessary boilerplate to also make this driver modular.
> Keep the subsys_initcall to not change registration order for built-in.
> Also add OF match table for module autoloading.
> 
> 

Applied, thanks!

[1/1] gpio: stmpe: Allow to compile as a module
      https://git.kernel.org/brgl/linux/c/03db20aaa3ba3998b5a025e243b04e33b5bdefa5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
