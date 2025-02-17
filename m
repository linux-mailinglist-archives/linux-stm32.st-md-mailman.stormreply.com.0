Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F080AA3821C
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Feb 2025 12:43:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5480C78F87;
	Mon, 17 Feb 2025 11:43:42 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9369C7803C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2025 11:43:36 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4398ec2abc2so437045e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2025 03:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1739792616; x=1740397416;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xvO6VVVrxL25G9tkhpz936tDjybjrpvtb36RnaeyFF0=;
 b=h8PB5xmxBhlWfvCeCTIPvu/eR+uQLYKz5pTGlX0FHckXyjwzXk0bFDZuswD2IM2+N2
 SvSE+z7Q1se6we13U38wMPO2rJXBMun6p/M3NrXHoXAI7zeo68hjXm61Z7gaZHHl8rb9
 8QGSVwMg4GjjhdnNGCV6IOzKrb8SU3fy6sEjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739792616; x=1740397416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xvO6VVVrxL25G9tkhpz936tDjybjrpvtb36RnaeyFF0=;
 b=d34anKzxtxAfyO9vwcshdAtuDYM3cAWENhBtPaqIv2bv7Qx//mhqgw80QdLrVteMIn
 4ONHyMk5/CLqa45Fro6aTQHgX8MqU78gE9eOHJBHpCvwoktpiybZBkhsN2nufeq6Ik6m
 OG2W1mV+mK4ancioYcTmnDNBdfVIxAuB221lcb6gCnoHE0UGaNfIeTFBuJ6cjhFWv3cj
 6pimO0O9UVL7Bj1wBltgJUwcT39QI6U5mnxeR7uHCRfuZgTKUl09Js47EKAbmgtQH5Bj
 pOuF694WbIbSM5QfiBFNAYMpAT8OH2lVP6wIstAly0xv5nW/sdRsNxfWCiCKw9uewAo5
 5bfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU70MjmAQH8khKZlJIZUbzcoA038N39/lOgHbOXX0imgdXp7cBOA0lEAAKC2tX4pOGaAJQruTNIgwbxww==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YydlOvJ2yKYbRq5KyJzdjz3+1HuCAlI5uTkm2TQybQcg6sgFmqf
 pJTSBCe+sR/XO/fIyl8KBWh9p0eRFxQ6duV87tM6J3hAjBpmmUZ0lN7M9nnSsTQ=
X-Gm-Gg: ASbGnct476P2DDm4ojV3bLxv6b32GaZ/wLLJLO6dOZGjxsl1xL2Rw2iwWJFSPclf0FO
 iPotC0QuHEqTxn52obkYLchAnG1CGHTi9qP+TFoXg/qCFS2IRltziR8E5LAC/qgyurwTxVqfbh5
 bak3y3csJMcx9Q8Xw3cRGixDM7ie2R3TxBnEVLYNP0oT4pMrjg+5KXVCeNUtc2+kE+PlFOtjfUa
 1tkMups+XqqaFfrFufIiXBwlF4fs9zfLRORG6V6hEkEFhq4tP9qAH97+KcvHeein3Otih936eao
 H/jT159m3NYPk32fxlgoUKkeUaoy7yXWWzsNqMHYkaE6p+SJkX+u+XDXDGVH/bVYzPfBpfQEtbu
 tvdt5suoZf04=
X-Google-Smtp-Source: AGHT+IG1kMvLCwkIlZ/7WxOf9BHdIUQElSPpYHSnhNergf/DVzd0TcB4oDWYyjgd4zWn0XxpcWvmxw==
X-Received: by 2002:a05:600c:468a:b0:439:6ab6:5d45 with SMTP id
 5b1f17b1804b1-4396e73742fmr77147445e9.28.1739792616186; 
 Mon, 17 Feb 2025 03:43:36 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2001:b07:6474:ebbf:78d7:ec72:38e9:87de])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43987088ecbsm18918465e9.31.2025.02.17.03.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 03:43:35 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 17 Feb 2025 12:43:23 +0100
Message-ID: <20250217114332.1098482-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217114332.1098482-1-dario.binacchi@amarulasolutions.com>
References: <20250217114332.1098482-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] ARM: dts: stm32: add push button to
	stm32f746 Discovery board
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

Add node for user push button.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32f746-disco.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32f746-disco.dts b/arch/arm/boot/dts/st/stm32f746-disco.dts
index 8bdd10644bf1..b57dbdce2f40 100644
--- a/arch/arm/boot/dts/st/stm32f746-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f746-disco.dts
@@ -86,6 +86,16 @@ led-usr {
 		};
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+		button-0 {
+			label = "User";
+			linux,code = <KEY_HOME>;
+			gpios = <&gpioi 11 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
 	usbotg_hs_phy: usb-phy {
 		#phy-cells = <0>;
 		compatible = "usb-nop-xceiv";
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
