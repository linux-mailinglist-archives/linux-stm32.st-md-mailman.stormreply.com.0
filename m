Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5651E44D963
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Nov 2021 16:46:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20DA0C5EC73;
	Thu, 11 Nov 2021 15:46:11 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 506C2C5EC73
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Nov 2021 15:46:09 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 t5-20020a17090a4e4500b001a0a284fcc2so4929677pjl.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Nov 2021 07:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XH4HtUz8oW0xzhVze5j7Kybwjbu7oDVLM7iF1rNAOBM=;
 b=l1ul0dc4fHtFQMBujyOWfT75JAyOGkrlGEHEEj1yOZDBB55DqcWknkLtB5UQlHN3Eo
 KK628YsJBJWi1pann0TjFFR4ZbUTuCstlKXntWOVhqxkjh/cy7zn8M9B37ucxoBg5lrE
 ehEIxozpyOn9V1/hgNaoZZMC72AoBFARRAbMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XH4HtUz8oW0xzhVze5j7Kybwjbu7oDVLM7iF1rNAOBM=;
 b=7m3wWqHX/BzDfk9mMea7uxh1kJ5BcptU5Gz/SHmhrh6Y6AHVFH4RjcInKXtTd5/tTd
 2Xvtaln28RS2mAZK7gUuRViK4g+hH4dS8n2+FJ3lI6fgkrUb/BIhIH9zY0+rZcsrfb+E
 LsdT+UoC4gIxepjbuRxiUtwpqe+YIU8FTd+e7X3FopR0yjBvVAxcLHDKHRWfU9SgNyNl
 koormWAKmSRkcuS5wnB8FkdJ1J/xotSUkQ7ZYEo8tkXqwmRYcYwGdzhjYdtc0hLBDyu2
 h1CwyxvonhbAI/uk75zZNPaf0Z8kOLF6DJp1h6iEbAQKREqQl/2gzjFiVT72fq0FTyUw
 w6QA==
X-Gm-Message-State: AOAM533MjM6QwXzJsnoWl7eU3WYr1Gy4TnKNT30h1aiHdBchDxXg52YZ
 YHCAka7oUtfrUWmDchQ9AMMtYQ==
X-Google-Smtp-Source: ABdhPJwTPiI9XvS4RwFxLLTvsnKMZ6GDcL/bbEwZMlMWhin+G7wV5HeZAeO3L3i6hza3lMdnQe7U7g==
X-Received: by 2002:a17:90b:4b0e:: with SMTP id
 lx14mr26068293pjb.160.1636645568044; 
 Thu, 11 Nov 2021 07:46:08 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:3041:135c:4e21:846c])
 by smtp.gmail.com with ESMTPSA id m15sm2782122pjf.49.2021.11.11.07.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 07:46:07 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 11 Nov 2021 21:15:56 +0530
Message-Id: <20211111154557.852637-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111154557.852637-1-jagan@amarulasolutions.com>
References: <20211111154557.852637-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/3] dt-bindings: arm: stm32: Add Engicam
	i.Core STM32MP1 C.TOUCH 2.0 10.1" OF
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

i.Core STM32MP1 is an EDIMM SoM based on STM32MP157A from Engicam.

C.TOUCH 2.0 is a general purpose carrier board with capacitive
touch interface support.

10.1" OF is a capacitive touch 10.1" Open Frame panel solutions.

i.Core STM32MP1 needs to mount on top of C.TOUCH 2.0 carrier with
pluged 10.1" OF for creating complete i.Core STM32MP1 C.TOUCH 2.0
10.1" Open Frame board.

Add bindings for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index bcaf7be3ab37..d2dd3f1847bb 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -77,6 +77,7 @@ properties:
         items:
           - enum:
               - engicam,icore-stm32mp1-ctouch2       # STM32MP1 Engicam i.Core STM32MP1 C.TOUCH 2.0
+              - engicam,icore-stm32mp1-ctouch2-of10  # STM32MP1 Engicam i.Core STM32MP1 C.TOUCH 2.0 10.1" Open Frame
               - engicam,icore-stm32mp1-edimm2.2      # STM32MP1 Engicam i.Core STM32MP1 EDIMM2.2 Starter Kit
           - const: engicam,icore-stm32mp1            # STM32MP1 Engicam i.Core STM32MP1 SoM
           - const: st,stm32mp157
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
