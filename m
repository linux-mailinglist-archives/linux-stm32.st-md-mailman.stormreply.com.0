Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9F7C0F060
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 16:45:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1EC9DC60489;
	Mon, 27 Oct 2025 15:45:09 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3148C60488
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 15:45:07 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-47117f92e32so42936995e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 08:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761579907; x=1762184707;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BBmZV3Vyg2J9mVCwrX0FEpMqEZn3TiFxaC6u7B4A1Dw=;
 b=vxhFOD0knAWtMwQODauIoGSp6A0yL0l40RDYLarpQakBmGGBZT6EnHx9ZLBBGuMrB3
 47PrDg9rY9mjamYYiYcGpuMCGlac/RsqaeeKyMRfxZPXUG8XrnTCaD+x34tRZq7xNSs/
 3ORbUuqBrR3vGGAZGCGkGUZuZkNHZ/FBhJCqsQu5tEoBYTemOcQ4afYDqui3EFFLXi1T
 sCUjqryHxt/2hwYCPnUBn8t2q6v2psGV1qHxsEKEc93ABZJZns8BMGdqOmSme5rVBAHw
 nOs04TpGqImrv9UqeM3o4ra4Uvp4gAKicsuZdD0KiT5kvnBvLQHBflgV1jr11F+FiUND
 UBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761579907; x=1762184707;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BBmZV3Vyg2J9mVCwrX0FEpMqEZn3TiFxaC6u7B4A1Dw=;
 b=XKGO6kxvlSinbpwax0EbIXj8s1p0Tq4yEcPIt7bu/leTDoKKDH2lwNC6uPXR4h5RiT
 ykJVmufKbFdo4cdPSI5PRNVG/VndZROiy7naZ0LwddRco/9IL9cTW6xuNCejI5NvQJOV
 dQnA6hhOvNtdRdeWY/nrICYYvoWGejsogGVYS3q4VmV0nUuC456qD70ZKese3Q5zhaL1
 UzqU7xqQf2gdhf068Qoi5Gm0gI/An0CZwAMsKNk55Ou3nrsemnUk4wgER3hcyqc+b5X1
 79I8pLpvCxR42lpvU3jiN2m5cNFaettl8fNt9k+JOjN8k/878Yuy1mOc/uMTqlz7Rgt1
 oEfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/l5YrmUrOlmBJ5hMxOkPc0uh1thAWwJFMmskRNhvfvQv4Ebk1vmGyk67KIxlmj7+Opor3YVUkbscpBA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxSt3tcoorboM70eqoYJktOZnd+ULc6GwsWlE9zaciZ235lwv+R
 mNm5y8fTAXnqXWwhkEm5VR7GfWqe1D5ASWdJMbFCm2nXOFaRzCM0yKQJZzfK9TlDnrg=
X-Gm-Gg: ASbGnctDGvKZm+Lm9N21WWXvVqI674pqQ0fKc3eWPZSK64hHulsd+gQMAMV3ynkHdDP
 dnZJQybnW0nYr0U38QQ18FoUGdx0r7jZbqSGBtxCFXLfWY7wXsxcflVX9pIENcL5WBlBGLeJNxQ
 jGSiXP7yZGacGbuesXN0S8NoNQcXmyOrO4ftdwkOmdfHmGR9DX0lCnOdsksr4oWuUPzs6V9N6LG
 Jz4Rvv8Sw5c6fX/VlSbGkttHYkTd/JWgyOnaWZfWLAuR+h2ZQWZio1J6foJt8hH5Pdl27jKAsRB
 ulb5XX/6B1u/AsFl3FKYNjUIR1PzK7oRV77a+rTdUuA525+z3knX6tqwxNjLrklygTNI0/U1tMC
 smE0nSV4QDUg7S+6Y9eUrADKGn1HAAoyhoerkXuqa5M2SafEeo5HOipSNJ5BIXu/Ty6nFDg7aYC
 ZzsXrc+w==
X-Google-Smtp-Source: AGHT+IECWyoE3V6eNyQ+Ni8Ig1arWy6NtdUV/t1u+09OLLf2glJJDnd/F8BXPUeWLSqyq4r2HXl0iw==
X-Received: by 2002:a05:600c:3b1c:b0:471:1b25:fa00 with SMTP id
 5b1f17b1804b1-47717e633acmr828955e9.36.1761579907219; 
 Mon, 27 Oct 2025 08:45:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1c6:7dde:fe94:6881])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd477d0esm138708045e9.0.2025.10.27.08.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 08:45:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 Oct 2025 16:44:51 +0100
MIME-Version: 1.0
Message-Id: <20251027-qcom-sa8255p-emac-v3-3-75767b9230ab@linaro.org>
References: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
In-Reply-To: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=mTsLMd9S404QxSew2dDaObEMEcD+rURz88/DzU+Cui8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo/5N7EtUYevy0KNURGjAbWD3ayjri7A65CXIjY
 quz63CLKUGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaP+TewAKCRARpy6gFHHX
 cpbXD/4rW59U3OyLKQKSjyyGQZLRkkV8UI/gn6+DtitezsllRAWiFL5xVrZxt57QxejnFAXi8D2
 ES0aolYvT57xfwVmbnieVs//EfL4Nq2ufUvnOJRYovEMS8cCxZ0FdtbrDV55ZFA2xHFcRUbpeGT
 +kcbYMDKWwu7pmV+biu9VEX6h1ZsuN6inepunZO6CYaGeUQOFyxJgf7ZY+nVWGvFsttL39Yai+d
 47t+qO1FSkpLxuakyURveQR1OsD0K1NInybeUmT5ApMUTKH2qNvpINsML4eTdL8yQN1zDL4mJjO
 zvN7lHjuKVJzogJnKQ078cHKC4hZ37wTHXuLwlHMG6URPvJbZj5MC8vvsU+tYoAnlNa5og0EUSZ
 R6gp5VYDQjzuERZnenBkmnx1WxQWAELVzPGpjwiUZ4J+UjIsk924po+ncs6LLXVCzuZx2uVzOEF
 y3FOVDZJSxf+vY7AR+vS8gkmZX/d1ZK8IqdnG5pOqB0wClGIfY1ZHo0Fqi+HqYfAvQocNAD6Bds
 m11j2pa6BtW2jcLPAxKE0gGZK397ZfEijSV/fIFP+LU609n2HiR5LiLaZc5BfPjYZgBAezW96l3
 0WyQf+SCZ6+fviTWrnZYwhzrLPFBH/4e4GWB1aWkoTnrXpLB9ivxHseQnnGvlI6MPkZ5n2/WLxJ
 /yj4Q1OMbOUwjFg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 3/8] net: stmmac: qcom-ethqos: improve
 typing in devres callback
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

It's bad practice to just directly pass void pointers to functions which
expect concrete types. Make it more clear what type ethqos_clks_config()
expects.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index b24134923fdff0de8b608c140dfb8ffaccd19303..ed799da4e4079b4da4b555dd119cce8c6591aa39 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -740,7 +740,9 @@ static int ethqos_clks_config(void *priv, bool enabled)
 
 static void ethqos_clks_disable(void *data)
 {
-	ethqos_clks_config(data, false);
+	struct qcom_ethqos *ethqos = data;
+
+	ethqos_clks_config(ethqos, false);
 }
 
 static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
