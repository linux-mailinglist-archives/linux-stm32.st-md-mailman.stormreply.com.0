Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B85AFAB2FC3
	for <lists+linux-stm32@lfdr.de>; Mon, 12 May 2025 08:38:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77EB6C78F90;
	Mon, 12 May 2025 06:38:41 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8EEF2C78F90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 May 2025 06:38:39 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5faaa717cfbso563828a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 May 2025 23:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747031919; x=1747636719;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m54qQDPPwUYYIp+I0ulLXNvjU7U+yLbsnGmwxSAZCM0=;
 b=bdHxCmoemxpU+fKlOW65MY3yNdV1g7TSV83ESNtPiawspsTEvoLHok/YV7pgEOTFPy
 6OmAnHNPsqYynNMNb9T9WPVNLe8vAB78P9JA32hodkQkNfWco8WK45rPZtXSz4N2ewiT
 LzMdvoiEo4KDLwjmV/P7DnIKfCtD243eTAa27oMS6oPW8urZY2yP7D/rA6TJsu2yEefu
 1XQQbrBOtkA7D5gTc96TA1uVm+dsZJb+9whLdBNYvowM2t0LVILfdkZBvHGKlmjw8TWh
 vIplXd+D/ia2iCkPxbwLUwQSg9nIYvz898WYCt90YWMpZsfFWjnY+bu7yePzQw4fdyE5
 XK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747031919; x=1747636719;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m54qQDPPwUYYIp+I0ulLXNvjU7U+yLbsnGmwxSAZCM0=;
 b=jvhBSrnaxcZTLvKeuVIZUOoQqHuQj0z06Sbygh/uCNyj76ULODk49aqdQgEsN45+kR
 gwgdHWd88qMV2Anh88L2F6HL9pX7AoYBvVktROMhQY/EjR8nAWq5hIp99L6dQtku0LAt
 SyI4j1Gh6f06YsII9tNvfZNRgNNphJGisva/sfjTyMufKt+h6HOzCpU3jqt94ftRAvZZ
 GLBClF3TdZTz4Niw13n6/6/WSLMhTDHF+EootmYh+enu8rgvFSM6K6BXB0IhsdvTU8oI
 W9IvBLkvvvHyxe39F4zQhBVi4Ol+YLPkNZ6pHduXTN2bBMHpJidDNd8fBrurD0SvzaW/
 YcIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHgU8N4aqFY3k92Yk2BCfgnpoADazc5JcAZi+ZHyNDNPzYG9pp22QE+D6CHPDDJcQqCS06tWePpZdWaw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YygC7NzXRqOrPC0trg/Ta3oRwA2GeEE++7l/18+7XcrMb/DRjFS
 j5z3oJ7jxU7fCR/QHSNCFa+2hyzBejQfJsjk1TRlrTuvX8C1liRsd2SQCICkmtQ=
X-Gm-Gg: ASbGncsnaxv3RS+opLKp3nbdQ87Tt0NoSFCEabEzamFVNL/MPtLVxXrCKpEqgArSX1o
 a4kftn5Go4Q2DfOa6ZZe2CEM5BqOFjbGaYLiq2CuWmuK4BoXNYhBK0BwVZeaSpCKod+dmVhY8cr
 N4bIl01MeIWkdOxZZ/QWkSyHAPZskYeIg38fw6JxrBm31S57v3rHNz+8rs14+0+RKFvMQ8VfP9F
 /YjrpuElrRShnrogDHxdGKxgZp/Uaii0JSl2kCUfc5q29Njg3WfmXdSNci7ycl8GdCyr668shxH
 8P0lVhRYl2+GIMzP5Sd6UYazbohrjJLJQL1hR+JEIEp4Rve3p9MRkNeBw7GQizY7O574vOU=
X-Google-Smtp-Source: AGHT+IFllBd+sniRuVcx7zlk+9/gEDgyoPcBo885hliuUygqoRqkFUwovnLuRvDW0FgmF20AaaF4RA==
X-Received: by 2002:a05:6402:26d2:b0:5fc:4043:dade with SMTP id
 4fb4d7f45d1cf-5fca0793fa6mr4040273a12.5.1747031919022; 
 Sun, 11 May 2025 23:38:39 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.234])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9d700e92sm5210075a12.55.2025.05.11.23.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 May 2025 23:38:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <cover.1746781081.git.dan.carpenter@linaro.org>
References: <cover.1746781081.git.dan.carpenter@linaro.org>
Message-Id: <174703191772.30920.1274669600667314405.b4-ty@linaro.org>
Date: Mon, 12 May 2025 08:38:37 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/2] memory: stm32_omm: Fix error handling
	bugs
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


On Fri, 09 May 2025 14:04:19 +0300, Dan Carpenter wrote:
> These are a couple bugs which were detected using the Smatch static
> checker.
> 
> Dan Carpenter (2):
>   memory: stm32_omm: Fix error handling in stm32_omm_configure()
>   memory: stm32_omm: Fix NULL vs IS_ERR() check in probe()
> 
> [...]

Applied, thanks!

[1/2] memory: stm32_omm: Fix error handling in stm32_omm_configure()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/d44eeb20d9bedce11297a09628ba5dd39db236be
[2/2] memory: stm32_omm: Fix NULL vs IS_ERR() check in probe()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/0169a24036848cf18205301673259bb6879eef97

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
