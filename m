Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBE9AABF95
	for <lists+linux-stm32@lfdr.de>; Tue,  6 May 2025 11:33:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C55ADC78F83;
	Tue,  6 May 2025 09:33:29 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43A0FC78027
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 May 2025 09:33:29 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-7c5a88b34a6so576047685a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 May 2025 02:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746524008; x=1747128808;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oUQlHE3WV+AglG3E1dueIGqmAdWvRG/aDbQh6p9Pats=;
 b=dIHz3gjCSkfgbjWgwmpbg6cCIrv/Tu5xpp7ExB0T7JSnkowiz3bdy83PweRhIIFpCH
 gSODq4ELSfmSaHhw9IK8j3GdGA+jsJlAzjQb2Vbfju5M8vXO60uYlJtUhHpioJAdKGq2
 rtPpBLQzN5WQFX19JFiWLuO0VeWHh6ti8txFYxOpi96w668E5xfwQtmwePRIG5DlnAxo
 s5b0QHHU546n34bAGwF1lLXH2l+XImOLdspPkT7Ke5kLyjwr87NrX93ukM+boJof4txU
 qTZZEbdL5L1E3Tm6NHgO5IJfy7X9PedVuRCv8pKYrO46CTGQonF0KKFx8MAicX239/LK
 msyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746524008; x=1747128808;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oUQlHE3WV+AglG3E1dueIGqmAdWvRG/aDbQh6p9Pats=;
 b=dfs3BAI6HUUzBEZFLJxXnB3DNdsbMnd35GCZIxG29PWykZSbi2yAJHRVeHD/xv2TVg
 mvSY4hOOs+3VbZwuIHWad5I5loJrUrQSIE5/J61eim3uzqQBx0ol/qyD+Jlf7deR8BL6
 xLMXFPPXmjw5duEVvZ1Ud9pwVB6xrvWVyNnjFK5LHeFZV4CT67+RKzOjX5/ZAjOSUtBd
 MYir8ejUVugZa14R3VW7lJErIKjz0Gnjhijj77wRUF6r2tLyKr64OiG4EHw3zFFZeSIP
 RxSJP25qcx3eRjEvgNscQSO0xqRXxWtnOS00IacvWpdS/pBuq65aHUhrnVl53zANANrS
 mO6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7Ff7NwYbj+chbRCRty3KHX0kdSHG0w2l6RZlqGlnSQyypJvjHTxRZbWLvUw1IWsJZ+iOcCZbX1PqHuw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy2fnMC0TfhXjcivd0hF6tViVd58EUIE5Sw3cMVIDMRGX5ogVxK
 jYlDAT5IMaLwb+JC8oRbDZy2OuOf5dkTYJ/Zmov7KmtrvpfapblZ
X-Gm-Gg: ASbGnctpyDhb88EmeIE0N3t8ZUCrOHCz0bVNZ9M+mQ8xBmmIheajLER3Ws0DOJMD63D
 DUJEWuQDS/8zV6WvFwx51dX3cqn78Iq0BAQTv48mM1CaqHQLY413SBq8PRO8gwoi3/BTDfGioMo
 x3Gc7+Pmmm2sFR9ATh5gmcSYfBEHkjMOFxhCpCxPnd2BSh8POfcweWxs8UtuHn9pxC7pZFsnCTN
 VaaER6RxTA3QTWZAN3T1dQD2kHTXBd29AF4wOmLc3LTp7XVSJUdCONH1Up8knbgKXIXCZ5CUkIr
 hFtt5fwaSnjrtwgx
X-Google-Smtp-Source: AGHT+IH3VqzXlInrKha6VmM4WZWfAGkLbfKCYjNCx8kJZ1aXhqv2kgptMAcRo1MHkN1XMG29piZ9jA==
X-Received: by 2002:a05:620a:2549:b0:7c5:5d4b:e63c with SMTP id
 af79cd13be357-7caf09d2a28mr363658985a.47.1746524008194; 
 Tue, 06 May 2025 02:33:28 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 af79cd13be357-7cad24501f1sm685744385a.114.2025.05.06.02.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 02:33:27 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Guo Ren <guoren@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Lothar Rubusch <l.rubusch@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Tue,  6 May 2025 17:32:52 +0800
Message-ID: <20250506093256.1107770-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506093256.1107770-1-inochiama@gmail.com>
References: <20250506093256.1107770-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/4] net: stmmac: dwmac-sophgo: Add
	support for Sophgo SG2042 SoC
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

Adds device id of the ethernet controller on the Sophgo SG2042 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
index 3303784cbbf8..3b7947a7a7ba 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
@@ -54,6 +54,7 @@ static int sophgo_dwmac_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id sophgo_dwmac_match[] = {
+	{ .compatible = "sophgo,sg2042-dwmac" },
 	{ .compatible = "sophgo,sg2044-dwmac" },
 	{ /* sentinel */ }
 };
-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
