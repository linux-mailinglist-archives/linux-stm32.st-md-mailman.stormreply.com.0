Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A33A0A997
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Jan 2025 14:33:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51213C78028;
	Sun, 12 Jan 2025 13:33:13 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C71CDC7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jan 2025 13:33:11 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5d3c1f68f1bso504800a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jan 2025 05:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736688791; x=1737293591;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TB4adxko33N4lxV8vB34w9Deg0raCbTSnaXjgezepI0=;
 b=mKp67npdRWv1h/o3PFANkHEB2tCK8LN8W5/WuuDPHoPohAkM/AmhsQ1foSbVnTzyEk
 dEI0PXCnCnJNWenB4rIPlZmIINQLsKMplnWFfEdxJik56dJR+4SG2O7Jv0DOpnW/0Dnf
 QiTFgMgp7tycKlS1cG33wt/eg5YKxnGdv6EHi+tZ9odCE55TCImXd3CbBhsEmcyW7rC4
 8HsOJJWxlT5Xlna3ABGhZ1SEnlFdsK7HfyxzbpAmBN0H1wxuNROF9Q1mYvhHwcPtZwe4
 guB93X3rvOLYNvQQboJAl8dFwFwDna8wpCxlVI80dAijRAdtBBvwF9tnynncxmY0RPFU
 CJlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736688791; x=1737293591;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TB4adxko33N4lxV8vB34w9Deg0raCbTSnaXjgezepI0=;
 b=dvHWPCTuBo84ENgSfkOZMX1LoB+lCvcgWxOhGBk2Izc2B5QhPD8ZHSIvI/mgIxmOs2
 cEa4k0/pGjICdRnuHq8p+UsE5AZYu67gi2+TW8kPfAWmXMrEPlCIreHmSkjr6FUkgTQl
 9nR3MsWJEsIFdjZG8zLbqFB04LQ0y5djYV8CeazAWS2OsgI75xEE4uYOdKLmUdEWya6c
 +KeNLZw09i47P+xO4uKrLMTr7Mi+U7y9wuUKHi4l3SFWZ/NAttKaVNnyJeCcdyGCR6q6
 VH0lKIhUmeTXjFmLfHub3Q0wOUQaLCdcQGfqJi54oP+/sKS62LiV/PQGJISyGM7Alo9e
 HpJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/d45WSFriEWrb9O8IKdOTfn6MX8RNFeHG9bky7jmK114vnB65xVTsE3e/AH1BrQ6ioVauthiHciXTnw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyX7EQ+RInEdOWsGfAy2EzcIGPzZA/zesavztFl1PVDZVWES390
 4ubjkf7lcz7BrRSny+nclaD0lcxNdI3z2xy506xl1Ld922ddwg8qh8HKxlGD+oQ=
X-Gm-Gg: ASbGncsWfYgvJf40aiZOOLRAGr1xjqcvKhhLRC5BhX/uR6uj/6Ws/J4peRFE5jzmX+M
 PghTgYW9grFsKR6z8E5XE/cYF2WJ65z6WDm5f4nTYfLOnvoxReFMrljrjUJlpzxhB7ex6PzKx9+
 JBxlbnawCFCyPX5VZ4WpD+Qr52bMT6WtjZ1Zoa+jnw80EMZ1Gd/nIxcyV2T2DX3KTff4ST51X8d
 WGZQv84zhiggu0Cugi237E+la17Y+UlrTiVd+QAmHDRre3VK6ePeKbrtJruqYsS0X7bHaGU
X-Google-Smtp-Source: AGHT+IHIeA9RUVsHVjCtYBXrSzIpeTFeEgLh0b/t4eC6XNfpXfMITPN9fmFvIdYvwM7BkZDK6rGKqw==
X-Received: by 2002:a05:6402:2355:b0:5d0:8111:e946 with SMTP id
 4fb4d7f45d1cf-5d972e15f45mr5790801a12.5.1736688791295; 
 Sun, 12 Jan 2025 05:33:11 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9903c4477sm3584609a12.51.2025.01.12.05.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2025 05:33:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 12 Jan 2025 14:32:47 +0100
MIME-Version: 1.0
Message-Id: <20250112-syscon-phandle-args-net-v1-5-3423889935f7@linaro.org>
References: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
In-Reply-To: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
To: MD Danish Anwar <danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1641;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=56BLcFVoX+7Lw71cTwO9yffs0jhx9suVmg3Qou8SBBk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBng8SEkQmvfABZs7QuVyVH4wapih3fPoh+Xo3JF
 lM90gZIsb6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4PEhAAKCRDBN2bmhouD
 14yoD/9oAXKquSceP15cb4gscg+NjoZ+s/tq5Q7p4hSunWTAFL8/Wd9T3H6hKFgZZce+fKazJeH
 OuMNJ+xcL0SXlWwVY9G4b9YXdEuYoJA6TSXQUiajhx0AbWHblwVbebmLTEJVyYxSPWKdYMkDOM1
 TwZdHK7mwNYgdJvCSJ5ND4AME0ONupR57eCjYKJHW06hflFBoqQ8JoXGpkG1cVrGrD5Yc/OpRdL
 qs0TPrx9Pcx0TLduLA4Y0WEIwAjWwQqipQVQXuiGf7bJDAcmgmrl3MMGhztBFz53tcAzWArA+wz
 vb3OxaD76FgG1AH8bHu1gUF6XiOMqGyO5MNclKzxnq20cnvmD51A9HJVo4AZ6Kn5iyQ2Uc7JAmX
 f852BpZXk+tD20hJ4LWw1CunjrtcZMKrTZs3KwJJqwhYUcylqd5+Jud0bH/kIJ0hy0kr4HV12ME
 3cNiRRBx75ErXkyDnOh85zzcqJ1wHwyKln9Bu5QVcuOFmneuqUyzyCf1YYN/Yo/V1dGEMoThVcc
 Q91OFMfYpRjz4xynGG/SP2H+RVf9RMxS4KE0TyKWEUrX2T7KR3PB9WV0SZsrOss40nqpKqD7WaP
 y8K8kyRxarGD7SGNq5RqQXaHmQcDpKew2kHjLq1oC/56T8THHvlHWulDPgyaCHBrlE/uSvzogDW
 bj/Ib9m93TZhnaA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: imx@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 5/5] net: stmmac: stm32: Use
 syscon_regmap_lookup_by_phandle_args
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

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

There is also no real benefit in printing errors on missing syscon
argument, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index 1e8bac665cc9bc95c3aa96e87a8e95d9c63ba8e1..1fcb74e9e3ffacdc7581b267febb55d015a83aed 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -419,16 +419,11 @@ static int stm32_dwmac_parse_data(struct stm32_dwmac *dwmac,
 	}
 
 	/* Get mode register */
-	dwmac->regmap = syscon_regmap_lookup_by_phandle(np, "st,syscon");
+	dwmac->regmap = syscon_regmap_lookup_by_phandle_args(np, "st,syscon",
+							     1, &dwmac->mode_reg);
 	if (IS_ERR(dwmac->regmap))
 		return PTR_ERR(dwmac->regmap);
 
-	err = of_property_read_u32_index(np, "st,syscon", 1, &dwmac->mode_reg);
-	if (err) {
-		dev_err(dev, "Can't get sysconfig mode offset (%d)\n", err);
-		return err;
-	}
-
 	if (dwmac->ops->is_mp2)
 		return 0;
 

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
