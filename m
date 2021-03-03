Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B3D32B5D8
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Mar 2021 09:05:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B657CC57B71;
	Wed,  3 Mar 2021 08:05:37 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 564BEC57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 08:05:36 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id s16so13587230plr.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Mar 2021 00:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=OpNip1o55xuc4+Ky8l8FusR3lVTvYhTkKkWI9EvaqAw=;
 b=T+sKaAaljryNd3jnFXNHELdiJqxLNqxDaQQvAEtlig9sXHZ/av4Gw2YH0J35N+O/uO
 1IrdMH2vw1ON6C3TrqIFKvoViUd6WSiBlI0hMqr2rCnbXOmRvhyuq6u0rXIwW560sAv+
 arGPYVBlF5LTHfz4RrfJRHQjmSvfHXFxfZumPRaDxvabNGMQ4xuEbxdRmIRLHi2M8k5L
 8+f7wa0Ne6XhaBnktqzRMnU2HrnE59fIlzgP/DRUmcLZ4DA7RZqhuv900IWu+oAMGM4q
 CxDxGENFfNhD71kRBOZV+SA7tivL/ufHhHDs5mezWlIN3YB05ltZufcxS1TAiJcp7ElY
 09fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=OpNip1o55xuc4+Ky8l8FusR3lVTvYhTkKkWI9EvaqAw=;
 b=cP9USEJSh6uUKQ5ToGDXVeVJUpVnOYQClkiIB3pUTNXVgTlnmC+s9EOQR/0RW89nNb
 VbG/5HRk69ff+3AvwQwKZy7BNJ2xyfwZvroPJ6G05OndiXCGNgsQnBD1Si57/Z6+eof8
 V5p3p3mBln6o/SpYNR0uJ/fPEVL0ruBJQlnFW04Z5Zf3NEH3Wv32BYF4o/VvRSdEq99N
 iv/rwkJxNII824Tg7dkUPnChvGrIimdHOREkuXeZXoyqOmy+TX16ySTlYilv7CvPPThq
 u5TmG/SGSCbJb5BkgOQa3U5NyURG++80aa1OlHN53FyBGaJJqmlKMkbJzJ5rz0fDwXYB
 LtLA==
X-Gm-Message-State: AOAM532CmIqA4CIVvLz1frTO4lY1ZGDvzYf58r8uw5Z2CmYgBsOT4UdZ
 4rGga8WPDJDrB0f8Vpwm0KhQo5Zb0I4=
X-Google-Smtp-Source: ABdhPJz5uYU1qMhU1ENUTLOyBKzlItHVFfCY9cebR94CVCa8qO3wdMQLchWHBv0tC8Q6k+fHx2ACww==
X-Received: by 2002:a17:90a:4f85:: with SMTP id
 q5mr8681244pjh.215.1614758734958; 
 Wed, 03 Mar 2021 00:05:34 -0800 (PST)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id h6sm22260887pfv.84.2021.03.03.00.05.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Mar 2021 00:05:34 -0800 (PST)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com
Date: Wed,  3 Mar 2021 16:05:13 +0800
Message-Id: <1614758717-18223-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614758717-18223-1-git-send-email-dillon.minfei@gmail.com>
References: <1614758717-18223-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH 4/8] dt-bindings: pinctrl: stm32: Add
	stm32h750 pinctrl
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

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 72877544ca78..59f33cbe8f48 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -24,6 +24,7 @@ properties:
       - st,stm32f746-pinctrl
       - st,stm32f769-pinctrl
       - st,stm32h743-pinctrl
+      - st,stm32h750-pinctrl
       - st,stm32mp157-pinctrl
       - st,stm32mp157-z-pinctrl
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
