Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 381DF9BBB77
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB6CFC7A827;
	Mon,  4 Nov 2024 17:18:38 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04FCAC78016
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 20:24:28 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-431506d4f3bso6272415e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 13:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730233467; x=1730838267;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZzwRCpqtu/LaKB65Sh0DA5SNke+63PFskUW28xnczPk=;
 b=FPRS+eIs+YgBUntC7dPp0vIdleF9uefArZUzMxtr0polNz3/y3bEw9PEJhAw65UbhE
 CGyDYXCGkp6xJoCUSns0qCArUAiwgyOaQcVPSCxvhwnzy68/0qxH0A1LcpKlHmnGUrm3
 /hQONbp3CRbYChXj5G5s6wMPEob7rl1LrEgVXClbYc+dyZjZlGFGjJPHuqf0XuxhWKEC
 SIcx0Emj9yottWIPSAdd9WXzJLrJ9ycvxR2fOFldeihjxBHwU5lHnQ8SCWx6qYKRhTuP
 /+5QSlXhhtBVe2Ru95bMH+qRqtlbiFOEepNrjxuaCC1EclX4C6VBNOhtyKgt8E90d7gZ
 TfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730233467; x=1730838267;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZzwRCpqtu/LaKB65Sh0DA5SNke+63PFskUW28xnczPk=;
 b=MF9posXZZDdN6Yn5+1AoB1CYavEqYn0TQbMhiqZRQ30u4DoYyf26Y3Xtyk9rpwUHuc
 MiHZ+skbRqqnYG49OYpsOjKQ/fzBg2uOTIqgeNFs4OH1w3qJf5GlUgaw38DBysWUXAX1
 DC9mTYBD92/BMTCD8hWqX9jqXbIi1YSm27eest5Qa8MYQlbD+6dBscxSR6u9NrP9bsTW
 OHyyfAlIDSHOwxNt//Vi+QcsnzvcRZAY9sc88Q1ujymaQoB/nK1pG7Oh0w1sPNcbhe8b
 xP8Ar5UoDJB31uAbt4OZYsvqAR2mBdtOfgypyeMp+Ra+BZNatPUjv3wyJMm6d+mujbqd
 G0kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLgQWk6oc6TWcbFi2x8375S1WHPj76IIpf4xIsZPtDPlcIWfpSHkCdW4W1O9fBh1A/Lewged0quV+cjA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzAXvu3oVW3cIRrEbQUkpexIEVZ3mSWniCIziGmDHnsWUBFYjy/
 Ts18ahWychez6xeILazVZ6f2YsEItaNhHuMuXECT9lDN6BazeFWM
X-Google-Smtp-Source: AGHT+IGVkLSu4+PWoIJ+coYpkKXLhR5XEyzMIPK5W8wNP/CqB9C8YHK4RGWYMg6MZPBGM3IM9RzNog==
X-Received: by 2002:a05:600c:4f10:b0:42c:ba6c:d9b1 with SMTP id
 5b1f17b1804b1-4319ad236dcmr49969575e9.4.1730233467355; 
 Tue, 29 Oct 2024 13:24:27 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch.
 [84.72.156.211]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 13:24:27 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Date: Tue, 29 Oct 2024 20:23:46 +0000
Message-Id: <20241029202349.69442-21-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029202349.69442-1-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 Nov 2024 17:18:35 +0000
Cc: marex@denx.de, devicetree@vger.kernel.org, conor+dt@kernel.org,
 pabeni@redhat.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, dinguyen@kernel.org,
 edumazet@google.com, joabreu@synopsys.com, l.rubusch@gmail.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, s.trumtrar@pengutronix.de,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 20/23] dt-bindings: altera: add Mercury AA1
	combinations
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

Update binding with combined .dts for the Mercury+ PE1, PE3 and ST1
carrier boards with the Mercury+ AA1 SoM.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 31af6859d..51f10ff8e 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -32,6 +32,9 @@ properties:
         items:
           - enum:
               - enclustra,mercury-pe1
+              - enclustra,mercury-aa1-pe1
+              - enclustra,mercury-aa1-pe3
+              - enclustra,mercury-aa1-st1
               - google,chameleon-v3
           - const: enclustra,mercury-aa1
           - const: altr,socfpga-arria10
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
