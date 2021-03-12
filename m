Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB8E3385BF
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Mar 2021 07:24:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15B06C5718D;
	Fri, 12 Mar 2021 06:24:53 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12A41C5718B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 06:24:51 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id e26so1149552pfd.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 22:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ipbs0vmn31jwBnMAmrQqwbFSeorIpjiivuriOSD9mTw=;
 b=hnoMeyqTgxI+BsZIA6OCmL9vC+/PsLv3BD3jq2ESlv91TV6fYJog8hU4qpKi1t5vcQ
 85hBlAaY6s1lUSYwzGwctHqHjdS8dOj6wcdTZid5H8EJLCrz/uEzoVD6/40u4s0dXbRa
 Ae4ieoCRhuy85VEyI4PVuQvStN2RbIxIAmPmKRlDW8nMU63kvXaOhDt7ORUM5eTFqVKU
 EuGmNo4WdPkDBcrFYigyjf2w1UPjD1Jx0GCVj2F42CIa1rrGM033zeTAsksCjHvD2N7/
 QJ+SviwGfqjrs50xAnx/agmkapFvP8IZxMdQo9H0TjfZpYG5vba0eWotEajm9YPkWmD/
 z1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ipbs0vmn31jwBnMAmrQqwbFSeorIpjiivuriOSD9mTw=;
 b=kSpKOHllaaHsazYct2+V+ArT1sFdTI+9yIPdeCWLhUK/WGX35pUVVevQdGiLs1hHb3
 jqkJFQ7npuy6nGmVRXu3WSkNsk6KC/uDn4ARGXoUhr++y4WlilWYWdHWqLdeSLi9KZRq
 uFkpiUTIGLtTzVr/E+3H18au7CI3McsVFDaZE2Re5UFP6uOCNU5P1sVoyKXLWci0LzrC
 CqR84zLV8siM/Z0xhlheu192e+bGWN9GwEINvkXRXql9WK05rq/J869qQWoT2UYEAB8I
 0bqAVDEtqeR5uRF63Rj1jegfCSWQITGezuwB3WVNxBOW7uStOE68v0BqqDrw/5sLBuLH
 ZJnA==
X-Gm-Message-State: AOAM531BNMy50fSVeLfGCvuH8Hceb8aLE7HlWw9A05dcrmOFZIHwuVMO
 oLeDpkl3aPhFvcmBzV10YTo=
X-Google-Smtp-Source: ABdhPJwbLrv2qnek5I0Nbk7xSDiIXg00FGvxUPIXtST4dXlIDQEHa/YC5+OrmArbUrCTwPr3JMAStw==
X-Received: by 2002:a65:5a4a:: with SMTP id z10mr10103297pgs.240.1615530289738; 
 Thu, 11 Mar 2021 22:24:49 -0800 (PST)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id h6sm4048406pfb.157.2021.03.11.22.24.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Mar 2021 22:24:49 -0800 (PST)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, alexandre.torgue@foss.st.com, a.fatoum@pengutronix.de,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com
Date: Fri, 12 Mar 2021 14:24:29 +0800
Message-Id: <1615530274-31422-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615530274-31422-1-git-send-email-dillon.minfei@gmail.com>
References: <1615530274-31422-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v2 3/8] dt-bindings: pinctrl: stm32: Add
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

This patch intend to add pinctrl configuration support for
stm32h750 value line

The datasheet of stm32h750 value line can be found at:
https://www.st.com/resource/en/datasheet/stm32h750ib.pdf

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
v2: just add more commit message description

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
