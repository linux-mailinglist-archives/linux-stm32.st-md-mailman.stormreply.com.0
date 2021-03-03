Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EACC932B5D7
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Mar 2021 09:05:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9DDBC57B74;
	Wed,  3 Mar 2021 08:05:34 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5485FC57B70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 08:05:33 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id z7so13587620plk.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Mar 2021 00:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5CH01EA9VYt10FW0+mfZjDjaLT5fUS+mwHbeYhgolHE=;
 b=pVzfgsNk6xvxfRSrEMjzQfQ195hwniJYYN4YwNc6i/kxr6ug9QlmKKRNS5He6xVuMk
 XVYvBO23bwSWkVIXHzMUmvT/Jcu6doW7WntugzKTRC14J/TjjcvvjPD9BPYjCJV2aN86
 Ao4O1BKMnNXD/EsHxADdgBH/4J9SJVp8H+thAz9rZeSjhoQaRUqs3hpId75BWe4bU+IQ
 W2tt9dIyK8YKczJu6dlTZVl+95zr1Iy+OWmAPKZXU73RmPfLcEBMSC5YWdCG0nU3p4gu
 UummH4u+rku2UPUri/5dXHlb1Uhd5YceyYzJyTkRDTkzvPYGT1HpiooW/hF6zAwGWevB
 zGyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5CH01EA9VYt10FW0+mfZjDjaLT5fUS+mwHbeYhgolHE=;
 b=N2jQ+YH5UEAafs7UiwPk8J5yRFJv82Msu5zYuEQfBPIc2396lRnnQhMzOO+rTcpBlu
 VJIfDZ2IjC0GQi4CKLhuamkyJGhqLQIw5TTBWdYEnaoi+VdlCUS+jukXB5tjKXVMKJnl
 yiiCkGbYAYmmXN9UbRlxhuSBVDnzQbALFtKOpLgItYy9WgM998dit76g3t1/0ZOu/r/7
 gPHArfwfFeYnC/WAAY0wvtdbX97x351yuqx9Eyv9XvwQn1NYZ7DAn/dIHhErg0MDZDMm
 UnHQ+KUl9M4HLXdvLfgvsB9HO5cZx8PwJ5AgFb48LjdMJ/1keftMWymeCMNINmDicTEp
 GDdw==
X-Gm-Message-State: AOAM533/4AWXktkastS9vjJxO8IEteB2rUOD3rQpdRwXXglv1ppyM87V
 IkgOouOzQy3S9x+RJj3CvhI=
X-Google-Smtp-Source: ABdhPJwo6ae/R50WZM3DB2SsjWo4OPuZ3H1RvOS13q+blJrwXA4mzp82m6B0MYUidNv14Thew4KpJA==
X-Received: by 2002:a17:90a:6385:: with SMTP id
 f5mr8604972pjj.91.1614758731962; 
 Wed, 03 Mar 2021 00:05:31 -0800 (PST)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id h6sm22260887pfv.84.2021.03.03.00.05.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Mar 2021 00:05:31 -0800 (PST)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com
Date: Wed,  3 Mar 2021 16:05:12 +0800
Message-Id: <1614758717-18223-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614758717-18223-1-git-send-email-dillon.minfei@gmail.com>
References: <1614758717-18223-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH 3/8] dt-bindings: arm: stm32: Add compatible
	strings for ART-PI board
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: dillon min <dillon.minfei@gmail.com>

Art-pi based on stm32h750xbh6, with following resources:

-8MiB QSPI flash
-16MiB SPI flash
-32MiB SDRAM
-AP6212 wifi, bt, fm

detail information can be found at:
https://art-pi.gitee.io/website/

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index e7525a3395e5..306e7551ad39 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -53,6 +53,10 @@ properties:
           - const: st,stm32h743
       - items:
           - enum:
+              - st,stm32h750i-art-pi
+          - const: st,stm32h750
+      - items:
+          - enum:
               - shiratech,stm32mp157a-iot-box # IoT Box
               - shiratech,stm32mp157a-stinger96 # Stinger96
               - st,stm32mp157c-ed1
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
