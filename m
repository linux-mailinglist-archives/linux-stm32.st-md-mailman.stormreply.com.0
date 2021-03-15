Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D1B33AF16
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Mar 2021 10:45:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C0EAC57B5A;
	Mon, 15 Mar 2021 09:45:37 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3F4DC57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 09:45:35 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id b23so6209204pfo.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 02:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zupSwfVuCw/OguGpqqu6E+epQ1SyjYIFjZTfov01EZ0=;
 b=NIqqO+nJVJhvWsNmWY4p1PlpvFMCWNzl4sQBSEqVTVeiNgF3l6lWKRMekmQxvHSOOn
 +16C6e/302P7xY2elMVknpOmFeqF57JuYC+qYDMVnDnktQQejpeZOsE28mIn935lEbNj
 yVPnpFZ1ZagTqYQgI3Ytvx5KGBkO+UioPpoBxLt/bEFAZefCQREVOQHTJgMPCGNx2lN5
 K4nhAFDX0/NweKzaMJmIoeQljLaRn/nTFpjB8ETjw0Q/oDc2X7ZkIcB/pzdEioQA4pCg
 wziE9mjS7TOFnvxe/vrMvZZnnDjYDbLZH8LIUVPhVCEiSwNTLEjgR9M8Tku9a0KAWxD/
 lnxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zupSwfVuCw/OguGpqqu6E+epQ1SyjYIFjZTfov01EZ0=;
 b=cf1wqi7nrinIZOxTpTKHQubM+d1PKCMvL4+jlm+EWrsuczYgJYgSQi4yIJN0OQRe/o
 /NUkoHoLDB/gPL4U1HLCz4Lo77g1lNIDCzScxy+KgnihRCz8XZxN2+vnmo6xvSrANXYP
 0JokjKGfnuxZP7SHqkaSSaK32dZTuZxPQYyUuWOgdjd8jgWeiDi+WU28BlKd83ZpSWWs
 YLfGQQ+YcB5GX0gp2NYd2IvkkKowRyFR42df9zORlyzxOfX4vz/awERla81H/2NVF4Qd
 FeuNMUVbv7AJ/TKV2XHNnfCmlHig8LqWEuAD5TF8dL+E8VfW7mBa+1Z7xeXtoMAD3GQL
 I4JQ==
X-Gm-Message-State: AOAM533UDj5Qlh6owkmKFH1is5EVf/Ct1a/kME5VthQn5d/aSqZliL+N
 fNmlj1mErkbMt7gkQniEFkc=
X-Google-Smtp-Source: ABdhPJyuO5YXdOcnHq6nThOQoNN/bPpKdfvrJ2wS8/AEBhEjresxF5u3JdBZ8Ns6PfNUaAAH49+H6Q==
X-Received: by 2002:a62:7b0b:0:b029:1ef:1999:1d57 with SMTP id
 w11-20020a627b0b0000b02901ef19991d57mr24210187pfc.19.1615801534609; 
 Mon, 15 Mar 2021 02:45:34 -0700 (PDT)
Received: from localhost.localdomain ([120.245.122.54])
 by smtp.gmail.com with ESMTPSA id 14sm12780811pfy.55.2021.03.15.02.45.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Mar 2021 02:45:34 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, alexandre.torgue@foss.st.com, a.fatoum@pengutronix.de,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com,
 gregkh@linuxfoundation.org, erwan.leray@st.com, erwan.leray@foss.st.com,
 linux-serial@vger.kernel.org
Date: Mon, 15 Mar 2021 17:43:56 +0800
Message-Id: <1615801436-3016-10-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1615801436-3016-1-git-send-email-dillon.minfei@gmail.com>
References: <1615801436-3016-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v3 9/9] dt-bindings: serial: stm32: add
	phandle 'bluetooth' to fix dtbs_check warrning
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

when run make dtbs_check with 'bluetoothi brcm,bcm43438-bt'
dts enabled on stm32h7, there is a warrning popup:

>> arch/arm/boot/dts/stm32h750i-art-pi.dt.yaml: serial@40004800: 'bluetooth'
   does not match any of the regexes: 'pinctrl-[0-9]+'

to make dtbs_check happy, so add a phandle bluetooth

Fixes: 500cdb23d608 ("ARM: dts: stm32: Add STM32H743 MCU and STM32H743i-EVAL board")
Signed-off-by: dillon min <dillon.minfei@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 Documentation/devicetree/bindings/serial/st,stm32-uart.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
index 8631678283f9..5e674840e62d 100644
--- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
@@ -50,6 +50,11 @@ properties:
     minItems: 1
     maxItems: 2
 
+  bluetooth:
+    type: object
+    description: |
+      phandles to the usart controller and bluetooth
+
 # cts-gpios and rts-gpios properties can be used instead of 'uart-has-rtscts'
 # or 'st,hw-flow-ctrl' (deprecated) for making use of any gpio pins for flow
 # control instead of dedicated pins.
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
