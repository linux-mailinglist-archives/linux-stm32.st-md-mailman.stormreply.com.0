Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBF5AB1170
	for <lists+linux-stm32@lfdr.de>; Fri,  9 May 2025 13:04:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F473C78F96;
	Fri,  9 May 2025 11:04:26 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C486DC78F94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 May 2025 11:04:25 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so21663085e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 May 2025 04:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746788665; x=1747393465;
 darn=st-md-mailman.stormreply.com; 
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3yJCNV9ygDRNtqgzkE30hTda74O4Y8KfcrRRQ3zGk4A=;
 b=GaAnYzJhTSHFdsghbpX7w5tonIDAKlTvQnVYDtjF5R3JQikslV8wlKPv51LhcE2LEx
 b96mpRFOsHBdtx0tRVv4mkaD6YRrCRGeRvC6/Auw+SmrXjqyF3U+7+8gzR4GpN6MWLhK
 LK5lBmJD0vACOw+JCfF1vcvpOaXgVIjmv4QqfpY16TJAOf2t3FK0sIWZMn8XSUoxbF1n
 Ze1/7kGYV7zG5p+zWYucnufIH9ND6cKqTRi37K9UgPiDfoOTvgNs0M9555YWU/mh3aek
 X0s3IIEHGfIn64rhlriGSVhPLG0zjPhR4uTvOKl96zxDP6bZKvmAbBq6QDMXM+JA7koQ
 KURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746788665; x=1747393465;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3yJCNV9ygDRNtqgzkE30hTda74O4Y8KfcrRRQ3zGk4A=;
 b=Kh4HzTGT0/SSPmBuZlzP8LPdM8ZxlHQbOzp63r1V+DHBie/WeJR7VRsAGWMoI/J3r2
 x2idP4R/9iEbQjAcuEUBrjyN8eJhQUpYpClipdG6GDoGjap8/zK2enkNXvq8QiDtUE/5
 nxFyePKRsneMml266WGVxp2UB9lNqEUiXti/BzaZ17l6THQ3lJ6abd7YQnK4TtNsL60M
 9OTTasEUGFTTkG99vgxz5XLKIHEzPhBjovElTr3QEFs66xew+DgAnfoWIh37lEYMso/x
 E7C/aHV5rs0z4QCAIuixNigG0GNtau7iJK6vwOY8eo6CC7LEnrzL0kQATnoQB8z/ErXM
 ZEJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfaN73y+UNxEDwXGgHz5RymuEFyB+6uressnAHBTrKStbFn+eB6u2DnxRppgSnpaNQO67JeoIW9gHtlA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwR2Pw27KoZGn7yc5bzjSv2fcRC3fmX3kzgXzLdM+Y7XQky8unm
 otwrMM6NMGmkxcE6CMDMWp6FhfzJO9JU6vDvdvkzaUsAxCjCr1DPpLT+QMLYztc=
X-Gm-Gg: ASbGncsd4nDT2u3t6hWk06fJ62M6YjXEfTUsRLITXyo5a1VcTMSCDUD9we793POAadY
 dVLEYvlixcU68fecJAtKJ5tV3Yklr7X6z0WXj0PuxHbE1BOM4xgbCuAQ1THEWjgJE2ehOLZC8h5
 4zuMkJFFdFXAAsEF6SR0HHUGqOI7QaCUs0g33heCpPXbPZvvtwta/NCf5kyA0BwC+ryu6j2ljDW
 nC17zw3ViIr82/PLDvuxz798Qfa6Y4E+7xHnrZji37z9ztvbU91zYzvd4AxE23j+WNijIYJFvTH
 eNBz9AjJx4ZIBQZY9o2njC0vE8Bx6jUga3S6salgL4UHPA==
X-Google-Smtp-Source: AGHT+IFw8W+AkGKpeFKjDzyDOm27ntxoNpUsFE65aEkWAInoVy+JgWVEmUmGVOr2GtLsFyJO7gfMIQ==
X-Received: by 2002:a05:600c:8205:b0:43b:c857:e9d7 with SMTP id
 5b1f17b1804b1-442d6d98a88mr23417245e9.5.1746788663606; 
 Fri, 09 May 2025 04:04:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-442d68585d1sm25970195e9.31.2025.05.09.04.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 04:04:23 -0700 (PDT)
Date: Fri, 9 May 2025 14:04:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <cover.1746781081.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2] memory: stm32_omm: Fix error handling bugs
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

These are a couple bugs which were detected using the Smatch static
checker.

Dan Carpenter (2):
  memory: stm32_omm: Fix error handling in stm32_omm_configure()
  memory: stm32_omm: Fix NULL vs IS_ERR() check in probe()

 drivers/memory/stm32_omm.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
