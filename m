Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D99B51081
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Sep 2025 10:07:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E11A3C3FACE;
	Wed, 10 Sep 2025 08:07:55 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FD07C3FACE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 08:07:54 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-45cb6428c46so61006655e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 01:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757491673; x=1758096473;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pG70VB/2THcHEf1bbNlRsLCEdjUZ295qJspYMOYZW5c=;
 b=x6j3BeNWCQ+aG9yEODmWnwWlNGDOG/jSg9HVkcvFR9vQDUMrfmr5vH0d8BZk6Cdnnu
 nDRJZ7mgwmo/KLlukLQ6hA28978XcwqHUxbnJ5qGoELBKfiIZ1zOa1qExUv6FpyKcF+f
 c5fsIYCegI95BnoUT7c2air0IUVeqgzbWSiW1rISvjR3N5ngbHXVqT4+M9BwXj0tdSyL
 n3wK6XovZjbPgIYcEXD87j5/b9ARoPMkIVeJVTDJvmyZ5B/1s7pMLVAKDkxXWdBPYlAk
 lhvK43ZbtKdjCfNEgx3XcCzfaenZSx79tpsB1/TwQH19AfxvSzYDREgY7VHSDp1tsexv
 PO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757491673; x=1758096473;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pG70VB/2THcHEf1bbNlRsLCEdjUZ295qJspYMOYZW5c=;
 b=r7yjLVvYTz95s7DB806FUnoMr0tRIpAKT+5l6vsgwOn7zT5AYkXDlFGzxd3JGD/FmE
 ipomVa+BoHtMXcY8qCpUD/Y2lZX/uMgotn/qOyIBdTLaWxPWNsY0t93ZtvvctGkkzB02
 QkF8ph+myM6EKv5CtKIQYKp1JiWjooOf9ziQviNqIlGFIpglE25nayzz8loDPef+Pt4a
 vjANETnnr2mPT94t5i91FH5w5eN/vUtqoiItY/vpZ7U1gUPLBkEwcmI7U3Q4caJFEWaz
 ApL1I0YiJbhSSYpuzA+aZ3wMUx4CXgPAgfXV0ucxdT4HVxS+otKJYR8yEVZhhzWsnxv5
 3Jqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0xET04HACTLHoChBqT7wHTFqmoQb9MCzVaeowTlnA0sta/ZBUP+JGRBE23zSh48AbB+jcbdfjCo62MQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz9HA9NmTcztSlKfyhSpvs/x/gExp7SqZXxPqVZfmOJaZhOTmNP
 XmJAZhlRQEonCskd0wNbvVpWoPPGNkpiZkF6RoGZwCTXxDvjlc8i5Iy3+dyuUCMIrI0=
X-Gm-Gg: ASbGncsuW1ArkdHBSTSptrBc0AIGldRCuCnyU/cnJ8R16JnU24qORuhPk38RaDKEc1g
 RnJMekiAQ/kRYnHU+0sQM9iezAFI7eVT3apzL3FtVfhxO1PNXExjrZdPMNd+NwMU0F/9vdffFxZ
 Gly7nBZETGmLMcn6Yp5pH7jA4jm9zC0AlyEc8GiS8QymBZlK6IXbxb59BscfHzhtAQiyo84CJOs
 letnRpqq8agpM0S77++H229cjLQm1ymPYnsAef2AqwmTi/hEbrNzMp6CV9CfYUsaNDCGDWr+RUM
 PYX3s7rFiUvV/veapochzVatXn0lw+5e+6cNo6+x9IuzEVw5y8APqf4Bf09kkCa0S5njlqBp/Yj
 uptC+QqRrF0XW3imFq7xtOqlulHrI
X-Google-Smtp-Source: AGHT+IFjyHooIgPzsIu5mjEBNXpXbM4EqzCxFwgK0R45SY2NiW1XrpvBRtE5XdvWfXqw4HoOsFUisQ==
X-Received: by 2002:a05:600c:6305:b0:45d:5c71:76a9 with SMTP id
 5b1f17b1804b1-45ddded7652mr141100805e9.24.1757491673453; 
 Wed, 10 Sep 2025 01:07:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45df8247cc6sm17813605e9.12.2025.09.10.01.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 01:07:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 10:07:41 +0200
MIME-Version: 1.0
Message-Id: <20250910-qcom-sa8255p-emac-v1-4-32a79cf1e668@linaro.org>
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
In-Reply-To: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
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
 bh=XKd4Dvzw0ejsOil4omJOz8oD8d0/SZudynnYpUwSWG4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowTHNFd6+XtHbiUlr0CBiyUr3sDo3TcopvUbxA
 Cez11/GZEiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMExzQAKCRARpy6gFHHX
 crSCD/sHgzl01Xm7vNRAaVRSRvpCpLopzb9hsEChofm4FjfDYUIcvTtJaJuDjU3XhHdNDwZV9Zu
 Jvj61hgts5CXRzx2EblTpQ/3DuiqYeDUlYoRNrKZ+bFnX5AXAVq/TA2zOzyXsWrNbUAaV1gNLOz
 VTz+PAVZGKpiWFDBpYusQE8juIR6bh0tEB17WWbbhZV6l0uK2fFCvllZG1nNk3SqJ5qG36efTPj
 /6VjOG1kimbc6GRwk5dLbYporMJimuedb5ycfMKxPqv+u3sJ1GTEbnxQDx9BxF/u562rsqfxazv
 mXGxtvtw56tQ3NaUCvLlWl5uxCMVhqV+jt0c8yiUxhssWPP6jK9r06eAybsTAVxChagDzakxs01
 n65RPiOgqoEuSqlYQpchL/l6Vjst4EKT/9xb/qi3pqlJTpBqcSyxiri6drcKDGaxihhe8w8gmMs
 sYLzxlL/oqpOYFfhL0aeFEA1WTGBYIeYQwsezafFr0CpNawRbrT5V8AuBRhSVZkNelEuFmYE9SI
 oAXG5zUxUzYb6LOW9qQ/LhFF6/plZCYbBsZP4cWXfzas3rXBaTecTfEcRctYXDXFmc596Gy3CTw
 eDYk7Xqxz1uDVEZOr5HoOdY/3M6E7CBtmpvBdIIMuVmWW43k8aLvjHK8ZWqdpWkIQ7ijqwOkMFM
 DCJTB/f1x5kcYUw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/9] net: stmmac: qcom-ethqos: improve typing
 in devres callback
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
index aa4715bc0b3e7ebb8534f6456c29991d2ab3f917..0381026af0fd8baaefa767f7e0ef33efe41b0aa4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -742,7 +742,9 @@ static int ethqos_clks_config(void *priv, bool enabled)
 
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
