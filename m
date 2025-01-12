Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 657DBA0A994
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Jan 2025 14:33:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31325C7128F;
	Sun, 12 Jan 2025 13:33:08 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6702FC78F6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jan 2025 13:33:06 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5d3cd821c60so608471a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jan 2025 05:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736688786; x=1737293586;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ld8ZPAnxgwhvLaqsgPKYU5t+3ZDPQJl13t2skco9HCk=;
 b=PqiE5DSrPbSGsaQ0sQctMxWtYRzDUYFxoeNKM5krbkTFjWsLfhxxxOHtnhAN4NpoWu
 ry4xTmLLqHnM4XoaywNoTou+CFdiRGjlofSrGKnBsZ2Q091fAbIKvZ+EZd70T3AjgZ1r
 qb22HsIRO5X8KoXIyHQZb5vP/239JwczeBGwbHrn7YQV7lacNuhKaKgzRVfdsARvnASn
 ik9sD0py6QFzCQrrkPMDbGlUrQnbR24jZBeIl9l3PNSAok2fTWjVV4VUAKSr/A8rTla1
 xRc6r9CFrBzyys5o182etNLUTEp5Ug6wXfuefWLLt2K8vnXwciharEs7crPpzTxCsb96
 qfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736688786; x=1737293586;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ld8ZPAnxgwhvLaqsgPKYU5t+3ZDPQJl13t2skco9HCk=;
 b=mMvhuW50mcNeqJOxz8VNB5rTy2KxvGWDQbDlf5wT9tjUzxZflyCqcX427POMIqw/xZ
 1FptRGIQF2WaOuDj6HJhaIwWEG7jr21j4F/DnlCng8ro3Dg+tV7v3rdzt+uzddN95wG2
 RkRQfhqJmBy3f7LLBkNv1peCNppInIPdFO6o/thlKMA6MjfH0LReJyQR1V7mGF35qdn0
 yvSbYPhPhgnqhxfjmml+0FmXfYHOk/xBDe5p9lybdaMki92bZx++/1EH3lrC+KlvK1c7
 +MvGI9zpP3i4AXOXNw2Bl7AiFT08euOpSHHkbSv6ludSvBa9yqPOaZF1nF2300Z9hEuo
 L+9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUl2H/cka46gD5r6ThyZT3U9pmRNHbpgMBSGcHiotzjJUaA0VCeAncFZY7s3A3Gc+QLUIJd40y+YbWQ8A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw5/NGkx6IpjtC5gps9HMEliQCnxiFMKzT+VCyzc6AviX5qGqHP
 EAL+L6WHbTjx5ps9sr8M7xRr4hUQbnWV41HGydRvwe5UlAeZuZgEAXUYK6LCHi4=
X-Gm-Gg: ASbGnct4Vpm20Q3vUbkUqAgQmKjZT5ecHF+6QCXhPczvdAclOVcHf3sEH3vD7xojKfe
 XqS5GA4Qlx/uJpjRtJOh/nptd4WJIslaZh84PvrWynD1ff5n9xJUfuSCKo841UnzMlSzERqo1T6
 jbJJOy34Nug35S2grETJCPsvdBUzmXu50/6ToDrEMX98KwfDFdXgm/9Iob8neT52HHZeTmCyRjP
 motHQ8J5o1OX4erXa+huVcayOcA4ga905KpJ8shXQFulhGZVv5BI69AOj5YfWYn0pnCbQhn
X-Google-Smtp-Source: AGHT+IFHwHH4KKIrysGLvqwXWCgJxLn+t19M/gFmLmYbS8NY9BWAcFiBlWXc9XqfFSlrFDFKeUN0GA==
X-Received: by 2002:a05:6402:13c1:b0:5d0:bf79:e925 with SMTP id
 4fb4d7f45d1cf-5d972e65777mr5439603a12.6.1736688785817; 
 Sun, 12 Jan 2025 05:33:05 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9903c4477sm3584609a12.51.2025.01.12.05.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2025 05:33:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 12 Jan 2025 14:32:45 +0100
MIME-Version: 1.0
Message-Id: <20250112-syscon-phandle-args-net-v1-3-3423889935f7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1702;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=BLKjHvMGwRWG32GZtZYj7md0qQ8nB6LVGjC0kEjtJ8E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBng8SDFkc9BxhB/j87J5OokfF6ZsmgjWIg1zax0
 EyCdFlFVjaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4PEgwAKCRDBN2bmhouD
 1x8AD/9Aau/f9uUdyr+OxKVQyIA5u+wnl31VUsMUYoZKktqRD/7R89XQcAZ4Ihv5P8LoYFUuGSk
 Ietj68aVH4LJP5HlzhkuI0R7ergp7NNod0odUeR15RVmyU5WQ9YSj5PvBGpfHdFPuefkEFt1kfw
 6FNRml6vfFv9oNkE/EcY+g5RtQoSyyAzH5P42KSjH5G56gOJaaeUOQzRP45DP89NXKhbwdOz+cV
 IoU4HZYVAU6EnU0frwulSeum1/Wg4j+Je/kk8DjnQqGSTYQJisj6bKHLettlVZ900rN9Kbfcqow
 a+1Xr5Ja4Lh/z7Av0ogch3QekPRI6lnIPkOX1TpY3BXstIKjyO1KQqVuNTO3qUzj7qlei8hNN0e
 kzDgRqCIU6AqAvU+T43YltB33DLbadSqmwoIYu6ezF7TxsYDGuMmqp9DMpPf0sZrlxHKBI4kkYi
 rX+2JHrdxNjwS8F9F1y2KD6jCrNdECHTMq8e9FY3rhyHN6HQE8kVCV+/JvnwQvxdDbtT8dnjQzX
 /7r7MIXSBoXplzcK1f0vBwLGGxL5mjR3/WmzgH5zpEQth7DJvvIj+FU1F2ZZlZ45Tr6t9pStmgb
 P02MIOsocH27LT2DgRYEF7Qv0xxUSKyva8FtwrioyZg7dKpYTmtz3UkJn7bGdPUxEGY1A5W2OKc
 ophfP6EMaGl2RVA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: imx@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 3/5] net: stmmac: imx: Use
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
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 4ac7a78f4b14b95169787538b56dad7f7fe162d3..20d3a202bb8d16743ba4f31fa8ebf19a246e8236 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -302,15 +302,11 @@ imx_dwmac_parse_dt(struct imx_priv_data *dwmac, struct device *dev)
 		 * is required by i.MX8MP, i.MX93.
 		 * is optinoal for i.MX8DXL.
 		 */
-		dwmac->intf_regmap = syscon_regmap_lookup_by_phandle(np, "intf_mode");
+		dwmac->intf_regmap =
+			syscon_regmap_lookup_by_phandle_args(np, "intf_mode", 1,
+							     &dwmac->intf_reg_off);
 		if (IS_ERR(dwmac->intf_regmap))
 			return PTR_ERR(dwmac->intf_regmap);
-
-		err = of_property_read_u32_index(np, "intf_mode", 1, &dwmac->intf_reg_off);
-		if (err) {
-			dev_err(dev, "Can't get intf mode reg offset (%d)\n", err);
-			return err;
-		}
 	}
 
 	return err;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
